import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart' show immutable, listEquals;
import 'package:flutter/painting.dart' show ColorSwatch;

/// Which settings the panels show, and the colours they offer.
///
/// Shared by the Material and Cupertino panels. A `null` candidate list
/// means the panel uses its own default palette.
@immutable
final class AccessibilitySettingsConfiguration {
  /// Creates a configuration. Every setting is shown by default.
  const AccessibilitySettingsConfiguration({
    this.showThemeSettingsGroup = true,
    this.showThemeProfileSeizureSafe = true,
    this.showThemeProfileVisionImpaired = true,
    this.showThemeProfileAdhdFriendly = true,
    this.showThemeModeSetting = true,
    this.showEffectsSetting = true,
    this.showColorSettingsGroup = true,
    this.showColorProfileSetting = true,
    this.showBackgroundColorSetting = true,
    this.showTextColorSetting = true,
    this.showTextSettingsGroup = true,
    this.showTextAlignSetting = true,
    this.showBoldSetting = true,
    this.showFontSetting = true,
    this.showLetterSpacingSetting = true,
    this.showLineHeightSetting = true,
    this.showTextScaleFactorSetting = true,
    this.showWordSpacingSetting = true,
    this.textColorCandidates,
    this.textColorAllowPickingShades = true,
    this.backgroundColorCandidates,
    this.backgroundColorAllowPickingShades = true,
    this.onRestoreSettings,
  });

  /// Whether the theme group is shown at all.
  final bool showThemeSettingsGroup;

  /// Whether the seizure-safe preset is offered.
  final bool showThemeProfileSeizureSafe;

  /// Whether the vision-impaired preset is offered.
  final bool showThemeProfileVisionImpaired;

  /// Whether the ADHD-friendly preset is offered.
  final bool showThemeProfileAdhdFriendly;

  /// Whether the theme brightness setting is shown.
  final bool showThemeModeSetting;

  /// Whether the effects setting is shown.
  final bool showEffectsSetting;

  /// Whether the colour group is shown at all.
  final bool showColorSettingsGroup;

  /// Whether the colour profile setting is shown.
  final bool showColorProfileSetting;

  /// Whether the page background colour setting is shown.
  final bool showBackgroundColorSetting;

  /// Whether the text colour setting is shown.
  final bool showTextColorSetting;

  /// Whether the text group is shown at all.
  final bool showTextSettingsGroup;

  /// Whether the text alignment setting is shown.
  final bool showTextAlignSetting;

  /// Whether the bold text setting is shown.
  final bool showBoldSetting;

  /// Whether the accessible font setting is shown (it also requires at
  /// least one registered font).
  final bool showFontSetting;

  /// Whether the letter spacing setting is shown.
  final bool showLetterSpacingSetting;

  /// Whether the line height setting is shown.
  final bool showLineHeightSetting;

  /// Whether the text scale factor setting is shown.
  final bool showTextScaleFactorSetting;

  /// Whether the word spacing setting is shown.
  final bool showWordSpacingSetting;

  /// The swatches offered for the text colour, or `null` for the panel's
  /// default palette.
  final Iterable<ColorSwatch<int>>? textColorCandidates;

  /// Whether the text colour picker lets the user pick shades.
  final bool textColorAllowPickingShades;

  /// The swatches offered for the background colour, or `null` for the
  /// panel's default palette.
  final Iterable<ColorSwatch<int>>? backgroundColorCandidates;

  /// Whether the background colour picker lets the user pick shades.
  final bool backgroundColorAllowPickingShades;

  /// Called after the user restores the default settings, for example to
  /// show a confirmation.
  final FutureOr<void> Function()? onRestoreSettings;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessibilitySettingsConfiguration &&
          other.showThemeSettingsGroup == showThemeSettingsGroup &&
          other.showThemeProfileSeizureSafe == showThemeProfileSeizureSafe &&
          other.showThemeProfileVisionImpaired ==
              showThemeProfileVisionImpaired &&
          other.showThemeProfileAdhdFriendly == showThemeProfileAdhdFriendly &&
          other.showThemeModeSetting == showThemeModeSetting &&
          other.showEffectsSetting == showEffectsSetting &&
          other.showColorSettingsGroup == showColorSettingsGroup &&
          other.showColorProfileSetting == showColorProfileSetting &&
          other.showBackgroundColorSetting == showBackgroundColorSetting &&
          other.showTextColorSetting == showTextColorSetting &&
          other.showTextSettingsGroup == showTextSettingsGroup &&
          other.showTextAlignSetting == showTextAlignSetting &&
          other.showBoldSetting == showBoldSetting &&
          other.showFontSetting == showFontSetting &&
          other.showLetterSpacingSetting == showLetterSpacingSetting &&
          other.showLineHeightSetting == showLineHeightSetting &&
          other.showTextScaleFactorSetting == showTextScaleFactorSetting &&
          other.showWordSpacingSetting == showWordSpacingSetting &&
          other.textColorAllowPickingShades == textColorAllowPickingShades &&
          other.backgroundColorAllowPickingShades ==
              backgroundColorAllowPickingShades &&
          listEquals(
            other.textColorCandidates?.toList(),
            textColorCandidates?.toList(),
          ) &&
          listEquals(
            other.backgroundColorCandidates?.toList(),
            backgroundColorCandidates?.toList(),
          ) &&
          other.onRestoreSettings == onRestoreSettings;

  @override
  int get hashCode => Object.hashAll([
    showThemeSettingsGroup,
    showThemeProfileSeizureSafe,
    showThemeProfileVisionImpaired,
    showThemeProfileAdhdFriendly,
    showThemeModeSetting,
    showEffectsSetting,
    showColorSettingsGroup,
    showColorProfileSetting,
    showBackgroundColorSetting,
    showTextColorSetting,
    showTextSettingsGroup,
    showTextAlignSetting,
    showBoldSetting,
    showFontSetting,
    showLetterSpacingSetting,
    showLineHeightSetting,
    showTextScaleFactorSetting,
    showWordSpacingSetting,
    textColorAllowPickingShades,
    backgroundColorAllowPickingShades,
    Object.hashAll(textColorCandidates ?? const []),
    Object.hashAll(backgroundColorCandidates ?? const []),
    onRestoreSettings,
  ]);

  @override
  String toString() =>
      'AccessibilitySettingsConfiguration('
      'showThemeSettingsGroup: $showThemeSettingsGroup, '
      'showThemeProfileSeizureSafe: $showThemeProfileSeizureSafe, '
      'showThemeProfileVisionImpaired: $showThemeProfileVisionImpaired, '
      'showThemeProfileAdhdFriendly: $showThemeProfileAdhdFriendly, '
      'showThemeModeSetting: $showThemeModeSetting, '
      'showEffectsSetting: $showEffectsSetting, '
      'showColorSettingsGroup: $showColorSettingsGroup, '
      'showColorProfileSetting: $showColorProfileSetting, '
      'showBackgroundColorSetting: $showBackgroundColorSetting, '
      'showTextColorSetting: $showTextColorSetting, '
      'showTextSettingsGroup: $showTextSettingsGroup, '
      'showTextAlignSetting: $showTextAlignSetting, '
      'showBoldSetting: $showBoldSetting, '
      'showFontSetting: $showFontSetting, '
      'showLetterSpacingSetting: $showLetterSpacingSetting, '
      'showLineHeightSetting: $showLineHeightSetting, '
      'showTextScaleFactorSetting: $showTextScaleFactorSetting, '
      'showWordSpacingSetting: $showWordSpacingSetting, '
      'textColorCandidates: $textColorCandidates, '
      'textColorAllowPickingShades: $textColorAllowPickingShades, '
      'backgroundColorCandidates: $backgroundColorCandidates, '
      'backgroundColorAllowPickingShades: '
      '$backgroundColorAllowPickingShades)';
}
