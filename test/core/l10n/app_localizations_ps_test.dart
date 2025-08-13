import 'package:accessibility/src/core/l10n/generated/app_localizations_ps.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsPs', () {
    late AccessibilityLocalizationsPs loc;

    setUp(() {
      loc = AccessibilityLocalizationsPs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ps'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('لاسرسی'));
      expect(loc.accessibility_settings, equals('د لاسرسي تنظیمات'));
      expect(
        loc.adjust_background_colors,
        equals('د شاته رنگونه تنظیم کړئ'),
      );
      expect(loc.adjust_text_colors, equals('د متن رنگونه تنظیم کړئ'));
      expect(loc.align_center, equals('منځ ته برابر کړئ'));
      expect(loc.align_left, equals('کیڼ ته برابر کړئ'));
      expect(loc.align_right, equals('ښي ته برابر کړئ'));
      expect(loc.bold_text, equals('پنډ متن'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('پنډ متن بدل کړئ'));
      expect(
        loc.change_pages_background_color,
        equals('د پاڼو د شاته رنگ بدل کړئ په: '),
      );
      expect(loc.change_text_color, equals('د متن رنگ بدل کړئ په: '));
      expect(loc.change_text_color_shade, equals('د رنگ سيوری بدل کړئ په: '));
      expect(loc.color_adjustment, equals('د رنگ تنظیم'));
      expect(
        loc.color_profile_changed_to,
        equals('اوسنی د رنگ پروفايل دی: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('د کلمو ترمنځ واټن کم کړئ'));
      expect(
        loc.decrement_letter_spacing,
        equals('د تورو ترمنځ واټن کم کړئ'),
      );
      expect(loc.decrement_line_height, equals('د کرښې لوړوالی کم کړئ'));
      expect(
        loc.decrement_text_scale_factor,
        equals('د متن د مقياس فکټور کم کړئ'),
      );
      expect(loc.increment_word_spacing, equals('د کلمو ترمنځ واټن زيات کړئ'));
      expect(
        loc.increment_letter_spacing,
        equals('د تورو ترمنځ واټن زيات کړئ'),
      );
      expect(loc.increment_line_height, equals('د کرښې لوړوالی زيات کړئ'));
      expect(
        loc.increment_text_scale_factor,
        equals('د متن د مقياس فکټور زيات کړئ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('د کلمو ترمنځ واټن زيات يا کم کړئ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('د تورو ترمنځ واټن زيات يا کم کړئ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('د کرښې لوړوالی زيات يا کم کړئ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('د متن اندازه زيات يا کم کړئ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('اغېزې'));
      expect(loc.expand_text, equals('متن پراخ کړئ'));
      expect(loc.font_size, equals('د ليک اندازه'));
      expect(loc.less_info, equals('معلومات پټ کړئ'));
      expect(loc.letter_spacing, equals('د تورو ترمنځ واټن'));
      expect(loc.line_height, equals('د کرښې لوړوالی'));
      expect(loc.more_info, equals('معلومات ښکاره کړئ'));
      expect(loc.word_spacing, equals('د کلمو ترمنځ واټن'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('لږ ولولئ'));
      expect(loc.read_more, equals('نور ولولئ'));
      expect(loc.reduce_effects, equals('په سکرين باندې اغېزې کمې کړئ'));
      expect(loc.reduce_text, equals('متن کم کړئ'));
      expect(
        loc.restore_settings,
        equals('تنظیمات بیا په خپل حالت راولئ'),
      );
      expect(
        loc.restore_main_color,
        equals('اصلي رنگ بیا په خپل حالت راولئ'),
      );
      expect(
        loc.return_to_main_colors,
        equals('اصلي رنگونو ته بېرته راوګرځئ'),
      );
      expect(loc.settings, equals('تنظیمات'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('د اندازې او متن ښودل'),
      );
      expect(
        loc.slider_word_spacing,
        equals('د کلمو ترمنځ واټن سلايډر'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('د تورو ترمنځ واټن سلايډر'),
      );
      expect(
        loc.slider_line_height,
        equals('د کرښې لوړوالي سلايډر'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('تهیم'));
      expect(
        loc.theme_profile('other'),
        equals('د تهیم پروفايل نه دی پېژندل شوی'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('د ميرګي لپاره خوندي'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('د ليد معذوريت لپاره'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('د ADHD لپاره مناسب'),
      );
      expect(loc.theme_profile('none'), equals('اصلي'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('د ميرگي لپاره خوندي پروفايل'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('انعکاسات لرې کړئ او رنگ کم کړئ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'دا پروفايل هغه کاروونکي ته اجازه ورکوي چې ميرگي '
          'لري او د ميرگي د حملو په خطر کې دي چې په خوندي '
          'توګه براوز وکړي په دې توګه چې د ځلېدونکو '
          'انیمیشنونو او خطرناکه رنگ ترکيبونو له امله د '
          'ميرگي د حملو خطر له منځه وړي.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('د ليد معذوريت پروفايل'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('د اپلیکېشن د ليدلو وړتيا ښه کړئ'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'دا پروفايل اپلیکېشن داسې عياروي چې د زياتره '
          'ليدلو معذوريتونو لپاره د لاسرسي وړ وي، لکه د '
          'ليدلو معذوريت، تونل ليد، مرواريد، گلوکوما او نور.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('د ADHD لپاره مناسب پروفايل'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('زيات تمرکز او لږ حواس پرتي'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'دا پروفايل په پام وړ توګه حواس پرتي کموي، ترڅو '
          'د ADHD او عصبي پرمختیايي اختلالاتو لرونکو '
          'خلکو سره مرسته وکړي چې نيويګيټ کړي، ولولي، او '
          'په اسانۍ سره د اپلیکېشن په اساسي برخو تمرکز وکړي.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('تنظیمات بیا تنظیم شوي دي.'),
      );
      expect(loc.toggle_dark_mode, equals('تور حالت بدل کړئ'));
      expect(loc.toggle_effects_mode, equals('د اغېزو حالت بدل کړئ'));
      expect(loc.toggle_font_weight, equals('د ليک وزن بدل کړئ'));
      expect(loc.toggle_theme_profile, equals('د تهیم پروفايل بدل کړئ'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('نورمال'));
      expect(loc.color_profile('lowSaturation'), equals('ٺيٺ مشبوعيت'));
      expect(loc.color_profile('normal'), equals('نورمال'));
      expect(loc.color_profile('highSaturation'), equals('لوړ مشبوعيت'));
      expect(loc.color_profile('monochrome'), equals('يو رنگه'));
      expect(loc.color_profile('highContrast'), equals('لوړ تضاد'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('رنگ نه دی پېژندل شوی'));
      expect(loc.color('cF44336'), equals('سور'));
      expect(loc.color('cE91E63'), equals('گلابي'));
      expect(loc.color('c9C27B0'), equals('ارغواني'));
      expect(loc.color('c673AB7'), equals('ژور ارغواني'));
      expect(loc.color('c3F51B5'), equals('نيلي'));
      expect(loc.color('c2196F3'), equals('شين'));
      expect(loc.color('c03A9F4'), equals('روښانه شين'));
      expect(loc.color('c00BCD4'), equals('آسماني'));
      expect(loc.color('c009688'), equals('شين شين'));
      expect(loc.color('c4CAF50'), equals('شين'));
      expect(loc.color('c8BC34A'), equals('روښانه شين'));
      expect(loc.color('cCDDC39'), equals('ليمويي'));
      expect(loc.color('cFFEB3B'), equals('ژيړ'));
      expect(loc.color('cFFC107'), equals('کهربايي'));
      expect(loc.color('cFF9800'), equals('نارنجي'));
      expect(loc.color('cFF5722'), equals('ژور نارنجي'));
      expect(loc.color('c795548'), equals('نسواري'));
      expect(loc.color('c9E9E9E'), equals('خړ'));
      expect(loc.color('c607D8B'), equals('شين خړ'));
    });
  });
}
