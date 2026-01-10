import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_font_family_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TextFontFamilySettingsItem', () {
    testWidgets('renders switch widget', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextFontFamilySettingsItem(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('switch is off by default', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextFontFamilySettingsItem(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isFalse);
    });

    testWidgets('toggles accessible font when tapped', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextFontFamilySettingsItem(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(TextFontFamilySettingsItem)),
      );

      expect(settings.textSettings.value.isAccessibleFontEnabled, isFalse);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(settings.textSettings.value.isAccessibleFontEnabled, isTrue);
      expect(
        settings.textSettings.value.fontFamily,
        equals(LocalStorageDefaultValues.accessibleFontFamily),
      );
    });

    testWidgets('disables accessible font when tapped again', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextFontFamilySettingsItem(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(TextFontFamilySettingsItem)),
      );

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(settings.textSettings.value.isAccessibleFontEnabled, isTrue);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(settings.textSettings.value.isAccessibleFontEnabled, isFalse);
      expect(
        settings.textSettings.value.fontFamily,
        equals(LocalStorageDefaultValues.fontFamilyDefault),
      );
    });

    testWidgets('has proper semantics when disabled', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextFontFamilySettingsItem(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.label, contains('Accessible font'));
    });

    testWidgets('reflects initial enabled state from settings', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const TextFontFamilySettingsItem(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(TextFontFamilySettingsItem)),
      );

      settings.textSettings.value = const TextSettings(
        fontFamily: 'Verdana',
      );

      await tester.pump();

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isTrue);
    });
  });
}
