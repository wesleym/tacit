import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

class FilesystemsCommand extends Command<void> {
  @override
  String get description => 'List filesystems';

  @override
  String get name => 'filesystems';

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
        'Name',
        'Region',
        'Mount Point',
        'Status',
        'Size (B)',
      ],
    );

    final ListFilesystems200Response filesystems;
    try {
      final maybeFilesystems =
          await FilesystemsApi(defaultApiClient).listFilesystems();
      // This should never be null: an ApiException should have been thrown instead.
      filesystems = maybeFilesystems!;
    } on ApiException catch (e) {
      stderr.write('Failed to instances: ${e.message}');
      return;
    }

    final rows = filesystems.data.map((fs) => [
          fs.name,
          fs.region.name,
          fs.mountPoint,
          fs.isInUse ? 'In use' : 'Not in use',
          fs.bytesUsed,
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}
