import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:openapi/api.dart';

class InstancesCommand extends Command<void> {
  @override
  String get description => 'List running instances';

  @override
  String get name => 'instances';

  @override
  Future<void> run() async {
    // TODO: Error handling.
    final instances = await DefaultApi(defaultApiClient).listInstances();

    for (final instance in instances!.data) {
      stdout.writeln(instance);
    }
  }
}