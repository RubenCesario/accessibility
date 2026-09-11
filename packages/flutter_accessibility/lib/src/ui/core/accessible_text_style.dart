import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';

/// Applies [TextSettings] to a [TextStyle].
extension AccessibleTextStyle on TextStyle {
  /// Returns this style with [settings] applied.
  ///
  /// The font size is multiplied by the scale factor when it is set; line
  /// height, spacing, weight and colour override the style only when the
  /// setting is set. When a font family is selected, [font] (the registered
  /// font matching it) provides the qualified family and the style's own
  /// family and fallbacks become the fallback chain, so scripts the
  /// accessible font does not cover keep rendering. Default settings return
  /// this instance unchanged.
  TextStyle applyTextSettings(TextSettings settings, {AccessibleFont? font}) {
    if (settings.isDefault) {
      return this;
    }
    final selectedFamily = settings.fontFamily;
    final matchingFont = font != null && font.family == selectedFamily
        ? font
        : null;
    final family = selectedFamily == null
        ? null
        : matchingFont?.qualifiedFamily ?? selectedFamily;
    final fallback = <String>[
      if (fontFamily != null) fontFamily!,
      ...?fontFamilyFallback,
    ];
    final size = fontSize;
    return copyWith(
      fontSize: size == null ? null : size * settings.textScaleFactor,
      height: settings.lineHeight,
      letterSpacing: settings.letterSpacing,
      wordSpacing: settings.wordSpacing,
      fontWeight: settings.isBold ? FontWeight.bold : null,
      color: settings.color == null ? null : Color(settings.color!),
      fontFamily: family,
      fontFamilyFallback: family != null && fallback.isNotEmpty
          ? fallback
          : null,
    );
  }
}
