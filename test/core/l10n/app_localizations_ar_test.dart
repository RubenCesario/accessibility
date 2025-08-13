// ignore_for_file: lines_longer_than_80_chars

import 'package:accessibility/src/core/l10n/generated/app_localizations_ar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsAr', () {
    late AccessibilityLocalizationsAr loc;

    setUp(() {
      loc = AccessibilityLocalizationsAr();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ar'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('الوصول'));
      expect(loc.accessibility_settings, equals('إعدادات الوصول'));
      expect(loc.adjust_background_colors, equals('تعديل الألوان الخلفية'));
      expect(loc.adjust_text_colors, equals('تعديل الألوان النصية'));
      expect(loc.align_center, equals('محاذاة المركز'));
      expect(loc.align_left, equals('محاذاة اليسار'));
      expect(loc.align_right, equals('محاذاة اليمين'));
      expect(loc.bold_text, equals('نص غامق'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('تغيير النص الغامق'));
      expect(
        loc.change_pages_background_color,
        equals('تغيير لون الخلفية للصفحات إلى: '),
      );
      expect(loc.change_text_color, equals('تغيير لون النص إلى: '));
      expect(loc.change_text_color_shade, equals('تغيير لون النص إلى: '));
      expect(loc.color_adjustment, equals('تعديل الألوان'));
      expect(loc.color_profile_changed_to, equals('ملف اللون الحالي هو: '));
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('تقليل مسافة الكلمات'));
      expect(loc.decrement_letter_spacing, equals('تقليل مسافة الحروف'));
      expect(loc.decrement_line_height, equals('تقليل ارتفاع الخط'));
      expect(loc.decrement_text_scale_factor, equals('تقليل عوامل تغيير النص'));
      expect(loc.increment_word_spacing, equals('زيادة مسافة الكلمات'));
      expect(loc.increment_letter_spacing, equals('زيادة مسافة الحروف'));
      expect(loc.increment_line_height, equals('زيادة ارتفاع الخط'));
      expect(loc.increment_text_scale_factor, equals('زيادة عوامل تغيير النص'));
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('زيادة أو تقليل مسافة الكلمات'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('زيادة أو تقليل مسافة الحروف'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('زيادة أو تقليل ارتفاع الخط'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('زيادة أو تقليل حجم النص'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('تأثيرات'));
      expect(loc.expand_text, equals('توسيع النص'));
      expect(loc.font_size, equals('حجم النص'));
      expect(loc.less_info, equals('إغلاق المعلومات'));
      expect(loc.letter_spacing, equals('مسافة الحروف'));
      expect(loc.line_height, equals('ارتفاع الخط'));
      expect(loc.more_info, equals('مزيد من المعلومات'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('قراءة أقل'));
      expect(loc.read_more, equals('قراءة المزيد'));
      expect(loc.reduce_effects, equals('تقليل تأثيرات الشاشة'));
      expect(loc.reduce_text, equals('تقليل النص'));
      expect(loc.restore_settings, equals('استعادة الإعدادات الافتراضية'));
      expect(loc.restore_main_color, equals('إعادة اللون الرئيسي'));
      expect(loc.return_to_main_colors, equals('إرجاع إلى الألوان الرئيسي'));
      expect(loc.settings, equals('إعدادات التطبيق'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('حجم النص وعرض النص'));
      expect(loc.slider_word_spacing, equals('مسافة الكلمات'));
      expect(loc.slider_letter_spacing, equals('مسافة الحروف'));
      expect(loc.slider_line_height, equals('ارتفاع الخط'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_profile('other'), equals('ملف الوضع غير معرف'));
      expect(loc.theme_profile('seizureSafe'), equals('آمن للنوبات'));
      expect(loc.theme_profile('visionImpaired'), equals('لضعاف البصر'));
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('مناسب لاضطراب فرط الحركة'),
      );
      expect(loc.theme_profile('none'), equals('افتراضي'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('وضع الأمان للنوبات'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('إزالة الألوان والرسوم المتحركة المسببة للنوبات'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'هذا الوضع يساعد المستخدمين المعرضين للنوبات على تصفح التطبيق بأمان من خلال إزالة الرسوم المتحركة السريعة والألوان التي قد تسبب النوبات.',
        ),
      );
      expect(loc.theme_profile_vision_impaired_title, equals('وضع ضعف البصر'));
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('تحسين وضوح وقراءة التطبيق'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'هذا الوضع يجعل التطبيق أكثر وضوحًا وأسهل قراءة للمستخدمين الذين لديهم مشاكل في الرؤية مثل ضعف البصر أو ألوان متداخلة.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('وضع مناسب لاضطراب فرط الحركة وتشتت الانتباه (ADHD)'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('تعزيز التركيز وتقليل التشتت'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'هذا الوضع يقلل من العناصر المشتتة ويعزز التركيز لمساعدة المستخدمين الذين يعانون من اضطراب فرط الحركة وتشتت الانتباه على استخدام التطبيق بسهولة.',
        ),
      );
      expect(loc.the_settings_have_been_reset, equals('تم إعادة الإعدادات.'));
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('تبديل الوضع المظلم'));
      expect(loc.toggle_effects_mode, equals('تبديل تأثيرات الشاشة'));
      expect(loc.toggle_font_weight, equals('تبديل وزن الخط'));
      expect(loc.word_spacing, equals('مسافة الكلمات'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('تشبع منخفض'));
      expect(loc.color_profile('normal'), equals('عادي'));
      expect(loc.color_profile('highSaturation'), equals('تشبع مرتفع'));
      expect(loc.color_profile('monochrome'), equals('أحادي اللون'));
      expect(loc.color_profile('highContrast'), equals('تباين عالي'));
      expect(loc.color_profile('unknown'), equals('عادي'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('أحمر'));
      expect(loc.color('cE91E63'), equals('وردي'));
      expect(loc.color('c9C27B0'), equals('أرجواني'));
      expect(loc.color('c673AB7'), equals('أرجواني غامق'));
      expect(loc.color('c3F51B5'), equals('نيلي'));
      expect(loc.color('c2196F3'), equals('أزرق'));
      expect(loc.color('c03A9F4'), equals('أزرق فاتح'));
      expect(loc.color('c00BCD4'), equals('سماوي'));
      expect(loc.color('c009688'), equals('أخضر مزرق'));
      expect(loc.color('c4CAF50'), equals('أخضر'));
      expect(loc.color('c8BC34A'), equals('أخضر فاتح'));
      expect(loc.color('cCDDC39'), equals('ليموني'));
      expect(loc.color('cFFEB3B'), equals('أصفر'));
      expect(loc.color('cFFC107'), equals('كهرماني'));
      expect(loc.color('cFF9800'), equals('برتقالي'));
      expect(loc.color('cFF5722'), equals('برتقالي غامق'));
      expect(loc.color('c795548'), equals('بني'));
      expect(loc.color('c9E9E9E'), equals('رمادي'));
      expect(loc.color('c607D8B'), equals('رمادي مزرق'));
      expect(loc.color('unknown'), equals('لون غير معروف'));
    });
  });
}
