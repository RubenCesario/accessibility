/// Tolerant readers for JSON maps: a missing key or a value of the wrong
/// type reads as `null`, so callers fall back to defaults.
library;

/// Reads [key] as a `double`; integral values are widened.
double? readDouble(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is num ? value.toDouble() : null;
}

/// Reads [key] as an `int`.
int? readInt(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is int ? value : null;
}

/// Reads [key] as a `bool`.
bool? readBool(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is bool ? value : null;
}

/// Reads [key] as a `String`.
String? readString(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is String ? value : null;
}

/// Reads [key] as a JSON object.
///
/// Accepts any [Map], not only `Map<String, Object?>`: `dart:convert`
/// always decodes JSON objects that way, but a caller may pass a map from
/// elsewhere (YAML, a database driver) typed `Map<dynamic, dynamic>`. Its
/// entries are copied, dropping any whose key is not a `String`.
Map<String, Object?>? readMap(Map<String, Object?> json, String key) {
  final value = json[key];
  if (value is Map<String, Object?>) {
    return value;
  }
  if (value is Map) {
    return <String, Object?>{
      for (final entry in value.entries)
        if (entry.key is String) entry.key as String: entry.value,
    };
  }
  return null;
}
