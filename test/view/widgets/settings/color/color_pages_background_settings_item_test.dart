import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/components/circle_color.dart';
import 'package:accessibility/src/view/widgets/components/color_picker.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_pages_background_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ColorPagesBackgroundSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.all,
          child: ColorPagesBackgroundSettingsItem(),
        ),
      );
    });
    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ColorPagesBackgroundSettingsItem), findsOneWidget);
      expect(find.byType(ColorPicker), findsOneWidget);
    });

    testWidgets('updates color settings when color is selected',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the ColorPicker
      final colorPicker = find.byType(ColorPicker);
      expect(colorPicker, findsOneWidget);

      // Get the initial color settings
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final initialColorValue =
          settingsInherited.colorSettings.value.pagesBackgroundColorValue;

      // Tap the color button to select a color
      await tester.tap(find.byType(CircleColor).last);
      await tester.pumpAndSettle();

      // Verify the color settings were updated
      final updatedColorValue =
          settingsInherited.colorSettings.value.pagesBackgroundColorValue;
      expect(updatedColorValue, isNot(equals(initialColorValue)));
    });

    testWidgets('updates shade color settings when shade is selected',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the ColorPicker
      final colorPicker = find.byType(ColorPicker);
      expect(colorPicker, findsOneWidget);

      // Get the initial color settings
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final initialColorValue =
          settingsInherited.colorSettings.value.pagesBackgroundColorValue;

      // First select a main color to move to shade selection
      await tester.tap(find.byType(CircleColor).last);
      await tester.pumpAndSettle();

      // Now we should see the back button indicating we're in shade selection
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Select a shade color
      await tester.tap(find.byType(CircleColor).last);
      await tester.pumpAndSettle();

      // Verify the color settings were updated
      final updatedColorValue =
          settingsInherited.colorSettings.value.pagesBackgroundColorValue;
      expect(updatedColorValue, isNot(equals(initialColorValue)));
    });

    testWidgets('resets color when close button is tapped', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // First select a color to ensure we have a close button
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Go back to main color selection if we were taken to shade selection
      if (find.byIcon(Icons.arrow_back).evaluate().isNotEmpty) {
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }

      // We should now see the close button
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Get color value before reset
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final colorValueBeforeReset =
          settingsInherited.colorSettings.value.pagesBackgroundColorValue;

      // Tap the close button to reset the color
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Verify the color was reset
      final colorValueAfterReset =
          settingsInherited.colorSettings.value.pagesBackgroundColorValue;
      expect(colorValueAfterReset, isNot(equals(colorValueBeforeReset)));
    });
  });
}
