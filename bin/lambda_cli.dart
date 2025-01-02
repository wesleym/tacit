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

  CommandRunner('lambda', 'The Lambda Cloud CLI')
    ..addCommand(InstancesCommand())
    ..addCommand(InstanceTypesCommand())
    ..addCommand(FilesystemsCommand())
    ..addCommand(SshCommand())
    ..run(arguments);
}
