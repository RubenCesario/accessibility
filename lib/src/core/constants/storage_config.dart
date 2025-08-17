/// Defines all the keys used to store data in the app.
class LocalStorageKeys {
  /// Creates an instance of [LocalStorageKeys].
  ///
  /// This constructor is private since [LocalStorageKeys] only contains
  /// static constants and should not be instantiated.
  const LocalStorageKeys._();

  /// The key used to store the theme mode in the app.
  /// * True => Dark theme
  /// * False => Light theme
  static const themeMode = 'isDarkMode';

  /// The key used to store the effects allowed in the app.
  /// * True => Remove animations and effects in the app.
  /// * False => Use animations and effects in the app.
  static const effectsAllowed = 'hasNoEffects';

  /// The key used to invoke all the functions that
  /// needs to be run only the first time the user
  /// use the app.
  /// * True => First time.
  /// * False => Other times.
  static const isFirstTimeOpened = 'isFirstTimeOpened';

  /// The key used to store the word spacing text settings
  /// of the app.
  ///
  /// Used for accessibility compliance.
  static const textAccessibilitySettingWordSpacing =
      'textAccessibilitySettingWordSpacing';

  /// The key used to store the line height text settings
  /// of the app.
  ///
  /// Used for accessibility compliance.
  static const textAccessibilitySettingLineHeight =
      'textAccessibilitySettingLineHeight';

  /// The key used to store the letter spacing text settings
  /// of the app.
  ///
  /// Used for accessibility compliance.
  static const textAccessibilitySettingLetterSpacing =
      'textAccessibilitySettingLetterSpacing';

  /// The key used to store the text scale factor settings
  /// of the app.
  ///
  /// Used for accessibility compliance.
  static const textAccessibilitySettingScaleFactor =
      'textAccessibilitySettingScaleFactor';

  /// The key used to store the text font weight settings
  /// of the app.
  ///
  /// Used for accessibility compliance.
  static const textAccessibilitySettingFontWeight =
      'textAccessibilitySettingFontWeight';

  /// The key used to store the text alignment settings
  /// of the app.
  ///
  /// Used for accessibility compliance.
  static const textAccessibilitySettingAlignment =
      'textAccessibilitySettingAlignment';

  /// The key used to store the theme profile setting
  /// of the app.
  static const themeProfileSetting = 'themeProfileSetting';

  /// The key used to store the color profile setting
  /// of the app.
  static const colorProfileSetting = 'colorProfileSetting';

  /// The key used to store the text color setting
  /// of the app.
  static const textColorSetting = 'textColorSetting';

  /// The key used to store the pages background color setting
  /// of the app.
  static const pagesBackgroundColorSetting = 'pagesBackgroundColorSetting';
}

/// Defines all the default values used in the app.
class LocalStorageDefaultValues {
  /// Creates an instance of [LocalStorageDefaultValues].
  ///
  /// This constructor is private since [LocalStorageDefaultValues]
  /// only contains static constants and should not be instantiated.
  const LocalStorageDefaultValues._();

  /// The default value of the theme mode.
  static const themeModeDefault = 'system';

  /// The default value of the effects mode.
  static const effectsAllowedDefault = true;

  /// The default value of the text font weight choice mode.
  static const textFontWeightModeDefault = false;

  /// The default value of the line height.
  static const lineHeightDefault = -1.0;

  /// The default value of the word spacing.
  static const wordSpacingDefault = -1.0;

  /// The default value of the letter spacing.
  static const letterSpacingDefault = -1.0;

  /// The default value of the text scale factor.
  static const textScaleFactorDefault = 1.0;

  /// The default value of the text alignment.
  static const textAlignmentDefault = 'none';

  /// The default value of the theme profile.
  static const themeProfileDefault = 'none';

  /// The default value of the color profile.
  static const colorProfileDefault = 'normal';

  /// The default value of the color not selected.
  static const noColorSelected = 0;
}
