import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_expansion_tile_switch.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_list_tile_switch.dart';
import 'package:accessibility/src/view/widgets/settings/theme/effects_mode_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_mode_settings_item.dart';
import 'package:accessibility/src/view/widgets/settings/theme/theme_profile_settings_item.dart';
import 'package:flutter/material.dart';

/// The theme settings group rendered with the standard list/switch style.
final class ThemeSettingsStandardGroup extends StatelessWidget {
  /// Creates a [ThemeSettingsStandardGroup].
  const ThemeSettingsStandardGroup({super.key});

  @override
  Widget build(BuildContext context) => SettingsGroup(
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
              subtitle: context.l10na.theme_profile_vision_impaired_subtitle,
              expansionDescription:
                  context.l10na.theme_profile_vision_impaired_description,
              setting: const ThemeProfileSettingsItem(
                themeProfileLevel: ThemeProfileLevel.visionImpaired,
              ),
            ),
          if (context.a11yConfig.showThemeProfileAdhdFriendly)
            SettingsItemExpansionTileSwitch(
              title: context.l10na.theme_profile_adhd_friendly_title,
              subtitle: context.l10na.theme_profile_adhd_friendly_subtitle,
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
      );
}
