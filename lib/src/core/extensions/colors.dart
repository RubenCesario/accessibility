import 'dart:collection' show UnmodifiableListView;
import 'dart:math' as math;

import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/painting.dart' show Color, ColorSwatch, HSLColor;
import 'package:flutter/widgets.dart' show BuildContext;

/// An extension to manipulate a [Color].
extension ColorTransformation on Color {
  /// Adjusts the saturation of a color.
  ///
  /// If no [saturationMultiplier] is provided,
  /// the original color is returned.
  Color adjustSaturation(double? saturationMultiplier) {
    if (saturationMultiplier == null) {
      return this;
    }
    assert(
      saturationMultiplier >= 0,
      'saturationMultiplier must be greater than or equal to 0',
    );
    final hslColor = HSLColor.fromColor(this);
    final originalSaturation = hslColor.saturation;
    final adjustedHslColor = hslColor.withSaturation(
      clampDouble(originalSaturation * saturationMultiplier, 0, 1),
    );
    return adjustedHslColor.toColor();
  }

  /// Adjusts the lightness of a color.
  ///
  /// If no [lightnessFactor] is provided,
  /// the original color is returned.
  ///
  /// HSL is a perceptual color model, placing fully saturated colors around a
  /// circle (conceptually) at a lightness of ​0.5, with a lightness of 0.0
  /// being completely black, and a lightness of 1.0 being completely white.
  /// As the lightness increases or decreases from 0.5, the apparent saturation
  /// decreases proportionally (even though the saturation parameter hasn't
  /// changed). See [HSLColor] for more information.
  ///
  /// The formulas to compute the new saturation are taken from
  /// the [HSLColor.fromColor] method.
  Color adjustLightness(double? lightnessFactor) {
    if (lightnessFactor == null) {
      return this;
    }
    final hslColor = HSLColor.fromColor(this);
    final originalLightness = hslColor.lightness;
    final adjustedLightnessHslColor = hslColor.withLightness(
      clampDouble(originalLightness + lightnessFactor, 0, 1),
    );
    // Calculates the delta to use for the new saturation.
    final red = r / 0xFF;
    final green = g / 0xFF;
    final blue = b / 0xFF;
    final max = math.max(red, math.max(green, blue));
    final min = math.min(red, math.min(green, blue));
    final delta = max - min;
    // Saturation can exceed 1.0 with rounding errors, so clamp it.
    final saturation = adjustedLightnessHslColor.lightness == 1.0
        ? 0.0
        : clampDouble(
            delta /
                (1.0 - (2.0 * adjustedLightnessHslColor.lightness - 1.0).abs()),
            0,
            1,
          );
    final adjustedHslColor = hslColor.withSaturation(saturation);
    return adjustedHslColor.toColor();
  }

  /// Retrieves the shade number of a [Color] from a [ColorSwatch].
  int shadeNumberOfColorSwatch(ColorSwatch<int> colorSwatch) {
    final index = colorSwatch.colorShades.indexWhere(
      (color) => color == this,
    );
    if (index < 0) {
      return 0;
    }
    if (index == 0) {
      return 50;
    }
    return index * 100;
  }
}

/// An extension to retrieve the semantic label of a [ColorSwatch].
extension SemanticColor on Color {
  /// Retrieves the semantic label of the color swatch.
  String semanticLabel(BuildContext context) {
    final stringCode =
        'c${toARGB32().toRadixString(16).substring(2, 8).toUpperCase()}';
    return context.l10na.color(stringCode);
  }
}

/// An extension to retrieve the list of shades of a [ColorSwatch].
extension ShadeColor on ColorSwatch<int> {
  /// Retrieves the list of shades of the color swatch.
  List<Color> get colorShades => UnmodifiableListView(<Color>[
        if (this[50] != null) this[50]!,
        if (this[100] != null) this[100]!,
        if (this[200] != null) this[200]!,
        if (this[300] != null) this[300]!,
        if (this[400] != null) this[400]!,
        if (this[500] != null) this[500]!,
        if (this[600] != null) this[600]!,
        if (this[700] != null) this[700]!,
        if (this[800] != null) this[800]!,
        if (this[900] != null) this[900]!,
      ]);
}
