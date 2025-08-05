import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

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
    final table = Table(
      header: [
        'ID',
        'Family',
      ],
    );

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
    table.addAll(rows);
    stdout.writeln(table);
  }
}
