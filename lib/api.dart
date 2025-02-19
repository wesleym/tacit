// Openapi Generator last run: : 2025-02-19T18:44:20.122248
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

const specUrl = 'https://cloud.lambdalabs.com/api/v1/openapi.yaml';

@Openapi(
  inputSpec: RemoteSpec(path: specUrl),
  generatorName: Generator.dart,
  outputDirectory: 'api',
)
class Api {}