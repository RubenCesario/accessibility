// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AccessibilityLocalizationsAr extends AccessibilityLocalizations {
  AccessibilityLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get accessibility => 'الوصول';

  @override
  String get accessibility_settings => 'إعدادات الوصول';

  @override
  String get adjust_background_colors => 'تعديل الألوان الخلفية';

  @override
  String get adjust_text_colors => 'تعديل الألوان النصية';

  @override
  String get align_center => 'محاذاة المركز';

  @override
  String get align_left => 'محاذاة اليسار';

  @override
  String get align_right => 'محاذاة اليمين';

  @override
  String get bold_text => 'نص غامق';

  @override
  String get change_bold_text => 'تغيير النص الغامق';

  @override
  String get change_pages_background_color => 'تغيير لون الخلفية للصفحات إلى: ';

  @override
  String get change_text_color => 'تغيير لون النص إلى: ';

  @override
  String get change_text_color_shade => 'تغيير لون النص إلى: ';

  @override
  String get color_adjustment => 'تعديل الألوان';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'عادي',
        'lowSaturation': 'تشبع منخفض',
        'normal': 'عادي',
        'highSaturation': 'تشبع مرتفع',
        'monochrome': 'أحادي اللون',
        'highContrast': 'تباين عالي',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'ملف اللون الحالي هو: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'لون غير معروف',
        'cF44336': 'أحمر',
        'cE91E63': 'وردي',
        'c9C27B0': 'أرجواني',
        'c673AB7': 'أرجواني غامق',
        'c3F51B5': 'نيلي',
        'c2196F3': 'أزرق',
        'c03A9F4': 'أزرق فاتح',
        'c00BCD4': 'سماوي',
        'c009688': 'أخضر مزرق',
        'c4CAF50': 'أخضر',
        'c8BC34A': 'أخضر فاتح',
        'cCDDC39': 'ليموني',
        'cFFEB3B': 'أصفر',
        'cFFC107': 'كهرماني',
        'cFF9800': 'برتقالي',
        'cFF5722': 'برتقالي غامق',
        'c795548': 'بني',
        'c9E9E9E': 'رمادي',
        'c607D8B': 'رمادي مزرق',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'تقليل مسافة الكلمات';

  @override
  String get decrement_letter_spacing => 'تقليل مسافة الحروف';

  @override
  String get decrement_line_height => 'تقليل ارتفاع الخط';

  @override
  String get decrement_text_scale_factor => 'تقليل عوامل تغيير النص';

  @override
  String get effects => 'تأثيرات';

  @override
  String get expand_text => 'توسيع النص';

  @override
  String get font_size => 'حجم النص';

  @override
  String get increase_or_decrease_word_spacing =>
      'زيادة أو تقليل مسافة الكلمات';

  @override
  String get increase_or_decrease_letter_spacing =>
      'زيادة أو تقليل مسافة الحروف';

  @override
  String get increase_or_decrease_line_height => 'زيادة أو تقليل ارتفاع الخط';

  @override
  String get increase_or_decrease_text_size => 'زيادة أو تقليل حجم النص';

  @override
  String get increment_word_spacing => 'زيادة مسافة الكلمات';

  @override
  String get increment_letter_spacing => 'زيادة مسافة الحروف';

  @override
  String get increment_line_height => 'زيادة ارتفاع الخط';

  @override
  String get increment_text_scale_factor => 'زيادة عوامل تغيير النص';

  @override
  String get less_info => 'إغلاق المعلومات';

  @override
  String get letter_spacing => 'مسافة الحروف';

  @override
  String get line_height => 'ارتفاع الخط';

  @override
  String get more_info => 'مزيد من المعلومات';

  @override
  String get read_less => 'قراءة أقل';

  @override
  String get read_more => 'قراءة المزيد';

  @override
  String get reduce_effects => 'تقليل تأثيرات الشاشة';

  @override
  String get reduce_text => 'تقليل النص';

  @override
  String get restore_settings => 'استعادة الإعدادات الافتراضية';

  @override
  String get restore_main_color => 'إعادة اللون الرئيسي';

  @override
  String get return_to_main_colors => 'إرجاع إلى الألوان الرئيسي';

  @override
  String get settings => 'إعدادات التطبيق';

  @override
  String get size_and_text_display => 'حجم النص وعرض النص';

  @override
  String get slider_word_spacing => 'مسافة الكلمات';

  @override
  String get slider_letter_spacing => 'مسافة الحروف';

  @override
  String get slider_line_height => 'ارتفاع الخط';

  @override
  String get theme_mode => 'الوضع';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'ملف الوضع غير معرف',
        'seizureSafe': 'آمن للنوبات',
        'visionImpaired': 'لضعاف البصر',
        'adhdFriendly': 'مناسب لاضطراب فرط الحركة',
        'none': 'افتراضي',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'وضع الأمان للنوبات';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'إزالة الألوان والرسوم المتحركة المسببة للنوبات';

  @override
  String get theme_profile_seizure_safe_description =>
      'هذا الوضع يساعد المستخدمين المعرضين للنوبات على تصفح التطبيق بأمان من خلال إزالة الرسوم المتحركة السريعة والألوان التي قد تسبب النوبات.';

  @override
  String get theme_profile_vision_impaired_title => 'وضع ضعف البصر';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'تحسين وضوح وقراءة التطبيق';

  @override
  String get theme_profile_vision_impaired_description =>
      'هذا الوضع يجعل التطبيق أكثر وضوحًا وأسهل قراءة للمستخدمين الذين لديهم مشاكل في الرؤية مثل ضعف البصر أو ألوان متداخلة.';

  @override
  String get theme_profile_adhd_friendly_title =>
      'وضع مناسب لاضطراب فرط الحركة وتشتت الانتباه (ADHD)';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'تعزيز التركيز وتقليل التشتت';

  @override
  String get theme_profile_adhd_friendly_description =>
      'هذا الوضع يقلل من العناصر المشتتة ويعزز التركيز لمساعدة المستخدمين الذين يعانون من اضطراب فرط الحركة وتشتت الانتباه على استخدام التطبيق بسهولة.';

  @override
  String get the_settings_have_been_reset => 'تم إعادة الإعدادات.';

  @override
  String get toggle_dark_mode => 'تبديل الوضع المظلم';

  @override
  String get toggle_effects_mode => 'تبديل تأثيرات الشاشة';

  @override
  String get toggle_font_weight => 'تبديل وزن الخط';

  @override
  String get toggle_theme_profile => 'تبديل ملف الوضع';

  @override
  String get word_spacing => 'مسافة الكلمات';

  @override
  String get accessible_font => 'خط سهل القراءة';

  @override
  String get accessible_font_subtitle => 'استخدام خط Verdana لقراءة أفضل';

  @override
  String get accessible_font_enabled => 'الخط سهل القراءة مفعل';

  @override
  String get accessible_font_disabled => 'الخط سهل القراءة معطل';

  @override
  String get toggle_accessible_font => 'تبديل الخط سهل القراءة';
}
