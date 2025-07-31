import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_line_height_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TextLineHeightSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.recommended,
          child: TextLineHeightSettingsItem(),
        ),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(TextLineHeightSettingsItem), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
    });

    testWidgets('increases line height when add button is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial line height value
      final initialHeight = settingsInherited.textSettings.value.lineHeight;

      // Find and tap the increment button
      final addButton = find.byIcon(Icons.add);
      expect(addButton, findsOneWidget);

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verify the line height was increased
      final updatedHeight = settingsInherited.textSettings.value.lineHeight;
      expect(updatedHeight, greaterThan(initialHeight));
    });

    testWidgets('decreases line height when remove button is tapped',
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

      final heightBeforeDecrease =
          settingsInherited.textSettings.value.lineHeight;

      // Find and tap the decrement button
      final removeButton = find.byIcon(Icons.remove);
      expect(removeButton, findsOneWidget);

      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      // Verify the line height was decreased
      final updatedHeight = settingsInherited.textSettings.value.lineHeight;
      expect(updatedHeight, lessThan(heightBeforeDecrease));
    });

    testWidgets('updates line height when slider is changed', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial line height value
      final initialHeight = settingsInherited.textSettings.value.lineHeight;

      // Find the slider
      final slider = find.byType(Slider);
      expect(slider, findsOneWidget);

      // Change the slider value (move to max)
      await tester.drag(slider, const Offset(500, 0));
      await tester.pumpAndSettle();

      // Verify the line height was updated
      final updatedHeight = settingsInherited.textSettings.value.lineHeight;
      expect(updatedHeight, greaterThan(initialHeight));
      expect(updatedHeight, lessThanOrEqualTo(kMaxLineHeightSliderValue));
    });
  });
}
