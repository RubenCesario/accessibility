import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const defaultThemeProfile = ThemeProfile.defaultTheme;

  group('ThemeProfileLevel', () {
    test('fromString returns correct enum value for valid string', () {
      expect(
        ThemeProfileLevel.fromString('none'),
        equals(ThemeProfileLevel.none),
      );
      expect(
        ThemeProfileLevel.fromString('seizureSafe'),
        equals(ThemeProfileLevel.seizureSafe),
      );
      expect(
        ThemeProfileLevel.fromString('visionImpaired'),
        equals(ThemeProfileLevel.visionImpaired),
      );
      expect(
        ThemeProfileLevel.fromString('adhdFriendly'),
        equals(ThemeProfileLevel.adhdFriendly),
      );
    });

    test('fromString returns none for invalid string', () {
      expect(
        ThemeProfileLevel.fromString('invalidValue'),
        equals(ThemeProfileLevel.none),
      );
      expect(ThemeProfileLevel.fromString(''), equals(ThemeProfileLevel.none));
    });
  });

  group('ThemeProfile', () {
    test('default theme has correct values', () {
      expect(
        defaultThemeProfile.textSettings,
        equals(TextSettings.defaultSettings),
      );
      expect(
        defaultThemeProfile.colorSettings,
        equals(ColorSettings.defaultSettings),
      );
      expect(
        defaultThemeProfile.effectsAllowed,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
    });

    group('fromLevel factory', () {
      test('creates correct profile for none level', () {
        final profile = ThemeProfile.fromLevel(ThemeProfileLevel.none);
        expect(profile, equals(ThemeProfile.defaultTheme));
        expect(profile.textSettings, equals(TextSettings.defaultSettings));
        expect(profile.colorSettings, equals(ColorSettings.defaultSettings));
        expect(
          profile.effectsAllowed,
          equals(LocalStorageDefaultValues.effectsAllowedDefault),
        );
      });

      test('creates correct profile for seizureSafe level', () {
        final profile = ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe);
        expect(profile.effectsAllowed, isFalse);
        expect(profile.textSettings, equals(TextSettings.defaultSettings));
        expect(
          profile.colorSettings.colorProfileLevel,
          equals(ColorProfileLevel.lowSaturation),
        );
      });

      test('creates correct profile for visionImpaired level', () {
        final profile =
            ThemeProfile.fromLevel(ThemeProfileLevel.visionImpaired);
        expect(
          profile.effectsAllowed,
          equals(LocalStorageDefaultValues.effectsAllowedDefault),
        );
        expect(profile.textSettings.isFontWeightBold, isTrue);
        expect(profile.textSettings.textScaleFactor, equals(2));
        expect(
          profile.colorSettings.colorProfileLevel,
          equals(ColorProfileLevel.highSaturation),
        );
      });

      test('creates correct profile for adhdFriendly level', () {
        final profile = ThemeProfile.fromLevel(ThemeProfileLevel.adhdFriendly);
        expect(profile.effectsAllowed, isFalse);
        expect(profile.textSettings.textScaleFactor, equals(1.25));
        expect(
          profile.colorSettings.colorProfileLevel,
          equals(ColorProfileLevel.highSaturation),
        );
      });
    });

    group('copyWith', () {
      test('creates a copy with updated textSettings', () {
        final newTextSettings = TextSettings.defaultSettings.copyWith(
          textScaleFactor: 1.5,
        );
        final copy =
            defaultThemeProfile.copyWith(textSettings: newTextSettings);
        expect(copy.textSettings, equals(newTextSettings));
        expect(copy.colorSettings, equals(defaultThemeProfile.colorSettings));
        expect(copy.effectsAllowed, equals(defaultThemeProfile.effectsAllowed));
      });

      test('creates a copy with updated colorSettings', () {
        final newColorSettings = ColorSettings.defaultSettings.copyWith(
          colorProfileLevel: ColorProfileLevel.monochrome,
        );
        final copy =
            defaultThemeProfile.copyWith(colorSettings: newColorSettings);
        expect(copy.textSettings, equals(defaultThemeProfile.textSettings));
        expect(copy.colorSettings, equals(newColorSettings));
        expect(copy.effectsAllowed, equals(defaultThemeProfile.effectsAllowed));
      });

      test('creates a copy with updated effectsAllowed', () {
        final newEffectsAllowed = !defaultThemeProfile.effectsAllowed;
        final copy =
            defaultThemeProfile.copyWith(effectsAllowed: newEffectsAllowed);
        expect(copy.textSettings, equals(defaultThemeProfile.textSettings));
        expect(copy.colorSettings, equals(defaultThemeProfile.colorSettings));
        expect(copy.effectsAllowed, equals(newEffectsAllowed));
      });

      test('creates a copy with all properties updated', () {
        final newTextSettings = TextSettings.defaultSettings.copyWith(
          textScaleFactor: 1.5,
        );
        final newColorSettings = ColorSettings.defaultSettings.copyWith(
          colorProfileLevel: ColorProfileLevel.monochrome,
        );
        final newEffectsAllowed = !defaultThemeProfile.effectsAllowed;
        final copy = defaultThemeProfile.copyWith(
          textSettings: newTextSettings,
          colorSettings: newColorSettings,
          effectsAllowed: newEffectsAllowed,
        );
        expect(copy.textSettings, equals(newTextSettings));
        expect(copy.colorSettings, equals(newColorSettings));
        expect(copy.effectsAllowed, equals(newEffectsAllowed));
      });
    });

    group('equality', () {
      test('instances with same values are equal', () {
        final profile1 = ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe);
        final profile2 = ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe);
        expect(profile1 == profile2, isTrue);
        expect(profile1.hashCode, equals(profile2.hashCode));
      });

      test('instances with different textSettings are not equal', () {
        final otherProfile = defaultThemeProfile.copyWith(
          textSettings:
              TextSettings.defaultSettings.copyWith(textScaleFactor: 2),
        );
        expect(defaultThemeProfile == otherProfile, isFalse);
        expect(defaultThemeProfile.hashCode != otherProfile.hashCode, isTrue);
      });

      test('instances with different colorSettings are not equal', () {
        final otherProfile = defaultThemeProfile.copyWith(
          colorSettings: ColorSettings.defaultSettings.copyWith(
            colorProfileLevel: ColorProfileLevel.monochrome,
          ),
        );
        expect(defaultThemeProfile == otherProfile, isFalse);
      });

      test('instances with different effectsAllowed are not equal', () {
        final otherProfile = defaultThemeProfile.copyWith(
          effectsAllowed: !defaultThemeProfile.effectsAllowed,
        );
        expect(defaultThemeProfile == otherProfile, isFalse);
      });
    });

    test('toString returns a string representation', () {
      final stringRepresentation = defaultThemeProfile.toString();
      expect(stringRepresentation, isA<String>());
      expect(stringRepresentation, contains('ThemeProfile'));
      expect(stringRepresentation, contains('textSettings:'));
      expect(stringRepresentation, contains('colorSettings:'));
      expect(stringRepresentation, contains('effectsAllowed:'));
    });
  });
}
