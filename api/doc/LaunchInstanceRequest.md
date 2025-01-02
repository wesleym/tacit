# openapi.model.LaunchInstanceRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**regionName** | **String** | Short name of a region | 
**instanceTypeName** | **String** | Name of an instance type | 
**sshKeyNames** | **List<String>** | Names of the SSH keys to allow access to the instances. Currently, exactly one SSH key must be specified. | [default to const []]
**fileSystemNames** | **List<String>** | Names of the file systems to attach to the instances. Currently, only one (if any) file system may be specified. | [optional] [default to const []]
**quantity** | **int** | Number of instances to launch | [optional] [default to 1]
**name** | **String** | User-provided name for the instance | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


