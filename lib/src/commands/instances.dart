import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
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
      final maybeInstances = await DefaultApi(defaultApiClient).restartInstance(RestartInstanceRequest(instanceIds: argResults!.rest));
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
