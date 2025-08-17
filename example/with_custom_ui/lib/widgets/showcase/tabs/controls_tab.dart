import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:with_custom_ui/widgets/custom/color/background_color_button.dart';
import 'package:with_custom_ui/widgets/custom/color/color_profile_button.dart';
import 'package:with_custom_ui/widgets/custom/color/text_color_button.dart';
import 'package:with_custom_ui/widgets/custom/text/font_weight_button.dart';
import 'package:with_custom_ui/widgets/custom/text/letter_spacing_button.dart';
import 'package:with_custom_ui/widgets/custom/text/line_height_button.dart';
import 'package:with_custom_ui/widgets/custom/text/text_scale_factor_button.dart';
import 'package:with_custom_ui/widgets/custom/text/word_spacing_button.dart';
import 'package:with_custom_ui/widgets/custom/theme/restore_settings_button.dart';
import 'package:with_custom_ui/widgets/custom/theme/theme_mode_button.dart';
import 'package:with_custom_ui/widgets/custom/theme/toggle_effects_button.dart';

/// A tab widget that displays all accessibility control buttons.
class ControlsTab extends StatelessWidget {
  /// Creates a [ControlsTab].
  const ControlsTab({super.key});

  static const _separator = SizedBox(height: 8);
  static const _largeSeparator = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Text('Theme & Display Controls', style: context.textTheme.titleLarge),
      _largeSeparator,
      const ThemeModeButton(),
      _separator,
      const BackgroundColorButton(),
      _separator,
      const ColorProfileButton(),
      _largeSeparator,
      Text('Text Settings Controls', style: context.textTheme.titleLarge),
      _largeSeparator,
      const TextScaleFactorButton(),
      _separator,
      const FontWeightButton(),
      _separator,
      const TextColorButton(),
      _separator,
      const LetterSpacingButton(),
      _separator,
      const WordSpacingButton(),
      _separator,
      const LineHeightButton(),
      _largeSeparator,
      Text('Other Controls', style: context.textTheme.titleLarge),
      _largeSeparator,
      const ToggleEffectsButton(),
      _separator,
      const CustomRestoreSettingsButton(),
    ],
  );
}
