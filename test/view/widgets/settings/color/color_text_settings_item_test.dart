import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/components/circle_color.dart';
import 'package:accessibility/src/view/widgets/components/color_picker.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_text_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ColorTextSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.all,
          child: ColorTextSettingsItem(),
        ),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(ColorTextSettingsItem), findsOneWidget);
      expect(find.byType(ColorPicker), findsOneWidget);
    });

    testWidgets('updates text color settings when color is selected',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the ColorPicker
      final colorPicker = find.byType(ColorPicker);
      expect(colorPicker, findsOneWidget);

      // Get the initial text color settings
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final initialTextColor = settingsInherited.textSettings.value.color;

      // Find and tap a color circle to select a new color
      final colorCircle = find.byType(CircleColor).last;
      expect(colorCircle, findsOneWidget);

      await tester.tap(colorCircle);
      await tester.pumpAndSettle();

      // Verify the text color settings were updated
      final updatedTextColor = settingsInherited.textSettings.value.color;

      expect(updatedTextColor, isNot(equals(initialTextColor)));
    });

    testWidgets('updates shade color settings when a shade is selected',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the initial text color settings
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final initialTextColor = settingsInherited.textSettings.value.color;

      // First select a main color to enter shade selection mode
      await tester.tap(find.byType(CircleColor).last);
      await tester.pumpAndSettle();

      // Should now be in shade selection mode (back button visible)
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Now select a shade color
      await tester.tap(find.byType(CircleColor).last);
      await tester.pumpAndSettle();

      // Verify the text color settings were updated
      final updatedTextColor = settingsInherited.textSettings.value.color;
      expect(updatedTextColor, isNot(equals(initialTextColor)));
    });

    testWidgets('resets text color when close button is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // First select a main color to ensure we have a close button
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Go back to main color selection if we entered shade selection mode
      if (find.byIcon(Icons.arrow_back).evaluate().isNotEmpty) {
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }

      // We should now see the close button
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Get the text color before reset
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final colorBeforeReset = settingsInherited.textSettings.value.color;

      // Tap the close button to reset the color
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Verify the color was reset
      final colorAfterReset = settingsInherited.textSettings.value.color;
      expect(colorAfterReset, isNot(equals(colorBeforeReset)));
    });
  });
}
