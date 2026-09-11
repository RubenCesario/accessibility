import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/segmented_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// System, light or dark theme.
final class ThemeModeSetting extends StatelessWidget {
  /// Creates the setting.
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SegmentedSetting<AccessibilityThemeMode>(
      title: l10n.themeMode,
      icon: CupertinoIcons.moon,
      segments: {
        AccessibilityThemeMode.system: l10n.themeModeSystem,
        AccessibilityThemeMode.light: l10n.themeModeLight,
        AccessibilityThemeMode.dark: l10n.themeModeDark,
      },
      selected: AccessibilityScope.settingsOf(context).themeMode,
      onSelected: AccessibilityScope.of(context).setThemeMode,
    );
  }
}
