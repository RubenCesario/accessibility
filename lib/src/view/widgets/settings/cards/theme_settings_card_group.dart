import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_row.dart';
import 'package:accessibility/src/view/widgets/settings/cards/effects_card.dart';
import 'package:accessibility/src/view/widgets/settings/cards/theme_mode_card.dart';
import 'package:accessibility/src/view/widgets/settings/cards/theme_profile_card.dart';
import 'package:flutter/material.dart';

/// The theme settings group rendered as accessible cards.
///
/// Renders two rows: a segmented single-choice row of theme-profile cards and
/// a row of theme/effects toggle cards (sized like the text-align cards).
final class ThemeSettingsCardGroup extends StatelessWidget {
  /// Creates a [ThemeSettingsCardGroup].
  const ThemeSettingsCardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.a11yConfig;
    final profileCards = <SettingsItem>[
      const ThemeProfileCard(
        level: ThemeProfileLevel.none,
        icon: Icons.restart_alt,
      ),
      if (config.showThemeProfileSeizureSafe)
        const ThemeProfileCard(
          level: ThemeProfileLevel.seizureSafe,
          icon: Icons.flash_off,
        ),
      if (config.showThemeProfileVisionImpaired)
        const ThemeProfileCard(
          level: ThemeProfileLevel.visionImpaired,
          icon: Icons.visibility,
        ),
      if (config.showThemeProfileAdhdFriendly)
        const ThemeProfileCard(
          level: ThemeProfileLevel.adhdFriendly,
          icon: Icons.center_focus_strong,
        ),
    ];
    final toggleCards = <SettingsItem>[
      if (config.showDarkModeSetting) const ThemeModeCard(),
      if (config.showEffectsAllowedSetting) const EffectsCard(),
    ];
    return SettingsGroup(
      separatorBetweenWidgets: const SizedBox.shrink(),
      settings: [
        if (profileCards.length > 1)
          for (var i = 0; i < profileCards.length; i += 2)
            SettingsItemRow(
              items: profileCards.sublist(
                i,
                i + 2 < profileCards.length ? i + 2 : profileCards.length,
              ),
            ),
        if (toggleCards.isNotEmpty) SettingsItemRow(items: toggleCards),
      ],
    );
  }
}
