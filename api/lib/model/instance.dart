//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Instance {
  /// Returns a new [Instance] instance.
  Instance({
    required this.id,
    this.name,
    this.ip,
    this.privateIp,
    required this.status,
    this.sshKeyNames = const [],
    this.fileSystemNames = const [],
    this.region,
    this.instanceType,
    this.hostname,
    this.jupyterToken,
    this.jupyterUrl,
    this.isReserved,
  });

  /// Unique identifier (ID) of an instance
  String id;

  /// User-provided name for the instance
  String? name;

  /// IPv4 address of the instance
  String? ip;

  /// Private IPv4 address of the instance
  String? privateIp;

  /// The current status of the instance
  InstanceStatusEnum status;

  /// Names of the SSH keys allowed to access the instance
  List<String> sshKeyNames;

  /// Names of the file systems, if any, attached to the instance
  List<String> fileSystemNames;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Region? region;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  InstanceType? instanceType;

  /// Hostname assigned to this instance, which resolves to the instance's IP.
  String? hostname;

  /// Secret token used to log into the jupyter lab server hosted on the instance.
  String? jupyterToken;

  /// URL that opens a jupyter lab notebook on the instance.
  String? jupyterUrl;

  /// Whether the instance is reserved.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isReserved;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Instance &&
          other.id == id &&
          other.name == name &&
          other.ip == ip &&
          other.privateIp == privateIp &&
          other.status == status &&
          _deepEquality.equals(other.sshKeyNames, sshKeyNames) &&
          _deepEquality.equals(other.fileSystemNames, fileSystemNames) &&
          other.region == region &&
          other.instanceType == instanceType &&
          other.hostname == hostname &&
          other.jupyterToken == jupyterToken &&
          other.jupyterUrl == jupyterUrl &&
          other.isReserved == isReserved;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (ip == null ? 0 : ip!.hashCode) +
      (privateIp == null ? 0 : privateIp!.hashCode) +
      (status.hashCode) +
      (sshKeyNames.hashCode) +
      (fileSystemNames.hashCode) +
      (region == null ? 0 : region!.hashCode) +
      (instanceType == null ? 0 : instanceType!.hashCode) +
      (hostname == null ? 0 : hostname!.hashCode) +
      (jupyterToken == null ? 0 : jupyterToken!.hashCode) +
      (jupyterUrl == null ? 0 : jupyterUrl!.hashCode) +
      (isReserved == null ? 0 : isReserved!.hashCode);

  @override
  String toString() =>
      'Instance[id=$id, name=$name, ip=$ip, privateIp=$privateIp, status=$status, sshKeyNames=$sshKeyNames, fileSystemNames=$fileSystemNames, region=$region, instanceType=$instanceType, hostname=$hostname, jupyterToken=$jupyterToken, jupyterUrl=$jupyterUrl, isReserved=$isReserved]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.ip != null) {
      json[r'ip'] = this.ip;
    } else {
      json[r'ip'] = null;
    }
    if (this.privateIp != null) {
      json[r'private_ip'] = this.privateIp;
    } else {
      json[r'private_ip'] = null;
    }
    json[r'status'] = this.status;
    json[r'ssh_key_names'] = this.sshKeyNames;
    json[r'file_system_names'] = this.fileSystemNames;
    if (this.region != null) {
      json[r'region'] = this.region;
    } else {
      json[r'region'] = null;
    }
    if (this.instanceType != null) {
      json[r'instance_type'] = this.instanceType;
    } else {
      json[r'instance_type'] = null;
    }
    if (this.hostname != null) {
      json[r'hostname'] = this.hostname;
    } else {
      json[r'hostname'] = null;
    }
    if (this.jupyterToken != null) {
      json[r'jupyter_token'] = this.jupyterToken;
    } else {
      json[r'jupyter_token'] = null;
    }
    if (this.jupyterUrl != null) {
      json[r'jupyter_url'] = this.jupyterUrl;
    } else {
      json[r'jupyter_url'] = null;
    }
    if (this.isReserved != null) {
      json[r'is_reserved'] = this.isReserved;
    } else {
      json[r'is_reserved'] = null;
    }
    return json;
  }

  /// Returns a new [Instance] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Instance? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Instance[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Instance[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Instance(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name'),
        ip: mapValueOfType<String>(json, r'ip'),
        privateIp: mapValueOfType<String>(json, r'private_ip'),
        status: InstanceStatusEnum.fromJson(json[r'status'])!,
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
        region: Region.fromJson(json[r'region']),
        instanceType: InstanceType.fromJson(json[r'instance_type']),
        hostname: mapValueOfType<String>(json, r'hostname'),
        jupyterToken: mapValueOfType<String>(json, r'jupyter_token'),
        jupyterUrl: mapValueOfType<String>(json, r'jupyter_url'),
        isReserved: mapValueOfType<bool>(json, r'is_reserved'),
      );
    }
    return null;
  }

  static List<Instance> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Instance>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Instance.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Instance> mapFromJson(dynamic json) {
    final map = <String, Instance>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Instance.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Instance-objects as value to a dart map
  static Map<String, List<Instance>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Instance>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Instance.listFromJson(
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
    'status',
    'ssh_key_names',
    'file_system_names',
  };
}

/// The current status of the instance
class InstanceStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const InstanceStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = InstanceStatusEnum._(r'active');
  static const booting = InstanceStatusEnum._(r'booting');
  static const unhealthy = InstanceStatusEnum._(r'unhealthy');
  static const terminating = InstanceStatusEnum._(r'terminating');
  static const terminated = InstanceStatusEnum._(r'terminated');

  /// List of all possible values in this [enum][InstanceStatusEnum].
  static const values = <InstanceStatusEnum>[
    active,
    booting,
    unhealthy,
    terminating,
    terminated,
  ];

  static InstanceStatusEnum? fromJson(dynamic value) =>
      InstanceStatusEnumTypeTransformer().decode(value);

  static List<InstanceStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InstanceStatusEnum] to String,
/// and [decode] dynamic data back to [InstanceStatusEnum].
class InstanceStatusEnumTypeTransformer {
  factory InstanceStatusEnumTypeTransformer() =>
      _instance ??= const InstanceStatusEnumTypeTransformer._();

  const InstanceStatusEnumTypeTransformer._();

  String encode(InstanceStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a InstanceStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InstanceStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return InstanceStatusEnum.active;
        case r'booting':
          return InstanceStatusEnum.booting;
        case r'unhealthy':
          return InstanceStatusEnum.unhealthy;
        case r'terminating':
          return InstanceStatusEnum.terminating;
        case r'terminated':
          return InstanceStatusEnum.terminated;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InstanceStatusEnumTypeTransformer] instance.
  static InstanceStatusEnumTypeTransformer? _instance;
}
