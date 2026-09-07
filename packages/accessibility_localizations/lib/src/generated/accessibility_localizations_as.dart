// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AccessibilityLocalizationsAs extends AccessibilityLocalizations {
  AccessibilityLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get accessibility => 'প্ৰৱেশযোগ্যতা';

  @override
  String get accessibilitySettings => 'প্ৰৱেশযোগ্যতা ছেটিংছ';

  @override
  String get adjustBackgroundColors => 'পৃষ্ঠাৰ পটভূমিৰ ৰং সলনি কৰক';

  @override
  String get adjustTextColors => 'লিখনৰ ৰং সলনি কৰক';

  @override
  String get alignCenter => 'মাজত সজাওক';

  @override
  String get alignLeft => 'বাওঁফালে সজাওক';

  @override
  String get alignRight => 'সোঁফালে সজাওক';

  @override
  String get textAlignment => 'পাঠ শাৰীবদ্ধকৰণ';

  @override
  String get boldText => 'ডাঠ লিখনী';

  @override
  String get changeBoldText => 'ডাঠ লিখনী সলনি কৰক';

  @override
  String get changePagesBackgroundColor =>
      'পৃষ্ঠাৰ পটভূমিৰ ৰং এইটোলৈ সলনি কৰক: ';

  @override
  String get changeTextColor => 'লিখনৰ ৰং এইটোলৈ সলনি কৰক: ';

  @override
  String get changeTextColorShade => 'লিখনৰ ৰংৰ ছাঁ এইটোলৈ সলনি কৰক: ';

  @override
  String get colorAdjustment => 'ৰং সমন্বয়';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'সাধাৰণ',
      'lowSaturation': 'কম সম্পৃক্ততা',
      'normal': 'সাধাৰণ',
      'highSaturation': 'বেছি সম্পৃক্ততা',
      'monochrome': 'এক ৰঙা',
      'highContrast': 'বেছি বৈপৰীত্য',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'বৰ্তমান ৰং প্ৰ\'ফাইল হৈছে: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'ৰং চিনাক্ত হোৱা নাই',
      'cF44336': 'ৰঙা',
      'cE91E63': 'গুলাপী',
      'c9C27B0': 'বেঙুনী',
      'c673AB7': 'গাঢ় বেঙুনী',
      'c3F51B5': 'নীলা',
      'c2196F3': 'বগা',
      'c03A9F4': 'হালধীয়া নীলা',
      'c00BCD4': 'চিয়ান',
      'c009688': 'টিল',
      'c4CAF50': 'সেউজীয়া',
      'c8BC34A': 'হালধীয়া সেউজীয়া',
      'cCDDC39': 'নিম',
      'cFFEB3B': 'হালধীয়া',
      'cFFC107': 'এম্বাৰ',
      'cFF9800': 'কমলা',
      'cFF5722': 'গাঢ় কমলা',
      'c795548': 'বাউণী',
      'c9E9E9E': 'ধূসৰ',
      'c607D8B': 'নীলা-ধূসৰ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'শব্দৰ মাজৰ দূৰত্ব কমাওক';

  @override
  String get decrementLetterSpacing => 'আখৰৰ মাজৰ দূৰত্ব কমাওক';

  @override
  String get decrementLineHeight => 'শাৰী উচ্চতা কমাওক';

  @override
  String get decrementTextScaleFactor => 'লিখন স্কেল ফেক্টৰ কমাওক';

  @override
  String get effects => 'প্ৰভাৱসমূহ';

  @override
  String get expandText => 'লিখনী বিস্তাৰিত কৰক';

  @override
  String get fontSize => 'আখৰৰ আকাৰ';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'শব্দৰ মাজৰ দূৰত্ব বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'আখৰৰ মাজৰ দূৰত্ব বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increaseOrDecreaseLineHeight => 'শাৰী উচ্চতা বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get increaseOrDecreaseTextSize => 'লিখনৰ আকাৰ বৃদ্ধি বা হ্ৰাস কৰক';

  @override
  String get incrementWordSpacing => 'শব্দৰ মাজৰ দূৰত্ব বৃদ্ধি কৰক';

  @override
  String get incrementLetterSpacing => 'আখৰৰ মাজৰ দূৰত্ব বৃদ্ধি কৰক';

  @override
  String get incrementLineHeight => 'শাৰী উচ্চতা বৃদ্ধি কৰক';

  @override
  String get incrementTextScaleFactor => 'লিখন স্কেল ফেক্টৰ বৃদ্ধি কৰক';

  @override
  String get lessInfo => 'তথ্য লুকুৱাওক';

  @override
  String get letterSpacing => 'আখৰৰ মাজৰ দূৰত্ব';

  @override
  String get lineHeight => 'শাৰী উচ্চতা';

  @override
  String get moreInfo => 'তথ্য দেখুৱাওক';

  @override
  String get readLess => 'কম পঢ়ক';

  @override
  String get readMore => 'অধিক পঢ়ক';

  @override
  String get reduceEffects => 'স্ক্ৰীনৰ প্ৰভাৱসমূহ হ্ৰাস কৰক';

  @override
  String get reduceText => 'লিখনী হ্ৰাস কৰক';

  @override
  String get restoreSettings => 'ছেটিংছ পুনৰুদ্ধাৰ কৰক';

  @override
  String get restoreMainColor => 'মূল ৰং পুনৰুদ্ধাৰ কৰক';

  @override
  String get returnToMainColors => 'মূল ৰংলৈ উভতি যাওক';

  @override
  String get settings => 'ছেটিংছ';

  @override
  String get sizeAndTextDisplay => 'আকাৰ আৰু লিখন প্ৰদর্শন';

  @override
  String get sliderWordSpacing => 'শব্দৰ মাজৰ দূৰত্ব সলাই থকা স্লাইডাৰ';

  @override
  String get sliderLetterSpacing => 'আখৰৰ মাজৰ দূৰত্ব সলাই থকা স্লাইডাৰ';

  @override
  String get sliderLineHeight => 'শাৰী উচ্চতা সলাই থকা স্লাইডাৰ';

  @override
  String get themeMode => 'থীম';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'থীম প্ৰ\'ফাইল চিনাক্ত হোৱা নাই',
      'seizureSafe': 'উপশম-নিরাপদ',
      'visionImpaired': 'দৃষ্টিহীন-সহায়ক',
      'adhdFriendly': 'ADHD-সহায়ক',
      'none': 'ডিফল্ট আৰ্হি',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'উপশম-নিরাপদ প্ৰ\'ফাইল';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'প্ৰতিৰূপ আঁতৰাওক আৰু ৰং হ্ৰাস কৰক';

  @override
  String get themeProfileSeizureSafeDescription =>
      'এই প্ৰ\'ফাইলটো মৃগী ৰোগী বা উপশমৰ আশংকা থকা ব্যৱহাৰকাৰীসকলৰ বাবে ঝলমলীয়া এনিমেশ্বন আৰু বিপজ্জনক ৰংসমূহ আঁতৰাই নিৰাপদভাৱে ব্যৱহাৰ কৰিবলৈ সহায় কৰে।';

  @override
  String get themeProfileVisionImpairedTitle => 'দৃষ্টিহীন-সহায়ক প্ৰ\'ফাইল';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'এপ্লিকেশ্যনৰ দৃশ্যতা উন্নত কৰক';

  @override
  String get themeProfileVisionImpairedDescription =>
      'এই প্ৰ\'ফাইলটোৱে দৃষ্টিহীনতা, টানেল ভিশন, ছানি, গ্লুকোমা আদি দৃষ্টিসম্বন্ধীয় অসুবিধাসমূহ থকা ব্যৱহাৰকাৰীসকলৰ বাবে এপ্লিকেশ্যনটো অধিক উপযোগী কৰে।';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-সহায়ক প্ৰ\'ফাইল';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'অধিক মনোযোগ আৰু কম বিঘ্নতা';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'এই প্ৰ\'ফাইলটোৱে ADHD আৰু নিউৰোডেভেলপমেন্টেল অসুবিধাসমূহ থকা ব্যৱহাৰকাৰীসকলৰ বাবে বিঘ্নতা হ্ৰাস কৰি, সহজে নেভিগেট, পঢ়া আৰু প্ৰয়োজনীয় উপাদানত মনোযোগ দিবলৈ সহায় কৰে।';

  @override
  String get theSettingsHaveBeenReset => 'ছেটিংছ পুনৰায় সংৰক্ষিত হৈছে।';

  @override
  String get toggleDarkMode => 'ডাৰ্ক ম\'ড টগল কৰক';

  @override
  String get toggleEffectsMode => 'ইফেক্ট ম\'ড টগল কৰক';

  @override
  String get toggleFontWeight => 'আখৰৰ ওজন টগল কৰক';

  @override
  String get toggleThemeProfile => 'থীম প্ৰ\'ফাইল টগল কৰক';

  @override
  String get wordSpacing => 'শব্দৰ মাজৰ দূৰত্ব';

  @override
  String get accessibleFont => 'সুগম্য আখৰ';

  @override
  String get accessibleFontSubtitle =>
      'উন্নত পঠনযোগ্যতাৰ বাবে এটা সুলভ আখৰ ব্যৱহাৰ কৰক';

  @override
  String get accessibleFontEnabled => 'সুগম্য আখৰ সক্ৰিয়';

  @override
  String get accessibleFontDisabled => 'সুগম্য আখৰ নিষ্ক্ৰিয়';

  @override
  String get toggleAccessibleFont => 'সুগম্য আখৰ টগল কৰক';

  @override
  String get settingsLoading => 'প্ৰৱেশযোগ্যতা ছেটিংছ ল\'ড হৈ আছে…';

  @override
  String get settingsLoadFailed => 'প্ৰৱেশযোগ্যতা ছেটিংছ ল\'ড কৰিব পৰা নগ\'ল।';

  @override
  String get retry => 'পুনৰ চেষ্টা কৰক';
}
