import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

class ListSshKeysCommand extends Command<void> {
  @override
  String get description => 'List Registered SSH Public Keys';

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
    final table = Table(
      header: [
        'Name',
        'Public Key',
      ],
    );

    final ListSSHKeys200Response sshKeys;
    try {
      final maybeSshKeys = await DefaultApi(defaultApiClient).listSSHKeys();
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

class AddSshKeyCommand extends Command<void> {
  AddSshKeyCommand() {
    argParser.addOption('public_key',
        help:
            'SSH public key to register. To generate a new keypair, omit this argument.');
  }

  @override
  String get description => 'List SSH Keys';

  @override
  String get name => 'add-ssh-key';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation [--public_key public_key] name';
  }

  @override
  Future<void> run() async {
    final rest = argResults!.rest;
    if (rest.length != 1) {
      usageException('Parameter "name" is required.');
    }

    final AddSSHKey200Response sshKeys;
    try {
      final maybeSshKeys = await DefaultApi(defaultApiClient)
          .addSSHKey(AddSSHKeyRequest(name: rest[0]));
      // This should never be null: an ApiException should have been thrown instead.
      sshKeys = maybeSshKeys!;
    } on ApiException catch (e) {
      stderr.write('Failed to register SSH public key: ${e.message}');
      return;
    }

    stdout
      ..writeln('Name: ${sshKeys.data.name}')
      ..writeln()
      ..writeln('Public key:')
      ..writeln(sshKeys.data.publicKey);
    if (sshKeys.data.privateKey != null) {
      stdout
        ..writeln()
        ..writeln('Private key:')
        ..writeln(sshKeys.data.privateKey);
    }
  }
}
