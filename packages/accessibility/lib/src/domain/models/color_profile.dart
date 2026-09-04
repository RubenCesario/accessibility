import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:meta/meta.dart';

/// How a [ColorProfileLevel] transforms colours.
@immutable
final class ColorProfile {
  const ColorProfile._({
    required this.level,
    this.saturationMultiplier,
    this.lightnessFactor,
  });

  /// Returns the profile of [level].
  factory ColorProfile.fromLevel(ColorProfileLevel level) => switch (level) {
    ColorProfileLevel.normal => normal,
    ColorProfileLevel.lowSaturation => lowSaturation,
    ColorProfileLevel.highSaturation => highSaturation,
    ColorProfileLevel.monochrome => monochrome,
    ColorProfileLevel.highContrast => highContrast,
  };

  /// No transformation.
  static const normal = ColorProfile._(
    level: ColorProfileLevel.normal,
    saturationMultiplier: 1,
    lightnessFactor: 0,
  );

  /// Saturation halved.
  static const lowSaturation = ColorProfile._(
    level: ColorProfileLevel.lowSaturation,
    saturationMultiplier: 0.5,
  );

  /// Saturation doubled.
  static const highSaturation = ColorProfile._(
    level: ColorProfileLevel.highSaturation,
    saturationMultiplier: 2,
  );

  /// Saturation removed.
  static const monochrome = ColorProfile._(
    level: ColorProfileLevel.monochrome,
    saturationMultiplier: 0,
  );

  /// Lightness pushed towards the extremes.
  static const highContrast = ColorProfile._(
    level: ColorProfileLevel.highContrast,
    lightnessFactor: 0.5,
  );

  /// Every profile, in [ColorProfileLevel] order.
  static const values = [
    normal,
    lowSaturation,
    highSaturation,
    monochrome,
    highContrast,
  ];

  /// The level this profile implements.
  final ColorProfileLevel level;

  /// Factor applied to the HSL saturation, or `null` to keep it.
  final double? saturationMultiplier;

  /// Amount by which lightness moves towards black or white, or `null`.
  final double? lightnessFactor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorProfile &&
          other.level == level &&
          other.saturationMultiplier == saturationMultiplier &&
          other.lightnessFactor == lightnessFactor;

  @override
  int get hashCode => Object.hash(level, saturationMultiplier, lightnessFactor);

  @override
  String toString() =>
      'ColorProfile('
      'level: $level, '
      'saturationMultiplier: $saturationMultiplier, '
      'lightnessFactor: $lightnessFactor)';
}
