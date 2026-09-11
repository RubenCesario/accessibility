// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AccessibilityLocalizationsPa extends AccessibilityLocalizations {
  AccessibilityLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get accessibility => 'ਪਹੁੰਚਯੋਗਤਾ';

  @override
  String get accessibilitySettings => 'ਪਹੁੰਚਯੋਗਤਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get adjustBackgroundColors => 'ਪਿਛੋਕੜ ਦੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ';

  @override
  String get adjustTextColors => 'ਟੈਕਸਟ ਦੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ';

  @override
  String get alignCenter => 'ਵਿਚਕਾਰ ਸਜਾਓ';

  @override
  String get alignLeft => 'ਖੱਬੇ ਸਜਾਓ';

  @override
  String get alignRight => 'ਸੱਜੇ ਸਜਾਓ';

  @override
  String get textAlignment => 'ਟੈਕਸਟ ਅਲਾਈਨਮੈਂਟ';

  @override
  String get boldText => 'ਮੋਟਾ ਟੈਕਸਟ';

  @override
  String get changeBoldText => 'ਮੋਟੇ ਟੈਕਸਟ ਨੂੰ ਬਦਲੋ';

  @override
  String get changePagesBackgroundColor => 'ਪੰਨਿਆਂ ਦੇ ਪਿਛੋਕੜ ਦੇ ਰੰਗ ਨੂੰ ਬਦਲੋ: ';

  @override
  String get changeTextColor => 'ਟੈਕਸਟ ਦੇ ਰੰਗ ਨੂੰ ਬਦਲੋ: ';

  @override
  String get changeTextColorShade => 'ਰੰਗ ਦੀ ਛਾਂ ਨੂੰ ਬਦਲੋ: ';

  @override
  String get colorAdjustment => 'ਰੰਗ ਵਿਵਸਥਾ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ਸਧਾਰਨ',
      'lowSaturation': 'ਘੱਟ ਸੰਤ੍ਰਿਪਤੀ',
      'normal': 'ਸਧਾਰਨ',
      'highSaturation': 'ਉੱਚ ਸੰਤ੍ਰਿਪਤੀ',
      'monochrome': 'ਇਕਰੰਗਾ',
      'highContrast': 'ਉੱਚ ਕੰਟਰਾਸਟ',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ਮੌਜੂਦਾ ਰੰਗ ਪ੍ਰੋਫਾਈਲ ਹੈ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'ਰੰਗ ਪਛਾਣਿਆ ਨਹੀਂ',
      'cF44336': 'ਲਾਲ',
      'cE91E63': 'ਗੁਲਾਬੀ',
      'c9C27B0': 'ਬੈਂਗਣੀ',
      'c673AB7': 'ਗੂੜ੍ਹਾ ਬੈਂਗਣੀ',
      'c3F51B5': 'ਨੀਲਾ ਬੈਂਗਣੀ',
      'c2196F3': 'ਨੀਲਾ',
      'c03A9F4': 'ਹਲਕਾ ਨੀਲਾ',
      'c00BCD4': 'ਸਾਇਨ',
      'c009688': 'ਟੀਲ',
      'c4CAF50': 'ਹਰਾ',
      'c8BC34A': 'ਹਲਕਾ ਹਰਾ',
      'cCDDC39': 'ਲਾਈਮ',
      'cFFEB3B': 'ਪੀਲਾ',
      'cFFC107': 'ਅੰਬਰ',
      'cFF9800': 'ਸੰਤਰੀ',
      'cFF5722': 'ਗੂੜ੍ਹਾ ਸੰਤਰੀ',
      'c795548': 'ਭੂਰਾ',
      'c9E9E9E': 'ਸਲੇਟੀ',
      'c607D8B': 'ਨੀਲਾ ਸਲੇਟੀ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਘਟਾਓ';

  @override
  String get decrementLetterSpacing => 'ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਘਟਾਓ';

  @override
  String get decrementLineHeight => 'ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਘਟਾਓ';

  @override
  String get decrementTextScaleFactor => 'ਟੈਕਸਟ ਸਕੇਲ ਫੈਕਟਰ ਨੂੰ ਘਟਾਓ';

  @override
  String get effects => 'ਅਸਰ';

  @override
  String get expandText => 'ਟੈਕਸਟ ਨੂੰ ਵਿਸਤਾਰ ਕਰੋ';

  @override
  String get fontSize => 'ਫੌਂਟ ਆਕਾਰ';

  @override
  String get increaseOrDecreaseWordSpacing => 'ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increaseOrDecreaseLetterSpacing => 'ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increaseOrDecreaseLineHeight => 'ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get increaseOrDecreaseTextSize => 'ਟੈਕਸਟ ਆਕਾਰ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ';

  @override
  String get incrementWordSpacing => 'ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਵਧਾਓ';

  @override
  String get incrementLetterSpacing => 'ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਵਧਾਓ';

  @override
  String get incrementLineHeight => 'ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਵਧਾਓ';

  @override
  String get incrementTextScaleFactor => 'ਟੈਕਸਟ ਸਕੇਲ ਫੈਕਟਰ ਨੂੰ ਵਧਾਓ';

  @override
  String get lessInfo => 'ਜਾਣਕਾਰੀ ਲੁਕਾਓ';

  @override
  String get letterSpacing => 'ਅੱਖਰ ਦੂਰੀ';

  @override
  String get lineHeight => 'ਲਾਈਨ ਉਚਾਈ';

  @override
  String get moreInfo => 'ਜਾਣਕਾਰੀ ਦਿਖਾਓ';

  @override
  String get readLess => 'ਘੱਟ ਪੜ੍ਹੋ';

  @override
  String get readMore => 'ਵੱਧ ਪੜ੍ਹੋ';

  @override
  String get reduceEffects => 'ਅਸਰਾਂ ਨੂੰ ਘਟਾਓ';

  @override
  String get reduceText => 'ਟੈਕਸਟ ਨੂੰ ਘਟਾਓ';

  @override
  String get restoreSettings => 'ਸੈਟਿੰਗਾਂ ਨੂੰ ਮੁੜ ਸਥਾਪਤ ਕਰੋ';

  @override
  String get restoreMainColor => 'ਮੁੱਖ ਰੰਗ ਨੂੰ ਮੁੜ ਸਥਾਪਤ ਕਰੋ';

  @override
  String get returnToMainColors => 'ਮੁੱਖ ਰੰਗਾਂ ਨੂੰ ਮੁੜ ਪਰਤੋ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get sizeAndTextDisplay => 'ਆਕਾਰ ਅਤੇ ਟੈਕਸਟ ਪ੍ਰਦਰਸ਼ਨ';

  @override
  String get sliderWordSpacing => 'ਸ਼ਬਦ ਦੂਰੀ ਸਲਾਈਡਰ';

  @override
  String get sliderLetterSpacing => 'ਅੱਖਰ ਦੂਰੀ ਸਲਾਈਡਰ';

  @override
  String get sliderLineHeight => 'ਲਾਈਨ ਉਚਾਈ ਸਲਾਈਡਰ';

  @override
  String get themeMode => 'ਥੀਮ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ਥੀਮ ਪ੍ਰੋਫਾਈਲ ਨਹੀਂ ਪਛਾਣਿਆ ਗਿਆ',
      'seizureSafe': 'ਦੌਰਾ ਸੁਰੱਖਿਅਤ',
      'visionImpaired': 'ਦ੍ਰਿਸ਼ਟੀ ਪ੍ਰਭਾਵਿਤ',
      'adhdFriendly': 'ਏਡੀਏਚਡੀ ਦੋਸਤਾਨਾ',
      'none': 'ਮੂਲ ਪ੍ਰੋਫਾਈਲ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'ਦੌਰਾ ਸੁਰੱਖਿਅਤ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get themeProfileSeizureSafeSubtitle => 'ਪ੍ਰਤਿਬਿੰਬ ਹਟਾਓ ਅਤੇ ਰੰਗ ਘਟਾਓ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ਇਹ ਪ੍ਰੋਫਾਈਲ ਉਹਨਾਂ ਵਰਤੋਂਕਾਰਾਂ ਨੂੰ ਜਿਨ੍ਹਾਂ ਨੂੰ ਮਿਰਗੀ ਹੈ ਅਤੇ ਦੌਰੇ ਪੈਣ ਦਾ ਖਤਰਾ ਹੈ, ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ ਬ੍ਰਾਉਜ਼ ਕਰਨ ਦੀ ਸਹੂਲਤ ਦਿੰਦੀ ਹੈ, ਚਮਕਦਾਰ ਐਨੀਮੇਸ਼ਨਾਂ ਅਤੇ ਜੋਖਮ ਭਰੇ ਰੰਗ ਸੰਯੋਜਨਾਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਦੌਰਿਆਂ ਦੇ ਜੋਖਮ ਨੂੰ ਖਤਮ ਕਰਕੇ.';

  @override
  String get themeProfileVisionImpairedTitle => 'ਦ੍ਰਿਸ਼ਟੀ ਪ੍ਰਭਾਵਿਤ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਦਿਖਾਈ ਵਿੱਚ ਸੁਧਾਰ ਕਰੋ';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ਇਹ ਪ੍ਰੋਫਾਈਲ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਜ਼ਿਆਦਾਤਰ ਦ੍ਰਿਸ਼ਟੀ ਵਿਕਾਰਾਂ ਲਈ ਪਹੁੰਚਯੋਗ ਬਣਾਉਂਦੀ ਹੈ, ਜਿਵੇਂ ਕਿ ਦ੍ਰਿਸ਼ਟੀ ਵਿਕਾਰ, ਟਨਲ ਦ੍ਰਿਸ਼ਟੀ, ਮੋਤੀਆਬਿੰਦ, ਗਲੂਕੋਮਾ ਅਤੇ ਹੋਰ.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ਏਡੀਏਚਡੀ ਦੋਸਤਾਨਾ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'ਵਧੇਰੇ ਇਕਾਗਰਤਾ ਅਤੇ ਘੱਟ ਵਿਘਨ';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ਇਹ ਪ੍ਰੋਫਾਈਲ ਵਿਘਨਾਂ ਨੂੰ ਮਹੱਤਵਪੂਰਨ ਰੂਪ ਵਿੱਚ ਘਟਾਉਂਦੀ ਹੈ, ਏਡੀਏਚਡੀ ਅਤੇ ਨਿਉਰੋਡਿਵੈਲਪਮੈਂਟਲ ਵਿਕਾਰਾਂ ਵਾਲੇ ਲੋਕਾਂ ਦੀ ਨੈਵੀਗੇਟ, ਪੜ੍ਹਨ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਜ਼ਰੂਰੀ ਤੱਤਾਂ ਤੇ ਧਿਆਨ ਕੇਂਦਰਿਤ ਕਰਨ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰਦੀ ਹੈ.';

  @override
  String get theSettingsHaveBeenReset => 'ਸੈਟਿੰਗਾਂ ਨੂੰ ਰੀਸੈੱਟ ਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ.';

  @override
  String get toggleDarkMode => 'ਡਾਰਕ ਮੋਡ ਟੌਗਲ ਕਰੋ';

  @override
  String get toggleEffectsMode => 'ਪ੍ਰਭਾਵ ਮੋਡ ਟੌਗਲ ਕਰੋ';

  @override
  String get toggleFontWeight => 'ਫੌਂਟ ਭਾਰ ਟੌਗਲ ਕਰੋ';

  @override
  String get toggleThemeProfile => 'ਥੀਮ ਪ੍ਰੋਫਾਈਲ ਟੌਗਲ ਕਰੋ';

  @override
  String get wordSpacing => 'ਸ਼ਬਦ ਦੂਰੀ';

  @override
  String get accessibleFont => 'ਪਹੁੰਚਯੋਗ ਫੌਂਟ';

  @override
  String get accessibleFontSubtitle => 'ਬਿਹਤਰ ਪੜ੍ਹਨਯੋਗਤਾ ਲਈ ਪਹੁੰਚਯੋਗ ਫੌਂਟ ਵਰਤੋ';

  @override
  String get accessibleFontEnabled => 'ਪਹੁੰਚਯੋਗ ਫੌਂਟ ਚਾਲੂ';

  @override
  String get accessibleFontDisabled => 'ਪਹੁੰਚਯੋਗ ਫੌਂਟ ਬੰਦ';

  @override
  String get toggleAccessibleFont => 'ਪਹੁੰਚਯੋਗ ਫੌਂਟ ਟੌਗਲ ਕਰੋ';

  @override
  String get settingsLoading => 'ਪਹੁੰਚਯੋਗਤਾ ਸੈਟਿੰਗਾਂ ਲੋਡ ਹੋ ਰਹੀਆਂ ਹਨ…';

  @override
  String get settingsLoadFailed => 'ਪਹੁੰਚਯੋਗਤਾ ਸੈਟਿੰਗਾਂ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀਆਂ.';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get themeModeSystem => 'ਸਿਸਟਮ';

  @override
  String get themeModeLight => 'ਲਾਈਟ';

  @override
  String get themeModeDark => 'ਡਾਰਕ';

  @override
  String get effectsModeSystem => 'ਸਿਸਟਮ';

  @override
  String get effectsModeEnabled => 'ਚਾਲੂ';

  @override
  String get effectsModeDisabled => 'ਬੰਦ';
}
