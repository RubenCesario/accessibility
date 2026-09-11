import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/core/theme_profile_icons.dart';
import 'package:accessibility_cupertino/src/ui/core/theme_profile_strings.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_expansion_switch_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A theme profile.
///
/// Standard style: a switch with the profile's description. Cards style:
/// a notched tile with a check mark when the profile is active; tapping
/// it applies the profile, and the `none` tile restores the default one.
/// The check mark uses [panelAccentColor] so it stays readable in both
/// brightnesses.
final class ThemeProfileSetting extends StatelessWidget {
  /// Creates the setting for [level].
  const ThemeProfileSetting({required this.level, super.key});

  /// The profile this setting applies.
  final ThemeProfileLevel level;

  @override
  Widget build(BuildContext context) {
    final strings = themeProfileStrings(context.l10n, level);
    final active = AccessibilityScope.settingsOf(context).matchingThemeProfile;
    final viewModel = AccessibilityScope.of(context);
    final isActive = active == level;
    return switch (PanelScope.maybeOf(context)?.style) {
      null ||
      AccessibilitySettingsStyle.standard => SettingsExpansionSwitchTile(
        title: strings.title,
        subtitle: strings.subtitle,
        description: strings.description,
        value: isActive,
        onChanged: (on) =>
            viewModel.applyThemeProfile(on ? level : ThemeProfileLevel.none),
      ),
      AccessibilitySettingsStyle.cards => SettingsTile(
        title: strings.title,
        subtitle: level == ThemeProfileLevel.none ? null : strings.subtitle,
        icon: themeProfileIcon(level),
        selected: isActive,
        trailing: isActive
            ? Icon(CupertinoIcons.check_mark, color: panelAccentColor(context))
            : null,
        onTap: () => viewModel.applyThemeProfile(level),
      ),
    };
  }
}
