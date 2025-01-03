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

    final InstanceTypes200Response instanceTypes;
    try {
      final maybeInstanceTypes = await instanceTypesFuture;
      // This should never be null: an ApiException should have been thrown instead.
      instanceTypes = maybeInstanceTypes!;
    } on ApiException catch (e) {
      stderr.write('Failed to fetch instance types: ${e.message}');
      return;
    }

    final rows = instanceTypes.data.entries.map((entry) => [
          entry.value.instanceType.description,
          entry.value.instanceType.specs.vcpus,
          entry.value.instanceType.specs.memoryGib,
          entry.value.instanceType.specs.storageGib,
          (entry.value.instanceType.priceCentsPerHour / 100.0)
              .toStringAsFixed(2),
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}
