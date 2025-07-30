import 'package:accessibility/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Colors Constants', () {
    test('kMaterialColors should contain all standard Material colors', () {
      expect(kMaterialColors, isNotEmpty);
      expect(kMaterialColors, contains(Colors.red));
      expect(kMaterialColors, contains(Colors.blue));
      expect(kMaterialColors, contains(Colors.green));
      expect(kMaterialColors.length, 19);
    });

    test('kMaterialMainColors should contain subset of main colors', () {
      expect(kMaterialMainColors, isNotEmpty);
      expect(kMaterialMainColors.length, 7);
      for (final color in kMaterialMainColors) {
        expect(kMaterialColors, contains(color));
      }

      // Check specific colors expected to be included
      expect(kMaterialMainColors, contains(Colors.red));
      expect(kMaterialMainColors, contains(Colors.blue));
      expect(kMaterialMainColors, contains(Colors.green));
      expect(kMaterialMainColors, contains(Colors.yellow));
    });

    test('kMaterialAccentColors should contain accent colors only', () {
      expect(kMaterialAccentColors, isNotEmpty);
      expect(
        kMaterialAccentColors.length,
        16,
      );
      expect(kMaterialAccentColors, contains(Colors.redAccent));
      expect(kMaterialAccentColors, contains(Colors.blueAccent));
      expect(kMaterialAccentColors, contains(Colors.greenAccent));

      // Ensure no non-accent colors are included
      for (final color in kMaterialAccentColors) {
        expect(color.toString().contains('Accent'), isTrue);
      }
    });

    test('kMaterialFullColors should include white and black', () {
      expect(kMaterialFullColors, isNotEmpty);
      expect(kMaterialFullColors.length, 37);
      expect(kMaterialFullColors[0][500], equals(Colors.white));
      expect(kMaterialFullColors[1][500], equals(Colors.black));
      for (final color in kMaterialColors) {
        expect(kMaterialFullColors, contains(color));
      }

      for (final color in kMaterialAccentColors) {
        expect(kMaterialFullColors, contains(color));
      }
    });

    test('all color constants should be ColorSwatch<int> type', () {
      for (final color in kMaterialColors) {
        expect(color, isA<ColorSwatch<int>>());
      }

      for (final color in kMaterialMainColors) {
        expect(color, isA<ColorSwatch<int>>());
      }

      for (final color in kMaterialAccentColors) {
        expect(color, isA<ColorSwatch<int>>());
      }

      for (final color in kMaterialFullColors) {
        expect(color, isA<ColorSwatch<int>>());
      }
    });
  });
}
