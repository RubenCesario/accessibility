import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/theme_profile_strings.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_expansion_switch.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A theme profile as a switch with its description (standard style).
final class ThemeProfileSetting extends StatelessWidget {
  /// Creates the switch for [level].
  const ThemeProfileSetting({required this.level, super.key});

  /// The profile this switch applies.
  final ThemeProfileLevel level;

  @override
  Widget build(BuildContext context) {
    final strings = themeProfileStrings(context.l10n, level);
    final active = AccessibilityScope.settingsOf(context).matchingThemeProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemExpansionSwitch(
      title: strings.title,
      subtitle: strings.subtitle,
      description: strings.description,
      value: active == level,
      onChanged: (on) =>
          viewModel.applyThemeProfile(on ? level : ThemeProfileLevel.none),
    );
  }
}
