// Openapi Generator last run: : 2025-02-20T13:07:22.465826
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

const specUrl = 'https://cloud.lambdalabs.com/api/v1/openapi.yaml';

@Openapi(
  inputSpec: RemoteSpec(path: specUrl),
  generatorName: Generator.dart,
  outputDirectory: 'api',
)
class Api {}