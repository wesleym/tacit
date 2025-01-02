//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LaunchInstanceRequest {
  /// Returns a new [LaunchInstanceRequest] instance.
  LaunchInstanceRequest({
    required this.regionName,
    required this.instanceTypeName,
    this.sshKeyNames = const [],
    this.fileSystemNames = const [],
    this.quantity = 1,
    this.name,
  });

  /// Short name of a region
  String regionName;

  /// Name of an instance type
  String instanceTypeName;

  /// Names of the SSH keys to allow access to the instances. Currently, exactly one SSH key must be specified.
  List<String> sshKeyNames;

  /// Names of the file systems to attach to the instances. Currently, only one (if any) file system may be specified.
  List<String> fileSystemNames;

  /// Number of instances to launch
  ///
  /// Minimum value: 1
  /// Maximum value: 1
  int quantity;

  /// User-provided name for the instance
  String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchInstanceRequest &&
          other.regionName == regionName &&
          other.instanceTypeName == instanceTypeName &&
          _deepEquality.equals(other.sshKeyNames, sshKeyNames) &&
          _deepEquality.equals(other.fileSystemNames, fileSystemNames) &&
          other.quantity == quantity &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (regionName.hashCode) +
      (instanceTypeName.hashCode) +
      (sshKeyNames.hashCode) +
      (fileSystemNames.hashCode) +
      (quantity.hashCode) +
      (name == null ? 0 : name!.hashCode);

  @override
  String toString() =>
      'LaunchInstanceRequest[regionName=$regionName, instanceTypeName=$instanceTypeName, sshKeyNames=$sshKeyNames, fileSystemNames=$fileSystemNames, quantity=$quantity, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'region_name'] = this.regionName;
    json[r'instance_type_name'] = this.instanceTypeName;
    json[r'ssh_key_names'] = this.sshKeyNames;
    json[r'file_system_names'] = this.fileSystemNames;
    json[r'quantity'] = this.quantity;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [LaunchInstanceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LaunchInstanceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "LaunchInstanceRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "LaunchInstanceRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LaunchInstanceRequest(
        regionName: mapValueOfType<String>(json, r'region_name')!,
        instanceTypeName: mapValueOfType<String>(json, r'instance_type_name')!,
        sshKeyNames: json[r'ssh_key_names'] is Iterable
            ? (json[r'ssh_key_names'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        fileSystemNames: json[r'file_system_names'] is Iterable
            ? (json[r'file_system_names'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        quantity: mapValueOfType<int>(json, r'quantity') ?? 1,
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<LaunchInstanceRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LaunchInstanceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LaunchInstanceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LaunchInstanceRequest> mapFromJson(dynamic json) {
    final map = <String, LaunchInstanceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LaunchInstanceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LaunchInstanceRequest-objects as value to a dart map
  static Map<String, List<LaunchInstanceRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<LaunchInstanceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LaunchInstanceRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'region_name',
    'instance_type_name',
    'ssh_key_names',
  };
}
