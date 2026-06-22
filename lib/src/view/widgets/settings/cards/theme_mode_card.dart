import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:flutter/material.dart';

/// Card variant of the dark-mode setting.
///
/// Shares the shape and height of the text-align cards. The on/off state is
/// conveyed by the highlight and by the icon (filled vs outlined).
final class ThemeModeCard extends SettingsItem {
  /// Creates a [ThemeModeCard].
  const ThemeModeCard({super.key});

  @override
  State<ThemeModeCard> createState() => _ThemeModeCardState();
}

class _ThemeModeCardState extends State<ThemeModeCard> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
        valueListenable: _settingsInherited.themeMode,
        builder: (_, __, ___) {
          final isDark = context.isDarkMode;
          return SettingsItemCard(
            icon: isDark ? Icons.dark_mode : Icons.light_mode,
            title: context.l10na.theme_mode,
            minHeight: kSettingsCardMinHeight,
            isHighlighted: isDark,
            onTap: () async {
              final newMode = isDark ? ThemeMode.light : ThemeMode.dark;
              _settingsInherited.themeMode.value = newMode;
              await _prefsInherited.storeThemeModeSetting(
                newSetting: newMode.name,
              );
            },
          );
        },
      );
}
