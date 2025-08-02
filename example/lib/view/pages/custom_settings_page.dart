import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// {@template CustomSettingsPage}
/// A widget that is the custom settings page of your application.
/// {@endtemplate}
class CustomSettingsPage extends StatelessWidget {
  /// {@macro CustomSettingsPage}
  const CustomSettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(color: context.colorScheme.onPrimary),
      title: AccessibleText(
        'Custom Settings',
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      backgroundColor: context.colorScheme.primary,
    ),
    body: const SafeArea(
      child: AccessibilitySettings(
        configuration: AccessibilitySettingsConfiguration(
          showThemeSettingsGroup: true,
          showThemeProfileSeizureSafe: true,
          showThemeProfileVisionImpaired: true,
          showThemeProfileAdhdFriendly: true,
          showDarkModeSetting: true,
          showEffectsAllowedSetting: true,
          showColorSettingsGroup: false,
          showColorProfileSetting: false,
          showColorPagesBackgroundSetting: false,
          showColorTextSetting: false,
          showTextSettingsGroup: true,
          showTextFontWeightSetting: true,
          showTextLetterSpacingSetting: true,
          showTextLineHeightSetting: true,
          showTextScaleFactorSetting: true,
          showTextWordSpacingSetting: true,
          showTextAlignSetting: true,
          textColorAllowPickingShades: false,
          pagesBackgroundColorAllowPickingShades: false,
          textColorCandidates: kMaterialColors,
          pagesBackgroundColorCandidates: kMaterialColors,
        ),
      ),
    ),
  );
}
