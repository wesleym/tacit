//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceTypes200ResponseDataValue {
  /// Returns a new [InstanceTypes200ResponseDataValue] instance.
  InstanceTypes200ResponseDataValue({
    required this.instanceType,
    this.regionsWithCapacityAvailable = const [],
  });

  InstanceType instanceType;

  /// List of regions, if any, that have this instance type available
  List<Region> regionsWithCapacityAvailable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceTypes200ResponseDataValue &&
          other.instanceType == instanceType &&
          _deepEquality.equals(
              other.regionsWithCapacityAvailable, regionsWithCapacityAvailable);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (instanceType.hashCode) + (regionsWithCapacityAvailable.hashCode);

  @override
  String toString() =>
      'InstanceTypes200ResponseDataValue[instanceType=$instanceType, regionsWithCapacityAvailable=$regionsWithCapacityAvailable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'instance_type'] = this.instanceType;
    json[r'regions_with_capacity_available'] =
        this.regionsWithCapacityAvailable;
    return json;
  }

  /// Returns a new [InstanceTypes200ResponseDataValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceTypes200ResponseDataValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceTypes200ResponseDataValue[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceTypes200ResponseDataValue[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceTypes200ResponseDataValue(
        instanceType: InstanceType.fromJson(json[r'instance_type'])!,
        regionsWithCapacityAvailable:
            Region.listFromJson(json[r'regions_with_capacity_available']),
      );
    }
    return null;
  }

  static List<InstanceTypes200ResponseDataValue> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceTypes200ResponseDataValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceTypes200ResponseDataValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceTypes200ResponseDataValue> mapFromJson(
      dynamic json) {
    final map = <String, InstanceTypes200ResponseDataValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceTypes200ResponseDataValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceTypes200ResponseDataValue-objects as value to a dart map
  static Map<String, List<InstanceTypes200ResponseDataValue>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceTypes200ResponseDataValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceTypes200ResponseDataValue.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'instance_type',
    'regions_with_capacity_available',
  };
}
