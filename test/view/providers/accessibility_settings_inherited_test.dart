import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/constants/text_theme_config.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:accessibility/src/models/themes/app_themes.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:accessibility/src/view/widgets/shared/accessibility_initializer.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../resources/theme/color_schemes.dart';

void main() {
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
  group('AccessibilitySettingsInherited', () {
    late Widget testWidget;
    setUp(() {
      testWidget = AccessibilityInitializer(
        accessibilitySettingsCollection: accessibilitySettingsCollection,
        sharedPreferencesService: SharedPreferencesService.createMockService(),
        child: AccessibleMaterialApp(
          theme: appThemes.lightTheme,
          highContrastTheme: appThemes.lightHighContrastTheme,
          darkTheme: appThemes.darkTheme,
          highContrastDarkTheme: appThemes.darkHighContrastTheme,
          home: const SizedBox(),
        ),
      );
    });

    testWidgets('should be created with default values', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);
      expect(
        settingsProvider.effectsAllowed.value,
        LocalStorageDefaultValues.effectsAllowedDefault,
      );
      expect(settingsProvider.themeMode.value, ThemeMode.system);
      expect(
        settingsProvider.textSettings.value,
        TextSettings.defaultSettings,
      );
      expect(
        settingsProvider.colorSettings.value,
        ColorSettings.defaultSettings,
      );
    });

    testWidgets('should update text align setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newTextAlign = 'right';
      settingsProvider.updateTextAlignSetting(newTextAlign);

      expect(
        settingsProvider.textSettings.value.textAlignMode,
        newTextAlign,
      );
    });

    testWidgets('should update font weight setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newSetting = true;
      settingsProvider.updateFontWeightSetting(newSetting: newSetting);

      expect(
        settingsProvider.textSettings.value.isFontWeightBold,
        newSetting,
      );
    });

    testWidgets('should update color profile level', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      // Test automatically moving to next color profile level
      final initialLevel =
          settingsProvider.colorSettings.value.colorProfileLevel;
      settingsProvider.updateColorProfileLevel();

      const allColorProfiles = ColorProfile.values;
      final expectedIndex = (initialLevel.index + 1) % allColorProfiles.length;
      final expectedLevel = allColorProfiles[expectedIndex].level;

      expect(
        settingsProvider.colorSettings.value.colorProfileLevel,
        expectedLevel,
      );

      // Test specific color profile by name
      const specificProfileName = 'highContrast';
      settingsProvider.updateColorProfileLevel(
        newColorProfileLevelName: specificProfileName,
      );

      expect(
        settingsProvider.colorSettings.value.colorProfileLevel.name,
        specificProfileName,
      );
    });

    testWidgets('should update pages background color settings',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newColor = Color(0xFF123456);
      settingsProvider.updatePagesBackgroundColorSettings(newColor);

      expect(
        settingsProvider.colorSettings.value.pagesBackgroundColorValue,
        newColor.toARGB32(),
      );
    });

    testWidgets('should update text color settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newColor = Color(0xFF654321);
      settingsProvider.updateTextColorSettings(newColor);

      expect(
        settingsProvider.textSettings.value.color,
        newColor.toARGB32(),
      );
    });

    testWidgets('should update letter spacing setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newSpacing = 2.5;
      settingsProvider.updateLetterSpacingSetting(newSpacing);

      expect(
        settingsProvider.textSettings.value.letterSpacing,
        newSpacing,
      );
    });

    testWidgets('should update line height setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newHeight = 1.8;
      settingsProvider.updateLineHeightSetting(newHeight);

      expect(
        settingsProvider.textSettings.value.lineHeight,
        newHeight,
      );
    });

    testWidgets('should update scale factor setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newFactor = 1.3;
      settingsProvider.updateScaleFactorSetting(newFactor);

      expect(
        settingsProvider.textSettings.value.textScaleFactor,
        newFactor,
      );
    });

    testWidgets('should update word spacing setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      const newSpacing = 3.0;
      settingsProvider.updateWordSpacingSetting(newSpacing);

      expect(
        settingsProvider.textSettings.value.wordSpacing,
        newSpacing,
      );
    });

    testWidgets('should restore default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context)

        // First modify various settings
        ..updateTextAlignSetting('right')
        ..updateFontWeightSetting(newSetting: true)
        ..updateLetterSpacingSetting(2)
        ..updateWordSpacingSetting(3);
      settingsProvider.themeMode.value = ThemeMode.dark;
      settingsProvider.effectsAllowed.value = true;

      // Then restore defaults
      settingsProvider.restoreDefaultSettings();

      // Verify all settings are back to defaults
      expect(
        settingsProvider.effectsAllowed.value,
        LocalStorageDefaultValues.effectsAllowedDefault,
      );
      expect(settingsProvider.themeMode.value, ThemeMode.system);
      expect(
        settingsProvider.textSettings.value,
        TextSettings.defaultSettings,
      );
      expect(
        settingsProvider.colorSettings.value,
        ColorSettings.defaultSettings,
      );
    });

    testWidgets('should apply theme profile', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(SizedBox));
      final settingsProvider = AccessibilitySettingsInherited.of(context);

      // Apply a specific theme profile
      const profileLevel = ThemeProfileLevel.seizureSafe;
      settingsProvider.applyThemeProfile(profileLevel);

      // Get expected settings for this profile
      final expectedProfile = ThemeProfile.fromLevel(profileLevel);

      // Verify settings match the theme profile
      expect(
        settingsProvider.textSettings.value,
        expectedProfile.textSettings,
      );
      expect(
        settingsProvider.colorSettings.value,
        expectedProfile.colorSettings,
      );
      expect(
        settingsProvider.effectsAllowed.value,
        expectedProfile.effectsAllowed,
      );
    });

    testWidgets('should find provider using of method', (tester) async {
      // Create a new widget with the provider and a child that uses it
      final widget = MaterialApp(
        home: AccessibilitySettingsInherited(
          viewModel: AccessibilitySettingsViewModel
              .fromAccessibilitySettingsCollection(
            accessibilitySettingsCollection: (
              effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
              themeMode: ThemeMode.dark,
              textSettings: TextSettings.defaultSettings,
              colorSettings: ColorSettings.defaultSettings,
            ),
          ),
          child: Builder(
            builder: (context) {
              final provider = AccessibilitySettingsInherited.of(context);
              return Text(provider.themeMode.value.toString());
            },
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // Verify the text was rendered with the expected theme mode value
      expect(find.text(ThemeMode.dark.toString()), findsOneWidget);
    });

    test('updateShouldNotify should return true when values change', () {
      final oldWidget = AccessibilitySettingsInherited(
        viewModel:
            AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
          accessibilitySettingsCollection: (
            effectsAllowed: false,
            themeMode: ThemeMode.light,
            textSettings: TextSettings.defaultSettings,
            colorSettings: ColorSettings.defaultSettings,
          ),
        ),
        child: const SizedBox(),
      );
      final newWidget = AccessibilitySettingsInherited(
        viewModel:
            AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
          accessibilitySettingsCollection: (
            effectsAllowed: true,
            themeMode: ThemeMode.dark,
            textSettings: TextSettings.defaultSettings,
            colorSettings: ColorSettings.defaultSettings,
          ),
        ),
        child: const SizedBox(),
      );
      expect(newWidget.updateShouldNotify(oldWidget), isTrue);
    });
  });
}
