import 'package:accessibility/src/domain/models/color_profile_level.dart';
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
