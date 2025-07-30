import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/mock_shared_preferences_service.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MockSharedPreferencesService mockService;

  setUp(() {
    mockService = MockSharedPreferencesService();
  });

  tearDown(() {
    mockService.reset();
  });

  group('MockSharedPreferencesService', () {
    test('should initialize with empty storage and method calls', () {
      expect(mockService.methodCalls, isEmpty);
    });

    test('should track method calls', () async {
      await mockService.getThemeModeSetting();
      expect(mockService.methodCalls, contains('getThemeModeSetting'));

      await mockService.storeThemeModeSetting(newSetting: 'dark');
      expect(mockService.methodCalls, contains('storeThemeModeSetting'));
    });

    test('should return default theme mode when not set', () async {
      final result = await mockService.getThemeModeSetting();
      expect(result, equals(LocalStorageDefaultValues.themeModeDefault));
      expect(mockService.methodCalls, contains('getThemeModeSetting'));
    });

    test('should store and retrieve theme mode setting', () async {
      const testThemeMode = 'dark';
      await mockService.storeThemeModeSetting(newSetting: testThemeMode);
      final result = await mockService.getThemeModeSetting();

      expect(result, equals(testThemeMode));
      expect(
        mockService.methodCalls,
        containsAll(['storeThemeModeSetting', 'getThemeModeSetting']),
      );
    });

    test('should store and retrieve effects allowed setting', () async {
      const testEffectsAllowed = false;
      await mockService.storeEffectsAllowedSetting(
        newSetting: testEffectsAllowed,
      );
      final result = await mockService.getEffectsAllowedSetting();

      expect(result, equals(testEffectsAllowed));
      expect(
        mockService.methodCalls,
        containsAll(['storeEffectsAllowedSetting', 'getEffectsAllowedSetting']),
      );
    });

    test('should store and retrieve text settings', () async {
      const testWordSpacing = 1.5;
      const testLineHeight = 1.8;
      const testLetterSpacing = 0.7;
      const testScaleFactor = 1.2;
      const testTextAlignment = 'center';
      const testFontWeight = true;

      await mockService.storeWordSpacingSetting(newSetting: testWordSpacing);
      await mockService.storeLineHeightSetting(newSetting: testLineHeight);
      await mockService.storeLetterSpacingSetting(
        newSetting: testLetterSpacing,
      );
      await mockService.storeTextScaleFactorSetting(
        newSetting: testScaleFactor,
      );
      await mockService.storeTextAlignmentSetting(
        newSetting: testTextAlignment,
      );
      await mockService.storeTextFontWeightSetting(newSetting: testFontWeight);

      final wordSpacing = await mockService.getWordSpacingSetting();
      final lineHeight = await mockService.getLineHeightSetting();
      final letterSpacing = await mockService.getLetterSpacingSetting();
      final scaleFactor = await mockService.getTextScaleFactorSetting();
      final textAlignment = await mockService.getTextAlignmentSetting();
      final fontWeight = await mockService.getTextFontWeightSetting();

      expect(wordSpacing, equals(testWordSpacing));
      expect(lineHeight, equals(testLineHeight));
      expect(letterSpacing, equals(testLetterSpacing));
      expect(scaleFactor, equals(testScaleFactor));
      expect(textAlignment, equals(testTextAlignment));
      expect(fontWeight, equals(testFontWeight));
    });

    test('should store and retrieve color settings', () async {
      const testThemeProfile = 'seizure_safe';
      const testColorProfile = 'protanopia';
      const testTextColor = 123;
      const testBackgroundColor = 456;

      await mockService.storeThemeProfileSetting(newSetting: testThemeProfile);
      await mockService.storeColorProfileSetting(newSetting: testColorProfile);
      await mockService.storeTextColorSetting(newSetting: testTextColor);
      await mockService.storePagesBackgroundColorSetting(
        newSetting: testBackgroundColor,
      );

      final themeProfile = await mockService.getThemeProfileSetting();
      final colorProfile = await mockService.getColorProfileSetting();
      final textColor = await mockService.getTextColorSetting();
      final backgroundColor =
          await mockService.getPagesBackgroundColorSetting();

      expect(themeProfile, equals(testThemeProfile));
      expect(colorProfile, equals(testColorProfile));
      expect(textColor, equals(testTextColor));
      expect(backgroundColor, equals(testBackgroundColor));
    });

    test('should correctly handle first time opened flag', () async {
      // Should be true initially
      final initialValue = await mockService.getIsAppFirstTimeOpened();
      expect(initialValue, isTrue);

      // Should be false after storing
      await mockService.storeIsFirstTimeOpened();
      final afterStore = await mockService.getIsAppFirstTimeOpened();
      expect(afterStore, isFalse);
    });

    test('should reset to default values', () async {
      // Set custom values first
      await mockService.storeThemeModeSetting(newSetting: 'dark');
      await mockService.storeEffectsAllowedSetting(newSetting: false);
      await mockService.storeWordSpacingSetting(newSetting: 2.5);

      // Reset to defaults
      await mockService.restoreDefaultSettings();

      // Verify defaults were set
      final themeMode = await mockService.getThemeModeSetting();
      final effectsAllowed = await mockService.getEffectsAllowedSetting();
      final wordSpacing = await mockService.getWordSpacingSetting();

      expect(themeMode, equals(LocalStorageDefaultValues.themeModeDefault));
      expect(
        effectsAllowed,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(wordSpacing, equals(TextSettings.defaultSettings.wordSpacing));
    });

    test('should get complete accessibility settings collection', () async {
      // Set some test values
      await mockService.storeThemeModeSetting(newSetting: 'dark');
      await mockService.storeEffectsAllowedSetting(newSetting: false);
      await mockService.storeWordSpacingSetting(newSetting: 2);
      await mockService.storeLineHeightSetting(newSetting: 1.8);
      await mockService.storeTextAlignmentSetting(newSetting: 'center');
      await mockService.storeColorProfileSetting(newSetting: 'monochrome');

      // Get combined settings
      final settings = await mockService.getLocalStorageAccessibilitySettings();

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

    test('should create mock service using static factory method', () {
      final mockService = SharedPreferencesService.createMockService(
        initialStorage: {'test': 'value'},
        initialMethodCalls: ['test'],
      );
      expect(mockService, isA<MockSharedPreferencesService>());
    });
  });
}
