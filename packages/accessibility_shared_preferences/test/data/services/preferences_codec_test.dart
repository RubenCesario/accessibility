import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_codec.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';

/// What a 1.x install looks like after the user touched nothing but the
/// first-launch flag: every setting at its stored default and sentinel.
const untouchedOneX = <String, Object?>{
  PreferencesKeys.legacyFirstTimeOpened: false,
  PreferencesKeys.themeMode: 'system',
  PreferencesKeys.legacyEffectsAllowed: true,
  PreferencesKeys.textScaleFactor: 1.0,
  PreferencesKeys.lineHeight: -1.0,
  PreferencesKeys.letterSpacing: -1.0,
  PreferencesKeys.wordSpacing: -1.0,
  PreferencesKeys.isBold: false,
  PreferencesKeys.textAlign: 'none',
  PreferencesKeys.textColor: 0,
  PreferencesKeys.fontFamily: '',
  PreferencesKeys.backgroundColor: 0,
  PreferencesKeys.colorProfile: 'normal',
  PreferencesKeys.legacyThemeProfile: 'none',
};

void main() {
  group('settingsFromPreferences', () {
    test('returns null when no settings key is present', () {
      expect(settingsFromPreferences(const {}), isNull);
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.legacyFirstTimeOpened: false,
          PreferencesKeys.legacyThemeProfile: 'seizureSafe',
          'someone_elses_key': 1,
        }),
        isNull,
      );
    });

    test('maps the 1.x defaults and sentinels, with the legacy boolean as '
        'enabled effects', () {
      expect(
        settingsFromPreferences(untouchedOneX),
        const AccessibilitySettings(effectsMode: EffectsMode.enabled),
      );
    });

    test('maps every 1.x value', () {
      final settings = settingsFromPreferences(const {
        PreferencesKeys.themeMode: 'dark',
        PreferencesKeys.legacyEffectsAllowed: false,
        PreferencesKeys.textScaleFactor: 1.5,
        PreferencesKeys.lineHeight: 1.8,
        PreferencesKeys.letterSpacing: 0.5,
        PreferencesKeys.wordSpacing: 2.0,
        PreferencesKeys.isBold: true,
        PreferencesKeys.textAlign: 'justify',
        PreferencesKeys.textColor: 0xFF112233,
        PreferencesKeys.fontFamily: 'Andika',
        PreferencesKeys.backgroundColor: 0xFFFFFFFF,
        PreferencesKeys.colorProfile: 'monochrome',
      });
      expect(
        settings,
        const AccessibilitySettings(
          themeMode: AccessibilityThemeMode.dark,
          effectsMode: EffectsMode.disabled,
          textSettings: TextSettings(
            textScaleFactor: 1.5,
            lineHeight: 1.8,
            letterSpacing: 0.5,
            wordSpacing: 2,
            isBold: true,
            textAlign: TextAlignMode.justify,
            color: 0xFF112233,
            fontFamily: 'Andika',
          ),
          colorSettings: ColorSettings(
            backgroundColor: 0xFFFFFFFF,
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
    });

    test('maps the 1.x effects boolean when effectsMode is absent', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.legacyEffectsAllowed: true,
        })?.effectsMode,
        EffectsMode.enabled,
      );
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.legacyEffectsAllowed: false,
        })?.effectsMode,
        EffectsMode.disabled,
      );
    });

    test('prefers effectsMode over the 1.x boolean', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.effectsMode: 'system',
          PreferencesKeys.legacyEffectsAllowed: false,
        })?.effectsMode,
        EffectsMode.system,
      );
    });

    test('falls back to system effects when neither key is present', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.themeMode: 'light',
        })?.effectsMode,
        EffectsMode.system,
      );
    });

    test('accepts integers where doubles are expected', () {
      final settings = settingsFromPreferences(const {
        PreferencesKeys.textScaleFactor: 2,
        PreferencesKeys.lineHeight: 2,
      });
      expect(settings?.textSettings.textScaleFactor, 2.0);
      expect(settings?.textSettings.lineHeight, 2.0);
    });

    test('falls back to the defaults on unknown names and wrong types', () {
      final settings = settingsFromPreferences(const {
        PreferencesKeys.themeMode: 'sepia',
        PreferencesKeys.effectsMode: 42,
        PreferencesKeys.textScaleFactor: 'big',
        PreferencesKeys.lineHeight: true,
        PreferencesKeys.isBold: 'yes',
        PreferencesKeys.textAlign: 'diagonal',
        PreferencesKeys.textColor: 'red',
        PreferencesKeys.fontFamily: 7,
        PreferencesKeys.backgroundColor: 1.5,
        PreferencesKeys.colorProfile: 'vivid',
      });
      expect(settings, AccessibilitySettings.defaults);
    });

    test('effectsMode of the wrong type ignores the 1.x boolean', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.effectsMode: 42,
          PreferencesKeys.legacyEffectsAllowed: false,
        })?.effectsMode,
        EffectsMode.system,
      );
    });
  });

  group('preferencesFromSettings', () {
    test('writes every field and removes the unset ones', () {
      expect(preferencesFromSettings(AccessibilitySettings.defaults), const {
        PreferencesKeys.themeMode: 'system',
        PreferencesKeys.effectsMode: 'system',
        PreferencesKeys.textScaleFactor: 1.0,
        PreferencesKeys.lineHeight: null,
        PreferencesKeys.letterSpacing: null,
        PreferencesKeys.wordSpacing: null,
        PreferencesKeys.isBold: false,
        PreferencesKeys.textAlign: 'none',
        PreferencesKeys.textColor: null,
        PreferencesKeys.fontFamily: null,
        PreferencesKeys.backgroundColor: null,
        PreferencesKeys.colorProfile: 'normal',
      });
    });

    test('round-trips a fully set value', () {
      const settings = AccessibilitySettingsSamples.everythingSet;
      final values = preferencesFromSettings(settings);
      expect(values.values, everyElement(isNotNull));
      expect(settingsFromPreferences(values), settings);
    });

    test('never writes the legacy keys', () {
      final keys = preferencesFromSettings(
        AccessibilitySettingsSamples.everythingSet,
      ).keys;
      expect(keys, isNot(contains(PreferencesKeys.legacyEffectsAllowed)));
      expect(keys, isNot(contains(PreferencesKeys.legacyThemeProfile)));
      expect(keys, isNot(contains(PreferencesKeys.legacyFirstTimeOpened)));
      expect(PreferencesKeys.all, containsAll(keys));
    });
  });
}
