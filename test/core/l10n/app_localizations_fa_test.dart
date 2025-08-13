import 'package:accessibility/src/core/l10n/generated/app_localizations_fa.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsFa', () {
    late AccessibilityLocalizationsFa loc;

    setUp(() {
      loc = AccessibilityLocalizationsFa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('fa'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('دسترسی‌پذیری'));
      expect(
        loc.accessibility_settings,
        equals('تنظیمات دسترسی‌پذیری'),
      );
      expect(
        loc.adjust_background_colors,
        equals('تنظیم رنگ‌های پس‌زمینه'),
      );
      expect(loc.adjust_text_colors, equals('تنظیم رنگ‌های متن'));
      expect(loc.align_center, equals('تراز وسط'));
      expect(loc.align_left, equals('تراز چپ'));
      expect(loc.align_right, equals('تراز راست'));
      expect(loc.bold_text, equals('متن پررنگ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('تغییر پررنگی متن'));
      expect(
        loc.change_pages_background_color,
        equals('تغییر رنگ پس‌زمینه صفحات به: '),
      );
      expect(loc.change_text_color, equals('تغییر رنگ متن به: '));
      expect(loc.change_text_color_shade, equals('تغییر سایه رنگ به: '));
      expect(loc.color_adjustment, equals('تنظیم رنگ'));
      expect(
        loc.color_profile_changed_to,
        equals('پروفایل رنگ فعلی است: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('کاهش فاصله بین کلمات'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('کاهش فاصله بین حروف'),
      );
      expect(loc.decrement_line_height, equals('کاهش ارتفاع خط'));
      expect(
        loc.decrement_text_scale_factor,
        equals('کاهش ضریب مقیاس متن'),
      );
      expect(
        loc.increment_word_spacing,
        equals('افزایش فاصله بین کلمات'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('افزایش فاصله بین حروف'),
      );
      expect(loc.increment_line_height, equals('افزایش ارتفاع خط'));
      expect(
        loc.increment_text_scale_factor,
        equals('افزایش ضریب مقیاس متن'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('افزایش یا کاهش فاصله بین کلمات'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('افزایش یا کاهش فاصله بین حروف'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('افزایش یا کاهش ارتفاع خط'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('افزایش یا کاهش اندازه متن'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('جلوه‌ها'));
      expect(loc.expand_text, equals('گسترش متن'));
      expect(loc.font_size, equals('اندازه قلم'));
      expect(loc.less_info, equals('پنهان کردن اطلاعات'));
      expect(loc.letter_spacing, equals('فاصله بین حروف'));
      expect(loc.line_height, equals('ارتفاع خط'));
      expect(loc.more_info, equals('نمایش اطلاعات'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('کمتر بخوانید'));
      expect(loc.read_more, equals('بیشتر بخوانید'));
      expect(
        loc.reduce_effects,
        equals('کاهش جلوه‌های صفحه نمایش'),
      );
      expect(loc.reduce_text, equals('کاهش متن'));
      expect(loc.restore_settings, equals('بازگردانی تنظیمات'));
      expect(loc.restore_main_color, equals('بازگردانی رنگ اصلی'));
      expect(
        loc.return_to_main_colors,
        equals('بازگشت به رنگ‌های اصلی'),
      );
      expect(loc.settings, equals('تنظیمات'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('اندازه و نمایش متن'),
      );
      expect(loc.slider_word_spacing, equals('لغزنده فاصله بین کلمات'));
      expect(loc.slider_letter_spacing, equals('لغزنده فاصله بین حروف'));
      expect(loc.slider_line_height, equals('لغزنده ارتفاع خط'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('پروفایل تم شناسایی نشد'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('ایمن برای صرع'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('مناسب برای اختلال بینایی'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('مناسب برای اختلال نقص توجه و بیش‌فعالی'),
      );
      expect(loc.theme_profile('none'), equals('پیش‌فرض'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('پروفایل ایمن برای صرع'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('حذف انعکاس‌ها و کاهش رنگ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'این پروفایل به کاربرانی که صرع دارند و در معرض خطر حمله‌های صرع '
          'هستند امکان می‌دهد تا با حذف خطر حملات ناشی از انیمیشن‌های '
          'چشمک‌زن و ترکیبات رنگی پرخطر، به طور ایمن مرور کنند.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('پروفایل مناسب برای اختلال بینایی'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('بهبود دید برنامه'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'این پروفایل برنامه را طوری تنظیم می‌کند که برای بیشتر اختلالات '
          'بینایی قابل دسترس باشد، مانند ضعف بینایی، دید تونلی، آب '
          'مروارید، آب سیاه و سایر موارد.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('پروفایل سازگار با اختلال نقص توجه و بیش‌فعالی'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('تمرکز بیشتر و حواس‌پرتی کمتر'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'این پروفایل به طور قابل توجهی حواس‌پرتی‌ها را کاهش می‌دهد، تا '
          'به افراد مبتلا به اختلال نقص توجه و بیش‌فعالی و اختلالات رشد '
          'عصبی کمک کند تا راحت‌تر در برنامه ناوبری کنند، مطالب را '
          'بخوانند و بر عناصر اصلی برنامه تمرکز کنند.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('تنظیمات بازنشانی شده‌اند.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('تغییر حالت تاریک'));
      expect(loc.toggle_effects_mode, equals('تغییر حالت جلوه‌ها'));
      expect(loc.toggle_font_weight, equals('تغییر ضخامت قلم'));
      expect(loc.toggle_theme_profile, equals('تغییر پروفایل تم'));
      expect(loc.word_spacing, equals('فاصله بین کلمات'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('اشباع کم'));
      expect(loc.color_profile('normal'), equals('عادی'));
      expect(loc.color_profile('highSaturation'), equals('اشباع بالا'));
      expect(loc.color_profile('monochrome'), equals('تک‌رنگ'));
      expect(loc.color_profile('highContrast'), equals('کنتراست بالا'));
      expect(loc.color_profile('unknown'), equals('عادی'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('قرمز'));
      expect(loc.color('cE91E63'), equals('صورتی'));
      expect(loc.color('c9C27B0'), equals('بنفش'));
      expect(loc.color('c673AB7'), equals('بنفش تیره'));
      expect(loc.color('c3F51B5'), equals('نیلی'));
      expect(loc.color('c2196F3'), equals('آبی'));
      expect(loc.color('c03A9F4'), equals('آبی روشن'));
      expect(loc.color('c00BCD4'), equals('فیروزه‌ای'));
      expect(loc.color('c009688'), equals('سبز آبی'));
      expect(loc.color('c4CAF50'), equals('سبز'));
      expect(loc.color('c8BC34A'), equals('سبز روشن'));
      expect(loc.color('cCDDC39'), equals('لیمویی'));
      expect(loc.color('cFFEB3B'), equals('زرد'));
      expect(loc.color('cFFC107'), equals('کهربایی'));
      expect(loc.color('cFF9800'), equals('نارنجی'));
      expect(loc.color('cFF5722'), equals('نارنجی تیره'));
      expect(loc.color('c795548'), equals('قهوه‌ای'));
      expect(loc.color('c9E9E9E'), equals('خاکستری'));
      expect(loc.color('c607D8B'), equals('خاکستری آبی'));
      expect(loc.color('unknown'), equals('رنگ شناسایی نشد'));
    });
  });
}
