import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The theme group: the profiles, then the theme and effects modes.
///
/// The cards style also offers the `none` profile, which restores the
/// default one, since its tiles cannot be switched off.
final class ThemeSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const ThemeSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = PanelScope.of(context);
    final configuration = scope.configuration;
    final cards = scope.style == AccessibilitySettingsStyle.cards;
    return SettingsSection(
      settings: [
        if (cards) const ThemeProfileSetting(level: ThemeProfileLevel.none),
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
