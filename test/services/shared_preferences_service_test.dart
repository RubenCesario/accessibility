import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/mock_shared_preferences_service.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SharedPreferencesService service;

  setUp(() {
    service = SharedPreferencesService.createMockService();
  });

  group('SharedPreferencesService', () {
    test('should create mock service using factory method', () {
      expect(service, isA<SharedPreferencesService>());
      expect(service, isA<MockSharedPreferencesService>());
    });

    test('should return accessibility settings collection', () async {
      final settings = await service.getLocalStorageAccessibilitySettings();

      expect(settings.themeMode, equals(ThemeMode.system));
      expect(settings.effectsAllowed, isTrue); // Default value
      expect(settings.textSettings, isNotNull);
      expect(settings.colorSettings, isNotNull);
    });

    test('should support theme mode changes', () async {
      final defaultMode = await service.getThemeModeSetting();
      expect(defaultMode, equals('system'));

      await service.storeThemeModeSetting(newSetting: 'dark');
      final updatedMode = await service.getThemeModeSetting();
      expect(updatedMode, equals('dark'));
      final settings = await service.getLocalStorageAccessibilitySettings();
      expect(settings.themeMode, equals(ThemeMode.dark));
    });

    test('should support effects allowed changes', () async {
      final defaultValue = await service.getEffectsAllowedSetting();
      expect(defaultValue, isTrue);

      await service.storeEffectsAllowedSetting(newSetting: false);
      final updatedValue = await service.getEffectsAllowedSetting();
      expect(updatedValue, isFalse);
      final settings = await service.getLocalStorageAccessibilitySettings();
      expect(settings.effectsAllowed, isFalse);
    });

    test('should support text settings changes', () async {
      // Set text settings
      await service.storeWordSpacingSetting(newSetting: 2);
      await service.storeLineHeightSetting(newSetting: 1.5);
      await service.storeLetterSpacingSetting(newSetting: 0.5);
      await service.storeTextScaleFactorSetting(newSetting: 1.2);
      await service.storeTextFontWeightSetting(newSetting: true);
      await service.storeTextAlignmentSetting(newSetting: 'center');
      await service.storeTextColorSetting(newSetting: 123456);

      // Verify individual settings
      expect(await service.getWordSpacingSetting(), equals(2.0));
      expect(await service.getLineHeightSetting(), equals(1.5));
      expect(await service.getLetterSpacingSetting(), equals(0.5));
      expect(await service.getTextScaleFactorSetting(), equals(1.2));
      expect(await service.getTextFontWeightSetting(), isTrue);
      expect(await service.getTextAlignmentSetting(), equals('center'));
      expect(await service.getTextColorSetting(), equals(123456));

      // Verify in combined settings
      final settings = await service.getLocalStorageAccessibilitySettings();
      expect(settings.textSettings.wordSpacing, equals(2.0));
      expect(settings.textSettings.lineHeight, equals(1.5));
      expect(settings.textSettings.letterSpacing, equals(0.5));
      expect(settings.textSettings.textScaleFactor, equals(1.2));
      expect(settings.textSettings.isFontWeightBold, isTrue);
      expect(settings.textSettings.textAlignMode, equals('center'));
      expect(settings.textSettings.color, equals(123456));
    });

    test('should support color settings changes', () async {
      await service.storeColorProfileSetting(newSetting: 'monochrome');
      await service.storeThemeProfileSetting(newSetting: 'seizure_safe');
      await service.storePagesBackgroundColorSetting(newSetting: 654321);
      expect(await service.getColorProfileSetting(), equals('monochrome'));
      expect(await service.getThemeProfileSetting(), equals('seizure_safe'));
      expect(await service.getPagesBackgroundColorSetting(), equals(654321));
      final settings = await service.getLocalStorageAccessibilitySettings();
      expect(
        settings.colorSettings.colorProfileLevel.name,
        equals('monochrome'),
      );
      expect(settings.colorSettings.pagesBackgroundColorValue, equals(654321));
    });

    test('should reset to default settings', () async {
      await service.storeThemeModeSetting(newSetting: 'dark');
      await service.storeEffectsAllowedSetting(newSetting: false);
      await service.storeWordSpacingSetting(newSetting: 2.5);
      await service.storeColorProfileSetting(newSetting: 'monochrome');
      await service.restoreDefaultSettings();
      final settings = await service.getLocalStorageAccessibilitySettings();
      expect(settings.themeMode, equals(ThemeMode.system));
      expect(settings.effectsAllowed, isTrue);
      expect(
        settings.textSettings.wordSpacing,
        equals(TextSettings.defaultSettings.wordSpacing),
      );
    });

    test('should track first time app opened status', () async {
      final initialValue = await service.getIsAppFirstTimeOpened();
      expect(initialValue, isTrue);
      await service.storeIsFirstTimeOpened();
      final afterStore = await service.getIsAppFirstTimeOpened();
      expect(afterStore, isFalse);
    });
  });
}
