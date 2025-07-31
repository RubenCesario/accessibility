import 'package:accessibility/src/core/constants/colors.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilitySettingsConfiguration', () {
    test('predefined "all" configuration should have all settings enabled', () {
      const config = AccessibilitySettingsConfiguration.all;
      expect(config.showThemeSettingsGroup, isTrue);
      expect(config.showThemeProfileSeizureSafe, isTrue);
      expect(config.showThemeProfileVisionImpaired, isTrue);
      expect(config.showThemeProfileAdhdFriendly, isTrue);
      expect(config.showDarkModeSetting, isTrue);
      expect(config.showEffectsAllowedSetting, isTrue);
      expect(config.showColorSettingsGroup, isTrue);
      expect(config.showColorProfileSetting, isTrue);
      expect(config.showColorPagesBackgroundSetting, isTrue);
      expect(config.showColorTextSetting, isTrue);
      expect(config.showTextSettingsGroup, isTrue);
      expect(config.showTextAlignSetting, isTrue);
      expect(config.showTextFontWeightSetting, isTrue);
      expect(config.showTextLetterSpacingSetting, isTrue);
      expect(config.showTextLineHeightSetting, isTrue);
      expect(config.showTextScaleFactorSetting, isTrue);
      expect(config.showTextWordSpacingSetting, isTrue);
      expect(config.textColorAllowPickingShades, isTrue);
      expect(config.pagesBackgroundColorAllowPickingShades, isTrue);
      expect(config.textColorCandidates, equals(kMaterialColors));
      expect(config.pagesBackgroundColorCandidates, equals(kMaterialColors));
    });

    test(
        'predefined "recommended" configuration should '
        'have specific settings disabled', () {
      const config = AccessibilitySettingsConfiguration.recommended;
      expect(config.showThemeSettingsGroup, isTrue);
      expect(config.showThemeProfileSeizureSafe, isTrue);
      expect(config.showThemeProfileVisionImpaired, isTrue);
      expect(config.showThemeProfileAdhdFriendly, isTrue);
      expect(config.showDarkModeSetting, isTrue);
      expect(config.showEffectsAllowedSetting, isTrue);
      expect(config.showColorSettingsGroup, isTrue);
      expect(config.showColorProfileSetting, isTrue);
      expect(config.showColorPagesBackgroundSetting, isTrue);
      expect(config.showColorTextSetting, isTrue);
      expect(config.showTextSettingsGroup, isTrue);
      expect(config.showTextFontWeightSetting, isTrue);
      expect(config.showTextLetterSpacingSetting, isTrue);
      expect(config.showTextLineHeightSetting, isTrue);
      expect(config.showTextScaleFactorSetting, isTrue);
      expect(config.showTextWordSpacingSetting, isTrue);

      // These settings should be disabled in recommended configuration
      expect(config.showTextAlignSetting, isFalse);
      expect(config.textColorAllowPickingShades, isFalse);
      expect(config.pagesBackgroundColorAllowPickingShades, isFalse);

      // These should use main colors only
      expect(config.textColorCandidates, equals(kMaterialMainColors));
      expect(
        config.pagesBackgroundColorCandidates,
        equals(kMaterialMainColors),
      );
    });

    test('custom configuration should respect provided values', () {
      const customConfig = AccessibilitySettingsConfiguration(
        showThemeSettingsGroup: false,
        showThemeProfileSeizureSafe: false,
        showThemeProfileVisionImpaired: true,
        showThemeProfileAdhdFriendly: true,
        showDarkModeSetting: false,
        showEffectsAllowedSetting: false,
        showColorSettingsGroup: true,
        showColorProfileSetting: true,
        showColorPagesBackgroundSetting: false,
        showColorTextSetting: false,
        showTextSettingsGroup: true,
        showTextAlignSetting: false,
        showTextFontWeightSetting: true,
        showTextLetterSpacingSetting: true,
        showTextLineHeightSetting: false,
        showTextScaleFactorSetting: false,
        showTextWordSpacingSetting: true,
        textColorAllowPickingShades: false,
        pagesBackgroundColorAllowPickingShades: false,
        textColorCandidates: kMaterialMainColors,
        pagesBackgroundColorCandidates: kMaterialMainColors,
      );

      expect(customConfig.showThemeSettingsGroup, isFalse);
      expect(customConfig.showThemeProfileSeizureSafe, isFalse);
      expect(customConfig.showThemeProfileVisionImpaired, isTrue);
      expect(customConfig.showThemeProfileAdhdFriendly, isTrue);
      expect(customConfig.showDarkModeSetting, isFalse);
      expect(customConfig.showEffectsAllowedSetting, isFalse);
      expect(customConfig.showColorSettingsGroup, isTrue);
      expect(customConfig.showColorProfileSetting, isTrue);
      expect(customConfig.showColorPagesBackgroundSetting, isFalse);
      expect(customConfig.showColorTextSetting, isFalse);
      expect(customConfig.showTextSettingsGroup, isTrue);
      expect(customConfig.showTextAlignSetting, isFalse);
      expect(customConfig.showTextFontWeightSetting, isTrue);
      expect(customConfig.showTextLetterSpacingSetting, isTrue);
      expect(customConfig.showTextLineHeightSetting, isFalse);
      expect(customConfig.showTextScaleFactorSetting, isFalse);
      expect(customConfig.showTextWordSpacingSetting, isTrue);
      expect(customConfig.textColorAllowPickingShades, isFalse);
      expect(customConfig.pagesBackgroundColorAllowPickingShades, isFalse);
      expect(customConfig.textColorCandidates, equals(kMaterialMainColors));
      expect(
        customConfig.pagesBackgroundColorCandidates,
        equals(kMaterialMainColors),
      );
    });

    group('equality', () {
      test('identical configs should be equal', () {
        const config1 = AccessibilitySettingsConfiguration.all;
        const config2 = AccessibilitySettingsConfiguration.all;
        expect(config1, equals(config2));
        expect(config1.hashCode, equals(config2.hashCode));
      });

      test('configs with same values should be equal', () {
        const config1 = AccessibilitySettingsConfiguration.all;
        const config2 = AccessibilitySettingsConfiguration.all;
        expect(config1, equals(config2));
        expect(config1.hashCode, equals(config2.hashCode));
      });

      test('configs with different values should not be equal', () {
        const config1 = AccessibilitySettingsConfiguration.all;
        const config2 = AccessibilitySettingsConfiguration.recommended;
        expect(config1, isNot(equals(config2)));
        expect(config1.hashCode, isNot(equals(config2.hashCode)));
      });

      test('equality operator tests all properties including lists', () {
        // Create two configs with custom color candidates lists
        final customColors1 = [kMaterialColors[0], kMaterialColors[1]];
        final customColors2 = [kMaterialColors[0], kMaterialColors[2]];

        final config1 = AccessibilitySettingsConfiguration(
          showThemeSettingsGroup: true,
          showThemeProfileSeizureSafe: true,
          showThemeProfileVisionImpaired: true,
          showThemeProfileAdhdFriendly: true,
          showDarkModeSetting: true,
          showEffectsAllowedSetting: true,
          showColorSettingsGroup: true,
          showColorProfileSetting: true,
          showColorPagesBackgroundSetting: true,
          showColorTextSetting: true,
          showTextSettingsGroup: true,
          showTextAlignSetting: true,
          showTextFontWeightSetting: true,
          showTextLetterSpacingSetting: true,
          showTextLineHeightSetting: true,
          showTextScaleFactorSetting: true,
          showTextWordSpacingSetting: true,
          textColorAllowPickingShades: true,
          pagesBackgroundColorAllowPickingShades: true,
          textColorCandidates: customColors1,
          pagesBackgroundColorCandidates: customColors1,
        );

        // Same config but with different color candidates list
        final config2 = AccessibilitySettingsConfiguration(
          showThemeSettingsGroup: true,
          showThemeProfileSeizureSafe: true,
          showThemeProfileVisionImpaired: true,
          showThemeProfileAdhdFriendly: true,
          showDarkModeSetting: true,
          showEffectsAllowedSetting: true,
          showColorSettingsGroup: true,
          showColorProfileSetting: true,
          showColorPagesBackgroundSetting: true,
          showColorTextSetting: true,
          showTextSettingsGroup: true,
          showTextAlignSetting: true,
          showTextFontWeightSetting: true,
          showTextLetterSpacingSetting: true,
          showTextLineHeightSetting: true,
          showTextScaleFactorSetting: true,
          showTextWordSpacingSetting: true,
          textColorAllowPickingShades: true,
          pagesBackgroundColorAllowPickingShades: true,
          textColorCandidates: customColors2,
          pagesBackgroundColorCandidates: customColors1,
        );

        // Same config but with different background color candidates list
        final config3 = AccessibilitySettingsConfiguration(
          showThemeSettingsGroup: true,
          showThemeProfileSeizureSafe: true,
          showThemeProfileVisionImpaired: true,
          showThemeProfileAdhdFriendly: true,
          showDarkModeSetting: true,
          showEffectsAllowedSetting: true,
          showColorSettingsGroup: true,
          showColorProfileSetting: true,
          showColorPagesBackgroundSetting: true,
          showColorTextSetting: true,
          showTextSettingsGroup: true,
          showTextAlignSetting: true,
          showTextFontWeightSetting: true,
          showTextLetterSpacingSetting: true,
          showTextLineHeightSetting: true,
          showTextScaleFactorSetting: true,
          showTextWordSpacingSetting: true,
          textColorAllowPickingShades: true,
          pagesBackgroundColorAllowPickingShades: true,
          textColorCandidates: customColors1,
          pagesBackgroundColorCandidates: customColors2,
        );

        // Same config but identical in all properties
        final config4 = AccessibilitySettingsConfiguration(
          showThemeSettingsGroup: true,
          showThemeProfileSeizureSafe: true,
          showThemeProfileVisionImpaired: true,
          showThemeProfileAdhdFriendly: true,
          showDarkModeSetting: true,
          showEffectsAllowedSetting: true,
          showColorSettingsGroup: true,
          showColorProfileSetting: true,
          showColorPagesBackgroundSetting: true,
          showColorTextSetting: true,
          showTextSettingsGroup: true,
          showTextAlignSetting: true,
          showTextFontWeightSetting: true,
          showTextLetterSpacingSetting: true,
          showTextLineHeightSetting: true,
          showTextScaleFactorSetting: true,
          showTextWordSpacingSetting: true,
          textColorAllowPickingShades: true,
          pagesBackgroundColorAllowPickingShades: true,
          textColorCandidates: customColors1,
          pagesBackgroundColorCandidates: customColors1,
        );

        // Test that equality checks list contents, not just references
        expect(config1, equals(config4));
        expect(config1, isNot(equals(config2)));
        expect(config1, isNot(equals(config3)));
        expect(config2, isNot(equals(config3)));
      });
    });

    test('toString should contain all properties', () {
      const config = AccessibilitySettingsConfiguration.recommended;
      final stringRepresentation = config.toString();
      expect(
        stringRepresentation,
        contains('AccessibilitySettingsConfiguration'),
      );
      expect(stringRepresentation, contains('showThemeSettingsGroup: true'));
      expect(stringRepresentation, contains('showTextAlignSetting: false'));
      expect(
        stringRepresentation,
        contains('textColorAllowPickingShades: false'),
      );
      expect(
        stringRepresentation,
        contains('pagesBackgroundColorAllowPickingShades: false'),
      );
    });
  });
}
