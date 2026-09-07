import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_test/flutter_test.dart';

const base = TextStyle(
  fontSize: 14,
  fontFamily: 'Roboto',
  fontFamilyFallback: ['Arial'],
  color: Color(0xFF000000),
);
const andika = AccessibleFont(family: 'Andika', package: 'font_andika');

void main() {
  group('applyTextSettings', () {
    test('returns the same style for default settings', () {
      expect(
        identical(base.applyTextSettings(TextSettings.defaults), base),
        isTrue,
      );
    });

    test('scales the font size and applies spacing, weight and colour', () {
      final styled = base.applyTextSettings(
        const TextSettings(
          textScaleFactor: 1.5,
          lineHeight: 2,
          letterSpacing: 0.5,
          wordSpacing: 3,
          isBold: true,
          color: 0xFF112233,
        ),
      );
      expect(styled.fontSize, 21);
      expect(styled.height, 2);
      expect(styled.letterSpacing, 0.5);
      expect(styled.wordSpacing, 3);
      expect(styled.fontWeight, FontWeight.bold);
      expect(styled.color, const Color(0xFF112233));
      expect(styled.fontFamily, 'Roboto');
      expect(styled.fontFamilyFallback, ['Arial']);
    });

    test('keeps a null font size and unset fields', () {
      const sizeless = TextStyle(color: Color(0xFF000000));
      final styled = sizeless.applyTextSettings(
        const TextSettings(textScaleFactor: 2),
      );
      expect(styled.fontSize, isNull);
      expect(styled.height, isNull);
      expect(styled.fontWeight, isNull);
      expect(styled.color, const Color(0xFF000000));
    });

    test('uses the registered font and keeps the app font as fallback', () {
      final styled = base.applyTextSettings(
        const TextSettings(fontFamily: 'Andika'),
        font: andika,
      );
      expect(styled.fontFamily, 'packages/font_andika/Andika');
      expect(styled.fontFamilyFallback, ['Roboto', 'Arial']);
    });

    test('uses the raw family when it is not a registered font', () {
      final styled = base.applyTextSettings(
        const TextSettings(fontFamily: 'OpenDyslexic'),
      );
      expect(styled.fontFamily, 'OpenDyslexic');
      expect(styled.fontFamilyFallback, ['Roboto', 'Arial']);
    });

    test('ignores a registered font that does not match the selection', () {
      final styled = base.applyTextSettings(
        const TextSettings(fontFamily: 'OpenDyslexic'),
        font: andika,
      );
      expect(styled.fontFamily, 'OpenDyslexic');
    });

    test('a style without a family gets no fallback chain', () {
      const bare = TextStyle(fontSize: 10);
      final styled = bare.applyTextSettings(
        const TextSettings(fontFamily: 'Andika'),
        font: andika,
      );
      expect(styled.fontFamily, 'packages/font_andika/Andika');
      expect(styled.fontFamilyFallback, isNull);
    });
  });
}
