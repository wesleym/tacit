import 'package:args/command_runner.dart';
import 'package:lambda_cli/instances.dart';
import 'package:lambda_cli/secrets.dart';
import 'package:openapi/api.dart';

void main(List<String> arguments) {
  defaultApiClient = ApiClient(
    authentication: ApiKeyAuth('header', 'Authorization')
      ..apiKeyPrefix = 'Bearer'
      ..apiKey = apiKey,
  );

  CommandRunner('lambda', 'The Lambda Cloud CLI')
    ..addCommand(InstancesCommand())
    ..run(arguments);
}
