import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:lambda_cli/src/commands/chat.dart';
import 'package:lambda_cli/src/commands/filesystems.dart';
import 'package:lambda_cli/src/commands/firewall.dart';
import 'package:lambda_cli/src/commands/images.dart';
import 'package:lambda_cli/src/commands/instance_types.dart';
import 'package:lambda_cli/src/commands/instances.dart';
import 'package:lambda_cli/src/commands/ssh.dart';
import 'package:lambda_cli/src/secrets.dart';
import 'package:openapi/api.dart';

void main(List<String> arguments) async {
  defaultApiClient = ApiClient(
    authentication: ApiKeyAuth('header', 'Authorization')
      ..apiKeyPrefix = 'Bearer'
      ..apiKey = apiKey,
  );

  final runner = CommandRunner('lambda', 'A Lambda Cloud CLI')
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
