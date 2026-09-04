import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:test/test.dart';

void main() {
  group('ThemeProfile', () {
    test('fromLevel returns the profile of every level', () {
      for (final level in ThemeProfileLevel.values) {
        expect(ThemeProfile.fromLevel(level).level, level);
      }
    });

    test('none is the default settings', () {
      expect(ThemeProfile.none.textSettings, TextSettings.defaults);
      expect(ThemeProfile.none.colorSettings, ColorSettings.defaults);
      expect(ThemeProfile.none.effectsMode, EffectsMode.system);
    });

    test('seizureSafe disables effects and lowers saturation', () {
      expect(ThemeProfile.seizureSafe.effectsMode, EffectsMode.disabled);
      expect(
        ThemeProfile.seizureSafe.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.lowSaturation),
      );
      expect(ThemeProfile.seizureSafe.textSettings, TextSettings.defaults);
    });

    test('visionImpaired doubles and bolds text with high saturation', () {
      expect(
        ThemeProfile.visionImpaired.textSettings,
        const TextSettings(isBold: true, textScaleFactor: 2),
      );
      expect(
        ThemeProfile.visionImpaired.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.highSaturation),
      );
      expect(ThemeProfile.visionImpaired.effectsMode, EffectsMode.system);
    });

    test('adhdFriendly enlarges text, disables effects, high saturation', () {
      expect(
        ThemeProfile.adhdFriendly.textSettings,
        const TextSettings(textScaleFactor: 1.25),
      );
      expect(ThemeProfile.adhdFriendly.effectsMode, EffectsMode.disabled);
      expect(
        ThemeProfile.adhdFriendly.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.highSaturation),
      );
    });

    test('is a value type with a readable toString', () {
      expect(
        ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe),
        ThemeProfile.seizureSafe,
      );
      expect(
        ThemeProfile.seizureSafe.hashCode,
        ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe).hashCode,
      );
      expect(ThemeProfile.seizureSafe, isNot(ThemeProfile.none));
      expect(ThemeProfile.seizureSafe.toString(), contains('seizureSafe'));
    });
  });
}
