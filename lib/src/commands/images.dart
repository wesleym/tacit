import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:tacit/src/adaptprinter.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';

class ListImagesCommand extends Command<void> {
  @override
  String get description => 'List the available boot disk images';

  @override
  String get name => 'list-images';

  @override
  String get category => 'Base images';

  @override
  List<String> get aliases => ['images'];

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
      ..addHeaders([
        'ID',
        'Family',
      ]);

    final ListImages200Response images;
    try {
      final maybeImages = await ImagesApi(defaultApiClient).listImages();
      // This should never be null: an ApiException should have been thrown instead.
      images = maybeImages!;
    } on ApiException catch (e) {
      stderr.write('Failed to fetch instance types: ${e.message}');
      return;
    }

    final rows = images.data.map((entry) => [
          entry.id,
          entry.family,
        ]);
    printer.addRows(rows);
    stdout.writeln(printer.render());
  }
}
