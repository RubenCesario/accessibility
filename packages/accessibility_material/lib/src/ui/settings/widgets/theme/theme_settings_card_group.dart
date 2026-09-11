import 'dart:math' as math;

import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The theme group in the cards style: profile cards two per row, then
/// the theme and effects modes.
final class ThemeSettingsCardGroup extends StatelessWidget {
  /// Creates the group.
  const ThemeSettingsCardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final cards = [
      const ThemeProfileCard(level: ThemeProfileLevel.none),
      if (configuration.showThemeProfileSeizureSafe)
        const ThemeProfileCard(level: ThemeProfileLevel.seizureSafe),
      if (configuration.showThemeProfileVisionImpaired)
        const ThemeProfileCard(level: ThemeProfileLevel.visionImpaired),
      if (configuration.showThemeProfileAdhdFriendly)
        const ThemeProfileCard(level: ThemeProfileLevel.adhdFriendly),
    ];
    return SettingsGroup(
      separator: const SizedBox.shrink(),
      settings: [
        for (var i = 0; i < cards.length; i += 2)
          SettingsItemRow(
            items: cards.sublist(i, math.min(i + 2, cards.length)),
          ),
        if (configuration.showThemeModeSetting) const ThemeModeSetting(),
        if (configuration.showEffectsSetting) const EffectsModeSetting(),
      ],
    );
  }
}
