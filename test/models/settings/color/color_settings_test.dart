import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const defaultSettings = ColorSettings.defaultSettings;

  group('ColorSettings', () {
    test('constructor creates instance with default values', () {
      expect(
        defaultSettings.pagesBackgroundColorValue,
        equals(LocalStorageDefaultValues.noColorSelected),
      );
      expect(
        defaultSettings.colorProfileLevel,
        equals(ColorProfileLevel.normal),
      );
    });

    test('constructor creates instance with custom values', () {
      const customBackgroundColor = 0xFF123456;
      const colorSettings = ColorSettings(
        pagesBackgroundColorValue: customBackgroundColor,
        colorProfileLevel: ColorProfileLevel.monochrome,
      );
      expect(
        colorSettings.pagesBackgroundColorValue,
        equals(customBackgroundColor),
      );
      expect(
        colorSettings.colorProfileLevel,
        equals(ColorProfileLevel.monochrome),
      );
    });

    test('defaultSettings has correct default values', () {
      expect(
        defaultSettings.pagesBackgroundColorValue,
        equals(LocalStorageDefaultValues.noColorSelected),
      );
      expect(
        defaultSettings.colorProfileLevel,
        equals(ColorProfileLevel.normal),
      );
    });

    group('copyWith', () {
      test('creates a copy with updated pagesBackgroundColorValue', () {
        const newBackgroundColor = 0xFF654321;
        final copy = defaultSettings.copyWith(
          pagesBackgroundColorValue: newBackgroundColor,
        );
        expect(copy.pagesBackgroundColorValue, equals(newBackgroundColor));
        expect(
          copy.colorProfileLevel,
          equals(defaultSettings.colorProfileLevel),
        );
      });

      test('creates a copy with updated colorProfileLevel', () {
        const newColorProfileLevel = ColorProfileLevel.highContrast;
        final copy = defaultSettings.copyWith(
          colorProfileLevel: newColorProfileLevel,
        );
        expect(
          copy.pagesBackgroundColorValue,
          equals(defaultSettings.pagesBackgroundColorValue),
        );
        expect(copy.colorProfileLevel, equals(newColorProfileLevel));
      });

      test('creates a copy with all properties updated', () {
        const newBackgroundColor = 0xFF987654;
        const newColorProfileLevel = ColorProfileLevel.lowSaturation;
        final copy = defaultSettings.copyWith(
          pagesBackgroundColorValue: newBackgroundColor,
          colorProfileLevel: newColorProfileLevel,
        );
        expect(copy.pagesBackgroundColorValue, equals(newBackgroundColor));
        expect(copy.colorProfileLevel, equals(newColorProfileLevel));
      });
    });

    group('equality', () {
      test('instances with same values are equal', () {
        const settings1 = ColorSettings(
          pagesBackgroundColorValue: 0xFF112233,
          colorProfileLevel: ColorProfileLevel.highSaturation,
        );

        const settings2 = ColorSettings(
          pagesBackgroundColorValue: 0xFF112233,
          colorProfileLevel: ColorProfileLevel.highSaturation,
        );
        expect(settings1 == settings2, isTrue);
        expect(settings1.hashCode, equals(settings2.hashCode));
      });

      test('instances with different pagesBackgroundColorValue are not equal',
          () {
        const otherSettings = ColorSettings(
          pagesBackgroundColorValue: 0xFFAABBCC,
        );
        expect(defaultSettings == otherSettings, isFalse);
        expect(defaultSettings.hashCode != otherSettings.hashCode, isTrue);
      });

      test('instances with different colorProfileLevel are not equal', () {
        const otherSettings = ColorSettings(
          colorProfileLevel: ColorProfileLevel.monochrome,
        );
        expect(defaultSettings == otherSettings, isFalse);
        expect(defaultSettings.hashCode != otherSettings.hashCode, isTrue);
      });
    });
  });
}
