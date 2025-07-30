import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_multi_selection_card.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_profile_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  group('ColorProfileSettingsItem', () {
    late Widget testWidget;

    setUp(() {
      testWidget = buildDefaultTestWidget(
        child: const ColorProfileSettingsItem(),
      );
    });

    testWidgets('renders correctly with default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      
      // Verify the widget renders correctly
      expect(find.byType(ColorProfileSettingsItem), findsOneWidget);
      expect(find.byType(SettingsItemMultiSelectionCard), findsOneWidget);
    });

    testWidgets('updates color profile when tapped', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the initial color profile level
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      final initialProfileLevel = 
          settingsInherited.colorSettings.value.colorProfileLevel;

      // Find the selection card
      final selectionCard = find.byType(SettingsItemMultiSelectionCard);
      expect(selectionCard, findsOneWidget);

      // Tap the selection card to change the profile
      await tester.tap(selectionCard);
      await tester.pumpAndSettle();

      // Verify the color profile was updated
      final updatedProfileLevel = 
          settingsInherited.colorSettings.value.colorProfileLevel;
      
      // The profile should have changed to the next level
      expect(updatedProfileLevel, isNot(equals(initialProfileLevel)));
      
      // Verify it cycles through the profiles correctly
      // (The profile is updated to the next level in sequence)
      final expectedNextProfile = ColorProfile.values[
        (initialProfileLevel.index + 1) % ColorProfile.values.length
      ].level;
      expect(updatedProfileLevel, equals(expectedNextProfile));
    });
  });
}
