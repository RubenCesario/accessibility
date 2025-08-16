import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:with_multiple_languages/constants/theme/color_schemes.dart';

/// Build a default test widget with the provided child.
///
/// This widget is used to test widgets that require the
/// [SharedPreferencesInherited] and [AccessibilitySettingsInherited]
/// providers.
Widget buildDefaultTestWidget({required Widget child}) {
  const accessibilitySettingsCollection = (
    effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
    themeMode: ThemeMode.system,
    textSettings: TextSettings.defaultSettings,
    colorSettings: ColorSettings.defaultSettings,
  );
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: kLightColorScheme,
    darkColorScheme: kDarkColorScheme,
    textTheme: kTextThemeMergableEnglishLike2021,
  );
  return SharedPreferencesInherited(
    sharedPreferencesService: SharedPreferencesService.createMockService(),
    child: AccessibilitySettingsInherited(
      viewModel:
          AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
            accessibilitySettingsCollection: accessibilitySettingsCollection,
          ),
      child: AccessibleMaterialApp(
        theme: appThemes.lightTheme,
        highContrastTheme: appThemes.lightHighContrastTheme,
        darkTheme: appThemes.darkTheme,
        highContrastDarkTheme: appThemes.darkHighContrastTheme,
        home: Scaffold(body: child),
      ),
    ),
  );
}
