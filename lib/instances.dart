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

    // TODO: Error handling.
    final instances = await instancesFuture;
    final rows = instances!.data.map((i) => [
          i.name,
          i.instanceType!.name,
          i.ip,
          i.region!.name,
          i.sshKeyNames.join(', '),
          // TODO: Replace with correct user-facing name.
          i.status.value,
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}
