/// The `shared_preferences` keys, unchanged from `accessibility` 1.x so
/// that stored settings survive the upgrade.
///
/// The names of the two legacy keys are misleading: `isDarkMode` holds the
/// name of the theme mode and `hasNoEffects` holds whether effects are
/// allowed, both exactly as 1.x wrote them.
abstract final class PreferencesKeys {
  /// The theme mode name (`system`, `light`, `dark`).
  static const themeMode = 'isDarkMode';

  /// The effects mode name (`system`, `enabled`, `disabled`). New in 2.0.
  static const effectsMode = 'effectsMode';

  /// The 1.x boolean: `true` when effects were allowed. Read only.
  static const legacyEffectsAllowed = 'hasNoEffects';

  /// The text scale factor, a double.
  static const textScaleFactor = 'textAccessibilitySettingScaleFactor';

  /// The line height, a double; `-1.0` meant unset in 1.x.
  static const lineHeight = 'textAccessibilitySettingLineHeight';

  /// The letter spacing, a double; `-1.0` meant unset in 1.x.
  static const letterSpacing = 'textAccessibilitySettingLetterSpacing';

  /// The word spacing, a double; `-1.0` meant unset in 1.x.
  static const wordSpacing = 'textAccessibilitySettingWordSpacing';

  /// Whether text is bold, a boolean.
  static const isBold = 'textAccessibilitySettingFontWeight';

  /// The text alignment name; `none` means no override.
  static const textAlign = 'textAccessibilitySettingAlignment';

  /// The text colour as an ARGB integer; `0` meant unset in 1.x.
  static const textColor = 'textColorSetting';

  /// The font family; `''` meant unset in 1.x.
  static const fontFamily = 'textAccessibilitySettingFontFamily';

  /// The page background colour as an ARGB integer; `0` meant unset in 1.x.
  static const backgroundColor = 'pagesBackgroundColorSetting';

  /// The colour profile name.
  static const colorProfile = 'colorProfileSetting';

  /// A 1.x key that is never read: the profile is derived from the values.
  static const legacyThemeProfile = 'themeProfileSetting';

  /// A 1.x key that is never read: a first-launch flag.
  static const legacyFirstTimeOpened = 'isFirstTimeOpened';

  /// The keys that carry settings. Reading returns `null` when none is
  /// present.
  static const settings = <String>{
    themeMode,
    effectsMode,
    legacyEffectsAllowed,
    textScaleFactor,
    lineHeight,
    letterSpacing,
    wordSpacing,
    isBold,
    textAlign,
    textColor,
    fontFamily,
    backgroundColor,
    colorProfile,
  };

  /// Every key this package or 1.x ever wrote; all removed by `clear()`.
  static const all = <String>{
    ...settings,
    legacyThemeProfile,
    legacyFirstTimeOpened,
  };
}
