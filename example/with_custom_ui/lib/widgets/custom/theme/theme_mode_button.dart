import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that toggles between light and dark theme modes.
class ThemeModeButton extends StatelessWidget {
  /// Creates a [ThemeModeButton].
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
    valueListenable: AccessibilitySettingsInherited.of(context).themeMode,
    builder:
        (_, themeMode, __) => ElevatedButton.icon(
          icon: Icon(
            themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          ),
          label: Text(
            themeMode == ThemeMode.dark
                ? 'Toggle light mode'
                : 'Toggle dark mode',
          ),
          onPressed: () async {
            final newThemeMode =
                context.isDarkMode ? ThemeMode.light : ThemeMode.dark;
            final settingsInherited = AccessibilitySettingsInherited.of(
              context,
            );
            settingsInherited.themeMode.value = newThemeMode;
            // Note: below there is a storage method from the package, but you
            // can use any storage method you want.
            await SharedPreferencesInherited.of(
              context,
            ).storeThemeModeSetting(newSetting: newThemeMode.name);
          },
        ),
  );
}
