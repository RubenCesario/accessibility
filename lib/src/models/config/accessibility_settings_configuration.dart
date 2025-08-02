import 'dart:async' show FutureOr;

import 'package:accessibility/src/core/constants/colors.dart'
    show kMaterialColors, kMaterialMainColors;
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/foundation.dart' show immutable, listEquals;
import 'package:flutter/painting.dart' show ColorSwatch;

/// {@template AccessibilitySettingsConfiguration}
/// A configuration object for accessibility settings.
///
/// {@endtemplate}
@immutable
final class AccessibilitySettingsConfiguration {
  /// {@macro AccessibilitySettingsConfiguration}
  ///
  /// Defaults to a configuration that shows all
  /// settings.
  const AccessibilitySettingsConfiguration({
    required this.showThemeSettingsGroup,
    required this.showThemeProfileSeizureSafe,
    required this.showThemeProfileVisionImpaired,
    required this.showThemeProfileAdhdFriendly,
    required this.showDarkModeSetting,
    required this.showEffectsAllowedSetting,
    required this.showColorSettingsGroup,
    required this.showColorProfileSetting,
    required this.showColorPagesBackgroundSetting,
    required this.showColorTextSetting,
    required this.showTextSettingsGroup,
    required this.showTextAlignSetting,
    required this.showTextFontWeightSetting,
    required this.showTextLetterSpacingSetting,
    required this.showTextLineHeightSetting,
    required this.showTextScaleFactorSetting,
    required this.showTextWordSpacingSetting,
    required this.textColorAllowPickingShades,
    required this.textColorCandidates,
    required this.pagesBackgroundColorCandidates,
    required this.pagesBackgroundColorAllowPickingShades,
    this.onRestoreSettingsCallback,
  });

  /// {@macro AccessibilitySettingsConfiguration}
  ///
  /// A recommended configuration that is suitable for most users
  /// that not require to use [AccessibleText].
  static const AccessibilitySettingsConfiguration all =
      AccessibilitySettingsConfiguration(
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
    textColorCandidates: kMaterialColors,
    pagesBackgroundColorCandidates: kMaterialColors,
  );

  /// {@macro AccessibilitySettingsConfiguration}
  ///
  /// A recommended configuration that is suitable for most users
  /// that not require to use [AccessibleText].
  static const AccessibilitySettingsConfiguration recommended =
      AccessibilitySettingsConfiguration(
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
    showTextFontWeightSetting: true,
    showTextLetterSpacingSetting: true,
    showTextLineHeightSetting: true,
    showTextScaleFactorSetting: true,
    showTextWordSpacingSetting: true,
    showTextAlignSetting: false,
    textColorCandidates: kMaterialMainColors,
    textColorAllowPickingShades: false,
    pagesBackgroundColorCandidates: kMaterialMainColors,
    pagesBackgroundColorAllowPickingShades: false,
  );

  /// Copy the instance updating only the [onRestoreSettingsCallback] parameter.
  AccessibilitySettingsConfiguration withOnRestoreSettingsCallback(
    FutureOr<void> Function()? onRestoreSettingsCallback,
  ) =>
      AccessibilitySettingsConfiguration(
        showThemeSettingsGroup: showThemeSettingsGroup,
        showThemeProfileSeizureSafe: showThemeProfileSeizureSafe,
        showThemeProfileVisionImpaired: showThemeProfileVisionImpaired,
        showThemeProfileAdhdFriendly: showThemeProfileAdhdFriendly,
        showDarkModeSetting: showDarkModeSetting,
        showEffectsAllowedSetting: showEffectsAllowedSetting,
        showColorSettingsGroup: showColorSettingsGroup,
        showColorProfileSetting: showColorProfileSetting,
        showColorPagesBackgroundSetting: showColorPagesBackgroundSetting,
        showColorTextSetting: showColorTextSetting,
        showTextSettingsGroup: showTextSettingsGroup,
        showTextFontWeightSetting: showTextFontWeightSetting,
        showTextLetterSpacingSetting: showTextLetterSpacingSetting,
        showTextLineHeightSetting: showTextLineHeightSetting,
        showTextScaleFactorSetting: showTextScaleFactorSetting,
        showTextWordSpacingSetting: showTextWordSpacingSetting,
        showTextAlignSetting: showTextAlignSetting,
        textColorCandidates: textColorCandidates,
        textColorAllowPickingShades: textColorAllowPickingShades,
        pagesBackgroundColorCandidates: pagesBackgroundColorCandidates,
        pagesBackgroundColorAllowPickingShades:
            pagesBackgroundColorAllowPickingShades,
        onRestoreSettingsCallback: onRestoreSettingsCallback,
      );

  /// Whether all the settings regarding the theme should be shown.
  final bool showThemeSettingsGroup;

  /// Whether the theme profile seizure safe setting should be shown.
  final bool showThemeProfileSeizureSafe;

  /// Whether the theme profile vision impaired setting should be shown.
  final bool showThemeProfileVisionImpaired;

  /// Whether the theme profile adhd friendly setting should be shown.
  final bool showThemeProfileAdhdFriendly;

  /// Whether the dark mode setting should be shown.
  final bool showDarkModeSetting;

  /// Whether the effects mode setting should be shown.
  final bool showEffectsAllowedSetting;

  /// Whether all the settings regarding the color should be shown.
  final bool showColorSettingsGroup;

  /// Whether the color profile setting should be shown.
  final bool showColorProfileSetting;

  /// Whether the color pages background setting should be shown.
  final bool showColorPagesBackgroundSetting;

  /// Whether the color text setting should be shown.
  final bool showColorTextSetting;

  /// Whether all the settings regarding the text should be shown.
  final bool showTextSettingsGroup;

  /// Whether the text align setting should be shown.
  final bool showTextAlignSetting;

  /// Whether the text font weight setting should be shown.
  final bool showTextFontWeightSetting;

  /// Whether the text letter spacing setting should be shown.
  final bool showTextLetterSpacingSetting;

  /// Whether the text line height setting should be shown.
  final bool showTextLineHeightSetting;

  /// Whether the text scale factor setting should be shown.
  final bool showTextScaleFactorSetting;

  /// Whether the text word spacing setting should be shown.
  final bool showTextWordSpacingSetting;

  /// The list of colors to be shown to pick.
  ///
  /// Defaults to the common Material colors.
  final Iterable<ColorSwatch<int>> textColorCandidates;

  /// Whether the color text setting should allow picking shades.
  final bool textColorAllowPickingShades;

  /// The list of colors to be shown to pick.
  ///
  /// Defaults to the common Material colors.
  final Iterable<ColorSwatch<int>> pagesBackgroundColorCandidates;

  /// Whether the color pages background setting should
  /// allow picking shades.
  final bool pagesBackgroundColorAllowPickingShades;

  /// The callback after restoring the default accessibility settings.
  ///
  /// Useful to show some informative message to the user.
  final FutureOr<void> Function()? onRestoreSettingsCallback;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is AccessibilitySettingsConfiguration &&
        other.showThemeSettingsGroup == showThemeSettingsGroup &&
        other.showThemeProfileSeizureSafe == showThemeProfileSeizureSafe &&
        other.showThemeProfileVisionImpaired ==
            showThemeProfileVisionImpaired &&
        other.showThemeProfileAdhdFriendly == showThemeProfileAdhdFriendly &&
        other.showDarkModeSetting == showDarkModeSetting &&
        other.showEffectsAllowedSetting == showEffectsAllowedSetting &&
        other.showColorSettingsGroup == showColorSettingsGroup &&
        other.showColorProfileSetting == showColorProfileSetting &&
        other.showColorPagesBackgroundSetting ==
            showColorPagesBackgroundSetting &&
        other.showColorTextSetting == showColorTextSetting &&
        other.showTextSettingsGroup == showTextSettingsGroup &&
        other.showTextAlignSetting == showTextAlignSetting &&
        other.showTextFontWeightSetting == showTextFontWeightSetting &&
        other.showTextLetterSpacingSetting == showTextLetterSpacingSetting &&
        other.showTextLineHeightSetting == showTextLineHeightSetting &&
        other.showTextScaleFactorSetting == showTextScaleFactorSetting &&
        other.showTextWordSpacingSetting == showTextWordSpacingSetting &&
        other.textColorAllowPickingShades == textColorAllowPickingShades &&
        other.pagesBackgroundColorAllowPickingShades ==
            pagesBackgroundColorAllowPickingShades &&
        listEquals<ColorSwatch<int>>(
          other.textColorCandidates.toList(),
          textColorCandidates.toList(),
        ) &&
        listEquals<ColorSwatch<int>>(
          other.pagesBackgroundColorCandidates.toList(),
          pagesBackgroundColorCandidates.toList(),
        );
  }

  @override
  int get hashCode =>
      showThemeSettingsGroup.hashCode ^
      showThemeProfileSeizureSafe.hashCode ^
      showThemeProfileVisionImpaired.hashCode ^
      showThemeProfileAdhdFriendly.hashCode ^
      showDarkModeSetting.hashCode ^
      showEffectsAllowedSetting.hashCode ^
      showColorSettingsGroup.hashCode ^
      showColorPagesBackgroundSetting.hashCode ^
      showColorTextSetting.hashCode ^
      showTextSettingsGroup.hashCode ^
      showTextAlignSetting.hashCode ^
      showTextFontWeightSetting.hashCode ^
      showTextLetterSpacingSetting.hashCode ^
      showTextLineHeightSetting.hashCode ^
      showTextScaleFactorSetting.hashCode ^
      showTextWordSpacingSetting.hashCode ^
      textColorCandidates.hashCode ^
      pagesBackgroundColorCandidates.hashCode ^
      textColorAllowPickingShades.hashCode ^
      pagesBackgroundColorAllowPickingShades.hashCode;

  @override
  String toString() => 'AccessibilitySettingsConfiguration('
      'showThemeSettingsGroup: $showThemeSettingsGroup, '
      'showThemeProfileSeizureSafe: $showThemeProfileSeizureSafe, '
      'showThemeProfileVisionImpaired: $showThemeProfileVisionImpaired, '
      'showThemeProfileAdhdFriendly: $showThemeProfileAdhdFriendly, '
      'showDarkModeSetting: $showDarkModeSetting, '
      'showEffectsAllowedSetting: $showEffectsAllowedSetting, '
      'showColorSettingsGroup: $showColorSettingsGroup, '
      'showColorProfileSetting: $showColorProfileSetting, '
      'showColorPagesBackgroundSetting: $showColorPagesBackgroundSetting, '
      'showColorTextSetting: $showColorTextSetting, '
      'showTextSettingsGroup: $showTextSettingsGroup, '
      'showTextAlignSetting: $showTextAlignSetting, '
      'showTextFontWeightSetting: $showTextFontWeightSetting, '
      'showTextLetterSpacingSetting: $showTextLetterSpacingSetting, '
      'showTextLineHeightSetting: $showTextLineHeightSetting, '
      'showTextScaleFactorSetting: $showTextScaleFactorSetting, '
      'showTextWordSpacingSetting: $showTextWordSpacingSetting, '
      'textColorCandidates: ${textColorCandidates.join(', ')}, '
      'pagesBackgroundColorCandidates: '
      '${pagesBackgroundColorCandidates.join(', ')}, '
      'textColorAllowPickingShades: $textColorAllowPickingShades, '
      'pagesBackgroundColorAllowPickingShades: '
      '$pagesBackgroundColorAllowPickingShades)';
}
