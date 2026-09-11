import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_cupertino.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

/// The light default and an explicit dark theme, so every scenario runs in
/// both brightnesses: unresolved `CupertinoDynamicColor`s keep their light
/// variant whatever the brightness, which only a dark run catches.
const brightnesses = <(String, CupertinoThemeData?)>[
  ('light', null),
  ('dark', CupertinoThemeData(brightness: Brightness.dark)),
];

/// The three guidelines every scenario is held to.
Future<void> _checkGuidelines(WidgetTester tester) async {
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
  await expectLater(tester, meetsGuideline(textContrastGuideline));
}

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
    await _checkGuidelines(tester);
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
    for (final (mode, theme) in brightnesses) {
      group('CupertinoAccessibilitySettingsPanel (${style.name}, $mode)', () {
        testWidgets('meets the accessibility guidelines', (tester) async {
          final handle = tester.ensureSemantics();
          await pumpCupertino(
            tester,
            CupertinoAccessibilitySettingsPanel(style: style),
            fonts: const [andika],
            theme: theme,
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
            theme: theme,
          );
          await _checkGuidelinesWhileScrolling(tester);
          handle.dispose();
        });
      });
    }
  }

  for (final (mode, theme) in brightnesses) {
    testWidgets('the load-failed status card meets the guidelines ($mode)', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await pumpCupertino(
        tester,
        const StatusCard(),
        service: FakeAccessibilityStorageService(readError: Exception('disk')),
        theme: theme,
      );
      expect(find.text('Retry'), findsOneWidget);
      await _checkGuidelines(tester);
      handle.dispose();
    });
  }
}
