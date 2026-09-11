import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/tri_state_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// System, light or dark theme.
final class ThemeModeSetting extends StatelessWidget {
  /// Creates the setting.
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TriStateSetting<AccessibilityThemeMode>(
      title: l10n.themeMode,
      icon: Icons.dark_mode_rounded,
      segments: [
        ButtonSegment(
          value: AccessibilityThemeMode.system,
          icon: const Icon(Icons.brightness_auto),
          label: Text(l10n.themeModeSystem),
          tooltip: l10n.themeModeSystem,
        ),
        ButtonSegment(
          value: AccessibilityThemeMode.light,
          icon: const Icon(Icons.light_mode),
          label: Text(l10n.themeModeLight),
          tooltip: l10n.themeModeLight,
        ),
        ButtonSegment(
          value: AccessibilityThemeMode.dark,
          icon: const Icon(Icons.dark_mode),
          label: Text(l10n.themeModeDark),
          tooltip: l10n.themeModeDark,
        ),
      ],
      selected: AccessibilityScope.settingsOf(context).themeMode,
      onSelected: AccessibilityScope.of(context).setThemeMode,
    );
  }
}
