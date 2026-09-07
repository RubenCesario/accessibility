import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibilitySettings', () {
    test('defaults follow the system and override nothing', () {
      const settings = AccessibilitySettings.defaults;
      expect(settings.themeMode, AccessibilityThemeMode.system);
      expect(settings.effectsMode, EffectsMode.system);
      expect(settings.textSettings, TextSettings.defaults);
      expect(settings.colorSettings, ColorSettings.defaults);
      expect(settings, AccessibilitySettings.defaults);
      expect(settings.isDefault, isTrue);
    });

    test('is a value type with a readable toString', () {
      const a = AccessibilitySettings(themeMode: AccessibilityThemeMode.dark);
      const b = AccessibilitySettings(themeMode: AccessibilityThemeMode.dark);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(AccessibilitySettings.defaults));
      expect(a.isDefault, isFalse);
      expect(a.toString(), contains('dark'));
    });

    test('copyWith keeps and replaces', () {
      const original = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.light,
        effectsMode: EffectsMode.enabled,
        textSettings: TextSettings(isBold: true),
        colorSettings: ColorSettings(backgroundColor: 0xFF000000),
      );
      expect(original.copyWith(), original);
      final changed = original.copyWith(
        themeMode: AccessibilityThemeMode.dark,
        effectsMode: EffectsMode.disabled,
        textSettings: const TextSettings(textScaleFactor: 2),
        colorSettings: const ColorSettings(
          colorProfile: ColorProfileLevel.monochrome,
        ),
      );
      expect(changed.themeMode, AccessibilityThemeMode.dark);
      expect(changed.effectsMode, EffectsMode.disabled);
      expect(changed.textSettings, const TextSettings(textScaleFactor: 2));
      expect(
        changed.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.monochrome),
      );
    });

    test('withThemeProfile applies the preset and keeps the theme mode', () {
      const original = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
        textSettings: TextSettings(letterSpacing: 3),
      );
      for (final level in ThemeProfileLevel.values) {
        final applied = original.withThemeProfile(level);
        final profile = ThemeProfile.fromLevel(level);
        expect(applied.themeMode, AccessibilityThemeMode.dark);
        expect(applied.textSettings, profile.textSettings);
        expect(applied.colorSettings, profile.colorSettings);
        expect(applied.effectsMode, profile.effectsMode);
      }
    });

    test('matchingThemeProfile finds the applied preset or none', () {
      expect(
        AccessibilitySettings.defaults.matchingThemeProfile,
        ThemeProfileLevel.none,
      );
      for (final level in ThemeProfileLevel.values) {
        expect(
          AccessibilitySettings.defaults
              .withThemeProfile(level)
              .matchingThemeProfile,
          level,
        );
      }
      final customised = AccessibilitySettings.defaults
          .withThemeProfile(ThemeProfileLevel.visionImpaired)
          .copyWith(textSettings: const TextSettings(textScaleFactor: 3));
      expect(customised.matchingThemeProfile, ThemeProfileLevel.none);
      const darkDefaults = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
      );
      expect(darkDefaults.matchingThemeProfile, ThemeProfileLevel.none);
    });

    test('withNextColorProfile cycles through every level and wraps', () {
      var settings = AccessibilitySettings.defaults;
      final seen = <ColorProfileLevel>[];
      for (var i = 0; i < ColorProfileLevel.values.length; i++) {
        settings = settings.withNextColorProfile();
        seen.add(settings.colorSettings.colorProfile);
      }
      expect(seen, [
        ColorProfileLevel.lowSaturation,
        ColorProfileLevel.highSaturation,
        ColorProfileLevel.monochrome,
        ColorProfileLevel.highContrast,
        ColorProfileLevel.normal,
      ]);
    });
  });
}
