// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AccessibilityLocalizationsFa extends AccessibilityLocalizations {
  AccessibilityLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get accessibility => 'دسترسی‌پذیری';

  @override
  String get accessibilitySettings => 'تنظیمات دسترسی‌پذیری';

  @override
  String get adjustBackgroundColors => 'تنظیم رنگ‌های پس‌زمینه';

  @override
  String get adjustTextColors => 'تنظیم رنگ‌های متن';

  @override
  String get alignCenter => 'تراز وسط';

  @override
  String get alignLeft => 'تراز چپ';

  @override
  String get alignRight => 'تراز راست';

  @override
  String get textAlignment => 'ترازبندی متن';

  @override
  String get boldText => 'متن پررنگ';

  @override
  String get changeBoldText => 'تغییر پررنگی متن';

  @override
  String get changePagesBackgroundColor => 'تغییر رنگ پس‌زمینه صفحات به: ';

  @override
  String get changeTextColor => 'تغییر رنگ متن به: ';

  @override
  String get changeTextColorShade => 'تغییر سایه رنگ به: ';

  @override
  String get colorAdjustment => 'تنظیم رنگ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'عادی',
      'lowSaturation': 'اشباع کم',
      'normal': 'عادی',
      'highSaturation': 'اشباع بالا',
      'monochrome': 'تک‌رنگ',
      'highContrast': 'کنتراست بالا',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'پروفایل رنگ فعلی است: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'رنگ شناسایی نشد',
      'cF44336': 'قرمز',
      'cE91E63': 'صورتی',
      'c9C27B0': 'بنفش',
      'c673AB7': 'بنفش تیره',
      'c3F51B5': 'نیلی',
      'c2196F3': 'آبی',
      'c03A9F4': 'آبی روشن',
      'c00BCD4': 'فیروزه‌ای',
      'c009688': 'سبز آبی',
      'c4CAF50': 'سبز',
      'c8BC34A': 'سبز روشن',
      'cCDDC39': 'لیمویی',
      'cFFEB3B': 'زرد',
      'cFFC107': 'کهربایی',
      'cFF9800': 'نارنجی',
      'cFF5722': 'نارنجی تیره',
      'c795548': 'قهوه‌ای',
      'c9E9E9E': 'خاکستری',
      'c607D8B': 'خاکستری آبی',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'کاهش فاصله بین کلمات';

  @override
  String get decrementLetterSpacing => 'کاهش فاصله بین حروف';

  @override
  String get decrementLineHeight => 'کاهش ارتفاع خط';

  @override
  String get decrementTextScaleFactor => 'کاهش ضریب مقیاس متن';

  @override
  String get effects => 'جلوه‌ها';

  @override
  String get expandText => 'گسترش متن';

  @override
  String get fontSize => 'اندازه قلم';

  @override
  String get increaseOrDecreaseWordSpacing => 'افزایش یا کاهش فاصله بین کلمات';

  @override
  String get increaseOrDecreaseLetterSpacing => 'افزایش یا کاهش فاصله بین حروف';

  @override
  String get increaseOrDecreaseLineHeight => 'افزایش یا کاهش ارتفاع خط';

  @override
  String get increaseOrDecreaseTextSize => 'افزایش یا کاهش اندازه متن';

  @override
  String get incrementWordSpacing => 'افزایش فاصله بین کلمات';

  @override
  String get incrementLetterSpacing => 'افزایش فاصله بین حروف';

  @override
  String get incrementLineHeight => 'افزایش ارتفاع خط';

  @override
  String get incrementTextScaleFactor => 'افزایش ضریب مقیاس متن';

  @override
  String get lessInfo => 'پنهان کردن اطلاعات';

  @override
  String get letterSpacing => 'فاصله بین حروف';

  @override
  String get lineHeight => 'ارتفاع خط';

  @override
  String get moreInfo => 'نمایش اطلاعات';

  @override
  String get readLess => 'کمتر بخوانید';

  @override
  String get readMore => 'بیشتر بخوانید';

  @override
  String get reduceEffects => 'کاهش جلوه‌های صفحه نمایش';

  @override
  String get reduceText => 'کاهش متن';

  @override
  String get restoreSettings => 'بازگردانی تنظیمات';

  @override
  String get restoreMainColor => 'بازگردانی رنگ اصلی';

  @override
  String get returnToMainColors => 'بازگشت به رنگ‌های اصلی';

  @override
  String get settings => 'تنظیمات';

  @override
  String get sizeAndTextDisplay => 'اندازه و نمایش متن';

  @override
  String get sliderWordSpacing => 'لغزنده فاصله بین کلمات';

  @override
  String get sliderLetterSpacing => 'لغزنده فاصله بین حروف';

  @override
  String get sliderLineHeight => 'لغزنده ارتفاع خط';

  @override
  String get themeMode => 'تم';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'پروفایل تم شناسایی نشد',
      'seizureSafe': 'ایمن برای صرع',
      'visionImpaired': 'مناسب برای اختلال بینایی',
      'adhdFriendly': 'مناسب برای اختلال نقص توجه و بیش‌فعالی',
      'none': 'نمایه پیش‌فرض',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'پروفایل ایمن برای صرع';

  @override
  String get themeProfileSeizureSafeSubtitle => 'حذف انعکاس‌ها و کاهش رنگ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'این پروفایل به کاربرانی که صرع دارند و در معرض خطر حمله‌های صرع هستند امکان می‌دهد تا با حذف خطر حملات ناشی از انیمیشن‌های چشمک‌زن و ترکیبات رنگی پرخطر، به طور ایمن مرور کنند.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'پروفایل مناسب برای اختلال بینایی';

  @override
  String get themeProfileVisionImpairedSubtitle => 'بهبود دید برنامه';

  @override
  String get themeProfileVisionImpairedDescription =>
      'این پروفایل برنامه را طوری تنظیم می‌کند که برای بیشتر اختلالات بینایی قابل دسترس باشد، مانند ضعف بینایی، دید تونلی، آب مروارید، آب سیاه و سایر موارد.';

  @override
  String get themeProfileAdhdFriendlyTitle =>
      'پروفایل سازگار با اختلال نقص توجه و بیش‌فعالی';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'تمرکز بیشتر و حواس‌پرتی کمتر';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'این پروفایل به طور قابل توجهی حواس‌پرتی‌ها را کاهش می‌دهد، تا به افراد مبتلا به اختلال نقص توجه و بیش‌فعالی و اختلالات رشد عصبی کمک کند تا راحت‌تر در برنامه ناوبری کنند، مطالب را بخوانند و بر عناصر اصلی برنامه تمرکز کنند.';

  @override
  String get theSettingsHaveBeenReset => 'تنظیمات بازنشانی شده‌اند.';

  @override
  String get toggleDarkMode => 'تغییر حالت تاریک';

  @override
  String get toggleEffectsMode => 'تغییر حالت جلوه‌ها';

  @override
  String get toggleFontWeight => 'تغییر ضخامت قلم';

  @override
  String get toggleThemeProfile => 'تغییر پروفایل تم';

  @override
  String get wordSpacing => 'فاصله بین کلمات';

  @override
  String get accessibleFont => 'قلم قابل دسترس';

  @override
  String get accessibleFontSubtitle =>
      'برای خوانایی بهتر از یک قلم دسترس‌پذیر استفاده کنید';

  @override
  String get accessibleFontEnabled => 'قلم قابل دسترس فعال است';

  @override
  String get accessibleFontDisabled => 'قلم قابل دسترس غیرفعال است';

  @override
  String get toggleAccessibleFont => 'تغییر قلم قابل دسترس';

  @override
  String get settingsLoading => 'در حال بارگذاری تنظیمات دسترسی‌پذیری…';

  @override
  String get settingsLoadFailed => 'تنظیمات دسترسی‌پذیری بارگذاری نشد.';

  @override
  String get retry => 'تلاش مجدد';
}
