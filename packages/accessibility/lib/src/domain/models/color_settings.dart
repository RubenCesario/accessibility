import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/enum_by_name.dart';
import 'package:accessibility/src/domain/models/json_reading.dart';
import 'package:meta/meta.dart';

/// Sentinel that tells [ColorSettings.copyWith] a parameter was not passed.
const Object _unset = Object();

/// The colour accessibility settings.
@immutable
final class ColorSettings {
  /// Creates colour settings. Every parameter is optional.
  const ColorSettings({
    this.backgroundColor,
    this.colorProfile = ColorProfileLevel.normal,
  });

  /// The settings that override nothing.
  static const defaults = ColorSettings();

  /// Creates settings from a JSON object produced by [toJson].
  ///
  /// Missing keys and values of the wrong type fall back to the defaults;
  /// unknown [colorProfile] names fall back to [ColorProfileLevel.normal].
  factory ColorSettings.fromJson(Map<String, Object?> json) => ColorSettings(
    backgroundColor: readInt(json, 'backgroundColor'),
    colorProfile: enumByName(
      ColorProfileLevel.values,
      json['colorProfile'],
      fallback: defaults.colorProfile,
    ),
  );

  /// Page background colour as ARGB, or `null` to keep the theme colour.
  final int? backgroundColor;

  /// The colour transformation applied to the theme.
  final ColorProfileLevel colorProfile;

  /// Whether these settings equal [defaults].
  bool get isDefault => this == defaults;

  /// Returns a copy with the given fields replaced.
  ///
  /// Passing `null` for [backgroundColor] clears it; not passing it keeps
  /// the current value.
  ColorSettings copyWith({
    Object? backgroundColor = _unset,
    ColorProfileLevel? colorProfile,
  }) => ColorSettings(
    backgroundColor: identical(backgroundColor, _unset)
        ? this.backgroundColor
        : backgroundColor as int?,
    colorProfile: colorProfile ?? this.colorProfile,
  );

  /// Serialises to a JSON object with one key per field.
  Map<String, Object?> toJson() => {
    'backgroundColor': backgroundColor,
    'colorProfile': colorProfile.name,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorSettings &&
          other.backgroundColor == backgroundColor &&
          other.colorProfile == colorProfile;

  @override
  int get hashCode => Object.hash(backgroundColor, colorProfile);

  @override
  String toString() =>
      'ColorSettings('
      'backgroundColor: $backgroundColor, '
      'colorProfile: $colorProfile)';
}
