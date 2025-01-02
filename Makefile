build: bin/lambda_cli.exe

bin/lambda_cli.exe: api/pubspec.yaml
	dart compile exe bin/lambda_cli.dart -o $@

api/pubspec.yaml: lib/api.dart
	dart run build_runner build --delete-conflicting-outputs

.PHONY: build
