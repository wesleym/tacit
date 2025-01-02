# openapi.model.Instance

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier (ID) of an instance | 
**name** | **String** | User-provided name for the instance | [optional] 
**ip** | **String** | IPv4 address of the instance | [optional] 
**privateIp** | **String** | Private IPv4 address of the instance | [optional] 
**status** | **String** | The current status of the instance | 
**sshKeyNames** | **List<String>** | Names of the SSH keys allowed to access the instance | [default to const []]
**fileSystemNames** | **List<String>** | Names of the file systems, if any, attached to the instance | [default to const []]
**region** | [**Region**](Region.md) |  | [optional] 
**instanceType** | [**InstanceType**](InstanceType.md) |  | [optional] 
**hostname** | **String** | Hostname assigned to this instance, which resolves to the instance's IP. | [optional] 
**jupyterToken** | **String** | Secret token used to log into the jupyter lab server hosted on the instance. | [optional] 
**jupyterUrl** | **String** | URL that opens a jupyter lab notebook on the instance. | [optional] 
**isReserved** | **bool** | Whether the instance is reserved. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


