import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/models/config/accessibility_settings_style.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

Future<void> _pumpCards(WidgetTester tester) async {
  // A tall surface so the whole card screen is laid out and tappable.
  tester.view.physicalSize = const Size(1200, 3000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(
    buildDefaultTestWidget(
      // Use the full configuration so every control is exercised.
      child: const AccessibilitySettings(
        configuration: AccessibilitySettingsConfiguration.all,
        style: AccessibilitySettingsStyle.cards,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

AccessibilitySettingsInherited _settings(WidgetTester tester) =>
    AccessibilitySettingsInherited.of(
      tester.element(find.byType(AccessibilitySettings)),
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AccessibilitySettings (cards style) accessibility guidelines', () {
    testWidgets('renders profile and toggle cards', (tester) async {
      await _pumpCards(tester);
      // The segmented profile selector (Default + 3 profiles).
      expect(find.text('Default profile'), findsOneWidget);
      expect(find.text('Seizure safe'), findsOneWidget);
      // The theme/effects toggle row.
      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Effects'), findsOneWidget);
      // The segmented align card shows its localized title.
      expect(find.text('Text alignment'), findsOneWidget);
    });

    testWidgets('all interactive elements expose a semantic label',
        (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpCards(tester);
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      handle.dispose();
    });

    testWidgets('tap targets meet the minimum size (48x48)', (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpCards(tester);
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      handle.dispose();
    });

    testWidgets('text meets the minimum contrast ratio', (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpCards(tester);
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
    });

    testWidgets('tapping the theme card toggles dark mode', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);
      expect(settings.themeMode.value, equals(ThemeMode.system));

      await tester.tap(find.text('Theme'));
      await tester.pumpAndSettle();

      expect(settings.themeMode.value, equals(ThemeMode.dark));
    });

    testWidgets('tapping the effects card toggles effects', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);
      expect(settings.effectsAllowed.value, isTrue);

      await tester.tap(find.text('Effects'));
      await tester.pumpAndSettle();

      expect(settings.effectsAllowed.value, isFalse);
    });

    testWidgets('tapping a profile card applies that profile', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);

      // Seizure-safe profile disables effects.
      await tester.tap(find.text('Seizure safe'));
      await tester.pumpAndSettle();

      expect(settings.effectsAllowed.value, isFalse);
    });

    testWidgets('tapping the bold card toggles bold text', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);
      expect(settings.textSettings.value.isFontWeightBold, isFalse);

      await tester.tap(find.text('Bold text'));
      await tester.pumpAndSettle();

      expect(settings.textSettings.value.isFontWeightBold, isTrue);
    });

    testWidgets('tapping the accessible-font card enables it', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);
      expect(settings.textSettings.value.isAccessibleFontEnabled, isFalse);

      await tester.tap(find.text('Accessible font'));
      await tester.pumpAndSettle();

      expect(settings.textSettings.value.isAccessibleFontEnabled, isTrue);
    });

    testWidgets('font size stepper increments and decrements', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);
      expect(settings.textSettings.value.textScaleFactor, equals(1.0));

      await tester.tap(find.byTooltip('Increment text scale factor'));
      await tester.pumpAndSettle();
      expect(settings.textSettings.value.textScaleFactor, greaterThan(1.0));

      await tester.tap(find.byTooltip('Decrement text scale factor'));
      await tester.pumpAndSettle();
      expect(settings.textSettings.value.textScaleFactor, equals(1.0));
    });

    testWidgets('segmented align card sets and clears alignment',
        (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);
      expect(settings.textSettings.value.textAlignMode, equals('none'));

      await tester.tap(find.byTooltip('Align center'));
      await tester.pumpAndSettle();
      expect(settings.textSettings.value.textAlignMode, equals('center'));

      // Tapping the active segment again clears back to default.
      await tester.tap(find.byTooltip('Align center'));
      await tester.pumpAndSettle();
      expect(settings.textSettings.value.textAlignMode, equals('none'));
    });

    testWidgets('word/line/letter steppers increment', (tester) async {
      await _pumpCards(tester);
      final settings = _settings(tester);

      await tester.tap(find.byTooltip('Increment word spacing'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Increment line height'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Increment letter spacing'));
      await tester.pumpAndSettle();

      expect(settings.textSettings.value.wordSpacing, greaterThan(0));
      expect(settings.textSettings.value.lineHeight, greaterThan(0));
      expect(settings.textSettings.value.letterSpacing, greaterThan(0));
    });
  });
}
