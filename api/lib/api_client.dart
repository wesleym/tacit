//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({
    this.basePath = 'https://cloud.lambda.ai',
    this.authentication,
  });

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty
        ? '?${urlEncodedQueryParams.join('&')}'
        : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (body is MultipartFile &&
          (contentType == null ||
              !contentType.toLowerCase().startsWith('multipart/form-data'))) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
              request.sink.add,
              onDone: request.sink.close,
              // ignore: avoid_types_on_closure_parameters
              onError: (Object error, StackTrace trace) => request.sink.close(),
              cancelOnError: true,
            );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
          ? formParams
          : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch (method) {
        case 'POST':
          return await _client.post(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PUT':
          return await _client.put(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'DELETE':
          return await _client.delete(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PATCH':
          return await _client.patch(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'HEAD':
          return await _client.head(
            uri,
            headers: nullableHeaderParams,
          );
        case 'GET':
          return await _client.get(
            uri,
            headers: nullableHeaderParams,
          );
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(
    String value,
    String targetType, {
    bool growable = false,
  }) async =>
      // ignore: deprecated_member_use_from_same_package
      deserialize(value, targetType, growable: growable);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(
    String value,
    String targetType, {
    bool growable = false,
  }) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType =
        targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
        ? value
        : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(
    dynamic value,
    String targetType, {
    bool growable = false,
  }) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'AddSSHKey200Response':
          return AddSSHKey200Response.fromJson(value);
        case 'AddSSHKey200ResponseData':
          return AddSSHKey200ResponseData.fromJson(value);
        case 'AddSSHKeyRequest':
          return AddSSHKeyRequest.fromJson(value);
        case 'ApiErrorAccountInactive':
          return ApiErrorAccountInactive.fromJson(value);
        case 'ApiErrorDuplicate':
          return ApiErrorDuplicate.fromJson(value);
        case 'ApiErrorFileSystemInWrongRegion':
          return ApiErrorFileSystemInWrongRegion.fromJson(value);
        case 'ApiErrorFilesystemInUse':
          return ApiErrorFilesystemInUse.fromJson(value);
        case 'ApiErrorFilesystemNotFound':
          return ApiErrorFilesystemNotFound.fromJson(value);
        case 'ApiErrorFirewallRulesetInUse':
          return ApiErrorFirewallRulesetInUse.fromJson(value);
        case 'ApiErrorFirewallRulesetNotFound':
          return ApiErrorFirewallRulesetNotFound.fromJson(value);
        case 'ApiErrorInstanceNotFound':
          return ApiErrorInstanceNotFound.fromJson(value);
        case 'ApiErrorInsufficientCapacity':
          return ApiErrorInsufficientCapacity.fromJson(value);
        case 'ApiErrorInternal':
          return ApiErrorInternal.fromJson(value);
        case 'ApiErrorInvalidBillingAddress':
          return ApiErrorInvalidBillingAddress.fromJson(value);
        case 'ApiErrorInvalidParameters':
          return ApiErrorInvalidParameters.fromJson(value);
        case 'ApiErrorLaunchResourceNotFound':
          return ApiErrorLaunchResourceNotFound.fromJson(value);
        case 'ApiErrorQuotaExceeded':
          return ApiErrorQuotaExceeded.fromJson(value);
        case 'ApiErrorUnauthorized':
          return ApiErrorUnauthorized.fromJson(value);
        case 'CreateFilesystem200Response':
          return CreateFilesystem200Response.fromJson(value);
        case 'CreateFilesystem400Response':
          return CreateFilesystem400Response.fromJson(value);
        case 'CreateFilesystem400ResponseError':
          return CreateFilesystem400ResponseError.fromJson(value);
        case 'CreateFirewallRuleset200Response':
          return CreateFirewallRuleset200Response.fromJson(value);
        case 'CreateFirewallRuleset400Response':
          return CreateFirewallRuleset400Response.fromJson(value);
        case 'CreateFirewallRuleset400ResponseError':
          return CreateFirewallRuleset400ResponseError.fromJson(value);
        case 'CreateFirewallRuleset409Response':
          return CreateFirewallRuleset409Response.fromJson(value);
        case 'DeleteFirewallRuleset400Response':
          return DeleteFirewallRuleset400Response.fromJson(value);
        case 'DeleteSSHKey200Response':
          return DeleteSSHKey200Response.fromJson(value);
        case 'Filesystem':
          return Filesystem.fromJson(value);
        case 'FilesystemCreateRequest':
          return FilesystemCreateRequest.fromJson(value);
        case 'FilesystemDelete200Response':
          return FilesystemDelete200Response.fromJson(value);
        case 'FilesystemDelete400Response':
          return FilesystemDelete400Response.fromJson(value);
        case 'FilesystemDelete404Response':
          return FilesystemDelete404Response.fromJson(value);
        case 'FilesystemDeleteResponse':
          return FilesystemDeleteResponse.fromJson(value);
        case 'FilesystemMountEntry':
          return FilesystemMountEntry.fromJson(value);
        case 'FirewallRule':
          return FirewallRule.fromJson(value);
        case 'FirewallRulesList200Response':
          return FirewallRulesList200Response.fromJson(value);
        case 'FirewallRulesPutRequest':
          return FirewallRulesPutRequest.fromJson(value);
        case 'FirewallRuleset':
          return FirewallRuleset.fromJson(value);
        case 'FirewallRulesetCreateRequest':
          return FirewallRulesetCreateRequest.fromJson(value);
        case 'FirewallRulesetEntry':
          return FirewallRulesetEntry.fromJson(value);
        case 'FirewallRulesetPatchRequest':
          return FirewallRulesetPatchRequest.fromJson(value);
        case 'FirewallRulesetsList200Response':
          return FirewallRulesetsList200Response.fromJson(value);
        case 'GeneratedSSHKey':
          return GeneratedSSHKey.fromJson(value);
        case 'GetFirewallRuleset404Response':
          return GetFirewallRuleset404Response.fromJson(value);
        case 'GetGlobalFirewallRuleset200Response':
          return GetGlobalFirewallRuleset200Response.fromJson(value);
        case 'GetInstance200Response':
          return GetInstance200Response.fromJson(value);
        case 'GetInstance401Response':
          return GetInstance401Response.fromJson(value);
        case 'GetInstance404Response':
          return GetInstance404Response.fromJson(value);
        case 'GlobalFirewallRuleset':
          return GlobalFirewallRuleset.fromJson(value);
        case 'GlobalFirewallRulesetPatchRequest':
          return GlobalFirewallRulesetPatchRequest.fromJson(value);
        case 'Image':
          return Image.fromJson(value);
        case 'ImageArchitecture':
          return ImageArchitectureTypeTransformer().decode(value);
        case 'ImageSpecificationFamily':
          return ImageSpecificationFamily.fromJson(value);
        case 'ImageSpecificationID':
          return ImageSpecificationID.fromJson(value);
        case 'Instance':
          return Instance.fromJson(value);
        case 'InstanceActionAvailability':
          return InstanceActionAvailability.fromJson(value);
        case 'InstanceActionAvailabilityDetails':
          return InstanceActionAvailabilityDetails.fromJson(value);
        case 'InstanceActionAvailabilityDetailsReasonCode':
          return InstanceActionAvailabilityDetailsReasonCode.fromJson(value);
        case 'InstanceActionUnavailableCode':
          return InstanceActionUnavailableCodeTypeTransformer().decode(value);
        case 'InstanceLaunchRequest':
          return InstanceLaunchRequest.fromJson(value);
        case 'InstanceLaunchRequestImage':
          return InstanceLaunchRequestImage.fromJson(value);
        case 'InstanceLaunchResponse':
          return InstanceLaunchResponse.fromJson(value);
        case 'InstanceModificationRequest':
          return InstanceModificationRequest.fromJson(value);
        case 'InstanceRestartRequest':
          return InstanceRestartRequest.fromJson(value);
        case 'InstanceRestartResponse':
          return InstanceRestartResponse.fromJson(value);
        case 'InstanceStatus':
          return InstanceStatusTypeTransformer().decode(value);
        case 'InstanceTerminateRequest':
          return InstanceTerminateRequest.fromJson(value);
        case 'InstanceTerminateResponse':
          return InstanceTerminateResponse.fromJson(value);
        case 'InstanceType':
          return InstanceType.fromJson(value);
        case 'InstanceTypeSpecs':
          return InstanceTypeSpecs.fromJson(value);
        case 'InstanceTypesItem':
          return InstanceTypesItem.fromJson(value);
        case 'LaunchInstance200Response':
          return LaunchInstance200Response.fromJson(value);
        case 'LaunchInstance400Response':
          return LaunchInstance400Response.fromJson(value);
        case 'LaunchInstance400ResponseError':
          return LaunchInstance400ResponseError.fromJson(value);
        case 'LaunchInstance403Response':
          return LaunchInstance403Response.fromJson(value);
        case 'LaunchInstance403ResponseError':
          return LaunchInstance403ResponseError.fromJson(value);
        case 'LaunchInstance404Response':
          return LaunchInstance404Response.fromJson(value);
        case 'ListFilesystems200Response':
          return ListFilesystems200Response.fromJson(value);
        case 'ListImages200Response':
          return ListImages200Response.fromJson(value);
        case 'ListInstanceTypes200Response':
          return ListInstanceTypes200Response.fromJson(value);
        case 'ListInstances200Response':
          return ListInstances200Response.fromJson(value);
        case 'ListInstances401Response':
          return ListInstances401Response.fromJson(value);
        case 'ListInstances403Response':
          return ListInstances403Response.fromJson(value);
        case 'ListSSHKeys200Response':
          return ListSSHKeys200Response.fromJson(value);
        case 'NetworkProtocol':
          return NetworkProtocolTypeTransformer().decode(value);
        case 'PostInstance400Response':
          return PostInstance400Response.fromJson(value);
        case 'PublicRegionCode':
          return PublicRegionCodeTypeTransformer().decode(value);
        case 'Region':
          return Region.fromJson(value);
        case 'RequestedFilesystemMountEntry':
          return RequestedFilesystemMountEntry.fromJson(value);
        case 'RequestedTagEntry':
          return RequestedTagEntry.fromJson(value);
        case 'RestartInstance200Response':
          return RestartInstance200Response.fromJson(value);
        case 'SSHKey':
          return SSHKey.fromJson(value);
        case 'TagEntry':
          return TagEntry.fromJson(value);
        case 'TerminateInstance200Response':
          return TerminateInstance200Response.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserStatus':
          return UserStatusTypeTransformer().decode(value);
        default:
          dynamic match;
          if (value is List &&
              (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toList(growable: growable);
          }
          if (value is Set &&
              (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toSet();
          }
          if (value is Map &&
              (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(
                    v,
                    match,
                    growable: growable,
                  )),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.internalServerError,
        'Exception during deserialization.',
        error,
        trace,
      );
    }
    throw ApiException(
      HttpStatus.internalServerError,
      'Could not find a suitable class for deserialization',
    );
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String' ? message.json : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
      ? message.json
      : ApiClient.fromJson(
          json.decode(message.json),
          targetType,
          growable: message.growable,
        );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async =>
    value == null ? '' : json.encode(value);
