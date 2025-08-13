import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_mode_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = buildDefaultTestWidget(
      child: const AccessibilitySettingsConfigurationInherited(
        configuration: AccessibilitySettingsConfiguration.recommended,
        child: ThemeModeSettingsItem(),
      ),
    );
  });

  group('ThemeModeSettingsItem', () {
    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders
      expect(find.byType(ThemeModeSettingsItem), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);

      // Switch should reflect the theme mode (light = off)
      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isFalse); // Light mode = switch off
    });

    testWidgets('toggles theme mode when switch is tapped', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the settings inherited to access the ThemeMode ValueNotifier
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      expect(settingsInherited.themeMode.value, equals(ThemeMode.system));

      // Initially the switch should be off (light mode)
      var switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isFalse);

      // Tap the switch to toggle to dark mode
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isTrue);

      // Verify theme mode was updated to dark
      expect(settingsInherited.themeMode.value, equals(ThemeMode.dark));

      // Tap again to toggle back to light
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isFalse);

      // Verify theme mode was updated back to light
      expect(settingsInherited.themeMode.value, equals(ThemeMode.light));
    });
  });
}
