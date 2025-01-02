//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SshKey {
  /// Returns a new [SshKey] instance.
  SshKey({
    required this.id,
    required this.name,
    required this.publicKey,
    this.privateKey,
  });

  /// Unique identifier (ID) of an SSH key
  String id;

  /// Name of the SSH key
  String name;

  /// Public key for the SSH key
  String publicKey;

  /// Private key for the SSH key. Only returned when generating a new key pair.
  String? privateKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SshKey &&
          other.id == id &&
          other.name == name &&
          other.publicKey == publicKey &&
          other.privateKey == privateKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name.hashCode) +
      (publicKey.hashCode) +
      (privateKey == null ? 0 : privateKey!.hashCode);

  @override
  String toString() =>
      'SshKey[id=$id, name=$name, publicKey=$publicKey, privateKey=$privateKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'public_key'] = this.publicKey;
    if (this.privateKey != null) {
      json[r'private_key'] = this.privateKey;
    } else {
      json[r'private_key'] = null;
    }
    return json;
  }

  /// Returns a new [SshKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SshKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SshKey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SshKey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SshKey(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        publicKey: mapValueOfType<String>(json, r'public_key')!,
        privateKey: mapValueOfType<String>(json, r'private_key'),
      );
    }
    return null;
  }

  static List<SshKey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SshKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SshKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SshKey> mapFromJson(dynamic json) {
    final map = <String, SshKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SshKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SshKey-objects as value to a dart map
  static Map<String, List<SshKey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SshKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SshKey.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'public_key',
  };
}
