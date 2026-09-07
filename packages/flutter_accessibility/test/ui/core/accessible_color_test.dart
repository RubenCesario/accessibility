import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_color.dart';
import 'package:flutter_test/flutter_test.dart';

const red = Color(0xFFFF0000);

void main() {
  group('withColorProfile', () {
    test('normal reproduces the 1.x arithmetic: lightness factor 0', () {
      // ColorProfile.normal carries lightnessFactor 0 from 1.x, so applying
      // it turns any colour black; theme layers never apply `normal`.
      expect(
        red.withColorProfile(ColorProfile.normal),
        const Color(0xFF000000),
      );
    });

    test('lowSaturation halves the saturation', () {
      final hsl = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.lowSaturation),
      );
      expect(hsl.saturation, closeTo(0.5, 0.01));
      expect(hsl.lightness, closeTo(0.5, 0.01));
    });

    test('highSaturation clamps the saturation to 1', () {
      final source = HSLColor.fromColor(red).withSaturation(0.4).toColor();
      final hsl = HSLColor.fromColor(
        source.withColorProfile(ColorProfile.highSaturation),
      );
      expect(hsl.saturation, closeTo(0.8, 0.02));
      final clamped = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.highSaturation),
      );
      expect(clamped.saturation, closeTo(1, 0.01));
    });

    test('monochrome removes the saturation', () {
      final hsl = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.monochrome),
      );
      expect(hsl.saturation, closeTo(0, 0.01));
    });

    test('highContrast halves the lightness', () {
      final hsl = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.highContrast),
      );
      expect(hsl.lightness, closeTo(0.25, 0.01));
      expect(hsl.saturation, closeTo(1, 0.01));
    });
  });
}
