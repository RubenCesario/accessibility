import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
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
        child: const TextLetterSpacingSettingsItem(),
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
