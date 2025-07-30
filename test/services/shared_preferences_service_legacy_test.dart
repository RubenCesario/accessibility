import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/shared_preferences_service_legacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SharedPreferencesServiceLegacy service;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    service = const SharedPreferencesServiceLegacy();
  });

  group('SharedPreferencesServiceLegacy', () {
    test('should return default theme mode when not set', () async {
      final result = await service.getThemeModeSetting();
      expect(result, equals(LocalStorageDefaultValues.themeModeDefault));
    });

    test('should store and retrieve theme mode setting', () async {
      const testThemeMode = 'dark';
      final storedResult = await service.storeThemeModeSetting(
        newSetting: testThemeMode,
      );
      final retrievedResult = await service.getThemeModeSetting();
      expect(storedResult, equals(testThemeMode));
      expect(retrievedResult, equals(testThemeMode));
    });

    test('should store and retrieve effects allowed setting', () async {
      const testEffectsAllowed = false;
      final storedResult = await service.storeEffectsAllowedSetting(
        newSetting: testEffectsAllowed,
      );
      final retrievedResult = await service.getEffectsAllowedSetting();

      expect(storedResult, equals(testEffectsAllowed));
      expect(retrievedResult, equals(testEffectsAllowed));
    });

    group('text settings', () {
      test('should store and retrieve word spacing setting', () async {
        const testWordSpacing = 1.5;
        final storedResult = await service.storeWordSpacingSetting(
          newSetting: testWordSpacing,
        );
        final retrievedResult = await service.getWordSpacingSetting();

        expect(storedResult, equals(testWordSpacing));
        expect(retrievedResult, equals(testWordSpacing));
      });

      test('should store and retrieve line height setting', () async {
        const testLineHeight = 1.8;
        final storedResult = await service.storeLineHeightSetting(
          newSetting: testLineHeight,
        );
        final retrievedResult = await service.getLineHeightSetting();

        expect(storedResult, equals(testLineHeight));
        expect(retrievedResult, equals(testLineHeight));
      });

      test('should store and retrieve letter spacing setting', () async {
        const testLetterSpacing = 0.7;
        final storedResult = await service.storeLetterSpacingSetting(
          newSetting: testLetterSpacing,
        );
        final retrievedResult = await service.getLetterSpacingSetting();

        expect(storedResult, equals(testLetterSpacing));
        expect(retrievedResult, equals(testLetterSpacing));
      });

      test('should store and retrieve text scale factor setting', () async {
        const testScaleFactor = 1.2;
        final storedResult = await service.storeTextScaleFactorSetting(
          newSetting: testScaleFactor,
        );
        final retrievedResult = await service.getTextScaleFactorSetting();

        expect(storedResult, equals(testScaleFactor));
        expect(retrievedResult, equals(testScaleFactor));
      });

      test('should store and retrieve text alignment setting', () async {
        const testTextAlignment = 'center';
        final storedResult = await service.storeTextAlignmentSetting(
          newSetting: testTextAlignment,
        );
        final retrievedResult = await service.getTextAlignmentSetting();

        expect(storedResult, equals(testTextAlignment));
        expect(retrievedResult, equals(testTextAlignment));
      });

      test('should store and retrieve font weight setting', () async {
        const testFontWeight = true;
        final storedResult = await service.storeTextFontWeightSetting(
          newSetting: testFontWeight,
        );
        final retrievedResult = await service.getTextFontWeightSetting();

        expect(storedResult, equals(testFontWeight));
        expect(retrievedResult, equals(testFontWeight));
      });
    });

    group('color settings', () {
      test('should store and retrieve theme profile setting', () async {
        const testThemeProfile = 'seizure_safe';
        final storedResult = await service.storeThemeProfileSetting(
          newSetting: testThemeProfile,
        );
        final retrievedResult = await service.getThemeProfileSetting();

        expect(storedResult, equals(testThemeProfile));
        expect(retrievedResult, equals(testThemeProfile));
      });

      test('should store and retrieve color profile setting', () async {
        const testColorProfile = 'protanopia';
        final storedResult = await service.storeColorProfileSetting(
          newSetting: testColorProfile,
        );
        final retrievedResult = await service.getColorProfileSetting();

        expect(storedResult, equals(testColorProfile));
        expect(retrievedResult, equals(testColorProfile));
      });

      test('should store and retrieve text color setting', () async {
        const testTextColor = 123;
        final storedResult = await service.storeTextColorSetting(
          newSetting: testTextColor,
        );
        final retrievedResult = await service.getTextColorSetting();

        expect(storedResult, equals(testTextColor));
        expect(retrievedResult, equals(testTextColor));
      });

      test('should store and retrieve pages background color setting',
          () async {
        const testBackgroundColor = 456;
        final storedResult = await service.storePagesBackgroundColorSetting(
          newSetting: testBackgroundColor,
        );
        final retrievedResult = await service.getPagesBackgroundColorSetting();

        expect(storedResult, equals(testBackgroundColor));
        expect(retrievedResult, equals(testBackgroundColor));
      });
    });

    test('should correctly handle first time opened flag', () async {
      // Should be true initially (app first opened)
      final initialValue = await service.getIsAppFirstTimeOpened();
      expect(initialValue, isTrue);

      // Should be false after storing (subsequent open)
      final storedResult = await service.storeIsFirstTimeOpened();
      expect(storedResult, isFalse);

      final afterStore = await service.getIsAppFirstTimeOpened();
      expect(afterStore, isFalse);
    });

    test('should reset to default values', () async {
      // Set custom values first
      await service.storeThemeModeSetting(newSetting: 'dark');
      await service.storeEffectsAllowedSetting(newSetting: false);
      await service.storeWordSpacingSetting(newSetting: 2.5);

      // Reset to defaults
      await service.restoreDefaultSettings();

      // Verify defaults were set
      final themeMode = await service.getThemeModeSetting();
      final effectsAllowed = await service.getEffectsAllowedSetting();
      final wordSpacing = await service.getWordSpacingSetting();

      expect(themeMode, equals(LocalStorageDefaultValues.themeModeDefault));
      expect(
        effectsAllowed,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(wordSpacing, equals(TextSettings.defaultSettings.wordSpacing));
    });

    test('should get complete accessibility settings collection', () async {
      // Set some test values
      await service.storeThemeModeSetting(newSetting: 'dark');
      await service.storeEffectsAllowedSetting(newSetting: false);
      await service.storeWordSpacingSetting(newSetting: 2);
      await service.storeLineHeightSetting(newSetting: 1.8);
      await service.storeTextAlignmentSetting(newSetting: 'center');
      await service.storeColorProfileSetting(newSetting: 'monochrome');

      // Get combined settings
      final settings = await service.getLocalStorageAccessibilitySettings();

      expect(settings.themeMode, equals(ThemeMode.dark));
      expect(settings.effectsAllowed, isFalse);
      expect(settings.textSettings.wordSpacing, equals(2.0));
      expect(settings.textSettings.lineHeight, equals(1.8));
      expect(settings.textSettings.textAlignMode, equals('center'));
      expect(
        settings.colorSettings.colorProfileLevel.name,
        equals('monochrome'),
      );
    });
  });
}
