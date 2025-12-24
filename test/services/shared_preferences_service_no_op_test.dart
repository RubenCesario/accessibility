import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/services/shared_preferences_service_no_op.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferencesServiceNoOp', () {
    late SharedPreferencesServiceNoOp service;

    setUp(() {
      service = const SharedPreferencesServiceNoOp();
    });

    test('should be instantiated as const', () {
      const service1 = SharedPreferencesServiceNoOp();
      const service2 = SharedPreferencesServiceNoOp();
      expect(identical(service1, service2), isTrue);
    });

    group('getLocalStorageAccessibilitySettings', () {
      test('should return a11yDefaultSettings', () async {
        final settings = await service.getLocalStorageAccessibilitySettings();

        expect(settings, equals(a11yDefaultSettings));
        expect(settings.themeMode, equals(ThemeMode.system));
        expect(settings.effectsAllowed, isFalse);
      });
    });

    group('restoreDefaultSettings', () {
      test('should complete without error', () async {
        await expectLater(
          service.restoreDefaultSettings(),
          completes,
        );
      });
    });

    group('Theme Mode', () {
      test('getThemeModeSetting should return default value', () async {
        final result = await service.getThemeModeSetting();
        expect(result, equals(LocalStorageDefaultValues.themeModeDefault));
      });

      test('storeThemeModeSetting should return the same value passed',
          () async {
        final result = await service.storeThemeModeSetting(newSetting: 'dark');
        expect(result, equals('dark'));
      });
    });

    group('Effects Allowed', () {
      test('getEffectsAllowedSetting should return default value', () async {
        final result = await service.getEffectsAllowedSetting();
        expect(result, equals(LocalStorageDefaultValues.effectsAllowedDefault));
      });

      test('storeEffectsAllowedSetting should return the same value passed',
          () async {
        final result =
            await service.storeEffectsAllowedSetting(newSetting: false);
        expect(result, isFalse);
      });
    });

    group('Word Spacing', () {
      test('getWordSpacingSetting should return default value', () async {
        final result = await service.getWordSpacingSetting();
        expect(result, equals(LocalStorageDefaultValues.wordSpacingDefault));
      });

      test('storeWordSpacingSetting should return the same value passed',
          () async {
        final result = await service.storeWordSpacingSetting(newSetting: 2);
        expect(result, equals(2.0));
      });
    });

    group('Text Alignment', () {
      test('getTextAlignmentSetting should return default value', () async {
        final result = await service.getTextAlignmentSetting();
        expect(result, equals(LocalStorageDefaultValues.textAlignmentDefault));
      });

      test('storeTextAlignmentSetting should return the same value passed',
          () async {
        final result =
            await service.storeTextAlignmentSetting(newSetting: 'center');
        expect(result, equals('center'));
      });
    });

    group('Line Height', () {
      test('getLineHeightSetting should return default value', () async {
        final result = await service.getLineHeightSetting();
        expect(result, equals(LocalStorageDefaultValues.lineHeightDefault));
      });

      test('storeLineHeightSetting should return the same value passed',
          () async {
        final result = await service.storeLineHeightSetting(newSetting: 1.5);
        expect(result, equals(1.5));
      });
    });

    group('Letter Spacing', () {
      test('getLetterSpacingSetting should return default value', () async {
        final result = await service.getLetterSpacingSetting();
        expect(result, equals(LocalStorageDefaultValues.letterSpacingDefault));
      });

      test('storeLetterSpacingSetting should return the same value passed',
          () async {
        final result = await service.storeLetterSpacingSetting(newSetting: 0.5);
        expect(result, equals(0.5));
      });
    });

    group('Text Scale Factor', () {
      test('getTextScaleFactorSetting should return default value', () async {
        final result = await service.getTextScaleFactorSetting();
        expect(
          result,
          equals(LocalStorageDefaultValues.textScaleFactorDefault),
        );
      });

      test('storeTextScaleFactorSetting should return the same value passed',
          () async {
        final result =
            await service.storeTextScaleFactorSetting(newSetting: 1.2);
        expect(result, equals(1.2));
      });
    });

    group('Text Font Weight', () {
      test('getTextFontWeightSetting should return default value', () async {
        final result = await service.getTextFontWeightSetting();
        expect(
          result,
          equals(LocalStorageDefaultValues.textFontWeightModeDefault),
        );
      });

      test('storeTextFontWeightSetting should return the same value passed',
          () async {
        final result =
            await service.storeTextFontWeightSetting(newSetting: true);
        expect(result, isTrue);
      });
    });

    group('Theme Profile', () {
      test('getThemeProfileSetting should return default value', () async {
        final result = await service.getThemeProfileSetting();
        expect(result, equals(LocalStorageDefaultValues.themeProfileDefault));
      });

      test('storeThemeProfileSetting should return the same value passed',
          () async {
        final result =
            await service.storeThemeProfileSetting(newSetting: 'seizure_safe');
        expect(result, equals('seizure_safe'));
      });
    });

    group('Color Profile', () {
      test('getColorProfileSetting should return default value', () async {
        final result = await service.getColorProfileSetting();
        expect(result, equals(LocalStorageDefaultValues.colorProfileDefault));
      });

      test('storeColorProfileSetting should return the same value passed',
          () async {
        final result =
            await service.storeColorProfileSetting(newSetting: 'monochrome');
        expect(result, equals('monochrome'));
      });
    });

    group('Text Color', () {
      test('getTextColorSetting should return default value', () async {
        final result = await service.getTextColorSetting();
        expect(result, equals(LocalStorageDefaultValues.noColorSelected));
      });

      test('storeTextColorSetting should return the same value passed',
          () async {
        final result = await service.storeTextColorSetting(newSetting: 123456);
        expect(result, equals(123456));
      });
    });

    group('Pages Background Color', () {
      test('getPagesBackgroundColorSetting should return default value',
          () async {
        final result = await service.getPagesBackgroundColorSetting();
        expect(result, equals(LocalStorageDefaultValues.noColorSelected));
      });

      test(
          'storePagesBackgroundColorSetting should return the same '
          'value passed', () async {
        final result =
            await service.storePagesBackgroundColorSetting(newSetting: 654321);
        expect(result, equals(654321));
      });
    });

    group('First Time Opened', () {
      test('getIsAppFirstTimeOpened should return false', () async {
        final result = await service.getIsAppFirstTimeOpened();
        expect(result, isFalse);
      });

      test('storeIsFirstTimeOpened should return false', () async {
        final result = await service.storeIsFirstTimeOpened();
        expect(result, isFalse);
      });
    });

    group('_storeToLocalStorage', () {
      setUp(() {
        SharedPreferences.setMockInitialValues({});
      });

      test('storeUnsupportedValueType should throw UnimplementedError',
          () async {
        await expectLater(
          service.storeUnsupportedValueType(),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('storeIntValue should store int value without error', () async {
        await expectLater(
          service.storeIntValue('test_int', 42),
          completes,
        );

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('test_int'), equals(42));
      });

      test('storeDoubleValue should store double value without error',
          () async {
        await expectLater(
          service.storeDoubleValue('test_double', 3.14),
          completes,
        );

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getDouble('test_double'), equals(3.14));
      });

      test('storeStringValue should store String value without error',
          () async {
        await expectLater(
          service.storeStringValue('test_string', 'hello'),
          completes,
        );

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('test_string'), equals('hello'));
      });

      test('storeBoolValue should store bool value without error', () async {
        await expectLater(
          service.storeBoolValue('test_bool', value: true),
          completes,
        );

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('test_bool'), isTrue);
      });
    });
  });
}
