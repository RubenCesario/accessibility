import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// The shades of a swatch, lightest first.
extension ColorSwatchShades on ColorSwatch<int> {
  /// The non-null shades among 50, 100, 200, ..., 900.
  List<Color> get shades => [
    for (final key in const [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
      if (this[key] case final Color shade) shade,
  ];
}

/// Spoken names for colours.
extension ColorSemantics on Color {
  /// The localised name of this colour, from the `color` message, which
  /// maps codes such as `cF44336` to "Red"; unknown colours get the
  /// fallback of that message.
  String semanticLabel(AccessibilityLocalizations l10n) {
    final hex = toARGB32().toRadixString(16).padLeft(8, '0');
    return l10n.color('c${hex.substring(2).toUpperCase()}');
  }

  /// The Material shade number (50, 100, ..., 900) of this colour within
  /// [swatch], or 0 when it is not one of its shades.
  int shadeNumberIn(ColorSwatch<int> swatch) {
    final index = swatch.shades.indexOf(this);
    return switch (index) {
      < 0 => 0,
      0 => 50,
      _ => index * 100,
    };
  }
}
