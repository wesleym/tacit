//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// Unique identifier for the type of error
class ErrorCode {
  /// Instantiate a new enum with the provided [value].
  const ErrorCode._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const globalSlashUnknown = ErrorCode._(r'global/unknown');
  static const globalSlashInvalidApiKey =
      ErrorCode._(r'global/invalid-api-key');
  static const globalSlashAccountInactive =
      ErrorCode._(r'global/account-inactive');
  static const globalSlashInvalidAddress =
      ErrorCode._(r'global/invalid-address');
  static const globalSlashInvalidParameters =
      ErrorCode._(r'global/invalid-parameters');
  static const globalSlashObjectDoesNotExist =
      ErrorCode._(r'global/object-does-not-exist');
  static const globalSlashQuotaExceeded = ErrorCode._(r'global/quota-exceeded');
  static const instanceOperationsSlashLaunchSlashInsufficientCapacity =
      ErrorCode._(r'instance-operations/launch/insufficient-capacity');
  static const instanceOperationsSlashLaunchSlashFileSystemInWrongRegion =
      ErrorCode._(r'instance-operations/launch/file-system-in-wrong-region');
  static const sshKeysSlashKeyInUse = ErrorCode._(r'ssh-keys/key-in-use');

  /// List of all possible values in this [enum][ErrorCode].
  static const values = <ErrorCode>[
    globalSlashUnknown,
    globalSlashInvalidApiKey,
    globalSlashAccountInactive,
    globalSlashInvalidAddress,
    globalSlashInvalidParameters,
    globalSlashObjectDoesNotExist,
    globalSlashQuotaExceeded,
    instanceOperationsSlashLaunchSlashInsufficientCapacity,
    instanceOperationsSlashLaunchSlashFileSystemInWrongRegion,
    sshKeysSlashKeyInUse,
  ];

  static ErrorCode? fromJson(dynamic value) =>
      ErrorCodeTypeTransformer().decode(value);

  static List<ErrorCode> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ErrorCode>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ErrorCode.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ErrorCode] to String,
/// and [decode] dynamic data back to [ErrorCode].
class ErrorCodeTypeTransformer {
  factory ErrorCodeTypeTransformer() =>
      _instance ??= const ErrorCodeTypeTransformer._();

  const ErrorCodeTypeTransformer._();

  String encode(ErrorCode data) => data.value;

  /// Decodes a [dynamic value][data] to a ErrorCode.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ErrorCode? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'global/unknown':
          return ErrorCode.globalSlashUnknown;
        case r'global/invalid-api-key':
          return ErrorCode.globalSlashInvalidApiKey;
        case r'global/account-inactive':
          return ErrorCode.globalSlashAccountInactive;
        case r'global/invalid-address':
          return ErrorCode.globalSlashInvalidAddress;
        case r'global/invalid-parameters':
          return ErrorCode.globalSlashInvalidParameters;
        case r'global/object-does-not-exist':
          return ErrorCode.globalSlashObjectDoesNotExist;
        case r'global/quota-exceeded':
          return ErrorCode.globalSlashQuotaExceeded;
        case r'instance-operations/launch/insufficient-capacity':
          return ErrorCode
              .instanceOperationsSlashLaunchSlashInsufficientCapacity;
        case r'instance-operations/launch/file-system-in-wrong-region':
          return ErrorCode
              .instanceOperationsSlashLaunchSlashFileSystemInWrongRegion;
        case r'ssh-keys/key-in-use':
          return ErrorCode.sshKeysSlashKeyInUse;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ErrorCodeTypeTransformer] instance.
  static ErrorCodeTypeTransformer? _instance;
}
