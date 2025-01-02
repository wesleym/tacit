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
  Future<void> run() async {
    final filesystemsFuture = DefaultApi(defaultApiClient).listFileSystems();

    final table = Table(
      header: [
        'Name',
        'Region',
        'Mount Point',
        'Status',
        'Size (B)',
      ],
    );

    final ListFileSystems200Response filesystems;
    try {
      final maybeFilesystems = await filesystemsFuture;
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
