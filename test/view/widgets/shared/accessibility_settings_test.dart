import 'package:accessibility/src/core/constants/colors.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/accessibility_settings_group.dart';
import 'package:accessibility/src/view/widgets/shared/accessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const customConfig = AccessibilitySettingsConfiguration(
    showThemeSettingsGroup: true,
    showThemeProfileSeizureSafe: false,
    showThemeProfileVisionImpaired: true,
    showThemeProfileAdhdFriendly: true,
    showDarkModeSetting: true,
    showEffectsAllowedSetting: false,
    showColorSettingsGroup: true,
    showColorProfileSetting: false,
    showColorPagesBackgroundSetting: true,
    showColorTextSetting: true,
    showTextSettingsGroup: false,
    showTextAlignSetting: true,
    showTextFontWeightSetting: true,
    showTextLetterSpacingSetting: true,
    showTextLineHeightSetting: false,
    showTextScaleFactorSetting: true,
    showTextWordSpacingSetting: true,
    textColorAllowPickingShades: false,
    pagesBackgroundColorAllowPickingShades: true,
    textColorCandidates: kMaterialColors,
    pagesBackgroundColorCandidates: kMaterialColors,
  );

  const allDisabledConfig = AccessibilitySettingsConfiguration(
    showThemeSettingsGroup: false,
    showThemeProfileSeizureSafe: false,
    showThemeProfileVisionImpaired: false,
    showThemeProfileAdhdFriendly: false,
    showDarkModeSetting: false,
    showEffectsAllowedSetting: false,
    showColorSettingsGroup: false,
    showColorProfileSetting: false,
    showColorPagesBackgroundSetting: false,
    showColorTextSetting: false,
    showTextSettingsGroup: false,
    showTextAlignSetting: false,
    showTextFontWeightSetting: false,
    showTextLetterSpacingSetting: false,
    showTextLineHeightSetting: false,
    showTextScaleFactorSetting: false,
    showTextWordSpacingSetting: false,
    textColorAllowPickingShades: false,
    pagesBackgroundColorAllowPickingShades: false,
    textColorCandidates: [],
    pagesBackgroundColorCandidates: [],
  );

  group('AccessibilitySettings', () {
    test('default constructor uses recommended configuration', () {
      const widget = AccessibilitySettings(
        key: ValueKey('test'),
      );
      expect(
        widget.configuration,
        equals(AccessibilitySettingsConfiguration.recommended),
      );
      expect(widget.key, const ValueKey('test'));
    });

    test('custom constructor', () {
      const widget = AccessibilitySettings(
        configuration: AccessibilitySettingsConfiguration.all,
        key: ValueKey('test'),
      );
      expect(
        widget.configuration,
        equals(AccessibilitySettingsConfiguration.all),
      );
      expect(widget.key, const ValueKey('test'));
    });

    testWidgets('renders with default recommended configuration',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettings(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should render the AccessibilitySettingsGroup
      expect(find.byType(AccessibilitySettingsGroup), findsOneWidget);

      // Should provide the AccessibilitySettingsConfigurationInherited
      expect(
        find.byType(AccessibilitySettingsConfigurationInherited),
        findsOneWidget,
      );

      // Verify the configuration is recommended by default
      final configProvider =
          tester.widget<AccessibilitySettingsConfigurationInherited>(
        find.byType(AccessibilitySettingsConfigurationInherited),
      );
      expect(
        configProvider.configuration,
        equals(AccessibilitySettingsConfiguration.recommended),
      );
    });

    testWidgets('renders with custom configuration', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettings(
          configuration: customConfig,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should still render the AccessibilitySettingsGroup
      expect(find.byType(AccessibilitySettingsGroup), findsOneWidget);

      // Verify the custom configuration is passed down
      final configProvider =
          tester.widget<AccessibilitySettingsConfigurationInherited>(
        find.byType(AccessibilitySettingsConfigurationInherited),
      );
      expect(configProvider.configuration, equals(customConfig));
      expect(configProvider.configuration.showThemeSettingsGroup, isTrue);
      expect(configProvider.configuration.showTextSettingsGroup, isFalse);
      expect(configProvider.configuration.showColorSettingsGroup, isTrue);
      expect(configProvider.configuration.showEffectsAllowedSetting, isFalse);
    });

    testWidgets('passes different configurations correctly', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettings(
          configuration: allDisabledConfig,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the disabled configuration is passed down
      final configProvider =
          tester.widget<AccessibilitySettingsConfigurationInherited>(
        find.byType(AccessibilitySettingsConfigurationInherited),
      );
      expect(configProvider.configuration, equals(allDisabledConfig));
      expect(configProvider.configuration.showThemeSettingsGroup, isFalse);
      expect(configProvider.configuration.showTextSettingsGroup, isFalse);
      expect(configProvider.configuration.showColorSettingsGroup, isFalse);
      expect(configProvider.configuration.showEffectsAllowedSetting, isFalse);
    });

    testWidgets('uses full configuration correctly', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibilitySettings(
          configuration: AccessibilitySettingsConfiguration.all,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the full configuration is passed down
      final configProvider =
          tester.widget<AccessibilitySettingsConfigurationInherited>(
        find.byType(AccessibilitySettingsConfigurationInherited),
      );
      expect(
        configProvider.configuration,
        equals(AccessibilitySettingsConfiguration.all),
      );
      expect(configProvider.configuration.showThemeSettingsGroup, isTrue);
      expect(configProvider.configuration.showTextSettingsGroup, isTrue);
      expect(configProvider.configuration.showColorSettingsGroup, isTrue);
      expect(configProvider.configuration.showEffectsAllowedSetting, isTrue);
    });
  });
}
