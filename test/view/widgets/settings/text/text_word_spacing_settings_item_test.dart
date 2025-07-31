import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_word_spacing_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TextWordSpacingSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.recommended,
          child: TextWordSpacingSettingsItem(),
        ),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(TextWordSpacingSettingsItem), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
    });

    testWidgets('increases word spacing when add button is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial word spacing value
      final initialSpacing = settingsInherited.textSettings.value.wordSpacing;

      // Find and tap the increment button
      final addButton = find.byIcon(Icons.add);
      expect(addButton, findsOneWidget);

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verify the word spacing was increased
      final updatedSpacing = settingsInherited.textSettings.value.wordSpacing;
      expect(updatedSpacing, greaterThan(initialSpacing));
    });

    testWidgets('decreases word spacing when remove button is tapped',
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
          settingsInherited.textSettings.value.wordSpacing;

      // Find and tap the decrement button
      final removeButton = find.byIcon(Icons.remove);
      expect(removeButton, findsOneWidget);

      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      // Verify the word spacing was decreased
      final updatedSpacing = settingsInherited.textSettings.value.wordSpacing;
      expect(updatedSpacing, lessThan(spacingBeforeDecrease));
    });

    testWidgets('updates word spacing when slider is changed', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial word spacing value
      final initialSpacing = settingsInherited.textSettings.value.wordSpacing;

      // Find the slider
      final slider = find.byType(Slider);
      expect(slider, findsOneWidget);

      // Change the slider value (move to max)
      await tester.drag(slider, const Offset(500, 0));
      await tester.pumpAndSettle();

      // Verify the word spacing was updated
      final updatedSpacing = settingsInherited.textSettings.value.wordSpacing;
      expect(updatedSpacing, greaterThan(initialSpacing));
      expect(updatedSpacing, lessThanOrEqualTo(kMaxWordSpacingSliderValue));
    });

    testWidgets('enforces minimum and maximum boundaries', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Define boundary constants
      const minWordSpacing = -5.0; // Default minimum value
      const maxWordSpacing = 5.0; // Default maximum value

      // Test exceeding maximum boundary
      // Set word spacing close to max first
      settingsInherited.textSettings.value =
          settingsInherited.textSettings.value.copyWith(
        wordSpacing: maxWordSpacing - 0.1,
      );
      await tester.pumpAndSettle();

      // Now try to exceed max by tapping add button multiple times
      for (var i = 0; i < 10; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
      }

      // Verify that the value doesn't exceed maximum (tests line 63)
      final maxValue = settingsInherited.textSettings.value.wordSpacing;
      expect(maxValue, lessThanOrEqualTo(maxWordSpacing));

      // Test enforcing minimum boundary
      // Set word spacing close to min
      settingsInherited.textSettings.value =
          settingsInherited.textSettings.value.copyWith(
        wordSpacing: minWordSpacing + 0.1,
      );
      await tester.pumpAndSettle();

      // Try to go below minimum by tapping remove button multiple times
      for (var i = 0; i < 10; i++) {
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pumpAndSettle();
      }

      // Verify that the value doesn't go below minimum (tests line 63)
      final minValue = settingsInherited.textSettings.value.wordSpacing;
      expect(minValue, greaterThanOrEqualTo(minWordSpacing));
    });
  });
}
