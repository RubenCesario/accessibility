import 'package:accessibility/src/core/l10n/generated/app_localizations_ur.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsUr', () {
    late AccessibilityLocalizationsUr loc;

    setUp(() {
      loc = AccessibilityLocalizationsUr();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ur'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('رسائی'));
      expect(
        loc.accessibility_settings,
        equals('رسائی کی ترتیبات'),
      );
      expect(
        loc.adjust_background_colors,
        equals('پس منظر کے رنگ کو ایڈجسٹ کریں'),
      );
      expect(loc.adjust_text_colors, equals('متن کے رنگ کو ایڈجسٹ کریں'));
      expect(loc.align_center, equals('درمیان میں منظم کریں'));
      expect(loc.align_left, equals('بائیں منظم کریں'));
      expect(loc.align_right, equals('دائیں منظم کریں'));
      expect(loc.bold_text, equals('موٹا متن'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('موٹے متن کو تبدیل کریں'));
      expect(
        loc.change_pages_background_color,
        equals('صفحات کے پس منظر کا رنگ تبدیل کریں: '),
      );
      expect(
        loc.change_text_color,
        equals('متن کا رنگ تبدیل کریں: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('رنگ کی شیڈ کو تبدیل کریں: '),
      );
      expect(loc.color_adjustment, equals('رنگ کی ایڈجسٹمنٹ'));
      expect(
        loc.color_profile_changed_to,
        equals('موجودہ رنگ پروفائل ہے: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('الفاظ کے درمیان فاصلہ کم کریں'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('حروف کے درمیان فاصلہ کم کریں'),
      );
      expect(loc.decrement_line_height, equals('سطر کی اونچائی کم کریں'));
      expect(
        loc.decrement_text_scale_factor,
        equals('متن کے پیمانے کا عنصر کم کریں'),
      );
      expect(
        loc.increment_word_spacing,
        equals('الفاظ کے درمیان فاصلہ بڑھائیں'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('حروف کے درمیان فاصلہ بڑھائیں'),
      );
      expect(loc.increment_line_height, equals('سطر کی اونچائی بڑھائیں'));
      expect(
        loc.increment_text_scale_factor,
        equals('متن کے پیمانے کا عنصر بڑھائیں'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('الفاظ کے درمیان فاصلہ بڑھائیں یا کم کریں'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('حروف کے درمیان فاصلہ بڑھائیں یا کم کریں'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('سطر کی اونچائی بڑھائیں یا کم کریں'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('متن کا سائز بڑھائیں یا کم کریں'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('اثرات'));
      expect(loc.expand_text, equals('متن کو پھیلائیں'));
      expect(loc.font_size, equals('حرف کا سائز'));
      expect(loc.less_info, equals('معلومات چھپائیں'));
      expect(loc.letter_spacing, equals('حروف کے درمیان فاصلہ'));
      expect(loc.line_height, equals('سطر کی اونچائی'));
      expect(loc.more_info, equals('معلومات دکھائیں'));
      expect(loc.word_spacing, equals('الفاظ کے درمیان فاصلہ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('کم پڑھیں'));
      expect(loc.read_more, equals('مزید پڑھیں'));
      expect(
        loc.reduce_effects,
        equals('اسکرین پر اثرات کم کریں'),
      );
      expect(loc.reduce_text, equals('متن کو کم کریں'));
      expect(loc.restore_settings, equals('ترتیبات بحال کریں'));
      expect(loc.restore_main_color, equals('اصل رنگ بحال کریں'));
      expect(
        loc.return_to_main_colors,
        equals('اصل رنگوں پر واپس جائیں'),
      );
      expect(loc.settings, equals('ترتیبات'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('سائز اور متن کی نمائش'),
      );
      expect(
        loc.slider_word_spacing,
        equals('سلائیڈر الفاظ کے درمیان فاصلہ'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('سلائیڈر حروف کے درمیان فاصلہ'),
      );
      expect(loc.slider_line_height, equals('سلائیڈر سطر کی اونچائی'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('تھیم'));
      expect(
        loc.theme_profile('other'),
        equals('تھیم پروفائل شناخت نہیں ہوا'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('دورے سے محفوظ'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('بصارت سے متاثر'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD دوستانہ'),
      );
      expect(loc.theme_profile('none'), equals('ڈیفالٹ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('دورے سے محفوظ پروفائل'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('عکاسی کو ختم کریں اور رنگ کو کم کریں'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals('یہ پروفائل مرگی والے اور دورے کے خطرے والے '
            'صارفین کو چمکدار اینیمیشن اور خطرناک رنگوں '
            'کے مجموعے سے پیدا ہونے والے دوروں کے خطرے '
            'کو ختم کرکے محفوظ طریقے سے براؤز کرنے کی '
            'اجازت دیتا ہے۔'),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('بصارت سے متاثر پروفائل'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ایپلیکیشن کی نظر آنے کی صلاحیت کو بہتر بنائیں'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals('یہ پروفائل ایپلیکیشن کو زیادہ تر بصری نقائص '
            'جیسے بصارت کی خرابی، ٹنل وژن، موتیا بند، '
            'گلوکوما وغیرہ کے لیے قابل رسائی بنانے کے لیے '
            'موافق بناتا ہے۔'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD دوستانہ پروفائل'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('زیادہ توجہ اور کم مداخلت'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals('یہ پروفائل مداخلتوں کو نمایاں طور پر کم کرتا '
            'ہے، تاکہ ADHD اور عصبی نشونما کے عوارض والے '
            'لوگوں کو آسانی سے نیویگیٹ کرنے، پڑھنے اور '
            'ایپلیکیشن کے ضروری عناصر پر توجہ مرکوز کرنے '
            'میں مدد ملے۔'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ترتیبات کو ری سیٹ کر دیا گیا ہے۔'),
      );
      expect(loc.toggle_dark_mode, equals('ڈارک موڈ کو ٹوگل کریں'));
      expect(loc.toggle_effects_mode, equals('اثرات موڈ کو ٹوگل کریں'));
      expect(loc.toggle_font_weight, equals('حرف کے وزن کو ٹوگل کریں'));
      expect(loc.toggle_theme_profile, equals('تھیم پروفائل کو ٹوگل کریں'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('معمول'));
      expect(loc.color_profile('lowSaturation'), equals('کم سیرابی'));
      expect(loc.color_profile('normal'), equals('معمول'));
      expect(loc.color_profile('highSaturation'), equals('زیادہ سیرابی'));
      expect(loc.color_profile('monochrome'), equals('یک رنگی'));
      expect(loc.color_profile('highContrast'), equals('زیادہ تضاد'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('رنگ شناخت نہیں ہوا'));
      expect(loc.color('cF44336'), equals('سرخ'));
      expect(loc.color('cE91E63'), equals('گلابی'));
      expect(loc.color('c9C27B0'), equals('ارغوانی'));
      expect(loc.color('c673AB7'), equals('گہرا ارغوانی'));
      expect(loc.color('c3F51B5'), equals('نیلگون'));
      expect(loc.color('c2196F3'), equals('نیلا'));
      expect(loc.color('c03A9F4'), equals('ہلکا نیلا'));
      expect(loc.color('c00BCD4'), equals('فیروزی'));
      expect(loc.color('c009688'), equals('سبز نیلا'));
      expect(loc.color('c4CAF50'), equals('سبز'));
      expect(loc.color('c8BC34A'), equals('ہلکا سبز'));
      expect(loc.color('cCDDC39'), equals('لائم'));
      expect(loc.color('cFFEB3B'), equals('پیلا'));
      expect(loc.color('cFFC107'), equals('کہربائی'));
      expect(loc.color('cFF9800'), equals('نارنجی'));
      expect(loc.color('cFF5722'), equals('گہرا نارنجی'));
      expect(loc.color('c795548'), equals('بھورا'));
      expect(loc.color('c9E9E9E'), equals('سلیٹی'));
      expect(loc.color('c607D8B'), equals('نیلا سلیٹی'));
    });
  });
}
