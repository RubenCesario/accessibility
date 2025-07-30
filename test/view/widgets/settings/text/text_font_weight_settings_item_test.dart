import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_font_weight_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TextFontWeightSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const TextFontWeightSettingsItem(),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(TextFontWeightSettingsItem), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('toggles font weight when switch is tapped', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial font weight setting
      final initialIsBold =
          settingsInherited.textSettings.value.isFontWeightBold;

      // Get the switch widget
      final switchWidget = find.byType(Switch);
      expect(switchWidget, findsOneWidget);

      // Tap the switch to toggle font weight
      await tester.tap(switchWidget);
      await tester.pumpAndSettle();

      // Verify the font weight setting was toggled
      final updatedIsBold =
          settingsInherited.textSettings.value.isFontWeightBold;
      expect(updatedIsBold, isNot(equals(initialIsBold)));
    });
  });
}
