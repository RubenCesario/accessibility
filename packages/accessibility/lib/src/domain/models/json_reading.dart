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
Map<String, Object?>? readMap(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is Map<String, Object?> ? value : null;
}
