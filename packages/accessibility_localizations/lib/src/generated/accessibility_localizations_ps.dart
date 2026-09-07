// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AccessibilityLocalizationsPs extends AccessibilityLocalizations {
  AccessibilityLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get accessibility => 'لاسرسی';

  @override
  String get accessibilitySettings => 'د لاسرسي تنظیمات';

  @override
  String get adjustBackgroundColors => 'د شاته رنگونه تنظیم کړئ';

  @override
  String get adjustTextColors => 'د متن رنگونه تنظیم کړئ';

  @override
  String get alignCenter => 'منځ ته برابر کړئ';

  @override
  String get alignLeft => 'کیڼ ته برابر کړئ';

  @override
  String get alignRight => 'ښي ته برابر کړئ';

  @override
  String get textAlignment => 'د متن سمون';

  @override
  String get boldText => 'پنډ متن';

  @override
  String get changeBoldText => 'پنډ متن بدل کړئ';

  @override
  String get changePagesBackgroundColor => 'د پاڼو د شاته رنگ بدل کړئ په: ';

  @override
  String get changeTextColor => 'د متن رنگ بدل کړئ په: ';

  @override
  String get changeTextColorShade => 'د رنگ سيوری بدل کړئ په: ';

  @override
  String get colorAdjustment => 'د رنگ تنظیم';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'نورمال',
      'lowSaturation': 'ٺيٺ مشبوعيت',
      'normal': 'نورمال',
      'highSaturation': 'لوړ مشبوعيت',
      'monochrome': 'يو رنگه',
      'highContrast': 'لوړ تضاد',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'اوسنی د رنگ پروفايل دی: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'رنگ نه دی پېژندل شوی',
      'cF44336': 'سور',
      'cE91E63': 'گلابي',
      'c9C27B0': 'ارغواني',
      'c673AB7': 'ژور ارغواني',
      'c3F51B5': 'نيلي',
      'c2196F3': 'شين',
      'c03A9F4': 'روښانه شين',
      'c00BCD4': 'آسماني',
      'c009688': 'شين شين',
      'c4CAF50': 'شين',
      'c8BC34A': 'روښانه شين',
      'cCDDC39': 'ليمويي',
      'cFFEB3B': 'ژيړ',
      'cFFC107': 'کهربايي',
      'cFF9800': 'نارنجي',
      'cFF5722': 'ژور نارنجي',
      'c795548': 'نسواري',
      'c9E9E9E': 'خړ',
      'c607D8B': 'شين خړ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'د کلمو ترمنځ واټن کم کړئ';

  @override
  String get decrementLetterSpacing => 'د تورو ترمنځ واټن کم کړئ';

  @override
  String get decrementLineHeight => 'د کرښې لوړوالی کم کړئ';

  @override
  String get decrementTextScaleFactor => 'د متن د مقياس فکټور کم کړئ';

  @override
  String get effects => 'اغېزې';

  @override
  String get expandText => 'متن پراخ کړئ';

  @override
  String get fontSize => 'د ليک اندازه';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'د کلمو ترمنځ واټن زيات يا کم کړئ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'د تورو ترمنځ واټن زيات يا کم کړئ';

  @override
  String get increaseOrDecreaseLineHeight => 'د کرښې لوړوالی زيات يا کم کړئ';

  @override
  String get increaseOrDecreaseTextSize => 'د متن اندازه زيات يا کم کړئ';

  @override
  String get incrementWordSpacing => 'د کلمو ترمنځ واټن زيات کړئ';

  @override
  String get incrementLetterSpacing => 'د تورو ترمنځ واټن زيات کړئ';

  @override
  String get incrementLineHeight => 'د کرښې لوړوالی زيات کړئ';

  @override
  String get incrementTextScaleFactor => 'د متن د مقياس فکټور زيات کړئ';

  @override
  String get lessInfo => 'معلومات پټ کړئ';

  @override
  String get letterSpacing => 'د تورو ترمنځ واټن';

  @override
  String get lineHeight => 'د کرښې لوړوالی';

  @override
  String get moreInfo => 'معلومات ښکاره کړئ';

  @override
  String get readLess => 'لږ ولولئ';

  @override
  String get readMore => 'نور ولولئ';

  @override
  String get reduceEffects => 'په سکرين باندې اغېزې کمې کړئ';

  @override
  String get reduceText => 'متن کم کړئ';

  @override
  String get restoreSettings => 'تنظیمات بیا په خپل حالت راولئ';

  @override
  String get restoreMainColor => 'اصلي رنگ بیا په خپل حالت راولئ';

  @override
  String get returnToMainColors => 'اصلي رنگونو ته بېرته راوګرځئ';

  @override
  String get settings => 'تنظیمات';

  @override
  String get sizeAndTextDisplay => 'د اندازې او متن ښودل';

  @override
  String get sliderWordSpacing => 'د کلمو ترمنځ واټن سلايډر';

  @override
  String get sliderLetterSpacing => 'د تورو ترمنځ واټن سلايډر';

  @override
  String get sliderLineHeight => 'د کرښې لوړوالي سلايډر';

  @override
  String get themeMode => 'تهیم';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'د تهیم پروفايل نه دی پېژندل شوی',
      'seizureSafe': 'د ميرګي لپاره خوندي',
      'visionImpaired': 'د ليد معذوريت لپاره',
      'adhdFriendly': 'د ADHD لپاره مناسب',
      'none': 'تلواله پروفایل',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'د ميرگي لپاره خوندي پروفايل';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'انعکاسات لرې کړئ او رنگ کم کړئ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'دا پروفايل هغه کاروونکي ته اجازه ورکوي چې ميرگي لري او د ميرگي د حملو په خطر کې دي چې په خوندي توګه براوز وکړي په دې توګه چې د ځلېدونکو انیمیشنونو او خطرناکه رنگ ترکيبونو له امله د ميرگي د حملو خطر له منځه وړي.';

  @override
  String get themeProfileVisionImpairedTitle => 'د ليد معذوريت پروفايل';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'د اپلیکېشن د ليدلو وړتيا ښه کړئ';

  @override
  String get themeProfileVisionImpairedDescription =>
      'دا پروفايل اپلیکېشن داسې عياروي چې د زياتره ليدلو معذوريتونو لپاره د لاسرسي وړ وي، لکه د ليدلو معذوريت، تونل ليد، مرواريد، گلوکوما او نور.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'د ADHD لپاره مناسب پروفايل';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'زيات تمرکز او لږ حواس پرتي';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'دا پروفايل په پام وړ توګه حواس پرتي کموي، ترڅو د ADHD او عصبي پرمختیايي اختلالاتو لرونکو خلکو سره مرسته وکړي چې نيويګيټ کړي، ولولي، او په اسانۍ سره د اپلیکېشن په اساسي برخو تمرکز وکړي.';

  @override
  String get theSettingsHaveBeenReset => 'تنظیمات بیا تنظیم شوي دي.';

  @override
  String get toggleDarkMode => 'تور حالت بدل کړئ';

  @override
  String get toggleEffectsMode => 'د اغېزو حالت بدل کړئ';

  @override
  String get toggleFontWeight => 'د ليک وزن بدل کړئ';

  @override
  String get toggleThemeProfile => 'د تهیم پروفايل بدل کړئ';

  @override
  String get wordSpacing => 'د کلمو ترمنځ واټن';

  @override
  String get accessibleFont => 'د لاسرسي وړ لیک';

  @override
  String get accessibleFontSubtitle =>
      'د ښه لوستلو لپاره د لاسرسي وړ لیک وکاروئ';

  @override
  String get accessibleFontEnabled => 'د لاسرسي وړ لیک فعال شو';

  @override
  String get accessibleFontDisabled => 'د لاسرسي وړ لیک غیرفعال شو';

  @override
  String get toggleAccessibleFont => 'د لاسرسي وړ لیک بدل کړئ';

  @override
  String get settingsLoading => 'د لاسرسي تنظیمات لوډېږي…';

  @override
  String get settingsLoadFailed => 'د لاسرسي تنظیمات نشول لوډېدلی.';

  @override
  String get retry => 'بیا هڅه وکړئ';
}
