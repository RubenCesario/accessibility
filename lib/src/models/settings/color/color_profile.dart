import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show IconData, Icons;

/// Defines all color profile levels.
enum ColorProfileLevel {
  /// Normal saturation color profile.
  normal,

  /// Low saturation color profile.
  lowSaturation,

  /// High saturation color profile.
  highSaturation,

  /// Monochrome color profile.
  monochrome,

  /// High contrast color profile.
  highContrast;

  /// Parses a [String] to a [ColorProfileLevel].
  static ColorProfileLevel fromString(String key) =>
      ColorProfileLevel.values.firstWhere(
        (element) => element.name == key,
        orElse: () => ColorProfileLevel.normal,
      );
}

/// Models a color profile.
@immutable
final class ColorProfile {
  /// Creates a [ColorProfile] instance from a [ColorProfileLevel].
  factory ColorProfile.fromLevel(ColorProfileLevel level) => switch (level) {
        ColorProfileLevel.lowSaturation => ColorProfile._lowSaturation(),
        ColorProfileLevel.normal => ColorProfile._normal(),
        ColorProfileLevel.highSaturation => ColorProfile._highSaturation(),
        ColorProfileLevel.monochrome => ColorProfile._monochrome(),
        ColorProfileLevel.highContrast => ColorProfile._highContrast(),
      };

  /// Creates a [ColorProfile] instance.
  const ColorProfile._({
    required this.level,
    required this.icon,
    this.saturationMultiplier,
    this.lightnessFactor,
  });

  /// All possible color profiles.
  static const values = [
    ColorProfile._(
      level: ColorProfileLevel.normal,
      icon: Icons.brightness_medium,
      saturationMultiplier: 1,
      lightnessFactor: 0,
    ),
    ColorProfile._(
      level: ColorProfileLevel.lowSaturation,
      icon: Icons.brightness_low,
      saturationMultiplier: 0.5,
    ),
    ColorProfile._(
      level: ColorProfileLevel.highSaturation,
      icon: Icons.brightness_high,
      saturationMultiplier: 1.5,
    ),
    ColorProfile._(
      level: ColorProfileLevel.monochrome,
      icon: Icons.brightness_1_outlined,
      lightnessFactor: 1,
    ),
    ColorProfile._(
      level: ColorProfileLevel.highContrast,
      icon: Icons.brightness_1,
      lightnessFactor: -1,
    ),
  ];

  /// The level of the color profile.
  final ColorProfileLevel level;

  /// The icon of the color profile.
  final IconData icon;

  /// The saturation of the color profile.
  final double? saturationMultiplier;

  /// The lightness of the color profile.
  final double? lightnessFactor;

  factory ColorProfile._lowSaturation() => const ColorProfile._(
        level: ColorProfileLevel.lowSaturation,
        icon: Icons.brightness_low,
        saturationMultiplier: 0.5,
      );

  factory ColorProfile._normal() => const ColorProfile._(
        level: ColorProfileLevel.normal,
        icon: Icons.brightness_medium,
        saturationMultiplier: 1,
        lightnessFactor: 0,
      );

  factory ColorProfile._highSaturation() => const ColorProfile._(
        level: ColorProfileLevel.highSaturation,
        icon: Icons.brightness_high,
        saturationMultiplier: 1.5,
      );

  factory ColorProfile._monochrome() => const ColorProfile._(
        level: ColorProfileLevel.monochrome,
        icon: Icons.brightness_1_outlined,
        lightnessFactor: 1,
      );

  factory ColorProfile._highContrast() => const ColorProfile._(
        level: ColorProfileLevel.highContrast,
        icon: Icons.brightness_1,
        lightnessFactor: -1,
      );

  /// Creates a copy of this [ColorProfile] but with
  /// the given fields replaced with the new values.
  ColorProfile copyWith({
    ColorProfileLevel? level,
    IconData? icon,
    double? saturationMultiplier,
    double? lightnessFactor,
  }) =>
      ColorProfile._(
        level: level ?? this.level,
        icon: icon ?? this.icon,
        saturationMultiplier: saturationMultiplier ?? this.saturationMultiplier,
        lightnessFactor: lightnessFactor ?? this.lightnessFactor,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ColorProfile &&
        other.level == level &&
        other.icon == icon &&
        other.saturationMultiplier == saturationMultiplier &&
        other.lightnessFactor == lightnessFactor;
  }

  @override
  int get hashCode =>
      level.hashCode ^
      icon.hashCode ^
      saturationMultiplier.hashCode ^
      lightnessFactor.hashCode;

  @override
  String toString() => 'ColorProfile(level: $level, '
      'icon: $icon, '
      'saturationMultiplier: $saturationMultiplier, '
      'lightnessFactor: $lightnessFactor)';
}
