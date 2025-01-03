import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

class SshCommand extends Command<void> {
  @override
  String get description => 'List SSH Keys';

  @override
  String get name => 'ssh-keys';

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
    final sshKeysFuture = DefaultApi(defaultApiClient).listSSHKeys();

    final table = Table(
      header: [
        'Name',
        'Public Key',
      ],
    );

    final ListSSHKeys200Response sshKeys;
    try {
      final maybeSshKeys = await sshKeysFuture;
      // This should never be null: an ApiException should have been thrown instead.
      sshKeys = maybeSshKeys!;
    } on ApiException catch (e) {
      stderr.write('Failed to list SSH keys: ${e.message}');
      return;
    }

    final rows = sshKeys.data.map((sk) => [
          sk.name,
          sk.publicKey,
        ]);
    table.addAll(rows);
    stdout.writeln(table);
  }
}
