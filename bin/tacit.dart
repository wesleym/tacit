import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:tacit/src/commands/chat.dart';
import 'package:tacit/src/commands/filesystems.dart';
import 'package:tacit/src/commands/firewall.dart';
import 'package:tacit/src/commands/images.dart';
import 'package:tacit/src/commands/instance_types.dart';
import 'package:tacit/src/commands/instances.dart';
import 'package:tacit/src/commands/ssh.dart';
import 'package:tacit/src/secrets.dart';
import 'package:openapi/api.dart';

void main(List<String> arguments) async {
  defaultApiClient = ApiClient(
    basePath: 'https://cloud.lambda.ai',
    authentication: ApiKeyAuth('header', 'Authorization')
      ..apiKeyPrefix = 'Bearer'
      ..apiKey = apiKey,
  );

  final runner = CommandRunner(
    'tacit',
    'A command-line tool for the Lambda Cloud API and the Lambda Inference API',
  )
    ..addCommand(ListInstancesCommand())
    ..addCommand(InstanceDetailsCommand())
    ..addCommand(LaunchInstancesCommand())
    ..addCommand(RenameInstanceCommand())
    ..addCommand(TerminateInstancesCommand())
    ..addCommand(RestartInstancesCommand())
    ..addCommand(InstanceTypesCommand())
    ..addCommand(ListImagesCommand())
    ..addCommand(FilesystemsCommand())
    ..addCommand(CreateFilesystemCommand())
    ..addCommand(DeleteFilesystemsCommand())
    ..addCommand(ListSshKeysCommand())
    ..addCommand(AddSshKeyCommand())
    ..addCommand(DeleteSshKeyCommand())
    ..addCommand(FirewallCommand())
    ..addCommand(UpdateFirewallCommand())
    ..addCommand(ChatCommand());
  try {
    await runner.run(arguments);
  } on UsageException catch (e) {
    stderr.writeln(e);
    exit(64);
  }

  exit(0);
}
