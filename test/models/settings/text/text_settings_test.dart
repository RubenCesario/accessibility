import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const defaultSettings = TextSettings.defaultSettings;
  group('TextSettings', () {
    test('constructor creates instance with default values', () {
      expect(
        defaultSettings.lineHeight,
        equals(LocalStorageDefaultValues.lineHeightDefault),
      );
      expect(
        defaultSettings.wordSpacing,
        equals(LocalStorageDefaultValues.wordSpacingDefault),
      );
      expect(
        defaultSettings.letterSpacing,
        equals(LocalStorageDefaultValues.letterSpacingDefault),
      );
      expect(
        defaultSettings.textScaleFactor,
        equals(LocalStorageDefaultValues.textScaleFactorDefault),
      );
      expect(
        defaultSettings.isFontWeightBold,
        equals(LocalStorageDefaultValues.textFontWeightModeDefault),
      );
      expect(
        defaultSettings.textAlignMode,
        equals(LocalStorageDefaultValues.textAlignmentDefault),
      );
      expect(
        defaultSettings.color,
        equals(LocalStorageDefaultValues.noColorSelected),
      );
    });

    test('constructor creates instance with custom values', () {
      const customLineHeight = 2.0;
      const customWordSpacing = 3.0;
      const customLetterSpacing = 1.5;
      const customTextScaleFactor = 1.2;
      const customIsFontWeightBold = true;
      const customTextAlignMode = 'right';
      const customColor = 0xFF123456;

      const textSettings = TextSettings(
        lineHeight: customLineHeight,
        wordSpacing: customWordSpacing,
        letterSpacing: customLetterSpacing,
        textScaleFactor: customTextScaleFactor,
        isFontWeightBold: customIsFontWeightBold,
        textAlignMode: customTextAlignMode,
        color: customColor,
      );

      expect(textSettings.lineHeight, equals(customLineHeight));
      expect(textSettings.wordSpacing, equals(customWordSpacing));
      expect(textSettings.letterSpacing, equals(customLetterSpacing));
      expect(textSettings.textScaleFactor, equals(customTextScaleFactor));
      expect(textSettings.isFontWeightBold, equals(customIsFontWeightBold));
      expect(textSettings.textAlignMode, equals(customTextAlignMode));
      expect(textSettings.color, equals(customColor));
    });

    test('defaultSettings has correct default values', () {
      const defaultSettings = TextSettings.defaultSettings;
      expect(
        defaultSettings.lineHeight,
        equals(LocalStorageDefaultValues.lineHeightDefault),
      );
      expect(
        defaultSettings.wordSpacing,
        equals(LocalStorageDefaultValues.wordSpacingDefault),
      );
      expect(
        defaultSettings.letterSpacing,
        equals(LocalStorageDefaultValues.letterSpacingDefault),
      );
      expect(
        defaultSettings.textScaleFactor,
        equals(LocalStorageDefaultValues.textScaleFactorDefault),
      );
      expect(
        defaultSettings.isFontWeightBold,
        equals(LocalStorageDefaultValues.textFontWeightModeDefault),
      );
      expect(
        defaultSettings.textAlignMode,
        equals(LocalStorageDefaultValues.textAlignmentDefault),
      );
      expect(
        defaultSettings.color,
        equals(LocalStorageDefaultValues.noColorSelected),
      );
    });

    group('copyWith', () {
      test('creates a copy with updated lineHeight', () {
        const newLineHeight = 2.5;
        final copy = defaultSettings.copyWith(lineHeight: newLineHeight);
        expect(copy.lineHeight, equals(newLineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });

      test('creates a copy with updated wordSpacing', () {
        const newWordSpacing = 3.5;
        final copy = defaultSettings.copyWith(wordSpacing: newWordSpacing);
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(newWordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });

      test('creates a copy with updated letterSpacing', () {
        const newLetterSpacing = 1.8;
        final copy = defaultSettings.copyWith(letterSpacing: newLetterSpacing);
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(newLetterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });

      test('creates a copy with updated textScaleFactor', () {
        const newTextScaleFactor = 1.3;
        final copy =
            defaultSettings.copyWith(textScaleFactor: newTextScaleFactor);
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(newTextScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });

      test('creates a copy with updated isFontWeightBold', () {
        final newIsFontWeightBold = !defaultSettings.isFontWeightBold;
        final copy =
            defaultSettings.copyWith(isFontWeightBold: newIsFontWeightBold);
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(newIsFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });

      test('creates a copy with updated textAlignMode', () {
        const newTextAlignMode = 'justify';
        final copy = defaultSettings.copyWith(textAlignMode: newTextAlignMode);
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(newTextAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });

      test('creates a copy with updated color', () {
        const newColor = 0xFF987654;
        final copy = defaultSettings.copyWith(color: newColor);
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(newColor));
      });

      test('creates a copy with all properties updated', () {
        const newLineHeight = 2.5;
        const newWordSpacing = 3.5;
        const newLetterSpacing = 1.8;
        const newTextScaleFactor = 1.3;
        const newIsFontWeightBold = true;
        const newTextAlignMode = 'justify';
        const newColor = 0xFF987654;
        final copy = defaultSettings.copyWith(
          lineHeight: newLineHeight,
          wordSpacing: newWordSpacing,
          letterSpacing: newLetterSpacing,
          textScaleFactor: newTextScaleFactor,
          isFontWeightBold: newIsFontWeightBold,
          textAlignMode: newTextAlignMode,
          color: newColor,
        );
        expect(copy.lineHeight, equals(newLineHeight));
        expect(copy.wordSpacing, equals(newWordSpacing));
        expect(copy.letterSpacing, equals(newLetterSpacing));
        expect(copy.textScaleFactor, equals(newTextScaleFactor));
        expect(copy.isFontWeightBold, equals(newIsFontWeightBold));
        expect(copy.textAlignMode, equals(newTextAlignMode));
        expect(copy.color, equals(newColor));
      });

      test('ignores saturationMultiplier parameter', () {
        const saturationMultiplier = 2.0;
        final copy = defaultSettings.copyWith(
          saturationMultiplier: saturationMultiplier,
        );
        expect(copy.lineHeight, equals(defaultSettings.lineHeight));
        expect(copy.wordSpacing, equals(defaultSettings.wordSpacing));
        expect(copy.letterSpacing, equals(defaultSettings.letterSpacing));
        expect(copy.textScaleFactor, equals(defaultSettings.textScaleFactor));
        expect(copy.isFontWeightBold, equals(defaultSettings.isFontWeightBold));
        expect(copy.textAlignMode, equals(defaultSettings.textAlignMode));
        expect(copy.color, equals(defaultSettings.color));
      });
    });

    group('equality', () {
      test('instances with same values are equal', () {
        const settings1 = TextSettings(
          lineHeight: 2,
          wordSpacing: 3,
          letterSpacing: 1,
          isFontWeightBold: true,
          textAlignMode: 'right',
          color: 0xFF123456,
        );

        const settings2 = TextSettings(
          lineHeight: 2,
          wordSpacing: 3,
          letterSpacing: 1,
          isFontWeightBold: true,
          textAlignMode: 'right',
          color: 0xFF123456,
        );

        expect(settings1 == settings2, isTrue);
        expect(settings1.hashCode, equals(settings2.hashCode));
      });

      test('instances with different lineHeight are not equal', () {
        final otherSettings = defaultSettings.copyWith(
          lineHeight: defaultSettings.lineHeight + 1,
        );
        expect(defaultSettings == otherSettings, isFalse);
      });

      test('instances with different wordSpacing are not equal', () {
        final otherSettings = defaultSettings.copyWith(
          wordSpacing: defaultSettings.wordSpacing + 1,
        );
        expect(defaultSettings == otherSettings, isFalse);
      });

      test('instances with different letterSpacing are not equal', () {
        final otherSettings = defaultSettings.copyWith(
          letterSpacing: defaultSettings.letterSpacing + 1,
        );
        expect(defaultSettings == otherSettings, isFalse);
      });

      test('instances with different textScaleFactor are not equal', () {
        final otherSettings = defaultSettings.copyWith(
          textScaleFactor: defaultSettings.textScaleFactor + 1,
        );
        expect(defaultSettings == otherSettings, isFalse);
      });

      test('instances with different isFontWeightBold are not equal', () {
        final otherSettings = defaultSettings.copyWith(
          isFontWeightBold: !defaultSettings.isFontWeightBold,
        );
        expect(defaultSettings == otherSettings, isFalse);
      });

      test('instances with different textAlignMode are not equal', () {
        final otherSettings = defaultSettings.copyWith(textAlignMode: 'right');
        expect(defaultSettings == otherSettings, isFalse);
      });

      test('instances with different color are not equal', () {
        final otherSettings = defaultSettings.copyWith(color: 0xFF123456);
        expect(defaultSettings == otherSettings, isFalse);
      });
    });
  });
}
