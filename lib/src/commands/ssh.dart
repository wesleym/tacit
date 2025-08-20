import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:tacit/src/kvprinter.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';

class ListSshKeysCommand extends Command<void> {
  @override
  String get description => 'List registered SSH keys';

  @override
  String get name => 'list-ssh-keys';

  @override
  String get category => 'SSH keys';

  @override
  List<String> get aliases => ['ssh-keys'];

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
    final ListSSHKeys200Response sshKeys;
    try {
      final maybeSshKeys = await SSHKeysApi(defaultApiClient).listSSHKeys();
      // This should never be null: an ApiException should have been thrown instead.
      sshKeys = maybeSshKeys!;
    } on ApiException catch (e) {
      stderr.write('Failed to list SSH keys: ${e.message}');
      return;
    }

    if (sshKeys.data.isEmpty) {
      stdout.writeln('No SSH keys registered.');
      return;
    }

    printKvs([
      Kv('ID:', sshKeys.data[0].id),
      Kv('Name:', sshKeys.data[0].name),
      Kv('Public key:', sshKeys.data[0].publicKey),
    ]);

    for (final key in sshKeys.data.sublist(1)) {
      stdout.writeln();
      printKvs([
        Kv('ID:', key.id),
        Kv('Name:', key.name),
        Kv('Public key:', key.publicKey),
      ]);
    }
  }
}

class AddSshKeyCommand extends Command<void> {
  AddSshKeyCommand() {
    argParser.addOption('public_key',
        help:
            'SSH public key to register. To generate a new keypair, omit this argument.');
  }

  @override
  String get description => 'Add SSH key';

  @override
  String get name => 'add-ssh-key';

  @override
  String get category => 'SSH keys';

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
      final maybeSshKeys = await SSHKeysApi(defaultApiClient)
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
      ..writeln(sshKeys.data.publicKey)
      ..writeln()
      ..writeln('Private key:')
      ..writeln(sshKeys.data.privateKey);
  }
}

class DeleteSshKeyCommand extends Command<void> {
  @override
  String get description => 'Delete SSH keys';

  @override
  String get name => 'delete-ssh-key';

  @override
  String get category => 'SSH keys';

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation ssh_key_id';
  }

  @override
  Future<void> run() async {
    final rest = argResults!.rest;
    if (rest.length != 1) {
      usageException('Parameter "ssh_key_id" is required.');
    }

    try {
      await SSHKeysApi(defaultApiClient).deleteSSHKey(rest[0]);
    } on ApiException catch (e) {
      stderr.write('Failed to delete SSH public key: ${e.message}');
      return;
    }

    stdout.writeln('SSH key ${rest[0]} deleted.');
  }
}
