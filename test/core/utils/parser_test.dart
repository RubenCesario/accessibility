import 'package:accessibility/src/core/utils/parser.dart';
import 'package:flutter/material.dart' show TextAlign, ThemeMode;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('parseThemeMode', () {
    test('should return correct ThemeMode when valid key is provided', () {
      expect(parseThemeMode('system'), equals(ThemeMode.system));
      expect(parseThemeMode('light'), equals(ThemeMode.light));
      expect(parseThemeMode('dark'), equals(ThemeMode.dark));
    });

    test('should return ThemeMode.system when invalid key is provided', () {
      expect(parseThemeMode('invalid'), equals(ThemeMode.system));
      expect(parseThemeMode(''), equals(ThemeMode.system));
    });

    test('should be case sensitive when parsing mode names', () {
      expect(
        parseThemeMode('System'),
        equals(ThemeMode.system),
        reason: 'fallback value',
      );
      expect(parseThemeMode('Light'), isNot(equals(ThemeMode.light)));
      expect(parseThemeMode('Dark'), isNot(equals(ThemeMode.dark)));
    });
  });

  group('parseTextAlign', () {
    test('should return correct TextAlign when valid key is provided', () {
      expect(parseTextAlign('start'), equals(TextAlign.start));
      expect(parseTextAlign('center'), equals(TextAlign.center));
      expect(parseTextAlign('end'), equals(TextAlign.end));
      expect(parseTextAlign('left'), equals(TextAlign.left));
      expect(parseTextAlign('right'), equals(TextAlign.right));
      expect(parseTextAlign('justify'), equals(TextAlign.justify));
    });

    test('should return TextAlign.start when invalid key is provided', () {
      expect(parseTextAlign('invalid'), equals(TextAlign.start));
      expect(parseTextAlign(''), equals(TextAlign.start));
    });

    test('should be case sensitive when parsing align names', () {
      expect(
        parseTextAlign('Start'),
        equals(TextAlign.start),
        reason: 'fallback value',
      );
      expect(parseTextAlign('Center'), isNot(equals(TextAlign.center)));
      expect(parseTextAlign('End'), isNot(equals(TextAlign.end)));
    });
  });
}
