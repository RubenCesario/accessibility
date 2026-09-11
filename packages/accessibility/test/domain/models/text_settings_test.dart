import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:test/test.dart';

void main() {
  group('TextSettings', () {
    test('defaults override nothing', () {
      const settings = TextSettings.defaults;
      expect(settings.lineHeight, isNull);
      expect(settings.wordSpacing, isNull);
      expect(settings.letterSpacing, isNull);
      expect(settings.textScaleFactor, 1.0);
      expect(settings.isBold, isFalse);
      expect(settings.textAlign, TextAlignMode.none);
      expect(settings.color, isNull);
      expect(settings.fontFamily, isNull);
      expect(settings, TextSettings.defaults);
      expect(settings.isDefault, isTrue);
    });

    test('is a value type', () {
      const a = TextSettings(lineHeight: 1.5, color: 0xFF000000);
      const b = TextSettings(lineHeight: 1.5, color: 0xFF000000);
      const c = TextSettings(lineHeight: 1.6, color: 0xFF000000);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(c));
      expect(a.isDefault, isFalse);
      expect(a.toString(), contains('lineHeight: 1.5'));
    });

    test('copyWith keeps fields that are not passed', () {
      const original = TextSettings(
        lineHeight: 1.5,
        wordSpacing: 2,
        letterSpacing: 0.5,
        textScaleFactor: 1.2,
        isBold: true,
        textAlign: TextAlignMode.center,
        color: 0xFF112233,
        fontFamily: 'Andika',
      );
      expect(original.copyWith(), original);
      expect(
        original.copyWith(textScaleFactor: 2, textAlign: TextAlignMode.end),
        const TextSettings(
          lineHeight: 1.5,
          wordSpacing: 2,
          letterSpacing: 0.5,
          textScaleFactor: 2,
          isBold: true,
          textAlign: TextAlignMode.end,
          color: 0xFF112233,
          fontFamily: 'Andika',
        ),
      );
    });

    test('copyWith with null clears a nullable field', () {
      const original = TextSettings(
        lineHeight: 1.5,
        wordSpacing: 2,
        letterSpacing: 0.5,
        color: 0xFF112233,
        fontFamily: 'Andika',
      );
      final cleared = original.copyWith(
        lineHeight: null,
        wordSpacing: null,
        letterSpacing: null,
        color: null,
        fontFamily: null,
      );
      expect(cleared, TextSettings.defaults);
    });

    test('copyWith sets nullable fields', () {
      final set = TextSettings.defaults.copyWith(
        lineHeight: 2,
        wordSpacing: 3,
        letterSpacing: 4,
        isBold: true,
        color: 0xFF445566,
        fontFamily: 'OpenDyslexic',
      );
      expect(set.lineHeight, 2);
      expect(set.wordSpacing, 3);
      expect(set.letterSpacing, 4);
      expect(set.isBold, isTrue);
      expect(set.color, 0xFF445566);
      expect(set.fontFamily, 'OpenDyslexic');
    });
  });
}
