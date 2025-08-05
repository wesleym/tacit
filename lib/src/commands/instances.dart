import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_console/dart_console.dart';
import 'package:lambda_cli/src/kvprinter.dart';
import 'package:openapi/api.dart';

class ListInstancesCommand extends Command<void> {
  @override
  String get description => 'List running instances';

  @override
  String get name => 'list-instances';

  @override
  String get category => 'GPU instances';

  @override
  List<String> get aliases => ['instances'];

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    return parents.reversed.join(' ');
  }

  @override
  Future<void> run() async {
    final table = Table()
      ..headerColor = ConsoleColor.red
      ..headerStyle = FontStyle.bold
      ..insertColumn(header: 'Instance ID')
      ..insertColumn(header: 'Name')
      ..insertColumn(header: 'Type')
      ..insertColumn(header: 'IP Address')
      ..insertColumn(header: 'Region')
      ..insertColumn(header: 'SSH Key')
      ..insertColumn(header: 'Status');

    final ListInstances200Response instances;
    try {
      final maybeInstances =
          await InstancesApi(defaultApiClient).listInstances();
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to instances: ${e.message}');
      return;
    }

    final rows = instances.data.map((i) => [
          i.id,
          i.name ?? "—",
          i.instanceType.name,
          i.ip ?? "—",
          i.region.name,
          i.sshKeyNames.join(', '),
          // TODO: Create a mapping to the correct user-facing name.
          i.status.value,
        ]);
    table.insertRows(rows.toList(growable: false));
    final renderedTable = table.render();
    if (renderedTable.indexOf('\n') <= Console().windowWidth) {
      stdout.writeln(renderedTable);
    } else {
      for (final i in instances.data) {
        printKvs([
          Kv(
            'Instance ID',
            i.id,
          ),
          Kv(
            'Name',
            i.name ?? "—",
          ),
          Kv(
            'Type',
            i.instanceType.name,
          ),
          Kv(
            'IP Address',
            i.ip ?? "—",
          ),
          Kv(
            'Region',
            i.region.name.toString(),
          ),
          Kv(
            'SSH Key',
            i.sshKeyNames.join(', '),
          ),
          Kv(
            'Status',
            // TODO: Create a mapping to the correct user-facing name.
            i.status.value,
          ),
        ]);
      }
    }
  }
}

class InstanceDetailsCommand extends Command<void> {
  @override
  String get description => 'Get details of a specific instance';

  @override
  String get name => 'describe-instance';

  @override
  String get category => 'GPU instances';

  @override
  List<String> get aliases => ['instance'];

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    var invocation = parents.reversed.join(' ');
    return '$invocation instance_id';
  }

  @override
  Future<void> run() async {
    var rest = argResults!.rest;
    if (rest.length != 1) {
      usageException('Parameter "instance_id" is required.');
    }

    final GetInstance200Response instance;
    try {
      final maybeInstance =
          await InstancesApi(defaultApiClient).getInstance(rest[0]);
      // This should never be null: an ApiException should have been thrown instead.
      instance = maybeInstance!;
    } on ApiException catch (e) {
      stderr.write('Failed to instances: ${e.message}');
      return;
    }

    final title = 'GPU Instance';

    stdout
      ..writeln(title)
      ..writeln('=' * title.length)
      ..writeln();

    printKvs([
      Kv('Instance ID:', instance.data.id),
      Kv('Name:', instance.data.name),
      Kv('Instance type:', instance.data.instanceType.description),
      Kv('IP address:', instance.data.ip),
      Kv('Region:', instance.data.region.name.value),
      Kv('SSH keys:', instance.data.sshKeyNames.join(', ')),
      Kv('Status:', instance.data.status.value),
    ]);
  }
}

class LaunchInstancesCommand extends Command<void> {
  LaunchInstancesCommand() {
    argParser
      ..addOption('region-name',
          help: 'Short name of a region', mandatory: true)
      ..addOption('instance-type',
          help: 'Name of an instance type', mandatory: true)
      ..addOption('ssh-key',
          help: 'Name of the SSH key to allow access to the instances.',
          mandatory: true)
      ..addOption('filesystem',
          help: 'Name of the filesystem to attach to the instances.')
      ..addOption('quantity',
          help: 'Name of the filesystem to attach to the instances.',
          defaultsTo: '1');
  }

  @override
  String get description => 'Launch instances';

  @override
  String get name => 'launch-instances';

  @override
  String get category => 'GPU instances';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation --region-name region_name --instance-type instance_type_name --ssh-key ssh_key_name [--filesystem filesystem_name] [--quantity 1] [name]';
  }

  @override
  Future<void> run() async {
    final table = Table()..insertColumn(header: 'Instance ID');

    final filesystemNames = <String>[];
    final filesystemValue = argResults!.option('filesystem');
    if (filesystemValue != null) {
      filesystemNames.add(filesystemValue);
    }

    final regionNameString = argResults!.option('region-name');
    final regionName =
        PublicRegionCode.values.firstWhere((r) => r.value == regionNameString);

    final LaunchInstance200Response instances;
    try {
      final maybeInstances = await InstancesApi(defaultApiClient)
          .launchInstance(InstanceLaunchRequest(
        regionName: regionName,
        instanceTypeName: argResults!.option('instance-type')!,
        sshKeyNames: [argResults!.option('ssh-key')!],
        fileSystemNames: filesystemNames,
      ));
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to restart instances: ${e.message}');
      return;
    }

    final rows = instances.data.instanceIds.map((i) => [i]);
    table.insertRows(rows.toList(growable: false));
    stdout.writeln(table);
  }
}

class RenameInstanceCommand extends Command<void> {
  @override
  String get description => 'Rename instance';

  @override
  String get name => 'rename-instance';

  @override
  String get category => 'GPU instances';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation instance_id name';
  }

  @override
  Future<void> run() async {
    assert(argResults!.rest.length == 1 || argResults!.rest.length == 2);

    final String? newName;
    if (argResults!.rest.length == 1) {
      newName = null;
    } else {
      newName = argResults!.rest[1];
    }

    final GetInstance200Response instances;
    try {
      final maybeInstances = await InstancesApi(defaultApiClient).postInstance(
          argResults!.rest.first, InstanceModificationRequest(name: newName));
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to rename instance: ${e.message}');
      return;
    }

    printKvs([
      Kv('Instance ID:', instances.data.id),
      Kv('Name:', instances.data.name),
      Kv('Instance type:', instances.data.instanceType.description),
      Kv('IP address:', instances.data.ip),
      Kv('Region:', instances.data.region.name.value),
      Kv('SSH keys:', instances.data.sshKeyNames.join(', ')),
      Kv('Status:', instances.data.status.value),
    ]);
  }
}

class TerminateInstancesCommand extends Command<void> {
  @override
  String get description => 'Terminate instances';

  @override
  String get name => 'terminate-instances';

  @override
  String get category => 'GPU instances';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation [instance_ids...]';
  }

  @override
  Future<void> run() async {
    final table = Table()
      ..insertColumn(header: 'Name')
      ..insertColumn(header: 'Type')
      ..insertColumn(header: 'IP Address')
      ..insertColumn(header: 'Region')
      ..insertColumn(header: 'SSH Key')
      ..insertColumn(header: 'Status');

    final TerminateInstance200Response instances;
    try {
      final maybeInstances = await InstancesApi(defaultApiClient)
          .terminateInstance(
              InstanceTerminateRequest(instanceIds: argResults!.rest));
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to restart instances: ${e.message}');
      return;
    }

    final rows = instances.data.terminatedInstances.map((i) => [
          i.name ?? "—",
          i.instanceType.name,
          i.ip ?? "—",
          i.region.name,
          i.sshKeyNames.join(', '),
          // TODO: Create a mapping to the correct user-facing name.
          i.status.value,
        ]);
    table.insertRows(rows.toList(growable: false));
    stdout.writeln(table);
  }
}

class RestartInstancesCommand extends Command<void> {
  @override
  String get description => 'Restart instances';

  @override
  String get name => 'restart-instances';

  @override
  String get category => 'GPU instances';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation [instance_ids...]';
  }

  @override
  Future<void> run() async {
    final table = Table()
      ..insertColumn(header: 'Name')
      ..insertColumn(header: 'Type')
      ..insertColumn(header: 'IP Address')
      ..insertColumn(header: 'Region')
      ..insertColumn(header: 'SSH Key')
      ..insertColumn(header: 'Status');
    final RestartInstance200Response instances;
    try {
      final maybeInstances = await InstancesApi(defaultApiClient)
          .restartInstance(
              InstanceRestartRequest(instanceIds: argResults!.rest));
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to restart instances: ${e.message}');
      return;
    }

    final rows = instances.data.restartedInstances.map((i) => [
          i.name ?? "—",
          i.instanceType.name,
          i.ip ?? "—",
          i.region.name,
          i.sshKeyNames.join(', '),
          // TODO: Create a mapping to the correct user-facing name.
          i.status.value,
        ]);
    table.insertRows(rows.toList(growable: false));
    stdout.writeln(table);
  }
}
