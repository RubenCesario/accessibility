// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AccessibilityLocalizationsFa extends AccessibilityLocalizations {
  AccessibilityLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get accessibility => 'دسترسی‌پذیری';

  @override
  String get accessibility_settings => 'تنظیمات دسترسی‌پذیری';

  @override
  String get adjust_background_colors => 'تنظیم رنگ‌های پس‌زمینه';

  @override
  String get adjust_text_colors => 'تنظیم رنگ‌های متن';

  @override
  String get align_center => 'تراز وسط';

  @override
  String get align_left => 'تراز چپ';

  @override
  String get align_right => 'تراز راست';

  @override
  String get bold_text => 'متن پررنگ';

  @override
  String get change_bold_text => 'تغییر پررنگی متن';

  @override
  String get change_pages_background_color => 'تغییر رنگ پس‌زمینه صفحات به: ';

  @override
  String get change_text_color => 'تغییر رنگ متن به: ';

  @override
  String get change_text_color_shade => 'تغییر سایه رنگ به: ';

  @override
  String get color_adjustment => 'تنظیم رنگ';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'پروفایل رنگ فعلی است: ';

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
  String get decrement_word_spacing => 'کاهش فاصله بین کلمات';

  @override
  String get decrement_letter_spacing => 'کاهش فاصله بین حروف';

  @override
  String get decrement_line_height => 'کاهش ارتفاع خط';

  @override
  String get decrement_text_scale_factor => 'کاهش ضریب مقیاس متن';

  @override
  String get effects => 'جلوه‌ها';

  @override
  String get expand_text => 'گسترش متن';

  @override
  String get font_size => 'اندازه قلم';

  @override
  String get increase_or_decrease_word_spacing =>
      'افزایش یا کاهش فاصله بین کلمات';

  @override
  String get increase_or_decrease_letter_spacing =>
      'افزایش یا کاهش فاصله بین حروف';

  @override
  String get increase_or_decrease_line_height => 'افزایش یا کاهش ارتفاع خط';

  @override
  String get increase_or_decrease_text_size => 'افزایش یا کاهش اندازه متن';

  @override
  String get increment_word_spacing => 'افزایش فاصله بین کلمات';

  @override
  String get increment_letter_spacing => 'افزایش فاصله بین حروف';

  @override
  String get increment_line_height => 'افزایش ارتفاع خط';

  @override
  String get increment_text_scale_factor => 'افزایش ضریب مقیاس متن';

  @override
  String get less_info => 'پنهان کردن اطلاعات';

  @override
  String get letter_spacing => 'فاصله بین حروف';

  @override
  String get line_height => 'ارتفاع خط';

  @override
  String get more_info => 'نمایش اطلاعات';

  @override
  String get read_less => 'کمتر بخوانید';

  @override
  String get read_more => 'بیشتر بخوانید';

  @override
  String get reduce_effects => 'کاهش جلوه‌های صفحه نمایش';

  @override
  String get reduce_text => 'کاهش متن';

  @override
  String get restore_settings => 'بازگردانی تنظیمات';

  @override
  String get restore_main_color => 'بازگردانی رنگ اصلی';

  @override
  String get return_to_main_colors => 'بازگشت به رنگ‌های اصلی';

  @override
  String get settings => 'تنظیمات';

  @override
  String get size_and_text_display => 'اندازه و نمایش متن';

  @override
  String get slider_word_spacing => 'لغزنده فاصله بین کلمات';

  @override
  String get slider_letter_spacing => 'لغزنده فاصله بین حروف';

  @override
  String get slider_line_height => 'لغزنده ارتفاع خط';

  @override
  String get theme_mode => 'تم';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'پروفایل تم شناسایی نشد',
      'seizureSafe': 'ایمن برای صرع',
      'visionImpaired': 'مناسب برای اختلال بینایی',
      'adhdFriendly': 'مناسب برای اختلال نقص توجه و بیش‌فعالی',
      'none': 'پیش‌فرض',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'پروفایل ایمن برای صرع';

  @override
  String get theme_profile_seizure_safe_subtitle => 'حذف انعکاس‌ها و کاهش رنگ';

  @override
  String get theme_profile_seizure_safe_description =>
      'این پروفایل به کاربرانی که صرع دارند و در معرض خطر حمله‌های صرع هستند امکان می‌دهد تا با حذف خطر حملات ناشی از انیمیشن‌های چشمک‌زن و ترکیبات رنگی پرخطر، به طور ایمن مرور کنند.';

  @override
  String get theme_profile_vision_impaired_title =>
      'پروفایل مناسب برای اختلال بینایی';

  @override
  String get theme_profile_vision_impaired_subtitle => 'بهبود دید برنامه';

  @override
  String get theme_profile_vision_impaired_description =>
      'این پروفایل برنامه را طوری تنظیم می‌کند که برای بیشتر اختلالات بینایی قابل دسترس باشد، مانند ضعف بینایی، دید تونلی، آب مروارید، آب سیاه و سایر موارد.';

  @override
  String get theme_profile_adhd_friendly_title =>
      'پروفایل سازگار با اختلال نقص توجه و بیش‌فعالی';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'تمرکز بیشتر و حواس‌پرتی کمتر';

  @override
  String get theme_profile_adhd_friendly_description =>
      'این پروفایل به طور قابل توجهی حواس‌پرتی‌ها را کاهش می‌دهد، تا به افراد مبتلا به اختلال نقص توجه و بیش‌فعالی و اختلالات رشد عصبی کمک کند تا راحت‌تر در برنامه ناوبری کنند، مطالب را بخوانند و بر عناصر اصلی برنامه تمرکز کنند.';

  @override
  String get the_settings_have_been_reset => 'تنظیمات بازنشانی شده‌اند.';

  @override
  String get toggle_dark_mode => 'تغییر حالت تاریک';

  @override
  String get toggle_effects_mode => 'تغییر حالت جلوه‌ها';

  @override
  String get toggle_font_weight => 'تغییر ضخامت قلم';

  @override
  String get toggle_theme_profile => 'تغییر پروفایل تم';

  @override
  String get word_spacing => 'فاصله بین کلمات';
}
