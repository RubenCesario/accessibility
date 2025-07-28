import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorProfileLevel', () {
    test('fromString returns correct enum value for valid string', () {
      expect(
        ColorProfileLevel.fromString('normal'),
        equals(ColorProfileLevel.normal),
      );
      expect(
        ColorProfileLevel.fromString('lowSaturation'),
        equals(ColorProfileLevel.lowSaturation),
      );
      expect(
        ColorProfileLevel.fromString('highSaturation'),
        equals(ColorProfileLevel.highSaturation),
      );
      expect(
        ColorProfileLevel.fromString('monochrome'),
        equals(ColorProfileLevel.monochrome),
      );
      expect(
        ColorProfileLevel.fromString('highContrast'),
        equals(ColorProfileLevel.highContrast),
      );
    });

    test('fromString returns normal for invalid string', () {
      expect(
        ColorProfileLevel.fromString('invalidValue'),
        equals(ColorProfileLevel.normal),
      );
      expect(
        ColorProfileLevel.fromString(''),
        equals(ColorProfileLevel.normal),
      );
    });
  });

  group('ColorProfile', () {
    test('fromLevel creates correct profile for normal level', () {
      final profile = ColorProfile.fromLevel(ColorProfileLevel.normal);
      expect(profile.level, equals(ColorProfileLevel.normal));
      expect(profile.icon, equals(Icons.brightness_medium));
      expect(profile.saturationMultiplier, equals(1.0));
      expect(profile.lightnessFactor, equals(0.0));
    });

    test('fromLevel creates correct profile for lowSaturation level', () {
      final profile = ColorProfile.fromLevel(ColorProfileLevel.lowSaturation);
      expect(profile.level, equals(ColorProfileLevel.lowSaturation));
      expect(profile.icon, equals(Icons.brightness_low));
      expect(profile.saturationMultiplier, equals(0.5));
      expect(profile.lightnessFactor, isNull);
    });

    test('fromLevel creates correct profile for highSaturation level', () {
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highSaturation);
      expect(profile.level, equals(ColorProfileLevel.highSaturation));
      expect(profile.icon, equals(Icons.brightness_high));
      expect(profile.saturationMultiplier, equals(1.5));
      expect(profile.lightnessFactor, isNull);
    });

    test('fromLevel creates correct profile for monochrome level', () {
      final profile = ColorProfile.fromLevel(ColorProfileLevel.monochrome);
      expect(profile.level, equals(ColorProfileLevel.monochrome));
      expect(profile.icon, equals(Icons.brightness_1_outlined));
      expect(profile.saturationMultiplier, isNull);
      expect(profile.lightnessFactor, equals(1.0));
    });

    test('fromLevel creates correct profile for highContrast level', () {
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(profile.level, equals(ColorProfileLevel.highContrast));
      expect(profile.icon, equals(Icons.brightness_1));
      expect(profile.saturationMultiplier, isNull);
      expect(profile.lightnessFactor, equals(-1.0));
    });

    group('copyWith', () {
      test('creates a copy with updated level', () {
        final original = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final copy = original.copyWith(level: ColorProfileLevel.highContrast);
        expect(copy.level, equals(ColorProfileLevel.highContrast));
        expect(copy.icon, equals(original.icon));
        expect(
          copy.saturationMultiplier,
          equals(original.saturationMultiplier),
        );
        expect(copy.lightnessFactor, equals(original.lightnessFactor));
      });

      test('creates a copy with updated icon', () {
        final original = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final copy = original.copyWith(icon: Icons.accessibility);
        expect(copy.level, equals(original.level));
        expect(copy.icon, equals(Icons.accessibility));
        expect(
          copy.saturationMultiplier,
          equals(original.saturationMultiplier),
        );
        expect(copy.lightnessFactor, equals(original.lightnessFactor));
      });

      test('creates a copy with updated saturationMultiplier', () {
        final original = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final copy = original.copyWith(saturationMultiplier: 2);
        expect(copy.level, equals(original.level));
        expect(copy.icon, equals(original.icon));
        expect(copy.saturationMultiplier, equals(2.0));
        expect(copy.lightnessFactor, equals(original.lightnessFactor));
      });

      test('creates a copy with updated lightnessFactor', () {
        final original = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final copy = original.copyWith(lightnessFactor: 0.5);
        expect(copy.level, equals(original.level));
        expect(copy.icon, equals(original.icon));
        expect(
          copy.saturationMultiplier,
          equals(original.saturationMultiplier),
        );
        expect(copy.lightnessFactor, equals(0.5));
      });
    });

    group('equality', () {
      test('instances with same values are equal', () {
        final profile1 = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final profile2 = ColorProfile.fromLevel(ColorProfileLevel.normal);
        expect(profile1 == profile2, isTrue);
        expect(profile1.hashCode, equals(profile2.hashCode));
      });

      test('instances with different values are not equal', () {
        final profile1 = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final profile2 = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
        expect(profile1 == profile2, isFalse);
        expect(profile1.hashCode != profile2.hashCode, isTrue);
      });

      test('instances with different saturation values are not equal', () {
        final profile1 = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final profile2 = profile1.copyWith(saturationMultiplier: 2);
        expect(profile1 == profile2, isFalse);
      });

      test('instances with different lightness values are not equal', () {
        final profile1 = ColorProfile.fromLevel(ColorProfileLevel.normal);
        final profile2 = profile1.copyWith(lightnessFactor: 0.7);
        expect(profile1 == profile2, isFalse);
      });
    });

    test('toString returns a string representation', () {
      final profile = ColorProfile.fromLevel(ColorProfileLevel.normal);
      final stringRepresentation = profile.toString();
      expect(stringRepresentation, isA<String>());
      expect(stringRepresentation, contains('ColorProfile'));
      expect(stringRepresentation, contains('level: ${profile.level}'));
      expect(stringRepresentation, contains('icon: ${profile.icon}'));
      expect(
        stringRepresentation,
        contains('saturationMultiplier: ${profile.saturationMultiplier}'),
      );
      expect(
        stringRepresentation,
        contains('lightnessFactor: ${profile.lightnessFactor}'),
      );
    });
  });
}
