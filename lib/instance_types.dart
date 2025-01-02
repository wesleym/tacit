import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

class InstanceTypesCommand extends Command<void> {
  @override
  String get description => 'Retrieve list of offered instance types';

  @override
  String get name => 'instance-types';

  @override
  Future<void> run() async {
    final instanceTypesFuture = DefaultApi(defaultApiClient).instanceTypes();

    final table = Table(
      header: [
        'Name',
        'CPU Cores',
        'RAM (GiB)',
        'SSD (GiB)',
        'Price (\$USD/hr)'
      ],
    );

    // TODO: Error handling.
    final instanceTypes = await instanceTypesFuture;

    final rows = instanceTypes!.data.entries.map((entry) => [
          entry.value.instanceType.description,
          entry.value.instanceType.specs.vcpus,
          entry.value.instanceType.specs.memoryGib,
          entry.value.instanceType.specs.storageGib,
          (entry.value.instanceType.priceCentsPerHour / 100.0).toStringAsFixed(2),
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}
