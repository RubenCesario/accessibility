import 'package:accessibility_cupertino/src/ui/core/color_semantics.dart';
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

// The full ten-shade red palette (the exact shade values Material's
// `Colors.red` uses), so `shadeNumberIn` — which maps a shade's *position*
// within the swatch to its shade number — reports the real 50/500/900
// numbers rather than a position that only happens to line up when every
// intervening shade is present.
const ColorSwatch<int> red = ColorSwatch<int>(0xFFF44336, {
  50: Color(0xFFFFEBEE),
  100: Color(0xFFFFCDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFE57373),
  400: Color(0xFFEF5350),
  500: Color(0xFFF44336),
  600: Color(0xFFE53935),
  700: Color(0xFFD32F2F),
  800: Color(0xFFC62828),
  900: Color(0xFFB71C1C),
});

void main() {
  test('shades lists the swatch shades in order', () {
    expect(red.shades, hasLength(10));
    expect(red.shades.first, red[50]);
    expect(red.shades.last, red[900]);
  });

  test('shadeNumberIn maps the index to the shade number', () {
    expect(red[50]!.shadeNumberIn(red), 50);
    expect(red[500]!.shadeNumberIn(red), 500);
    expect(red[900]!.shadeNumberIn(red), 900);
    expect(const Color(0xFF123456).shadeNumberIn(red), 0);
  });

  test('semanticLabel names a known colour and falls back for an unknown '
      'one', () async {
    final l10n = await AccessibilityLocalizations.delegate.load(
      const Locale('en'),
    );
    expect(red.semanticLabel(l10n), 'Red');
    expect(const Color(0xFF123456).semanticLabel(l10n), 'Color not recognized');
  });
}
