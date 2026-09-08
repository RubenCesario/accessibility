import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_material/src/ui/core/color_semantics.dart';
import 'package:accessibility_material/src/ui/core/material_palette.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  test('shades lists the ten Material shades in order', () {
    expect(Colors.red.shades, hasLength(10));
    expect(Colors.red.shades.first, Colors.red[50]);
    expect(Colors.red.shades.last, Colors.red[900]);
  });

  test('shadeNumberIn maps the index to the shade number', () {
    expect(Colors.red[50]!.shadeNumberIn(Colors.red), 50);
    expect(Colors.red[500]!.shadeNumberIn(Colors.red), 500);
    expect(const Color(0xFF123456).shadeNumberIn(Colors.red), 0);
  });

  test('semanticLabel names every default swatch', () async {
    final l10n = await AccessibilityLocalizations.delegate.load(
      const Locale('en'),
    );
    for (final swatch in kMaterialColors) {
      expect(
        swatch.semanticLabel(l10n),
        isNot('Color not recognized'),
        reason: '$swatch',
      );
    }
    expect(Colors.red.semanticLabel(l10n), 'Red');
    expect(const Color(0xFF123456).semanticLabel(l10n), 'Color not recognized');
  });
}
