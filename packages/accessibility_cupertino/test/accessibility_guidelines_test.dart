import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_cupertino.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

/// The panel is taller than the 600 px test window, and the guidelines only
/// evaluate the semantics nodes laid out in the current frame. This checks
/// the three guidelines (labelled tap targets, the 44 dp iOS tap target and
/// text contrast) at the current scroll position, then drags the panel's
/// [CustomScrollView] up by 400 px and repeats, so every item is checked at
/// least once, until [CupertinoRestoreSettingsButton] is on screen. Fails if
/// the button never appears within 12 scrolls.
Future<void> _checkGuidelinesWhileScrolling(WidgetTester tester) async {
  const maxScrolls = 12;
  for (var scroll = 0; scroll <= maxScrolls; scroll++) {
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    if (find.byType(CupertinoRestoreSettingsButton).evaluate().isNotEmpty) {
      return;
    }
    if (scroll == maxScrolls) {
      fail(
        'CupertinoRestoreSettingsButton was never visible after '
        '$maxScrolls scrolls',
      );
    }
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
  }
}

void main() {
  for (final style in AccessibilitySettingsStyle.values) {
    group('CupertinoAccessibilitySettingsPanel (${style.name})', () {
      testWidgets('meets the accessibility guidelines', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpCupertino(
          tester,
          CupertinoAccessibilitySettingsPanel(style: style),
          fonts: const [andika],
        );
        await _checkGuidelinesWhileScrolling(tester);
        handle.dispose();
      });

      testWidgets('meets the guidelines with every setting active', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();
        await pumpCupertino(
          tester,
          CupertinoAccessibilitySettingsPanel(style: style),
          fonts: const [andika],
          initial: AccessibilitySettingsSamples.everythingSet,
        );
        await _checkGuidelinesWhileScrolling(tester);
        handle.dispose();
      });
    });
  }
}
