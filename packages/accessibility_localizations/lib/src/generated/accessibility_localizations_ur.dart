// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AccessibilityLocalizationsUr extends AccessibilityLocalizations {
  AccessibilityLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get accessibility => 'رسائی';

  @override
  String get accessibilitySettings => 'رسائی کی ترتیبات';

  @override
  String get adjustBackgroundColors => 'پس منظر کے رنگ کو ایڈجسٹ کریں';

  @override
  String get adjustTextColors => 'متن کے رنگ کو ایڈجسٹ کریں';

  @override
  String get alignCenter => 'درمیان میں منظم کریں';

  @override
  String get alignLeft => 'بائیں منظم کریں';

  @override
  String get alignRight => 'دائیں منظم کریں';

  @override
  String get textAlignment => 'متن کی سیدھ';

  @override
  String get boldText => 'موٹا متن';

  @override
  String get changeBoldText => 'موٹے متن کو تبدیل کریں';

  @override
  String get changePagesBackgroundColor =>
      'صفحات کے پس منظر کا رنگ تبدیل کریں: ';

  @override
  String get changeTextColor => 'متن کا رنگ تبدیل کریں: ';

  @override
  String get changeTextColorShade => 'رنگ کی شیڈ کو تبدیل کریں: ';

  @override
  String get colorAdjustment => 'رنگ کی ایڈجسٹمنٹ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'معمول',
      'lowSaturation': 'کم سیرابی',
      'normal': 'معمول',
      'highSaturation': 'زیادہ سیرابی',
      'monochrome': 'یک رنگی',
      'highContrast': 'زیادہ تضاد',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'موجودہ رنگ پروفائل ہے: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'رنگ شناخت نہیں ہوا',
      'cF44336': 'سرخ',
      'cE91E63': 'گلابی',
      'c9C27B0': 'ارغوانی',
      'c673AB7': 'گہرا ارغوانی',
      'c3F51B5': 'نیلگون',
      'c2196F3': 'نیلا',
      'c03A9F4': 'ہلکا نیلا',
      'c00BCD4': 'فیروزی',
      'c009688': 'سبز نیلا',
      'c4CAF50': 'سبز',
      'c8BC34A': 'ہلکا سبز',
      'cCDDC39': 'لائم',
      'cFFEB3B': 'پیلا',
      'cFFC107': 'کہربائی',
      'cFF9800': 'نارنجی',
      'cFF5722': 'گہرا نارنجی',
      'c795548': 'بھورا',
      'c9E9E9E': 'سلیٹی',
      'c607D8B': 'نیلا سلیٹی',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'الفاظ کے درمیان فاصلہ کم کریں';

  @override
  String get decrementLetterSpacing => 'حروف کے درمیان فاصلہ کم کریں';

  @override
  String get decrementLineHeight => 'سطر کی اونچائی کم کریں';

  @override
  String get decrementTextScaleFactor => 'متن کے پیمانے کا عنصر کم کریں';

  @override
  String get effects => 'اثرات';

  @override
  String get expandText => 'متن کو پھیلائیں';

  @override
  String get fontSize => 'حرف کا سائز';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'الفاظ کے درمیان فاصلہ بڑھائیں یا کم کریں';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'حروف کے درمیان فاصلہ بڑھائیں یا کم کریں';

  @override
  String get increaseOrDecreaseLineHeight =>
      'سطر کی اونچائی بڑھائیں یا کم کریں';

  @override
  String get increaseOrDecreaseTextSize => 'متن کا سائز بڑھائیں یا کم کریں';

  @override
  String get incrementWordSpacing => 'الفاظ کے درمیان فاصلہ بڑھائیں';

  @override
  String get incrementLetterSpacing => 'حروف کے درمیان فاصلہ بڑھائیں';

  @override
  String get incrementLineHeight => 'سطر کی اونچائی بڑھائیں';

  @override
  String get incrementTextScaleFactor => 'متن کے پیمانے کا عنصر بڑھائیں';

  @override
  String get lessInfo => 'معلومات چھپائیں';

  @override
  String get letterSpacing => 'حروف کے درمیان فاصلہ';

  @override
  String get lineHeight => 'سطر کی اونچائی';

  @override
  String get moreInfo => 'معلومات دکھائیں';

  @override
  String get readLess => 'کم پڑھیں';

  @override
  String get readMore => 'مزید پڑھیں';

  @override
  String get reduceEffects => 'اسکرین پر اثرات کم کریں';

  @override
  String get reduceText => 'متن کو کم کریں';

  @override
  String get restoreSettings => 'ترتیبات بحال کریں';

  @override
  String get restoreMainColor => 'اصل رنگ بحال کریں';

  @override
  String get returnToMainColors => 'اصل رنگوں پر واپس جائیں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get sizeAndTextDisplay => 'سائز اور متن کی نمائش';

  @override
  String get sliderWordSpacing => 'سلائیڈر الفاظ کے درمیان فاصلہ';

  @override
  String get sliderLetterSpacing => 'سلائیڈر حروف کے درمیان فاصلہ';

  @override
  String get sliderLineHeight => 'سلائیڈر سطر کی اونچائی';

  @override
  String get themeMode => 'تھیم';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'تھیم پروفائل شناخت نہیں ہوا',
      'seizureSafe': 'دورے سے محفوظ',
      'visionImpaired': 'بصارت سے متاثر',
      'adhdFriendly': 'ADHD دوستانہ',
      'none': 'ڈیفالٹ پروفائل',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'دورے سے محفوظ پروفائل';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'عکاسی کو ختم کریں اور رنگ کو کم کریں';

  @override
  String get themeProfileSeizureSafeDescription =>
      'یہ پروفائل مرگی والے اور دورے کے خطرے والے صارفین کو چمکدار اینیمیشن اور خطرناک رنگوں کے مجموعے سے پیدا ہونے والے دوروں کے خطرے کو ختم کرکے محفوظ طریقے سے براؤز کرنے کی اجازت دیتا ہے۔';

  @override
  String get themeProfileVisionImpairedTitle => 'بصارت سے متاثر پروفائل';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ایپلیکیشن کی نظر آنے کی صلاحیت کو بہتر بنائیں';

  @override
  String get themeProfileVisionImpairedDescription =>
      'یہ پروفائل ایپلیکیشن کو زیادہ تر بصری نقائص جیسے بصارت کی خرابی، ٹنل وژن، موتیا بند، گلوکوما وغیرہ کے لیے قابل رسائی بنانے کے لیے موافق بناتا ہے۔';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD دوستانہ پروفائل';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'زیادہ توجہ اور کم مداخلت';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'یہ پروفائل مداخلتوں کو نمایاں طور پر کم کرتا ہے، تاکہ ADHD اور عصبی نشونما کے عوارض والے لوگوں کو آسانی سے نیویگیٹ کرنے، پڑھنے اور ایپلیکیشن کے ضروری عناصر پر توجہ مرکوز کرنے میں مدد ملے۔';

  @override
  String get theSettingsHaveBeenReset => 'ترتیبات کو ری سیٹ کر دیا گیا ہے۔';

  @override
  String get toggleDarkMode => 'ڈارک موڈ کو ٹوگل کریں';

  @override
  String get toggleEffectsMode => 'اثرات موڈ کو ٹوگل کریں';

  @override
  String get toggleFontWeight => 'حرف کے وزن کو ٹوگل کریں';

  @override
  String get toggleThemeProfile => 'تھیم پروفائل کو ٹوگل کریں';

  @override
  String get wordSpacing => 'الفاظ کے درمیان فاصلہ';

  @override
  String get accessibleFont => 'قابل رسائی فونٹ';

  @override
  String get accessibleFontSubtitle =>
      'بہتر پڑھنے کی صلاحیت کے لیے ایک قابل رسائی فونٹ استعمال کریں';

  @override
  String get accessibleFontEnabled => 'قابل رسائی فونٹ فعال';

  @override
  String get accessibleFontDisabled => 'قابل رسائی فونٹ غیر فعال';

  @override
  String get toggleAccessibleFont => 'قابل رسائی فونٹ کو ٹوگل کریں';

  @override
  String get settingsLoading => 'رسائی کی ترتیبات لوڈ ہو رہی ہیں…';

  @override
  String get settingsLoadFailed => 'رسائی کی ترتیبات لوڈ نہیں کی جا سکیں۔';

  @override
  String get retry => 'دوبارہ کوشش کریں';
}
