// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AccessibilityLocalizationsUr extends AccessibilityLocalizations {
  AccessibilityLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get accessibility => 'رسائی';

  @override
  String get accessibility_settings => 'رسائی کی ترتیبات';

  @override
  String get adjust_background_colors => 'پس منظر کے رنگ کو ایڈجسٹ کریں';

  @override
  String get adjust_text_colors => 'متن کے رنگ کو ایڈجسٹ کریں';

  @override
  String get align_center => 'درمیان میں منظم کریں';

  @override
  String get align_left => 'بائیں منظم کریں';

  @override
  String get align_right => 'دائیں منظم کریں';

  @override
  String get bold_text => 'موٹا متن';

  @override
  String get change_bold_text => 'موٹے متن کو تبدیل کریں';

  @override
  String get change_pages_background_color =>
      'صفحات کے پس منظر کا رنگ تبدیل کریں: ';

  @override
  String get change_text_color => 'متن کا رنگ تبدیل کریں: ';

  @override
  String get change_text_color_shade => 'رنگ کی شیڈ کو تبدیل کریں: ';

  @override
  String get color_adjustment => 'رنگ کی ایڈجسٹمنٹ';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'موجودہ رنگ پروفائل ہے: ';

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
  String get decrement_word_spacing => 'الفاظ کے درمیان فاصلہ کم کریں';

  @override
  String get decrement_letter_spacing => 'حروف کے درمیان فاصلہ کم کریں';

  @override
  String get decrement_line_height => 'سطر کی اونچائی کم کریں';

  @override
  String get decrement_text_scale_factor => 'متن کے پیمانے کا عنصر کم کریں';

  @override
  String get effects => 'اثرات';

  @override
  String get expand_text => 'متن کو پھیلائیں';

  @override
  String get font_size => 'حرف کا سائز';

  @override
  String get increase_or_decrease_word_spacing =>
      'الفاظ کے درمیان فاصلہ بڑھائیں یا کم کریں';

  @override
  String get increase_or_decrease_letter_spacing =>
      'حروف کے درمیان فاصلہ بڑھائیں یا کم کریں';

  @override
  String get increase_or_decrease_line_height =>
      'سطر کی اونچائی بڑھائیں یا کم کریں';

  @override
  String get increase_or_decrease_text_size => 'متن کا سائز بڑھائیں یا کم کریں';

  @override
  String get increment_word_spacing => 'الفاظ کے درمیان فاصلہ بڑھائیں';

  @override
  String get increment_letter_spacing => 'حروف کے درمیان فاصلہ بڑھائیں';

  @override
  String get increment_line_height => 'سطر کی اونچائی بڑھائیں';

  @override
  String get increment_text_scale_factor => 'متن کے پیمانے کا عنصر بڑھائیں';

  @override
  String get less_info => 'معلومات چھپائیں';

  @override
  String get letter_spacing => 'حروف کے درمیان فاصلہ';

  @override
  String get line_height => 'سطر کی اونچائی';

  @override
  String get more_info => 'معلومات دکھائیں';

  @override
  String get read_less => 'کم پڑھیں';

  @override
  String get read_more => 'مزید پڑھیں';

  @override
  String get reduce_effects => 'اسکرین پر اثرات کم کریں';

  @override
  String get reduce_text => 'متن کو کم کریں';

  @override
  String get restore_settings => 'ترتیبات بحال کریں';

  @override
  String get restore_main_color => 'اصل رنگ بحال کریں';

  @override
  String get return_to_main_colors => 'اصل رنگوں پر واپس جائیں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get size_and_text_display => 'سائز اور متن کی نمائش';

  @override
  String get slider_word_spacing => 'سلائیڈر الفاظ کے درمیان فاصلہ';

  @override
  String get slider_letter_spacing => 'سلائیڈر حروف کے درمیان فاصلہ';

  @override
  String get slider_line_height => 'سلائیڈر سطر کی اونچائی';

  @override
  String get theme_mode => 'تھیم';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'تھیم پروفائل شناخت نہیں ہوا',
      'seizureSafe': 'دورے سے محفوظ',
      'visionImpaired': 'بصارت سے متاثر',
      'adhdFriendly': 'ADHD دوستانہ',
      'none': 'ڈیفالٹ',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'دورے سے محفوظ پروفائل';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'عکاسی کو ختم کریں اور رنگ کو کم کریں';

  @override
  String get theme_profile_seizure_safe_description =>
      'یہ پروفائل مرگی والے اور دورے کے خطرے والے صارفین کو چمکدار اینیمیشن اور خطرناک رنگوں کے مجموعے سے پیدا ہونے والے دوروں کے خطرے کو ختم کرکے محفوظ طریقے سے براؤز کرنے کی اجازت دیتا ہے۔';

  @override
  String get theme_profile_vision_impaired_title => 'بصارت سے متاثر پروفائل';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ایپلیکیشن کی نظر آنے کی صلاحیت کو بہتر بنائیں';

  @override
  String get theme_profile_vision_impaired_description =>
      'یہ پروفائل ایپلیکیشن کو زیادہ تر بصری نقائص جیسے بصارت کی خرابی، ٹنل وژن، موتیا بند، گلوکوما وغیرہ کے لیے قابل رسائی بنانے کے لیے موافق بناتا ہے۔';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD دوستانہ پروفائل';

  @override
  String get theme_profile_adhd_friendly_subtitle => 'زیادہ توجہ اور کم مداخلت';

  @override
  String get theme_profile_adhd_friendly_description =>
      'یہ پروفائل مداخلتوں کو نمایاں طور پر کم کرتا ہے، تاکہ ADHD اور عصبی نشونما کے عوارض والے لوگوں کو آسانی سے نیویگیٹ کرنے، پڑھنے اور ایپلیکیشن کے ضروری عناصر پر توجہ مرکوز کرنے میں مدد ملے۔';

  @override
  String get the_settings_have_been_reset => 'ترتیبات کو ری سیٹ کر دیا گیا ہے۔';

  @override
  String get toggle_dark_mode => 'ڈارک موڈ کو ٹوگل کریں';

  @override
  String get toggle_effects_mode => 'اثرات موڈ کو ٹوگل کریں';

  @override
  String get toggle_font_weight => 'حرف کے وزن کو ٹوگل کریں';

  @override
  String get toggle_theme_profile => 'تھیم پروفائل کو ٹوگل کریں';

  @override
  String get word_spacing => 'الفاظ کے درمیان فاصلہ';
}
