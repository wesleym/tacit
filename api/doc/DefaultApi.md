# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://cloud.lambdalabs.com/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addSSHKey**](DefaultApi.md#addsshkey) | **POST** /ssh-keys | Add SSH key
[**deleteSSHKey**](DefaultApi.md#deletesshkey) | **DELETE** /ssh-keys/{id} | Delete SSH key
[**getInstance**](DefaultApi.md#getinstance) | **GET** /instances/{id} | List details of a specific instance
[**instanceTypes**](DefaultApi.md#instancetypes) | **GET** /instance-types | Retrieve list of offered instance types
[**launchInstance**](DefaultApi.md#launchinstance) | **POST** /instance-operations/launch | Launch instances
[**listFileSystems**](DefaultApi.md#listfilesystems) | **GET** /file-systems | List file systems
[**listInstances**](DefaultApi.md#listinstances) | **GET** /instances | List running instances
[**listSSHKeys**](DefaultApi.md#listsshkeys) | **GET** /ssh-keys | List SSH keys
[**restartInstance**](DefaultApi.md#restartinstance) | **POST** /instance-operations/restart | Restart instances
[**terminateInstance**](DefaultApi.md#terminateinstance) | **POST** /instance-operations/terminate | Terminate an instance


# **addSSHKey**
> AddSSHKey200Response addSSHKey(addSSHKeyRequest)

Add SSH key

Add an SSH key  To use an existing key pair, enter the public key for the `public_key` property of the request body.  To generate a new key pair, omit the `public_key` property from the request body. Save the `private_key` from the response somewhere secure. For example, with curl:  ``` curl https://cloud.lambdalabs.com/api/v1/ssh-keys \\   --fail \\   -u ${LAMBDA_API_KEY}: \\   -X POST \\   -d '{\"name\": \"new key\"}' \\   | jq -r '.data.private_key' > key.pem  chmod 400 key.pem ```  Then, after you launch an instance with `new key` attached to it: ``` ssh -i key.pem <instance IP> ``` 

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final addSSHKeyRequest = AddSSHKeyRequest(); // AddSSHKeyRequest | 

try {
    final result = api_instance.addSSHKey(addSSHKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->addSSHKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addSSHKeyRequest** | [**AddSSHKeyRequest**](AddSSHKeyRequest.md)|  | 

### Return type

[**AddSSHKey200Response**](AddSSHKey200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSSHKey**
> deleteSSHKey(id)

Delete SSH key

Delete an SSH key.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = id_example; // String | The unique identifier (ID) of the SSH key

try {
    api_instance.deleteSSHKey(id);
} catch (e) {
    print('Exception when calling DefaultApi->deleteSSHKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the SSH key | 

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getInstance**
> GetInstance200Response getInstance(id)

List details of a specific instance

Retrieves details of a specific instance, including whether or not the instance is running. 

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = id_example; // String | The unique identifier (ID) of the instance

try {
    final result = api_instance.getInstance(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the instance | 

### Return type

[**GetInstance200Response**](GetInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **instanceTypes**
> InstanceTypes200Response instanceTypes()

Retrieve list of offered instance types

Returns a detailed list of the instance types offered by Lambda GPU Cloud. The details include the regions, if any, in which each instance type is currently available. 

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();

try {
    final result = api_instance.instanceTypes();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->instanceTypes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InstanceTypes200Response**](InstanceTypes200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **launchInstance**
> LaunchInstance200Response launchInstance(launchInstanceRequest)

Launch instances

Launches one or more instances of a given instance type.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final launchInstanceRequest = LaunchInstanceRequest(); // LaunchInstanceRequest | 

try {
    final result = api_instance.launchInstance(launchInstanceRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->launchInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **launchInstanceRequest** | [**LaunchInstanceRequest**](LaunchInstanceRequest.md)|  | 

### Return type

[**LaunchInstance200Response**](LaunchInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFileSystems**
> ListFileSystems200Response listFileSystems()

List file systems

Retrieve the list of file systems

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();

try {
    final result = api_instance.listFileSystems();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listFileSystems: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListFileSystems200Response**](ListFileSystems200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listInstances**
> ListInstances200Response listInstances()

List running instances

Retrieves a detailed list of running instances.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();

try {
    final result = api_instance.listInstances();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listInstances: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListInstances200Response**](ListInstances200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSSHKeys**
> ListSSHKeys200Response listSSHKeys()

List SSH keys

Retrieve the list of SSH keys

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();

try {
    final result = api_instance.listSSHKeys();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listSSHKeys: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListSSHKeys200Response**](ListSSHKeys200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **restartInstance**
> RestartInstance200Response restartInstance(restartInstanceRequest)

Restart instances

Restarts the given instances.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final restartInstanceRequest = RestartInstanceRequest(); // RestartInstanceRequest | 

try {
    final result = api_instance.restartInstance(restartInstanceRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->restartInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **restartInstanceRequest** | [**RestartInstanceRequest**](RestartInstanceRequest.md)|  | 

### Return type

[**RestartInstance200Response**](RestartInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **terminateInstance**
> TerminateInstance200Response terminateInstance(terminateInstanceRequest)

Terminate an instance

Terminates a given instance.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final terminateInstanceRequest = TerminateInstanceRequest(); // TerminateInstanceRequest | 

try {
    final result = api_instance.terminateInstance(terminateInstanceRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->terminateInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **terminateInstanceRequest** | [**TerminateInstanceRequest**](TerminateInstanceRequest.md)|  | 

### Return type

[**TerminateInstance200Response**](TerminateInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

