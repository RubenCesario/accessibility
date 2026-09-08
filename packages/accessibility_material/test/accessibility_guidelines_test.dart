import 'package:accessibility_material/accessibility_material.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'helpers/pump_material.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

/// The panel is taller than the 600 px test window, and the guidelines only
/// evaluate the semantics nodes laid out in the current frame. This checks
/// the three guidelines at the current scroll position, then drags the
/// panel's [CustomScrollView] up by 400 px and repeats, so every item is
/// checked at least once, until [RestoreSettingsButton] is on screen. Fails
/// if the button never appears within 12 scrolls.
Future<void> _checkGuidelinesWhileScrolling(WidgetTester tester) async {
  const maxScrolls = 12;
  for (var scroll = 0; scroll <= maxScrolls; scroll++) {
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    if (find.byType(RestoreSettingsButton).evaluate().isNotEmpty) {
      return;
    }
    if (scroll == maxScrolls) {
      fail('RestoreSettingsButton was never visible after $maxScrolls scrolls');
    }
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
  }
}

void main() {
  for (final style in AccessibilitySettingsStyle.values) {
    group('AccessibilitySettingsPanel (${style.name})', () {
      testWidgets('meets the accessibility guidelines', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpMaterial(
          tester,
          AccessibilitySettingsPanel(style: style),
          fonts: const [andika],
        );
        await _checkGuidelinesWhileScrolling(tester);
        handle.dispose();
      });

      testWidgets('meets the guidelines with every setting active', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();
        await pumpMaterial(
          tester,
          AccessibilitySettingsPanel(style: style),
          fonts: const [andika],
          initial: AccessibilitySettingsSamples.everythingSet,
        );
        await _checkGuidelinesWhileScrolling(tester);
        handle.dispose();
      });
    });
  }
}
