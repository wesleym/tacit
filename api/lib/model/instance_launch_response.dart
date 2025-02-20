//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceLaunchResponse {
  /// Returns a new [InstanceLaunchResponse] instance.
  InstanceLaunchResponse({
    this.instanceIds = const [],
  });

  /// The unique identifiers (IDs) of the launched instances.
  List<String> instanceIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceLaunchResponse &&
          _deepEquality.equals(other.instanceIds, instanceIds);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (instanceIds.hashCode);

  @override
  String toString() => 'InstanceLaunchResponse[instanceIds=$instanceIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'instance_ids'] = this.instanceIds;
    return json;
  }

  /// Returns a new [InstanceLaunchResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceLaunchResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceLaunchResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceLaunchResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceLaunchResponse(
        instanceIds: json[r'instance_ids'] is Iterable
            ? (json[r'instance_ids'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<InstanceLaunchResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceLaunchResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceLaunchResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceLaunchResponse> mapFromJson(dynamic json) {
    final map = <String, InstanceLaunchResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceLaunchResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceLaunchResponse-objects as value to a dart map
  static Map<String, List<InstanceLaunchResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceLaunchResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceLaunchResponse.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'instance_ids',
  };
}
