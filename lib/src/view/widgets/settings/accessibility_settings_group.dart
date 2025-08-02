import 'dart:ui' show PointerDeviceKind;

import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_container.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_expansion_tile_switch.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_slider.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_switch.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_row.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_pages_background_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_profile_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/color/color_text_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_align_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_font_weight_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_letter_spacing_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_line_height_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_scale_factor_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/text/text_word_spacing_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/theme/effects_mode_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_mode_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_profile_settings_item.dart';
import 'package:flutter/material.dart';

/// {@template AccessibilitySettingsGroup}
/// A list of accessibility settings items.
///
/// The list can be configured to show or hide
/// specific settings items.
///
/// {@endtemplate}
final class AccessibilitySettingsGroup extends StatefulWidget {
  /// {@macro AccessibilitySettingsGroup}
  const AccessibilitySettingsGroup({
    super.key,
  });

  @override
  State<AccessibilitySettingsGroup> createState() =>
      _AccessibilitySettingsGroupState();
}

class _AccessibilitySettingsGroupState
    extends State<AccessibilitySettingsGroup> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int _getSemanticChildCount() {
    var semanticChildCount = 1;
    if (context.a11yConfig.showThemeSettingsGroup) {
      semanticChildCount++;
    }
    if (context.a11yConfig.showColorSettingsGroup) {
      semanticChildCount++;
    }
    if (context.a11yConfig.showTextSettingsGroup) {
      semanticChildCount++;
    }
    return semanticChildCount;
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        semanticChildCount: _getSemanticChildCount(),
        scrollBehavior: const ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        restorationId: 'accessibility_settings_group',
        slivers: [
          if (context.a11yConfig.showThemeSettingsGroup)
            SettingsGroup(
              settings: [
                if (context.a11yConfig.showThemeProfileSeizureSafe)
                  SettingsItemExpansionTileSwitch(
                    title: context.l10na.theme_profile_seizure_safe_title,
                    subtitle: context.l10na.theme_profile_seizure_safe_subtitle,
                    expansionDescription:
                        context.l10na.theme_profile_seizure_safe_description,
                    setting: const ThemeProfileSettingsItem(
                      themeProfileLevel: ThemeProfileLevel.seizureSafe,
                    ),
                  ),
                if (context.a11yConfig.showThemeProfileVisionImpaired)
                  SettingsItemExpansionTileSwitch(
                    title: context.l10na.theme_profile_vision_impaired_title,
                    subtitle:
                        context.l10na.theme_profile_vision_impaired_subtitle,
                    expansionDescription:
                        context.l10na.theme_profile_vision_impaired_description,
                    setting: const ThemeProfileSettingsItem(
                      themeProfileLevel: ThemeProfileLevel.visionImpaired,
                    ),
                  ),
                if (context.a11yConfig.showThemeProfileAdhdFriendly)
                  SettingsItemExpansionTileSwitch(
                    title: context.l10na.theme_profile_adhd_friendly_title,
                    subtitle:
                        context.l10na.theme_profile_adhd_friendly_subtitle,
                    expansionDescription:
                        context.l10na.theme_profile_adhd_friendly_description,
                    setting: const ThemeProfileSettingsItem(
                      themeProfileLevel: ThemeProfileLevel.adhdFriendly,
                    ),
                  ),
                if (context.a11yConfig.showDarkModeSetting)
                  SettingsItemListTileSwitch(
                    icon: Icons.dark_mode_rounded,
                    title: context.l10na.theme_mode,
                    subtitle: context.l10na.toggle_dark_mode,
                    setting: const ThemeModeSettingsItem(),
                  ),
                if (context.a11yConfig.showEffectsAllowedSetting)
                  SettingsItemListTileSwitch(
                    icon: Icons.remove_red_eye,
                    title: context.l10na.effects,
                    subtitle: context.l10na.reduce_effects,
                    setting: const EffectsAllowedSettingsItem(),
                  ),
              ],
            ),
          if (context.a11yConfig.showColorSettingsGroup)
            SettingsGroup(
              title: context.l10na.color_adjustment,
              separatorBetweenWidgets: const SizedBox.shrink(),
              settings: [
                if (context.a11yConfig.showColorProfileSetting)
                  const SettingsItemContainer(
                    widthFactor: 0.75,
                    setting: ColorProfileSettingsItem(),
                  ),
                if (context.a11yConfig.showColorTextSetting)
                  SettingsItemContainer(
                    title: context.l10na.adjust_text_colors,
                    setting: const ColorTextSettingsItem(),
                  ),
                if (context.a11yConfig.showColorPagesBackgroundSetting)
                  SettingsItemContainer(
                    title: context.l10na.adjust_background_colors,
                    setting: const ColorPagesBackgroundSettingsItem(),
                  ),
              ],
            ),
          if (context.a11yConfig.showTextSettingsGroup)
            SettingsGroup(
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
            ),
          const SliverToBoxAdapter(
            child: RestoreSettingsButton(),
          ),
        ],
      );
}
