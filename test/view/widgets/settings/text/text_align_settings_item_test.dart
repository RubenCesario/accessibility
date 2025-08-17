import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_align_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/widgets/base_tester.dart';

void main() {
  group('TextAlignSettingsItem', () {
    testWidgets('renders correctly with the provided parameters',
        (tester) async {
      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: const AccessibilitySettingsConfigurationInherited(
            configuration: AccessibilitySettingsConfiguration.recommended,
            child: TextAlignSettingsItem(
              title: 'Left Align',
              icon: Icons.align_horizontal_left,
              textAlignSetting: TextAlign.start,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify the widget renders with correct parameters
      expect(find.byType(TextAlignSettingsItem), findsOneWidget);
      expect(find.byType(SettingsItemCard), findsOneWidget);

      // Card should not be highlighted initially with default settings
      final card =
          tester.widget<SettingsItemCard>(find.byType(SettingsItemCard));
      expect(card.isHighlighted, isFalse);
    });

    testWidgets('updates text alignment when tapped', (tester) async {
      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: const TextAlignSettingsItem(
            title: 'Right Align',
            icon: Icons.align_horizontal_right,
            textAlignSetting: TextAlign.end,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Initially not highlighted
      var card = tester.widget<SettingsItemCard>(find.byType(SettingsItemCard));
      expect(card.isHighlighted, isFalse);

      // Tap the card to set alignment to end (right)
      await tester.tap(find.byType(SettingsItemCard));

      // Verify settings were updated - card should now be highlighted
      await tester.pump();
      card = tester.widget<SettingsItemCard>(find.byType(SettingsItemCard));
      expect(card.isHighlighted, isTrue);

      // Find the AccessibilitySettingsInherited to check the actual value
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );
      expect(
        settingsInherited.textSettings.value.textAlignMode,
        equals(TextAlign.end.name),
      );

      // Tap the card again to reset alignment to default
      await tester.tap(find.byType(SettingsItemCard));
      await tester.pump();

      // Verify settings were reset to default
      expect(
        settingsInherited.textSettings.value.textAlignMode,
        equals(LocalStorageDefaultValues.textAlignmentDefault),
      );

      // With the updated settings, the card should no longer be highlighted
      await tester.pump();
      card = tester.widget<SettingsItemCard>(find.byType(SettingsItemCard));
      expect(card.isHighlighted, isFalse);
    });
  });
}
