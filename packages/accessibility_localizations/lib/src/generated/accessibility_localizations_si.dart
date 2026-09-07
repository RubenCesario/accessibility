// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AccessibilityLocalizationsSi extends AccessibilityLocalizations {
  AccessibilityLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get accessibility => 'ප්‍රවේශ්‍යතාව';

  @override
  String get accessibilitySettings => 'ප්‍රවේශ්‍යතා සැකසීම්';

  @override
  String get adjustBackgroundColors => 'පසුබිම් වර්ණ සකසන්න';

  @override
  String get adjustTextColors => 'පෙළ වර්ණ සකසන්න';

  @override
  String get alignCenter => 'මධ්‍යයට පෙළ ගස්වන්න';

  @override
  String get alignLeft => 'වමට පෙළ ගස්වන්න';

  @override
  String get alignRight => 'දකුණට පෙළ ගස්වන්න';

  @override
  String get textAlignment => 'පෙළ පෙළගැස්ම';

  @override
  String get boldText => 'තද පෙළ';

  @override
  String get changeBoldText => 'තද පෙළ වෙනස් කරන්න';

  @override
  String get changePagesBackgroundColor => 'පිටුවල පසුබිම් වර්ණය වෙනස් කරන්න: ';

  @override
  String get changeTextColor => 'පෙළ වර්ණය වෙනස් කරන්න: ';

  @override
  String get changeTextColorShade => 'වර්ණයේ ශේඩ් වෙනස් කරන්න: ';

  @override
  String get colorAdjustment => 'වර්ණ ගැලපීම';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'සාමාන්‍ය',
      'lowSaturation': 'අඩු සංතෘප්තිය',
      'normal': 'සාමාන්‍ය',
      'highSaturation': 'ඉහළ සංතෘප්තිය',
      'monochrome': 'එකවර්ණ',
      'highContrast': 'ඉහළ අනුපාතය',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'වර්තමාන වර්ණ පැතිකඩ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'වර්ණය හඳුනාගත නොහැක',
      'cF44336': 'රතු',
      'cE91E63': 'රෝස',
      'c9C27B0': 'දම් පාට',
      'c673AB7': 'ගැඹුරු දම් පාට',
      'c3F51B5': 'ඉන්ඩිගෝ',
      'c2196F3': 'නිල්',
      'c03A9F4': 'ළා නිල්',
      'c00BCD4': 'සයන්',
      'c009688': 'ටීල්',
      'c4CAF50': 'කොළ',
      'c8BC34A': 'ළා කොළ',
      'cCDDC39': 'දෙහි',
      'cFFEB3B': 'කහ',
      'cFFC107': 'ඇම්බර්',
      'cFF9800': 'තැම්බිලි',
      'cFF5722': 'ගැඹුරු තැම්බිලි',
      'c795548': 'දුඹුරු',
      'c9E9E9E': 'අළු',
      'c607D8B': 'නිල්-අළු',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'වචන අතර පරතරය අඩු කරන්න';

  @override
  String get decrementLetterSpacing => 'අකුරු අතර පරතරය අඩු කරන්න';

  @override
  String get decrementLineHeight => 'පේළි උස අඩු කරන්න';

  @override
  String get decrementTextScaleFactor => 'පෙළ පරිමාණ සාධකය අඩු කරන්න';

  @override
  String get effects => 'බලපෑම්';

  @override
  String get expandText => 'පෙළ විස්තීරණය කරන්න';

  @override
  String get fontSize => 'අකුරු ප්‍රමාණය';

  @override
  String get increaseOrDecreaseWordSpacing => 'වචන අතර පරතරය වැඩි හෝ අඩු කරන්න';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'අකුරු අතර පරතරය වැඩි හෝ අඩු කරන්න';

  @override
  String get increaseOrDecreaseLineHeight => 'පේළි උස වැඩි හෝ අඩු කරන්න';

  @override
  String get increaseOrDecreaseTextSize => 'පෙළ ප්‍රමාණය වැඩි හෝ අඩු කරන්න';

  @override
  String get incrementWordSpacing => 'වචන අතර පරතරය වැඩි කරන්න';

  @override
  String get incrementLetterSpacing => 'අකුරු අතර පරතරය වැඩි කරන්න';

  @override
  String get incrementLineHeight => 'පේළි උස වැඩි කරන්න';

  @override
  String get incrementTextScaleFactor => 'පෙළ පරිමාණ සාධකය වැඩි කරන්න';

  @override
  String get lessInfo => 'තොරතුරු සඟවන්න';

  @override
  String get letterSpacing => 'අකුරු අතර පරතරය';

  @override
  String get lineHeight => 'පේළි උස';

  @override
  String get moreInfo => 'තොරතුරු පෙන්වන්න';

  @override
  String get readLess => 'අඩුවෙන් කියවන්න';

  @override
  String get readMore => 'වැඩියෙන් කියවන්න';

  @override
  String get reduceEffects => 'තිරයට ඇති බලපෑම් අඩු කරන්න';

  @override
  String get reduceText => 'පෙළ අඩු කරන්න';

  @override
  String get restoreSettings => 'සැකසීම් නැවත සකසන්න';

  @override
  String get restoreMainColor => 'ප්‍රධාන වර්ණය නැවත සකසන්න';

  @override
  String get returnToMainColors => 'ප්‍රධාන වර්ණ වලට නැවත යන්න';

  @override
  String get settings => 'සැකසීම්';

  @override
  String get sizeAndTextDisplay => 'ප්‍රමාණය සහ පෙළ ප්‍රදර්ශනය';

  @override
  String get sliderWordSpacing => 'වචන අතර පරතරය ස්ලයිඩරය';

  @override
  String get sliderLetterSpacing => 'අකුරු අතර පරතරය ස්ලයිඩරය';

  @override
  String get sliderLineHeight => 'පේළි උස ස්ලයිඩරය';

  @override
  String get themeMode => 'තේමාව';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'තේමා පැතිකඩ හඳුනාගත නොහැක',
      'seizureSafe': 'අපස්මාරයෙන් ආරක්ෂිත',
      'visionImpaired': 'දෘෂ්ටි ආබාධිත',
      'adhdFriendly': 'ADHD හිතකාමී',
      'none': 'පෙරනිමි පැතිකඩ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'අපස්මාරයෙන් ආරක්ෂිත පැතිකඩ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'ප්‍රතිබිම්බ ඉවත් කර වර්ණ අඩු කරන්න';

  @override
  String get themeProfileSeizureSafeDescription =>
      'මෙම පැතිකඩ මගින් අපස්මාර රෝගය ඇති සහ අපස්මාර අවදානමක් ඇති පරිශීලකයින්ට විද්යුත් සංචලන සහ අවදානම් සහිත වර්ණ සංයෝග මගින් ඇතිවන අපස්මාර අවදානම ඉවත් කරමින් ආරක්ෂිතව පිරික්සීමට ඉඩ සලසයි.';

  @override
  String get themeProfileVisionImpairedTitle => 'දෘෂ්ටි ආබාධිත පැතිකඩ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'යෙදුමේ දෘශ්‍යමානතාවය වැඩි දියුණු කරන්න';

  @override
  String get themeProfileVisionImpairedDescription =>
      'මෙම පැතිකඩ යෙදුම දෘෂ්ටි ආබාධ, ටනල් දෘෂ්ටිය, කැටරැක්ට්, ග්ලූකෝමා සහ තවත් බොහෝ දෘෂ්ටි ආබාධ සහිත පුද්ගලයින්ට ප්‍රවේශ විය හැකි පරිදි යෙදුම අනුවර්තනය කරයි.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-හිතකාමී පැතිකඩ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'වැඩි අවධානයක් සහ අඩු විසිරීමක්';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'මෙම පැතිකඩ මගින් ADHD සහ ස්නායු සංවර්ධන ආබාධ සහිත පුද්ගලයින්ට යෙදුමේ අත්‍යවශ්‍ය කොටස් වලට පහසුවෙන් සංචාලනය කිරීමට, කියවීමට සහ අවධානය යොමු කිරීමට උපකාර වන පරිදි විසිරීම් සැලකිය යුතු ලෙස අඩු කරයි.';

  @override
  String get theSettingsHaveBeenReset => 'සැකසීම් නැවත සකසා ඇත.';

  @override
  String get toggleDarkMode => 'අඳුරු මාදිලිය මාරු කරන්න';

  @override
  String get toggleEffectsMode => 'බලපෑම් මාදිලිය මාරු කරන්න';

  @override
  String get toggleFontWeight => 'අකුරු බර මාරු කරන්න';

  @override
  String get toggleThemeProfile => 'තේමා පැතිකඩ මාරු කරන්න';

  @override
  String get wordSpacing => 'වචන අතර පරතරය';

  @override
  String get accessibleFont => 'ප්‍රවේශ විය හැකි අකුරු';

  @override
  String get accessibleFontSubtitle =>
      'වඩා හොඳ කියවීමක් සඳහා ප්‍රවේශ විය හැකි අකුරු භාවිතා කරන්න';

  @override
  String get accessibleFontEnabled => 'ප්‍රවේශ විය හැකි අකුරු සක්‍රීයයි';

  @override
  String get accessibleFontDisabled => 'ප්‍රවේශ විය හැකි අකුරු අක්‍රීයයි';

  @override
  String get toggleAccessibleFont => 'ප්‍රවේශ විය හැකි අකුරු මාරු කරන්න';

  @override
  String get settingsLoading => 'ප්‍රවේශ්‍යතා සැකසීම් පූරණය වෙමින්…';

  @override
  String get settingsLoadFailed => 'ප්‍රවේශ්‍යතා සැකසීම් පූරණය කළ නොහැකි විය.';

  @override
  String get retry => 'නැවත උත්සාහ කරන්න';
}
