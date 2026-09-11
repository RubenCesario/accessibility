import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/slider_config.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/stepper_settings_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text scale factor, 1 to 2, as a stepper card.
final class TextScaleFactorCard extends StatelessWidget {
  /// Creates the card.
  const TextScaleFactorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return StepperSettingsCard(
      icon: Icons.format_size,
      title: l10n.fontSize,
      value: AccessibilityScope.settingsOf(
        context,
      ).textSettings.textScaleFactor,
      min: kMinTextScaleFactor,
      max: kMaxTextScaleFactor,
      divisions: kRangeDivisions,
      decrementLabel: l10n.decrementTextScaleFactor,
      incrementLabel: l10n.incrementTextScaleFactor,
      onChanged: AccessibilityScope.of(context).setTextScaleFactor,
    );
  }
}

/// The word spacing, 0.5 to 3, as a stepper card.
final class WordSpacingCard extends StatelessWidget {
  /// Creates the card.
  const WordSpacingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return StepperSettingsCard(
      icon: Icons.space_bar,
      title: l10n.wordSpacing,
      value:
          AccessibilityScope.settingsOf(context).textSettings.wordSpacing ??
          kMinWordSpacing,
      min: kMinWordSpacing,
      max: kMaxWordSpacing,
      divisions: kRangeDivisions,
      decrementLabel: l10n.decrementWordSpacing,
      incrementLabel: l10n.incrementWordSpacing,
      onChanged: AccessibilityScope.of(context).setWordSpacing,
    );
  }
}

/// The line height, 1.5 to 2, as a stepper card.
final class LineHeightCard extends StatelessWidget {
  /// Creates the card.
  const LineHeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return StepperSettingsCard(
      icon: Icons.format_line_spacing,
      title: l10n.lineHeight,
      value:
          AccessibilityScope.settingsOf(context).textSettings.lineHeight ??
          kMinLineHeight,
      min: kMinLineHeight,
      max: kMaxLineHeight,
      divisions: kRangeDivisions,
      decrementLabel: l10n.decrementLineHeight,
      incrementLabel: l10n.incrementLineHeight,
      onChanged: AccessibilityScope.of(context).setLineHeight,
    );
  }
}

/// The letter spacing, 0.5 to 1, as a stepper card.
final class LetterSpacingCard extends StatelessWidget {
  /// Creates the card.
  const LetterSpacingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return StepperSettingsCard(
      icon: Icons.text_fields,
      title: l10n.letterSpacing,
      value:
          AccessibilityScope.settingsOf(context).textSettings.letterSpacing ??
          kMinLetterSpacing,
      min: kMinLetterSpacing,
      max: kMaxLetterSpacing,
      divisions: kRangeDivisions,
      decrementLabel: l10n.decrementLetterSpacing,
      incrementLabel: l10n.incrementLetterSpacing,
      onChanged: AccessibilityScope.of(context).setLetterSpacing,
    );
  }
}
