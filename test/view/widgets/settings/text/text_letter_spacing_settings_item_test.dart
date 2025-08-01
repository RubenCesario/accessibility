import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/components/restore_settings_button.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_letter_spacing_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TextLetterSpacingSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.recommended,
          child: Column(
            children: [
              TextLetterSpacingSettingsItem(),
              RestoreSettingsButton(),
            ],
          ),
        ),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(TextLetterSpacingSettingsItem), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
    });

    testWidgets('increases letter spacing when add button is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial letter spacing value
      final initialSpacing = settingsInherited.textSettings.value.letterSpacing;

      // Find and tap the increment button
      final addButton = find.byIcon(Icons.add);
      expect(addButton, findsOneWidget);

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verify the letter spacing was increased
      final updatedSpacing = settingsInherited.textSettings.value.letterSpacing;
      expect(updatedSpacing, greaterThan(initialSpacing));
    });

    testWidgets('decreases letter spacing when remove button is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Make sure we're not at the minimum already by increasing first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      final spacingBeforeDecrease =
          settingsInherited.textSettings.value.letterSpacing;

      // Find and tap the decrement button
      final removeButton = find.byIcon(Icons.remove);
      expect(removeButton, findsOneWidget);

      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      // Verify the letter spacing was decreased
      final updatedSpacing = settingsInherited.textSettings.value.letterSpacing;
      expect(updatedSpacing, lessThan(spacingBeforeDecrease));
    });

    testWidgets('resets to default when reset button is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final initialLetterSpacing =
          settingsInherited.textSettings.value.letterSpacing;

      // Increase the letter spacing first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verify the letter spacing changed
      expect(
        settingsInherited.textSettings.value.letterSpacing,
        greaterThan(initialLetterSpacing),
      );

      // Now tap the reset button
      await tester.tap(find.byType(RestoreSettingsButton));
      await tester.pumpAndSettle();

      // Verify the letter spacing was reset to default
      expect(
        settingsInherited.textSettings.value.letterSpacing,
        equals(
          LocalStorageDefaultValues.letterSpacingDefault,
        ),
      );
    });

    testWidgets('enforces minimum and maximum boundaries', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the min and max bounds for letter spacing
      const minLetterSpacing = -1.0; // Default minimum value
      const maxLetterSpacing = 2.0; // Default maximum value

      // Test exceeding maximum boundary
      // Set letter spacing close to max first
      settingsInherited.textSettings.value =
          settingsInherited.textSettings.value.copyWith(
        letterSpacing: maxLetterSpacing - 0.1,
      );
      await tester.pumpAndSettle();

      // Now try to exceed max by tapping add button multiple times
      for (var i = 0; i < 10; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
      }

      // Verify that the value doesn't exceed maximum (tests line 61)
      final maxValue = settingsInherited.textSettings.value.letterSpacing;
      expect(maxValue, lessThanOrEqualTo(maxLetterSpacing));

      // Test enforcing minimum boundary
      // Set letter spacing close to min
      settingsInherited.textSettings.value =
          settingsInherited.textSettings.value.copyWith(
        letterSpacing: minLetterSpacing + 0.1,
      );
      await tester.pumpAndSettle();

      // Try to go below minimum by tapping remove button multiple times
      for (var i = 0; i < 10; i++) {
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pumpAndSettle();
      }

      // Verify that the value doesn't go below minimum (tests line 63)
      final minValue = settingsInherited.textSettings.value.letterSpacing;
      expect(minValue, greaterThanOrEqualTo(minLetterSpacing));
    });

    testWidgets('updates letter spacing when slider is changed',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial letter spacing value
      final initialSpacing = settingsInherited.textSettings.value.letterSpacing;

      // Find the slider
      final slider = find.byType(Slider);
      expect(slider, findsOneWidget);

      // Change the slider value (move to max)
      await tester.drag(slider, const Offset(500, 0));
      await tester.pumpAndSettle();

      // Verify the letter spacing was updated
      final updatedSpacing = settingsInherited.textSettings.value.letterSpacing;
      expect(updatedSpacing, greaterThan(initialSpacing));
      expect(updatedSpacing, lessThanOrEqualTo(kMaxLetterSpacingSliderValue));
    });
  });
}
