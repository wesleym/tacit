import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

class InstancesCommand extends Command<void> {
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
    final instancesFuture = DefaultApi(defaultApiClient).listInstances();

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

    final ListInstances200Response instances;
    try {
      final maybeInstances = await instancesFuture;
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      stderr.write('Failed to instances: ${e.message}');
      return;
    }

    final rows = instances.data.map((i) => [
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
