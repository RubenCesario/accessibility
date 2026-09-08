import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/slider_config.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_slider.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text scale factor, 1 to 2.
final class TextScaleFactorSetting extends StatelessWidget {
  /// Creates the setting.
  const TextScaleFactorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.fontSize,
      subtitle: l10n.increaseOrDecreaseTextSize,
      value: AccessibilityScope.settingsOf(
        context,
      ).textSettings.textScaleFactor,
      min: kMinTextScaleFactor,
      max: kMaxTextScaleFactor,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementTextScaleFactor,
      decrementLabel: l10n.decrementTextScaleFactor,
      onChanged: AccessibilityScope.of(context).setTextScaleFactor,
    );
  }
}

/// The word spacing, 0.5 to 3.
final class WordSpacingSetting extends StatelessWidget {
  /// Creates the setting.
  const WordSpacingSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.wordSpacing,
      subtitle: l10n.increaseOrDecreaseWordSpacing,
      value:
          AccessibilityScope.settingsOf(context).textSettings.wordSpacing ??
          kMinWordSpacing,
      min: kMinWordSpacing,
      max: kMaxWordSpacing,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementWordSpacing,
      decrementLabel: l10n.decrementWordSpacing,
      onChanged: AccessibilityScope.of(context).setWordSpacing,
    );
  }
}

/// The line height, 1.5 to 2.
final class LineHeightSetting extends StatelessWidget {
  /// Creates the setting.
  const LineHeightSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.lineHeight,
      subtitle: l10n.increaseOrDecreaseLineHeight,
      value:
          AccessibilityScope.settingsOf(context).textSettings.lineHeight ??
          kMinLineHeight,
      min: kMinLineHeight,
      max: kMaxLineHeight,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementLineHeight,
      decrementLabel: l10n.decrementLineHeight,
      onChanged: AccessibilityScope.of(context).setLineHeight,
    );
  }
}

/// The letter spacing, 0.5 to 1.
final class LetterSpacingSetting extends StatelessWidget {
  /// Creates the setting.
  const LetterSpacingSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.letterSpacing,
      subtitle: l10n.increaseOrDecreaseLetterSpacing,
      value:
          AccessibilityScope.settingsOf(context).textSettings.letterSpacing ??
          kMinLetterSpacing,
      min: kMinLetterSpacing,
      max: kMaxLetterSpacing,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementLetterSpacing,
      decrementLabel: l10n.decrementLetterSpacing,
      onChanged: AccessibilityScope.of(context).setLetterSpacing,
    );
  }
}
