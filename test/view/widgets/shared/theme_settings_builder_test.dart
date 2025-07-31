import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/theme_settings_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Keys to verify different builder outputs
  const lightModeKey = Key('light-mode');
  const darkModeKey = Key('dark-mode');
  const customColorKey = Key('custom-color');
  const defaultColorKey = Key('default-color');
  const customTextKey = Key('custom-text');
  const defaultTextKey = Key('default-text');
  const effectsEnabledKey = Key('effects-enabled');
  const effectsDisabledKey = Key('effects-disabled');

  late Widget testWidget;

  setUp(() {
    testWidget = buildDefaultTestWidget(
      child: ThemeSettingsBuilder(
        builder: (
          context,
          themeMode,
          colorSettings,
          textSettings, {
          required effectsEnabled,
        }) =>
            Column(
          children: [
            // Show theme mode
            if (themeMode == ThemeMode.light || themeMode == ThemeMode.system)
              const Text('Light Mode', key: lightModeKey)
            else
              const Text('Dark Mode', key: darkModeKey),

            // Show color settings
            if (colorSettings == ColorSettings.defaultSettings)
              const Text('Default Colors', key: defaultColorKey)
            else
              const Text('Custom Colors', key: customColorKey),

            // Show text settings
            if (textSettings == TextSettings.defaultSettings)
              const Text('Default Text', key: defaultTextKey)
            else
              const Text('Custom Text', key: customTextKey),

            // Show effects status
            if (effectsEnabled)
              const Text('Effects Enabled', key: effectsEnabledKey)
            else
              const Text('Effects Disabled', key: effectsDisabledKey),
          ],
        ),
      ),
    );
  });

  group('ThemeSettingsBuilder', () {
    testWidgets('renders with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Default theme mode is light
      expect(find.byKey(lightModeKey), findsOneWidget);
      expect(find.byKey(darkModeKey), findsNothing);

      // Default color settings
      expect(find.byKey(defaultColorKey), findsOneWidget);
      expect(find.byKey(customColorKey), findsNothing);

      // Default text settings
      expect(find.byKey(defaultTextKey), findsOneWidget);
      expect(find.byKey(customTextKey), findsNothing);

      // Default effects enabled
      expect(find.byKey(effectsEnabledKey), findsOneWidget);
      expect(find.byKey(effectsDisabledKey), findsNothing);
    });

    testWidgets('responds to theme mode changes', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      // Change theme mode to dark
      settingsInherited.themeMode.value = ThemeMode.dark;
      await tester.pump();

      // Should now show dark mode
      expect(find.byKey(darkModeKey), findsOneWidget);
      expect(find.byKey(lightModeKey), findsNothing);

      // Change back to light mode
      settingsInherited.themeMode.value = ThemeMode.light;
      await tester.pump();

      // Should show light mode again
      expect(find.byKey(lightModeKey), findsOneWidget);
      expect(find.byKey(darkModeKey), findsNothing);
    });

    testWidgets('responds to color settings changes', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Change to custom color settings
      settingsInherited.colorSettings.value = const ColorSettings(
        colorProfileLevel: ColorProfileLevel.highContrast,
      );
      await tester.pump();

      // Should now show custom colors
      expect(find.byKey(customColorKey), findsOneWidget);
      expect(find.byKey(defaultColorKey), findsNothing);
    });

    testWidgets('responds to text settings changes', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Change to custom text settings
      settingsInherited.textSettings.value = const TextSettings(
        textScaleFactor: 1.5,
        textAlignMode: 'center',
        lineHeight: 1.5,
      );
      await tester.pump();

      // Should now show custom text settings
      expect(find.byKey(customTextKey), findsOneWidget);
      expect(find.byKey(defaultTextKey), findsNothing);
    });

    testWidgets('responds to effects setting changes', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Disable effects
      settingsInherited.effectsAllowed.value = false;
      await tester.pump();

      // Should now show effects disabled
      expect(find.byKey(effectsDisabledKey), findsOneWidget);
      expect(find.byKey(effectsEnabledKey), findsNothing);
    });

    testWidgets('updates for multiple settings changes simultaneously',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Change multiple settings
      settingsInherited.themeMode.value = ThemeMode.dark;
      settingsInherited.colorSettings.value = const ColorSettings(
        colorProfileLevel: ColorProfileLevel.highContrast,
      );
      settingsInherited.textSettings.value = const TextSettings(
        textScaleFactor: 1.2,
        textAlignMode: 'right',
        lineHeight: 1.2,
      );
      settingsInherited.effectsAllowed.value = false;

      await tester.pump();

      // Should reflect all changes
      expect(find.byKey(darkModeKey), findsOneWidget);
      expect(find.byKey(customColorKey), findsOneWidget);
      expect(find.byKey(customTextKey), findsOneWidget);
      expect(find.byKey(effectsDisabledKey), findsOneWidget);
    });
  });
}
