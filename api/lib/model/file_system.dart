//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FileSystem {
  /// Returns a new [FileSystem] instance.
  FileSystem({
    required this.id,
    required this.name,
    required this.created,
    required this.createdBy,
    required this.mountPoint,
    required this.region,
    required this.isInUse,
    this.bytesUsed,
  });

  /// Unique identifier (ID) of a file system
  String id;

  /// Name of a file system
  String name;

  /// A date and time, formatted as an ISO 8601 time stamp
  String created;

  User createdBy;

  /// Absolute path indicating where on instances the file system will be mounted
  String mountPoint;

  Region region;

  /// Whether the file system is currently in use by an instance. File systems that are in use cannot be deleted.
  bool isInUse;

  /// Approximate amount of storage used by the file system, in bytes. This value is an estimate that is updated every several hours.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? bytesUsed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileSystem &&
          other.id == id &&
          other.name == name &&
          other.created == created &&
          other.createdBy == createdBy &&
          other.mountPoint == mountPoint &&
          other.region == region &&
          other.isInUse == isInUse &&
          other.bytesUsed == bytesUsed;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name.hashCode) +
      (created.hashCode) +
      (createdBy.hashCode) +
      (mountPoint.hashCode) +
      (region.hashCode) +
      (isInUse.hashCode) +
      (bytesUsed == null ? 0 : bytesUsed!.hashCode);

  @override
  String toString() =>
      'FileSystem[id=$id, name=$name, created=$created, createdBy=$createdBy, mountPoint=$mountPoint, region=$region, isInUse=$isInUse, bytesUsed=$bytesUsed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'created'] = this.created;
    json[r'created_by'] = this.createdBy;
    json[r'mount_point'] = this.mountPoint;
    json[r'region'] = this.region;
    json[r'is_in_use'] = this.isInUse;
    if (this.bytesUsed != null) {
      json[r'bytes_used'] = this.bytesUsed;
    } else {
      json[r'bytes_used'] = null;
    }
    return json;
  }

  /// Returns a new [FileSystem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FileSystem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FileSystem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FileSystem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FileSystem(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        created: mapValueOfType<String>(json, r'created')!,
        createdBy: User.fromJson(json[r'created_by'])!,
        mountPoint: mapValueOfType<String>(json, r'mount_point')!,
        region: Region.fromJson(json[r'region'])!,
        isInUse: mapValueOfType<bool>(json, r'is_in_use')!,
        bytesUsed: mapValueOfType<int>(json, r'bytes_used'),
      );
    }
    return null;
  }

  static List<FileSystem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FileSystem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FileSystem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FileSystem> mapFromJson(dynamic json) {
    final map = <String, FileSystem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FileSystem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FileSystem-objects as value to a dart map
  static Map<String, List<FileSystem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FileSystem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FileSystem.listFromJson(
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
    'created',
    'created_by',
    'mount_point',
    'region',
    'is_in_use',
  };
}
