import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to show the setting about the theme mode.
final class ThemeModeSettingsItem extends SettingsItem {
  /// Creates an [ThemeModeSettingsItem] Widget.
  const ThemeModeSettingsItem({super.key});

  @override
  State<ThemeModeSettingsItem> createState() => _ThemeModeSettingsState();
}

class _ThemeModeSettingsState extends State<ThemeModeSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  Future<void> _storeThemeMode(String newSetting) async =>
      _prefsInherited.storeThemeModeSetting(
        newSetting: newSetting,
      );

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
        valueListenable: _settingsInherited.themeMode,
        builder: (_, themeModeSetting, __) => Semantics(
          label: context.l10na.toggle_dark_mode,
          child: Switch.adaptive(
            inactiveTrackColor: Colors.grey.withValues(alpha: 0.2),
            value: context.isDarkMode,
            onChanged: (value) async {
              final newThemeMode = value ? ThemeMode.dark : ThemeMode.light;
              _settingsInherited.themeMode.value = newThemeMode;
              await _storeThemeMode(newThemeMode.name);
            },
          ),
        ),
      );
}
