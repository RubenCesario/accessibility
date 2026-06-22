import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_slider.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_switch.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_row.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_align_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_font_family_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_font_weight_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_letter_spacing_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_line_height_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_scale_factor_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_word_spacing_settings_item.dart';
import 'package:flutter/material.dart';

/// The text settings group rendered with the standard list/slider style.
final class TextSettingsStandardGroup extends StatelessWidget {
  /// Creates a [TextSettingsStandardGroup].
  const TextSettingsStandardGroup({super.key});

  @override
  Widget build(BuildContext context) => SettingsGroup(
        title: context.l10na.size_and_text_display,
        settings: [
          if (context.a11yConfig.showTextAlignSetting)
            SettingsItemRow(
              items: [
                TextAlignSettingsItem(
                  title: context.l10na.align_left,
                  icon: Icons.align_horizontal_left_outlined,
                  textAlignSetting: TextAlign.start,
                ),
                TextAlignSettingsItem(
                  title: context.l10na.align_center,
                  icon: Icons.align_horizontal_center_outlined,
                  textAlignSetting: TextAlign.center,
                ),
                TextAlignSettingsItem(
                  title: context.l10na.align_right,
                  icon: Icons.align_horizontal_right_outlined,
                  textAlignSetting: TextAlign.end,
                ),
              ],
            ),
          if (context.a11yConfig.showTextFontWeightSetting)
            SettingsItemListTileSwitch(
              title: context.l10na.bold_text,
              subtitle: context.l10na.change_bold_text,
              setting: const TextFontWeightSettingsItem(),
            ),
          if (context.a11yConfig.showTextFontFamilySetting)
            SettingsItemListTileSwitch(
              title: context.l10na.accessible_font,
              subtitle: context.l10na.accessible_font_subtitle,
              setting: const TextFontFamilySettingsItem(),
            ),
          if (context.a11yConfig.showTextScaleFactorSetting)
            SettingsItemListTileSlider(
              title: context.l10na.font_size,
              subtitle: context.l10na.increase_or_decrease_text_size,
              setting: const TextScaleFactorSettingsItem(),
            ),
          if (context.a11yConfig.showTextWordSpacingSetting)
            SettingsItemListTileSlider(
              title: context.l10na.word_spacing,
              subtitle: context.l10na.increase_or_decrease_word_spacing,
              setting: const TextWordSpacingSettingsItem(),
            ),
          if (context.a11yConfig.showTextLineHeightSetting)
            SettingsItemListTileSlider(
              title: context.l10na.line_height,
              subtitle: context.l10na.increase_or_decrease_line_height,
              setting: const TextLineHeightSettingsItem(),
            ),
          if (context.a11yConfig.showTextLetterSpacingSetting)
            SettingsItemListTileSlider(
              title: context.l10na.letter_spacing,
              subtitle: context.l10na.increase_or_decrease_letter_spacing,
              setting: const TextLetterSpacingSettingsItem(),
            ),
        ],
      );
}
