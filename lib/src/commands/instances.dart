import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:lambda_cli/src/kvprinter.dart';
import 'package:openapi/api.dart';

class ListInstancesCommand extends Command<void> {
  @override
  String get description => 'List running instances';

  @override
  String get name => 'instances';

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
    final table = Table(
      header: [
        'Instance ID',
        'Name',
        'Type',
        'IP Address',
        'Region',
        'SSH Key',
        'Status',
      ],
    );

    final ListInstances200Response instances;
    try {
      final maybeInstances = await DefaultApi(defaultApiClient).listInstances();
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to instances: ${e.message}');
      return;
    }

    final rows = instances.data.map((i) => [
          i.id,
          i.name,
          i.instanceType!.name,
          i.ip,
          i.region!.name,
          i.sshKeyNames.join(', '),
          // TODO: Create a mapping to the correct user-facing name.
          i.status.value,
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}

class InstanceDetailsCommand extends Command<void> {
  @override
  String get description => 'Get details of a specific instance';

  @override
  String get name => 'instance';

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
          await DefaultApi(defaultApiClient).getInstance(rest[0]);
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
      Kv('Instance type:', instance.data.instanceType!.description),
      Kv('IP address:', instance.data.ip),
      Kv('Region:', instance.data.region!.name),
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
    final table = Table(header: ['Instance ID']);

    final filesystemNames = <String>[];
    final filesystemValue = argResults!.option('filesystem');
    if (filesystemValue != null) {
      filesystemNames.add(filesystemValue);
    }

    final LaunchInstance200Response instances;
    try {
      final maybeInstances = await DefaultApi(defaultApiClient)
          .launchInstance(LaunchInstanceRequest(
        regionName: argResults!.option('region-name')!,
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
    table.addAll(rows);
    stdout.writeln(table);
  }
}

class TerminateInstancesCommand extends Command<void> {
  @override
  String get description => 'Terminate instances';

  @override
  String get name => 'terminate-instances';

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
    final table = Table(
      header: [
        'Name',
        'Type',
        'IP Address',
        'Region',
        'SSH Key',
        'Status',
      ],
    );

    final TerminateInstance200Response instances;
    try {
      final maybeInstances = await DefaultApi(defaultApiClient)
          .terminateInstance(
              TerminateInstanceRequest(instanceIds: argResults!.rest));
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to restart instances: ${e.message}');
      return;
    }

    final rows = instances.data.terminatedInstances.map((i) => [
          i.name,
          i.instanceType!.name,
          i.ip,
          i.region!.name,
          i.sshKeyNames.join(', '),
          // TODO: Create a mapping to the correct user-facing name.
          i.status.value,
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}

class RestartInstancesCommand extends Command<void> {
  @override
  String get description => 'Restart instances';

  @override
  String get name => 'restart-instances';

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
    final table = Table(
      header: [
        'Name',
        'Type',
        'IP Address',
        'Region',
        'SSH Key',
        'Status',
      ],
    );

    final RestartInstance200Response instances;
    try {
      final maybeInstances = await DefaultApi(defaultApiClient).restartInstance(
          RestartInstanceRequest(instanceIds: argResults!.rest));
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to restart instances: ${e.message}');
      return;
    }

    final rows = instances.data.restartedInstances.map((i) => [
          i.name,
          i.instanceType!.name,
          i.ip,
          i.region!.name,
          i.sshKeyNames.join(', '),
          // TODO: Create a mapping to the correct user-facing name.
          i.status.value,
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}
