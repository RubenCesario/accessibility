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
        child: const ColorTextSettingsItem(),
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
      final initialTextColor = 
          settingsInherited.textSettings.value.color;

      // Find and tap a color circle to select a new color
      final colorCircle = find.byType(CircleColor).last;
      expect(colorCircle, findsOneWidget);
      
      await tester.tap(colorCircle);
      await tester.pumpAndSettle();

      // Verify the text color settings were updated
      final updatedTextColor = 
          settingsInherited.textSettings.value.color;
      
      expect(updatedTextColor, isNot(equals(initialTextColor)));
    });
  });
}
