// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AccessibilityLocalizationsUg extends AccessibilityLocalizations {
  AccessibilityLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get accessibility => 'ئۇچۇرلۇق';

  @override
  String get accessibilitySettings => 'ئۇچۇرلۇق تەڭشەكلەر';

  @override
  String get adjustBackgroundColors => 'ئارقا كۆرۈنۈش رەڭلەرنى تەڭشەش';

  @override
  String get adjustTextColors => 'تېكىست رەڭلەرنى تەڭشەش';

  @override
  String get alignCenter => 'ئوتتۇرىغا تەڭشەش';

  @override
  String get alignLeft => 'سولغا تەڭشەش';

  @override
  String get alignRight => 'ئوڭغا تەڭشەش';

  @override
  String get textAlignment => 'تېكىست توغرىلىنىشى';

  @override
  String get boldText => 'توم تېكىست';

  @override
  String get changeBoldText => 'توم تېكىستنى ئۆزگەرتىش';

  @override
  String get changePagesBackgroundColor =>
      'بەتلەرنىڭ ئارقا كۆرۈنۈش رەڭلەرىنى ئۆزگەرتىش: ';

  @override
  String get changeTextColor => 'تېكىست رەڭلەرىنى ئۆزگەرتىش: ';

  @override
  String get changeTextColorShade => 'رەڭ سايىسىنى ئۆزگەرتىش: ';

  @override
  String get colorAdjustment => 'رەڭ تەڭشەش';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'نورمال',
      'lowSaturation': 'تۆۋەن تويۇنۇش',
      'normal': 'نورمال',
      'highSaturation': 'يۇقىرى تويۇنۇش',
      'monochrome': 'ئاق قارا',
      'highContrast': 'يۇقىرى كونتراست',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ھازىرقى رەڭ سەپى: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'رەڭ تونۇلمىدى',
      'cF44336': 'قىزىل',
      'cE91E63': 'قىزغۇچ',
      'c9C27B0': 'سۆسۈن',
      'c673AB7': 'چوڭقۇر سۆسۈن',
      'c3F51B5': 'كۆك سۆسۈن',
      'c2196F3': 'كۆك',
      'c03A9F4': 'يورۇق كۆك',
      'c00BCD4': 'ياش كۆك',
      'c009688': 'كۆك يېشىل',
      'c4CAF50': 'يېشىل',
      'c8BC34A': 'يورۇق يېشىل',
      'cCDDC39': 'لىمون يېشىل',
      'cFFEB3B': 'سېرىق',
      'cFFC107': 'قەھرىۋا',
      'cFF9800': 'قىزغۇچ سېرىق',
      'cFF5722': 'چوڭقۇر قىزغۇچ سېرىق',
      'c795548': 'قوڭۇر',
      'c9E9E9E': 'كۈلرەڭ',
      'c607D8B': 'كۆك كۈلرەڭ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'سۆز ئارىلىقىنى ئازايتىش';

  @override
  String get decrementLetterSpacing => 'ھەرپ ئارىلىقىنى ئازايتىش';

  @override
  String get decrementLineHeight => 'قۇر ئېگىزلىكىنى ئازايتىش';

  @override
  String get decrementTextScaleFactor => 'تېكىست مىقدارىنى ئازايتىش';

  @override
  String get effects => 'ئۈنۈملەر';

  @override
  String get expandText => 'تېكىستنى كېڭەيتىش';

  @override
  String get fontSize => 'خەت چوڭلۇقى';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'سۆز ئارىلىقىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'ھەرپ ئارىلىقىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increaseOrDecreaseLineHeight =>
      'قۇر ئېگىزلىكىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increaseOrDecreaseTextSize =>
      'تېكىست چوڭلۇقىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get incrementWordSpacing => 'سۆز ئارىلىقىنى كۆپەيتىش';

  @override
  String get incrementLetterSpacing => 'ھەرپ ئارىلىقىنى كۆپەيتىش';

  @override
  String get incrementLineHeight => 'قۇر ئېگىزلىكىنى كۆپەيتىش';

  @override
  String get incrementTextScaleFactor => 'تېكىست مىقدارىنى كۆپەيتىش';

  @override
  String get lessInfo => 'ئۇچۇرنى يوشۇرۇش';

  @override
  String get letterSpacing => 'ھەرپ ئارىلىقى';

  @override
  String get lineHeight => 'قۇر ئېگىزلىكى';

  @override
  String get moreInfo => 'ئۇچۇرنى كۆرسىتىش';

  @override
  String get readLess => 'ئازراق ئوقۇش';

  @override
  String get readMore => 'كۆپرەك ئوقۇش';

  @override
  String get reduceEffects => 'ئېكران ئۈنۈملىرىنى ئازايتىش';

  @override
  String get reduceText => 'تېكىستنى ئازايتىش';

  @override
  String get restoreSettings => 'تەڭشەكلەرنى ئەسلىگە كەلتۈرۈش';

  @override
  String get restoreMainColor => 'ئاساسىي رەڭنى ئەسلىگە كەلتۈرۈش';

  @override
  String get returnToMainColors => 'ئاساسىي رەڭلەرگە قايتىش';

  @override
  String get settings => 'تەڭشەكلەر';

  @override
  String get sizeAndTextDisplay => 'چوڭلۇق ۋە تېكىست كۆرسىتىش';

  @override
  String get sliderWordSpacing => 'سۆز ئارىلىقى سۈرگۈچى';

  @override
  String get sliderLetterSpacing => 'ھەرپ ئارىلىقى سۈرگۈچى';

  @override
  String get sliderLineHeight => 'قۇر ئېگىزلىكى سۈرگۈچى';

  @override
  String get themeMode => 'ئۇسلۇب';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ئۇسلۇب سەپى تونۇلمىدى',
      'seizureSafe': 'تۇتقاققا بىخەتەر',
      'visionImpaired': 'كۆرۈش ئاجىزلىقى',
      'adhdFriendly': 'ADHD دوستانە',
      'none': 'كۆڭۈldeki سەپلىمە',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'تۇتقاققا بىخەتەر سەپ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'چاقناشلارنى يوقىتىش ۋە رەڭنى ئازايتىش';

  @override
  String get themeProfileSeizureSafeDescription =>
      'بۇ سەپ تۇتقاق كېسىلى بار ۋە تۇتقاق خەۋپى بولغان ئىشلەتكۈچىلەرنىڭ چاقنايدىغان ئانىماتسىيە ۋە خەتەرلىك رەڭ بىرىكمىلىرىدىن كېلىدىغان تۇتقاق خەۋپىنى يوقىتىپ، بىخەتەر كۆرۈشىنى ئىشقا ئاشۇرىدۇ.';

  @override
  String get themeProfileVisionImpairedTitle => 'كۆرۈش ئاجىزلىقى سەپى';

  @override
  String get themeProfileVisionImpairedSubtitle => 'ئەپنىڭ كۆرۈنۈشىنى ياخشىلاش';

  @override
  String get themeProfileVisionImpairedDescription =>
      'بۇ سەپ ئەپنى كۆرۈش ئاجىزلىقى، تۇننېل كۆرۈش، كاتاراكتا، گلاۋكوما ۋە باشقا كۆپ خىل كۆرۈش ئاجىزلىقلىرىغا ئۇچۇرلۇق بولۇشقا ماسلاشتۇرىدۇ.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD دوستانە سەپ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'تېخىمۇ دىققەت ۋە ئازراق دىققەت چېچىلىش';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'بۇ سەپ ADHD ۋە نېرۋا تەرەققىيات بۇزۇقلۇقلىرى بار كىشىلەرنىڭ ئەپتىكى مۇھىم ئېلېمېنتلارغا تېخىمۇ ئاسان دىققەت مەركەزلەشتۈرۈشى، ئوقۇشى ۋە يول تېپىشىغا ياردەم قىلىش ئۈچۈن دىققەت چېچىلىشلارنى كۆپ دەرىجىدە ئازايتىدۇ.';

  @override
  String get theSettingsHaveBeenReset => 'تەڭشەكلەر ئەسلىگە قايتۇرۇلدى.';

  @override
  String get toggleDarkMode => 'قاراڭغۇ ھالەتنى ئالماشتۇرۇش';

  @override
  String get toggleEffectsMode => 'ئۈنۈم ھالىتىنى ئالماشتۇرۇش';

  @override
  String get toggleFontWeight => 'خەت قېلىنلىقىنى ئالماشتۇرۇش';

  @override
  String get toggleThemeProfile => 'ئۇسلۇب سەپىنى ئالماشتۇرۇش';

  @override
  String get wordSpacing => 'سۆز ئارىلىقى';

  @override
  String get accessibleFont => 'ئۇچۇرلۇق خەت نۇسخىسى';

  @override
  String get accessibleFontSubtitle =>
      'تېخىمۇ ياخشى ئوقۇش ئۈچۈن قولايلىق خەت نۇسخىسىنى ئىشلىتىڭ';

  @override
  String get accessibleFontEnabled => 'ئۇچۇرلۇق خەت نۇسخىسى قوزغىتىلدى';

  @override
  String get accessibleFontDisabled => 'ئۇچۇرلۇق خەت نۇسخىسى چەكلەندى';

  @override
  String get toggleAccessibleFont => 'ئۇچۇرلۇق خەت نۇسخىسىنى ئالماشتۇرۇش';

  @override
  String get settingsLoading => 'ئۇچۇرلۇق تەڭشەكلىرى يۈكلىنىۋاتىدۇ…';

  @override
  String get settingsLoadFailed => 'ئۇچۇرلۇق تەڭشەكلىرىنى يۈكلىگىلى بولمىدى.';

  @override
  String get retry => 'قايتا سىناڭ';

  @override
  String get themeModeSystem => 'سىستېما';

  @override
  String get themeModeLight => 'يورۇق';

  @override
  String get themeModeDark => 'قاراڭغۇ';

  @override
  String get effectsModeSystem => 'سىستېما';

  @override
  String get effectsModeEnabled => 'ئوچۇق';

  @override
  String get effectsModeDisabled => 'تاقاق';
}
