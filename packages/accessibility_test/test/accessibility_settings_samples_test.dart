import 'package:accessibility/accessibility.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibilitySettingsSamples', () {
    test('presets equal the core theme profiles', () {
      expect(
        AccessibilitySettingsSamples.seizureSafe,
        AccessibilitySettings.defaults.withThemeProfile(
          ThemeProfileLevel.seizureSafe,
        ),
      );
      expect(
        AccessibilitySettingsSamples.visionImpaired,
        AccessibilitySettings.defaults.withThemeProfile(
          ThemeProfileLevel.visionImpaired,
        ),
      );
      expect(
        AccessibilitySettingsSamples.adhdFriendly,
        AccessibilitySettings.defaults.withThemeProfile(
          ThemeProfileLevel.adhdFriendly,
        ),
      );
    });

    test('everythingSet has no default field', () {
      const sample = AccessibilitySettingsSamples.everythingSet;
      expect(sample.themeMode, isNot(AccessibilityThemeMode.system));
      expect(sample.effectsMode, isNot(EffectsMode.system));
      expect(sample.textSettings.lineHeight, isNotNull);
      expect(sample.textSettings.wordSpacing, isNotNull);
      expect(sample.textSettings.letterSpacing, isNotNull);
      expect(sample.textSettings.textScaleFactor, isNot(1.0));
      expect(sample.textSettings.isBold, isTrue);
      expect(sample.textSettings.textAlign, isNot(TextAlignMode.none));
      expect(sample.textSettings.color, isNotNull);
      expect(sample.textSettings.fontFamily, isNotNull);
      expect(sample.colorSettings.backgroundColor, isNotNull);
      expect(
        sample.colorSettings.colorProfile,
        isNot(ColorProfileLevel.normal),
      );
      expect(sample.matchingThemeProfile, ThemeProfileLevel.none);
    });
  });
}
