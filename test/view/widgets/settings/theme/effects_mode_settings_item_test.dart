import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/theme/effects_mode_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('EffectsAllowedSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const EffectsAllowedSettingsItem(),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(EffectsAllowedSettingsItem), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('toggles effects allowed when switch is tapped',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the settings inherited widget
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Get the initial effects allowed setting
      final initialEffectsAllowed = settingsInherited.effectsAllowed.value;

      // Find the switch widget
      final switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget);

      // The switch value is inverted from effectsAllowed
      // (Switch is ON when effects are OFF)
      final switchWidget = tester.widget<Switch>(switchFinder);
      expect(switchWidget.value, equals(!initialEffectsAllowed));

      // Tap the switch to toggle effects allowed
      await tester.tap(switchFinder);
      await tester.pumpAndSettle();

      // Verify the effects allowed setting was toggled
      final updatedEffectsAllowed = settingsInherited.effectsAllowed.value;
      expect(updatedEffectsAllowed, isNot(equals(initialEffectsAllowed)));

      // Make sure the switch reflects the updated value
      final updatedSwitchWidget = tester.widget<Switch>(switchFinder);
      expect(updatedSwitchWidget.value, equals(!updatedEffectsAllowed));
    });
  });
}
