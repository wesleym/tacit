import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:lambda_cli/src/commands/filesystems.dart';
import 'package:lambda_cli/src/commands/instance_types.dart';
import 'package:lambda_cli/src/commands/instances.dart';
import 'package:lambda_cli/src/commands/ssh.dart';
import 'package:lambda_cli/src/secrets.dart';
import 'package:openapi/api.dart';

void main(List<String> arguments) {
  defaultApiClient = ApiClient(
    authentication: ApiKeyAuth('header', 'Authorization')
      ..apiKeyPrefix = 'Bearer'
      ..apiKey = apiKey,
  );

  final runner = CommandRunner('lambda_cli.exe', 'A Lambda Cloud CLI')
    ..addCommand(ListInstancesCommand())
    ..addCommand(TerminateInstancesCommand())
    ..addCommand(RestartInstancesCommand())
    ..addCommand(InstanceTypesCommand())
    ..addCommand(FilesystemsCommand())
    ..addCommand(ListSshKeysCommand())
    ..addCommand(AddSshKeyCommand())
    ..addCommand(DeleteSshKeyCommand());
  runner.run(arguments).catchError((error) {
    assert (error is UsageException);
    stderr.writeln(error);
    exit(64);
  });
}
