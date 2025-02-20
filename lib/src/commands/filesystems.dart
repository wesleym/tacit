import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:lambda_cli/src/kvprinter.dart';
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

class CreateFilesystemCommand extends Command<void> {
  @override
  String get description => 'Create filesystems';

  @override
  String get name => 'create-filesystem';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    return '${parents.reversed.join(' ')} name region';
  }

  @override
  Future<void> run() async {
    if (argResults!.rest.length != 2) {
      usageException('Name and region are required');
    }

    final PublicRegionCode region;
    try {
      region = PublicRegionCode.values
          .firstWhere((r) => argResults!.rest[1] == r.value);
    } on StateError {
      usageException('Invalid region');
    }

    final CreateFilesystem200Response filesystems;
    try {
      final maybeFilesystems = await FilesystemsApi(defaultApiClient)
          .createFilesystem(FilesystemCreateRequest(
              name: argResults!.rest[0], region: region));
      // This should never be null: an ApiException should have been thrown instead.
      filesystems = maybeFilesystems!;
    } on ApiException catch (e) {
      stderr.write('Failed to instances: ${e.message}');
      return;
    }

    printKvs([
      Kv('Name', filesystems.data.name),
      Kv('Region', filesystems.data.region.name.value),
      Kv('Mount point', filesystems.data.mountPoint),
      Kv('Use', filesystems.data.isInUse ? 'In use' : 'Not in use'),
      Kv('Size', filesystems.data.bytesUsed.toString()),
    ]);
  }
}
