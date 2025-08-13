import 'package:accessibility/src/core/constants/colors.dart'
    show kMaterialMainColors;
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/accessibility_settings_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  /// Builds a test widget with the AccessibilitySettingsGroup
  /// widget and the provided configuration
  Widget buildSettingsGroupTestWidget({
    AccessibilitySettingsConfiguration? customConfig,
  }) =>
      buildDefaultTestWidget(
        child: AccessibilitySettingsConfigurationInherited(
          configuration:
              customConfig ?? AccessibilitySettingsConfiguration.recommended,
          child: const SafeArea(child: AccessibilitySettingsGroup()),
        ),
      );

  group('AccessibilitySettingsGroup', () {
    testWidgets('renders correctly with all settings visible', (tester) async {
      await tester.pumpWidget(buildSettingsGroupTestWidget());
      await tester.pumpAndSettle();

      // Verify the AccessibilitySettingsGroup renders
      expect(find.byType(AccessibilitySettingsGroup), findsOneWidget);
    });

    testWidgets(
        'only shows theme settings when only theme settings are enabled',
        (tester) async {
      // Create a custom config based on recommended but with
      // specific settings modified
      const themeOnlyConfig = AccessibilitySettingsConfiguration(
        // Theme settings
        showThemeSettingsGroup: true,
        showThemeProfileSeizureSafe: true,
        showThemeProfileVisionImpaired: true,
        showThemeProfileAdhdFriendly: true,
        showDarkModeSetting: true,
        showEffectsAllowedSetting: true,

        // Disable color settings
        showColorSettingsGroup: false,
        showColorProfileSetting: false,
        showColorPagesBackgroundSetting: false,
        showColorTextSetting: false,

        // Disable text settings
        showTextSettingsGroup: false,
        showTextAlignSetting: false,
        showTextFontWeightSetting: false,
        showTextLetterSpacingSetting: false,
        showTextLineHeightSetting: false,
        showTextScaleFactorSetting: false,
        showTextWordSpacingSetting: false,

        // Color candidates and settings
        textColorAllowPickingShades: false,
        pagesBackgroundColorAllowPickingShades: false,
        textColorCandidates: kMaterialMainColors,
        pagesBackgroundColorCandidates: kMaterialMainColors,
      );

      await tester.pumpWidget(
        buildSettingsGroupTestWidget(customConfig: themeOnlyConfig),
      );
      await tester.pumpAndSettle();

      // Color and Text groups should not be visible
      expect(find.text('color_adjustment'), findsNothing);
      expect(find.text('size_and_text_display'), findsNothing);
    });
  });
}
