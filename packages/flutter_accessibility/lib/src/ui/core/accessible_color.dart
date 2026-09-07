import 'package:accessibility/accessibility.dart';
import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/painting.dart';

/// Applies a [ColorProfile] to a [Color].
extension AccessibleColor on Color {
  /// Returns this colour with the profile's saturation multiplier and
  /// lightness factor applied in HSL space; a `null` factor keeps the
  /// component unchanged.
  Color withColorProfile(ColorProfile profile) {
    var hsl = HSLColor.fromColor(this);
    final saturationMultiplier = profile.saturationMultiplier;
    if (saturationMultiplier != null) {
      hsl = hsl.withSaturation(
        clampDouble(hsl.saturation * saturationMultiplier, 0, 1),
      );
    }
    final lightnessFactor = profile.lightnessFactor;
    if (lightnessFactor != null) {
      hsl = hsl.withLightness(
        clampDouble(hsl.lightness * lightnessFactor, 0, 1),
      );
    }
    return hsl.toColor();
  }
}
