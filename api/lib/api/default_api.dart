//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultApi {
  DefaultApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add SSH key
  ///
  /// Add an SSH key  To use an existing key pair, enter the public key for the `public_key` property of the request body.  To generate a new key pair, omit the `public_key` property from the request body. Save the `private_key` from the response somewhere secure. For example, with curl:  ``` curl https://cloud.lambdalabs.com/api/v1/ssh-keys \\   --fail \\   -u ${LAMBDA_API_KEY}: \\   -X POST \\   -d '{\"name\": \"new key\"}' \\   | jq -r '.data.private_key' > key.pem  chmod 400 key.pem ```  Then, after you launch an instance with `new key` attached to it: ``` ssh -i key.pem <instance IP> ```
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AddSSHKeyRequest] addSSHKeyRequest (required):
  Future<Response> addSSHKeyWithHttpInfo(
    AddSSHKeyRequest addSSHKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/ssh-keys';

    // ignore: prefer_final_locals
    Object? postBody = addSSHKeyRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Add SSH key
  ///
  /// Add an SSH key  To use an existing key pair, enter the public key for the `public_key` property of the request body.  To generate a new key pair, omit the `public_key` property from the request body. Save the `private_key` from the response somewhere secure. For example, with curl:  ``` curl https://cloud.lambdalabs.com/api/v1/ssh-keys \\   --fail \\   -u ${LAMBDA_API_KEY}: \\   -X POST \\   -d '{\"name\": \"new key\"}' \\   | jq -r '.data.private_key' > key.pem  chmod 400 key.pem ```  Then, after you launch an instance with `new key` attached to it: ``` ssh -i key.pem <instance IP> ```
  ///
  /// Parameters:
  ///
  /// * [AddSSHKeyRequest] addSSHKeyRequest (required):
  Future<AddSSHKey200Response?> addSSHKey(
    AddSSHKeyRequest addSSHKeyRequest,
  ) async {
    final response = await addSSHKeyWithHttpInfo(
      addSSHKeyRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'AddSSHKey200Response',
      ) as AddSSHKey200Response;
    }
    return null;
  }

  /// Delete SSH key
  ///
  /// Delete an SSH key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the SSH key
  Future<Response> deleteSSHKeyWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/ssh-keys/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete SSH key
  ///
  /// Delete an SSH key.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the SSH key
  Future<void> deleteSSHKey(
    String id,
  ) async {
    final response = await deleteSSHKeyWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// List details of a specific instance
  ///
  /// Retrieves details of a specific instance, including whether or not the instance is running.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the instance
  Future<Response> getInstanceWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/instances/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List details of a specific instance
  ///
  /// Retrieves details of a specific instance, including whether or not the instance is running.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the instance
  Future<GetInstance200Response?> getInstance(
    String id,
  ) async {
    final response = await getInstanceWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GetInstance200Response',
      ) as GetInstance200Response;
    }
    return null;
  }

  /// Retrieve list of offered instance types
  ///
  /// Returns a detailed list of the instance types offered by Lambda GPU Cloud. The details include the regions, if any, in which each instance type is currently available.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> instanceTypesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/instance-types';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve list of offered instance types
  ///
  /// Returns a detailed list of the instance types offered by Lambda GPU Cloud. The details include the regions, if any, in which each instance type is currently available.
  Future<InstanceTypes200Response?> instanceTypes() async {
    final response = await instanceTypesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'InstanceTypes200Response',
      ) as InstanceTypes200Response;
    }
    return null;
  }

  /// Launch instances
  ///
  /// Launches one or more instances of a given instance type.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LaunchInstanceRequest] launchInstanceRequest (required):
  Future<Response> launchInstanceWithHttpInfo(
    LaunchInstanceRequest launchInstanceRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/instance-operations/launch';

    // ignore: prefer_final_locals
    Object? postBody = launchInstanceRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Launch instances
  ///
  /// Launches one or more instances of a given instance type.
  ///
  /// Parameters:
  ///
  /// * [LaunchInstanceRequest] launchInstanceRequest (required):
  Future<LaunchInstance200Response?> launchInstance(
    LaunchInstanceRequest launchInstanceRequest,
  ) async {
    final response = await launchInstanceWithHttpInfo(
      launchInstanceRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'LaunchInstance200Response',
      ) as LaunchInstance200Response;
    }
    return null;
  }

  /// List file systems
  ///
  /// Retrieve the list of file systems
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> listFileSystemsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/file-systems';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List file systems
  ///
  /// Retrieve the list of file systems
  Future<ListFileSystems200Response?> listFileSystems() async {
    final response = await listFileSystemsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ListFileSystems200Response',
      ) as ListFileSystems200Response;
    }
    return null;
  }

  /// List running instances
  ///
  /// Retrieves a detailed list of running instances.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> listInstancesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/instances';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List running instances
  ///
  /// Retrieves a detailed list of running instances.
  Future<ListInstances200Response?> listInstances() async {
    final response = await listInstancesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ListInstances200Response',
      ) as ListInstances200Response;
    }
    return null;
  }

  /// List SSH keys
  ///
  /// Retrieve the list of SSH keys
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> listSSHKeysWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/ssh-keys';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List SSH keys
  ///
  /// Retrieve the list of SSH keys
  Future<ListSSHKeys200Response?> listSSHKeys() async {
    final response = await listSSHKeysWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ListSSHKeys200Response',
      ) as ListSSHKeys200Response;
    }
    return null;
  }

  /// Restart instances
  ///
  /// Restarts the given instances.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RestartInstanceRequest] restartInstanceRequest (required):
  Future<Response> restartInstanceWithHttpInfo(
    RestartInstanceRequest restartInstanceRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/instance-operations/restart';

    // ignore: prefer_final_locals
    Object? postBody = restartInstanceRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Restart instances
  ///
  /// Restarts the given instances.
  ///
  /// Parameters:
  ///
  /// * [RestartInstanceRequest] restartInstanceRequest (required):
  Future<RestartInstance200Response?> restartInstance(
    RestartInstanceRequest restartInstanceRequest,
  ) async {
    final response = await restartInstanceWithHttpInfo(
      restartInstanceRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'RestartInstance200Response',
      ) as RestartInstance200Response;
    }
    return null;
  }

  /// Terminate an instance
  ///
  /// Terminates a given instance.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [TerminateInstanceRequest] terminateInstanceRequest (required):
  Future<Response> terminateInstanceWithHttpInfo(
    TerminateInstanceRequest terminateInstanceRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/instance-operations/terminate';

    // ignore: prefer_final_locals
    Object? postBody = terminateInstanceRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Terminate an instance
  ///
  /// Terminates a given instance.
  ///
  /// Parameters:
  ///
  /// * [TerminateInstanceRequest] terminateInstanceRequest (required):
  Future<TerminateInstance200Response?> terminateInstance(
    TerminateInstanceRequest terminateInstanceRequest,
  ) async {
    final response = await terminateInstanceWithHttpInfo(
      terminateInstanceRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'TerminateInstance200Response',
      ) as TerminateInstance200Response;
    }
    return null;
  }
}
