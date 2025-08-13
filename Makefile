build: bin/tacit

bin/tacit: api/pubspec.yaml bin/tacit.dart $(shell find lib -name '*.dart')
	dart compile exe bin/tacit.dart -o $@

api/pubspec.yaml: lib/api.dart
	dart run build_runner build --delete-conflicting-outputs

.PHONY: build
