import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:tacit/src/adaptprinter.dart';
import 'package:openapi/api.dart';

class InstanceTypesCommand extends Command<void> {
  @override
  String get description => 'Retrieve list of offered instance types';

  @override
  String get name => 'list-instance-types';

  @override
  String get category => 'GPU instances';

  @override
  List<String> get aliases => ['instance-types'];

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
    final printer = AdaptPrinter()
      ..addHeaders(
          ['Name', 'CPU Cores', 'RAM (GiB)', 'SSD (GiB)', 'Price (\$USD/hr)']);

    final ListInstanceTypes200Response instanceTypes;
    try {
      final maybeInstanceTypes =
          await InstancesApi(defaultApiClient).listInstanceTypes();
      // This should never be null: an ApiException should have been thrown instead.
      instanceTypes = maybeInstanceTypes!;
    } on ApiException catch (e) {
      stderr.write('Failed to fetch instance types: ${e.message}');
      return;
    }

    for (final entry in instanceTypes.data.entries) {
      printer.addRow([
        entry.value.instanceType.description,
        entry.value.instanceType.specs.vcpus.toString(),
        entry.value.instanceType.specs.memoryGib.toString(),
        entry.value.instanceType.specs.storageGib.toString(),
        (entry.value.instanceType.priceCentsPerHour / 100.0).toStringAsFixed(2),
      ]);
    }
    stdout.writeln(printer.render());
  }
}
