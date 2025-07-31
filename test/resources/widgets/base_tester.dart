import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/constants/text_theme_config.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/themes/app_themes.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_material_app.dart';
import 'package:flutter/material.dart';

import '../theme/color_schemes.dart';

/// Build a default test widget with the provided child.
///
/// This widget is used to test widgets that require the
/// [SharedPreferencesInherited] and [AccessibilitySettingsInherited]
/// providers.
Widget buildDefaultTestWidget({
  required Widget child,
}) {
  const accessibilitySettingsCollection = (
    effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
    themeMode: ThemeMode.system,
    textSettings: TextSettings.defaultSettings,
    colorSettings: ColorSettings.defaultSettings,
  );
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: kLightColorScheme,
    darkColorScheme: kDarkColorScheme,
    highContrastLightColorScheme: kHighContrastLightColorScheme,
    highContrastDarkColorScheme: kHighContrastDarkColorScheme,
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
        home: Scaffold(
          body: child,
        ),
      ),
    ),
  );
}

class MockSettingsItem extends SettingsItem {
  const MockSettingsItem({super.key});

  @override
  State<MockSettingsItem> createState() => _MockSettingsItemState();
}

class _MockSettingsItemState extends State<MockSettingsItem> {
  @override
  Widget build(BuildContext context) => const SizedBox(
        height: 1,
        width: 1,
      );
}
