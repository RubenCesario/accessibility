import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The theme group in the standard style: profile switches, then the
/// theme and effects modes.
final class ThemeSettingsStandardGroup extends StatelessWidget {
  /// Creates the group.
  const ThemeSettingsStandardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    return SettingsGroup(
      settings: [
        if (configuration.showThemeProfileSeizureSafe)
          const ThemeProfileSetting(level: ThemeProfileLevel.seizureSafe),
        if (configuration.showThemeProfileVisionImpaired)
          const ThemeProfileSetting(level: ThemeProfileLevel.visionImpaired),
        if (configuration.showThemeProfileAdhdFriendly)
          const ThemeProfileSetting(level: ThemeProfileLevel.adhdFriendly),
        if (configuration.showThemeModeSetting) const ThemeModeSetting(),
        if (configuration.showEffectsSetting) const EffectsModeSetting(),
      ],
    );
  }
}
