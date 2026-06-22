import 'package:accessibility/src/core/constants/component_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/settings/cards/stepper_settings_card.dart';
import 'package:flutter/material.dart';

double _clamped(double value, double min, double max) => value.clamp(min, max);

/// Stepper card for the text scale factor (font size).
final class FontSizeStepperCard extends SettingsItem {
  /// Creates a [FontSizeStepperCard].
  const FontSizeStepperCard({super.key});

  @override
  State<FontSizeStepperCard> createState() => _FontSizeStepperCardState();
}

class _FontSizeStepperCardState extends State<FontSizeStepperCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) => StepperSettingsCard(
          icon: Icons.format_size,
          title: context.l10na.font_size,
          value: _clamped(
            settings.textScaleFactor,
            kMinScaleFactorSliderValue,
            kMaxScaleFactorSliderValue,
          ),
          min: kMinScaleFactorSliderValue,
          max: kMaxScaleFactorSliderValue,
          divisions: kSliderDivisions,
          decrementLabel: context.l10na.decrement_text_scale_factor,
          incrementLabel: context.l10na.increment_text_scale_factor,
          onChanged: (value) async {
            _settings.updateScaleFactorSetting(value);
            await _prefs.storeTextScaleFactorSetting(newSetting: value);
          },
        ),
      );
}

/// Stepper card for word spacing.
final class WordSpacingStepperCard extends SettingsItem {
  /// Creates a [WordSpacingStepperCard].
  const WordSpacingStepperCard({super.key});

  @override
  State<WordSpacingStepperCard> createState() => _WordSpacingStepperCardState();
}

class _WordSpacingStepperCardState extends State<WordSpacingStepperCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) => StepperSettingsCard(
          icon: Icons.space_bar,
          title: context.l10na.word_spacing,
          value: _clamped(
            settings.wordSpacing,
            kMinWordSpacingSliderValue,
            kMaxWordSpacingSliderValue,
          ),
          min: kMinWordSpacingSliderValue,
          max: kMaxWordSpacingSliderValue,
          divisions: kSliderDivisions,
          decrementLabel: context.l10na.decrement_word_spacing,
          incrementLabel: context.l10na.increment_word_spacing,
          onChanged: (value) async {
            _settings.updateWordSpacingSetting(value);
            await _prefs.storeWordSpacingSetting(newSetting: value);
          },
        ),
      );
}

/// Stepper card for line height.
final class LineHeightStepperCard extends SettingsItem {
  /// Creates a [LineHeightStepperCard].
  const LineHeightStepperCard({super.key});

  @override
  State<LineHeightStepperCard> createState() => _LineHeightStepperCardState();
}

class _LineHeightStepperCardState extends State<LineHeightStepperCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) => StepperSettingsCard(
          icon: Icons.format_line_spacing,
          title: context.l10na.line_height,
          value: _clamped(
            settings.lineHeight,
            kMinLineHeightSliderValue,
            kMaxLineHeightSliderValue,
          ),
          min: kMinLineHeightSliderValue,
          max: kMaxLineHeightSliderValue,
          divisions: kSliderDivisions,
          decrementLabel: context.l10na.decrement_line_height,
          incrementLabel: context.l10na.increment_line_height,
          onChanged: (value) async {
            _settings.updateLineHeightSetting(value);
            await _prefs.storeLineHeightSetting(newSetting: value);
          },
        ),
      );
}

/// Stepper card for letter spacing.
final class LetterSpacingStepperCard extends SettingsItem {
  /// Creates a [LetterSpacingStepperCard].
  const LetterSpacingStepperCard({super.key});

  @override
  State<LetterSpacingStepperCard> createState() =>
      _LetterSpacingStepperCardState();
}

class _LetterSpacingStepperCardState extends State<LetterSpacingStepperCard> {
  late AccessibilitySettingsInherited _settings;
  late SharedPreferencesInherited _prefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settings = AccessibilitySettingsInherited.of(context);
    _prefs = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settings.textSettings,
        builder: (_, settings, __) => StepperSettingsCard(
          icon: Icons.text_fields,
          title: context.l10na.letter_spacing,
          value: _clamped(
            settings.letterSpacing,
            kMinLetterSpacingSliderValue,
            kMaxLetterSpacingSliderValue,
          ),
          min: kMinLetterSpacingSliderValue,
          max: kMaxLetterSpacingSliderValue,
          divisions: kSliderDivisions,
          decrementLabel: context.l10na.decrement_letter_spacing,
          incrementLabel: context.l10na.increment_letter_spacing,
          onChanged: (value) async {
            _settings.updateLetterSpacingSetting(value);
            await _prefs.storeLetterSpacingSetting(newSetting: value);
          },
        ),
      );
}
