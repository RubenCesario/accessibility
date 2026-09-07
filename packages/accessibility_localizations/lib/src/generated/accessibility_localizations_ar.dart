// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AccessibilityLocalizationsAr extends AccessibilityLocalizations {
  AccessibilityLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get accessibility => 'الوصول';

  @override
  String get accessibilitySettings => 'إعدادات الوصول';

  @override
  String get adjustBackgroundColors => 'تعديل الألوان الخلفية';

  @override
  String get adjustTextColors => 'تعديل الألوان النصية';

  @override
  String get alignCenter => 'محاذاة المركز';

  @override
  String get alignLeft => 'محاذاة اليسار';

  @override
  String get alignRight => 'محاذاة اليمين';

  @override
  String get textAlignment => 'محاذاة النص';

  @override
  String get boldText => 'نص غامق';

  @override
  String get changeBoldText => 'تغيير النص الغامق';

  @override
  String get changePagesBackgroundColor => 'تغيير لون الخلفية للصفحات إلى: ';

  @override
  String get changeTextColor => 'تغيير لون النص إلى: ';

  @override
  String get changeTextColorShade => 'تغيير لون النص إلى: ';

  @override
  String get colorAdjustment => 'تعديل الألوان';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'عادي',
      'lowSaturation': 'تشبع منخفض',
      'normal': 'عادي',
      'highSaturation': 'تشبع مرتفع',
      'monochrome': 'أحادي اللون',
      'highContrast': 'تباين عالي',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ملف اللون الحالي هو: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'تقليل مسافة الكلمات';

  @override
  String get decrementLetterSpacing => 'تقليل مسافة الحروف';

  @override
  String get decrementLineHeight => 'تقليل ارتفاع الخط';

  @override
  String get decrementTextScaleFactor => 'تقليل عوامل تغيير النص';

  @override
  String get effects => 'تأثيرات';

  @override
  String get expandText => 'توسيع النص';

  @override
  String get fontSize => 'حجم النص';

  @override
  String get increaseOrDecreaseWordSpacing => 'زيادة أو تقليل مسافة الكلمات';

  @override
  String get increaseOrDecreaseLetterSpacing => 'زيادة أو تقليل مسافة الحروف';

  @override
  String get increaseOrDecreaseLineHeight => 'زيادة أو تقليل ارتفاع الخط';

  @override
  String get increaseOrDecreaseTextSize => 'زيادة أو تقليل حجم النص';

  @override
  String get incrementWordSpacing => 'زيادة مسافة الكلمات';

  @override
  String get incrementLetterSpacing => 'زيادة مسافة الحروف';

  @override
  String get incrementLineHeight => 'زيادة ارتفاع الخط';

  @override
  String get incrementTextScaleFactor => 'زيادة عوامل تغيير النص';

  @override
  String get lessInfo => 'إغلاق المعلومات';

  @override
  String get letterSpacing => 'مسافة الحروف';

  @override
  String get lineHeight => 'ارتفاع الخط';

  @override
  String get moreInfo => 'مزيد من المعلومات';

  @override
  String get readLess => 'قراءة أقل';

  @override
  String get readMore => 'قراءة المزيد';

  @override
  String get reduceEffects => 'تقليل تأثيرات الشاشة';

  @override
  String get reduceText => 'تقليل النص';

  @override
  String get restoreSettings => 'استعادة الإعدادات الافتراضية';

  @override
  String get restoreMainColor => 'إعادة اللون الرئيسي';

  @override
  String get returnToMainColors => 'إرجاع إلى الألوان الرئيسي';

  @override
  String get settings => 'إعدادات التطبيق';

  @override
  String get sizeAndTextDisplay => 'حجم النص وعرض النص';

  @override
  String get sliderWordSpacing => 'مسافة الكلمات';

  @override
  String get sliderLetterSpacing => 'مسافة الحروف';

  @override
  String get sliderLineHeight => 'ارتفاع الخط';

  @override
  String get themeMode => 'الوضع';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ملف الوضع غير معرف',
      'seizureSafe': 'آمن للنوبات',
      'visionImpaired': 'لضعاف البصر',
      'adhdFriendly': 'مناسب لاضطراب فرط الحركة',
      'none': 'الملف الافتراضي',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'وضع الأمان للنوبات';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'إزالة الألوان والرسوم المتحركة المسببة للنوبات';

  @override
  String get themeProfileSeizureSafeDescription =>
      'هذا الوضع يساعد المستخدمين المعرضين للنوبات على تصفح التطبيق بأمان من خلال إزالة الرسوم المتحركة السريعة والألوان التي قد تسبب النوبات.';

  @override
  String get themeProfileVisionImpairedTitle => 'وضع ضعف البصر';

  @override
  String get themeProfileVisionImpairedSubtitle => 'تحسين وضوح وقراءة التطبيق';

  @override
  String get themeProfileVisionImpairedDescription =>
      'هذا الوضع يجعل التطبيق أكثر وضوحًا وأسهل قراءة للمستخدمين الذين لديهم مشاكل في الرؤية مثل ضعف البصر أو ألوان متداخلة.';

  @override
  String get themeProfileAdhdFriendlyTitle =>
      'وضع مناسب لاضطراب فرط الحركة وتشتت الانتباه (ADHD)';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'تعزيز التركيز وتقليل التشتت';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'هذا الوضع يقلل من العناصر المشتتة ويعزز التركيز لمساعدة المستخدمين الذين يعانون من اضطراب فرط الحركة وتشتت الانتباه على استخدام التطبيق بسهولة.';

  @override
  String get theSettingsHaveBeenReset => 'تم إعادة الإعدادات.';

  @override
  String get toggleDarkMode => 'تبديل الوضع المظلم';

  @override
  String get toggleEffectsMode => 'تبديل تأثيرات الشاشة';

  @override
  String get toggleFontWeight => 'تبديل وزن الخط';

  @override
  String get toggleThemeProfile => 'تبديل ملف الوضع';

  @override
  String get wordSpacing => 'مسافة الكلمات';

  @override
  String get accessibleFont => 'خط سهل القراءة';

  @override
  String get accessibleFontSubtitle => 'استخدم خطًا سهل القراءة لقراءة أفضل';

  @override
  String get accessibleFontEnabled => 'الخط سهل القراءة مفعل';

  @override
  String get accessibleFontDisabled => 'الخط سهل القراءة معطل';

  @override
  String get toggleAccessibleFont => 'تبديل الخط سهل القراءة';

  @override
  String get settingsLoading => 'جارٍ تحميل إعدادات الوصول…';

  @override
  String get settingsLoadFailed => 'تعذر تحميل إعدادات الوصول.';

  @override
  String get retry => 'إعادة المحاولة';
}
