import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_profile_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeProfileSettingsItem', () {
    late Widget testWidget;
    late ThemeProfileLevel testProfileLevel;

    setUp(() {
      // Use seizure-safe profile for testing
      testProfileLevel = ThemeProfileLevel.seizureSafe;

      testWidget = buildDefaultTestWidget(
        child: AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.recommended,
          child: ThemeProfileSettingsItem(
            themeProfileLevel: testProfileLevel,
          ),
        ),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(ThemeProfileSettingsItem), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('switch reflects profile state correctly', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Initially the switch should be OFF because default settings
      // don't match any specific profile
      final switchFinder = find.byType(Switch);
      final switchWidget = tester.widget<Switch>(switchFinder);
      expect(switchWidget.value, isFalse);
    });

    testWidgets('applies theme profile when switch is turned on',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Capture initial settings
      final initialTextSettings = settingsInherited.textSettings.value;
      final initialColorSettings = settingsInherited.colorSettings.value;
      final initialEffectsAllowed = settingsInherited.effectsAllowed.value;

      // Find and tap the switch to apply the profile
      final switchFinder = find.byType(Switch);
      await tester.tap(switchFinder);
      await tester.pumpAndSettle();

      // Verify the profile was applied by checking if settings changed
      final updatedTextSettings = settingsInherited.textSettings.value;
      final updatedColorSettings = settingsInherited.colorSettings.value;
      final updatedEffectsAllowed = settingsInherited.effectsAllowed.value;

      expect(
        updatedTextSettings != initialTextSettings ||
            updatedColorSettings != initialColorSettings ||
            updatedEffectsAllowed != initialEffectsAllowed,
        isTrue,
        reason: 'At least one setting should change when profile is applied',
      );

      // The switch should now be ON
      final updatedSwitchWidget = tester.widget<Switch>(switchFinder);
      expect(updatedSwitchWidget.value, isTrue);

      // Verify settings match the expected profile
      final expectedProfile = ThemeProfile.fromLevel(testProfileLevel);
      expect(updatedTextSettings, equals(expectedProfile.textSettings));
      expect(updatedColorSettings, equals(expectedProfile.colorSettings));
      expect(updatedEffectsAllowed, equals(expectedProfile.effectsAllowed));
    });

    testWidgets('resets to no profile when switch is turned off',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // First apply the profile by tapping the switch
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      // Now turn it off
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // The switch should be OFF
      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isFalse);

      // Verify settings no longer match the specific profile
      final profile = ThemeProfile.fromLevel(testProfileLevel);
      final currentTextSettings = settingsInherited.textSettings.value;
      final currentColorSettings = settingsInherited.colorSettings.value;
      final currentEffectsAllowed = settingsInherited.effectsAllowed.value;

      expect(
        currentTextSettings == profile.textSettings &&
            currentColorSettings == profile.colorSettings &&
            currentEffectsAllowed == profile.effectsAllowed,
        isFalse,
        reason: 'Settings should no longer match the profile',
      );
    });
  });
}
