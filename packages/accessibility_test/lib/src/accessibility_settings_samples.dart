import 'package:accessibility/accessibility.dart';

/// Ready-made [AccessibilitySettings] values for tests.
abstract final class AccessibilitySettingsSamples {
  /// The seizure-safe preset, equal to
  /// `AccessibilitySettings.defaults.withThemeProfile(
  /// ThemeProfileLevel.seizureSafe)`.
  static const seizureSafe = AccessibilitySettings(
    effectsMode: EffectsMode.disabled,
    colorSettings: ColorSettings(colorProfile: ColorProfileLevel.lowSaturation),
  );

  /// The vision-impaired preset, equal to
  /// `AccessibilitySettings.defaults.withThemeProfile(
  /// ThemeProfileLevel.visionImpaired)`.
  static const visionImpaired = AccessibilitySettings(
    textSettings: TextSettings(isBold: true, textScaleFactor: 2),
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// The ADHD-friendly preset, equal to
  /// `AccessibilitySettings.defaults.withThemeProfile(
  /// ThemeProfileLevel.adhdFriendly)`.
  static const adhdFriendly = AccessibilitySettings(
    effectsMode: EffectsMode.disabled,
    textSettings: TextSettings(textScaleFactor: 1.25),
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// Every nullable field non-null and every enum at a non-default value.
  static const everythingSet = AccessibilitySettings(
    themeMode: AccessibilityThemeMode.dark,
    effectsMode: EffectsMode.disabled,
    textSettings: TextSettings(
      lineHeight: 1.5,
      wordSpacing: 2,
      letterSpacing: 0.5,
      textScaleFactor: 1.5,
      isBold: true,
      textAlign: TextAlignMode.justify,
      color: 0xFF112233,
      fontFamily: 'Andika',
    ),
    colorSettings: ColorSettings(
      backgroundColor: 0xFFFFFFF0,
      colorProfile: ColorProfileLevel.monochrome,
    ),
  );
}
