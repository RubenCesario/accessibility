// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AccessibilityLocalizationsBn extends AccessibilityLocalizations {
  AccessibilityLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get accessibility => 'প্রবেশযোগ্যতা';

  @override
  String get accessibilitySettings => 'প্রবেশযোগ্যতার সেটিংস';

  @override
  String get adjustBackgroundColors => 'পটভূমির রঙ সামঞ্জস্য করুন';

  @override
  String get adjustTextColors => 'লেখার রঙ সামঞ্জস্য করুন';

  @override
  String get alignCenter => 'কেন্দ্রে সারিবদ্ধ করুন';

  @override
  String get alignLeft => 'বামে সারিবদ্ধ করুন';

  @override
  String get alignRight => 'ডানে সারিবদ্ধ করুন';

  @override
  String get textAlignment => 'টেক্সট সারিবদ্ধকরণ';

  @override
  String get boldText => 'গাঢ় লেখা';

  @override
  String get changeBoldText => 'গাঢ় লেখার ধরন পরিবর্তন করুন';

  @override
  String get changePagesBackgroundColor => 'পৃষ্ঠার পটভূমির রঙ পরিবর্তন করুন: ';

  @override
  String get changeTextColor => 'লেখার রঙ পরিবর্তন করুন: ';

  @override
  String get changeTextColorShade => 'রঙের ছায়া পরিবর্তন করুন: ';

  @override
  String get colorAdjustment => 'রঙ সামঞ্জস্য';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'স্বাভাবিক',
      'lowSaturation': 'কম স্যাচুরেশন',
      'normal': 'স্বাভাবিক',
      'highSaturation': 'উচ্চ স্যাচুরেশন',
      'monochrome': 'মনোক্রোম',
      'highContrast': 'উচ্চ কনট্রাস্ট',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'বর্তমান রঙ প্রোফাইল: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'রঙ শনাক্ত করা যায়নি',
      'cF44336': 'লাল',
      'cE91E63': 'গোলাপি',
      'c9C27B0': 'বেগুনি',
      'c673AB7': 'গাঢ় বেগুনি',
      'c3F51B5': 'ইন্ডিগো',
      'c2196F3': 'নীল',
      'c03A9F4': 'হালকা নীল',
      'c00BCD4': 'সায়ান',
      'c009688': 'টিল',
      'c4CAF50': 'সবুজ',
      'c8BC34A': 'হালকা সবুজ',
      'cCDDC39': 'লেম',
      'cFFEB3B': 'হলুদ',
      'cFFC107': 'অ্যাম্বার',
      'cFF9800': 'কমলা',
      'cFF5722': 'গাঢ় কমলা',
      'c795548': 'বাদামী',
      'c9E9E9E': 'ধূসর',
      'c607D8B': 'নীল-ধূসর',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'শব্দের ব্যবধান কমান';

  @override
  String get decrementLetterSpacing => 'অক্ষরের ব্যবধান কমান';

  @override
  String get decrementLineHeight => 'লাইনের উচ্চতা কমান';

  @override
  String get decrementTextScaleFactor => 'টেক্সট স্কেল ফ্যাক্টর কমান';

  @override
  String get effects => 'প্রভাবসমূহ';

  @override
  String get expandText => 'টেক্সট প্রসারিত করুন';

  @override
  String get fontSize => 'ফন্টের আকার';

  @override
  String get increaseOrDecreaseWordSpacing => 'শব্দের ব্যবধান বাড়ান বা কমান';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'অক্ষরের ব্যবধান বাড়ান বা কমান';

  @override
  String get increaseOrDecreaseLineHeight => 'লাইনের উচ্চতা বাড়ান বা কমান';

  @override
  String get increaseOrDecreaseTextSize => 'লেখার আকার বাড়ান বা কমান';

  @override
  String get incrementWordSpacing => 'শব্দের ব্যবধান বাড়ান';

  @override
  String get incrementLetterSpacing => 'অক্ষরের ব্যবধান বাড়ান';

  @override
  String get incrementLineHeight => 'লাইনের উচ্চতা বাড়ান';

  @override
  String get incrementTextScaleFactor => 'টেক্সট স্কেল ফ্যাক্টর বাড়ান';

  @override
  String get lessInfo => 'তথ্য লুকান';

  @override
  String get letterSpacing => 'অক্ষরের ব্যবধান';

  @override
  String get lineHeight => 'লাইনের উচ্চতা';

  @override
  String get moreInfo => 'তথ্য দেখান';

  @override
  String get readLess => 'কম পড়ুন';

  @override
  String get readMore => 'আরও পড়ুন';

  @override
  String get reduceEffects => 'স্ক্রিনে প্রভাব কমান';

  @override
  String get reduceText => 'লেখা সংক্ষিপ্ত করুন';

  @override
  String get restoreSettings => 'সেটিংস পুনরুদ্ধার করুন';

  @override
  String get restoreMainColor => 'মূল রঙ পুনরুদ্ধার করুন';

  @override
  String get returnToMainColors => 'মূল রঙে ফিরে যান';

  @override
  String get settings => 'সেটিংস';

  @override
  String get sizeAndTextDisplay => 'আকার ও টেক্সট প্রদর্শন';

  @override
  String get sliderWordSpacing => 'শব্দ ব্যবধান স্লাইডার';

  @override
  String get sliderLetterSpacing => 'অক্ষর ব্যবধান স্লাইডার';

  @override
  String get sliderLineHeight => 'লাইন উচ্চতা স্লাইডার';

  @override
  String get themeMode => 'থিম';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'থিম প্রোফাইল সনাক্ত করা যায়নি',
      'seizureSafe': 'সিজার-নিরাপদ',
      'visionImpaired': 'দৃষ্টিপ্রতিবন্ধী',
      'adhdFriendly': 'ADHD-বান্ধব',
      'none': 'ডিফল্ট প্রোফাইল',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'সিজার-নিরাপদ প্রোফাইল';

  @override
  String get themeProfileSeizureSafeSubtitle => 'প্রতিফলন সরান এবং রঙ কমান';

  @override
  String get themeProfileSeizureSafeDescription =>
      'এই প্রোফাইলটি মৃগী বা খিঁচুনি ঝুঁকিপূর্ণ ব্যবহারকারীদের জন্য নিরাপদ ব্রাউজিং নিশ্চিত করে, ঝলমলে অ্যানিমেশন ও বিপজ্জনক রঙের সংমিশ্রণ সরিয়ে।';

  @override
  String get themeProfileVisionImpairedTitle => 'দৃষ্টিপ্রতিবন্ধী প্রোফাইল';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'অ্যাপ্লিকেশনের দৃশ্যমানতা উন্নত করুন';

  @override
  String get themeProfileVisionImpairedDescription =>
      'এই প্রোফাইলটি অ্যাপ্লিকেশনকে বিভিন্ন দৃষ্টিপ্রতিবন্ধকতা, যেমন টানেল ভিশন, ক্যাটারাক্ট, গ্লুকোমা ইত্যাদির জন্য আরও প্রবেশযোগ্য করে তোলে।';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-বান্ধব প্রোফাইল';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'বেশি মনোযোগ, কম বিভ্রান্তি';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'এই প্রোফাইলটি ADHD ও নিউরোডেভেলপমেন্টাল ডিসঅর্ডারযুক্ত ব্যক্তিদের জন্য বিভ্রান্তি কমিয়ে, অ্যাপের গুরুত্বপূর্ণ অংশে মনোযোগ দিতে সহায়তা করে।';

  @override
  String get theSettingsHaveBeenReset => 'সেটিংস রিসেট করা হয়েছে।';

  @override
  String get toggleDarkMode => 'ডার্ক মোড চালু/বন্ধ করুন';

  @override
  String get toggleEffectsMode => 'ইফেক্ট মোড চালু/বন্ধ করুন';

  @override
  String get toggleFontWeight => 'ফন্টের ওজন চালু/বন্ধ করুন';

  @override
  String get toggleThemeProfile => 'থিম প্রোফাইল চালু/বন্ধ করুন';

  @override
  String get wordSpacing => 'শব্দের ব্যবধান';

  @override
  String get accessibleFont => 'প্রবেশযোগ্য ফন্ট';

  @override
  String get accessibleFontSubtitle =>
      'উন্নত পাঠযোগ্যতার জন্য একটি সহজলভ্য ফন্ট ব্যবহার করুন';

  @override
  String get accessibleFontEnabled => 'প্রবেশযোগ্য ফন্ট সক্রিয়';

  @override
  String get accessibleFontDisabled => 'প্রবেশযোগ্য ফন্ট নিষ্ক্রিয়';

  @override
  String get toggleAccessibleFont => 'প্রবেশযোগ্য ফন্ট চালু/বন্ধ করুন';

  @override
  String get settingsLoading => 'প্রবেশযোগ্যতার সেটিংস লোড হচ্ছে…';

  @override
  String get settingsLoadFailed => 'প্রবেশযোগ্যতার সেটিংস লোড করা যায়নি।';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get themeModeSystem => 'সিস্টেম';

  @override
  String get themeModeLight => 'লাইট';

  @override
  String get themeModeDark => 'ডার্ক';

  @override
  String get effectsModeSystem => 'সিস্টেম';

  @override
  String get effectsModeEnabled => 'চালু';

  @override
  String get effectsModeDisabled => 'বন্ধ';
}
