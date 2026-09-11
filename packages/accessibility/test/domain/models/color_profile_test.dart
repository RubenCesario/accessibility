import 'package:accessibility/src/domain/models/color_profile.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:test/test.dart';

void main() {
  group('ColorProfile', () {
    test('fromLevel returns the profile of every level', () {
      for (final level in ColorProfileLevel.values) {
        expect(ColorProfile.fromLevel(level).level, level);
      }
    });

    test('values are ordered like the levels', () {
      expect(
        ColorProfile.values.map((profile) => profile.level),
        ColorProfileLevel.values,
      );
    });

    test('keeps the 1.x saturation and lightness values', () {
      expect(ColorProfile.normal.saturationMultiplier, 1);
      expect(ColorProfile.normal.lightnessFactor, 0);
      expect(ColorProfile.lowSaturation.saturationMultiplier, 0.5);
      expect(ColorProfile.lowSaturation.lightnessFactor, isNull);
      expect(ColorProfile.highSaturation.saturationMultiplier, 2);
      expect(ColorProfile.monochrome.saturationMultiplier, 0);
      expect(ColorProfile.highContrast.saturationMultiplier, isNull);
      expect(ColorProfile.highContrast.lightnessFactor, 0.5);
    });

    test('is a value type with a readable toString', () {
      expect(
        ColorProfile.fromLevel(ColorProfileLevel.monochrome),
        ColorProfile.monochrome,
      );
      expect(
        ColorProfile.monochrome.hashCode,
        ColorProfile.fromLevel(ColorProfileLevel.monochrome).hashCode,
      );
      expect(ColorProfile.monochrome, isNot(ColorProfile.normal));
      expect(ColorProfile.monochrome.toString(), contains('monochrome'));
    });
  });
}
