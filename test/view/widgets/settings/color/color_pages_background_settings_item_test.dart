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
        child: const ColorPagesBackgroundSettingsItem(),
      );
    });
    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(ColorPagesBackgroundSettingsItem), findsOneWidget);
      expect(find.byType(ColorPicker), findsOneWidget);
    });

    testWidgets('updates color settings when color is selected',
        (tester) async {
      await tester.pumpWidget(testWidget);

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
  });
}
