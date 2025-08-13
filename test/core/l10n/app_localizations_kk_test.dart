import 'package:accessibility/src/core/l10n/generated/app_localizations_kk.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsKk', () {
    late AccessibilityLocalizationsKk loc;

    setUp(() {
      loc = AccessibilityLocalizationsKk();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('kk'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Қолжетімділік'));
      expect(
        loc.accessibility_settings,
        equals('Қолжетімділік параметрлері'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Фон түстерін реттеу'),
      );
      expect(loc.adjust_text_colors, equals('Мәтін түстерін реттеу'));
      expect(loc.align_center, equals('Ортаға туралау'));
      expect(loc.align_left, equals('Солға туралау'));
      expect(loc.align_right, equals('Оңға туралау'));
      expect(loc.bold_text, equals('Қалың мәтін'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Қалың мәтінді өзгерту'));
      expect(
        loc.change_pages_background_color,
        equals('Беттердің фон түсін келесіге өзгерту: '),
      );
      expect(
        loc.change_text_color,
        equals('Мәтіннің түсін келесіге өзгерту: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Түстің реңкін келесіге өзгерту: '),
      );
      expect(loc.color_adjustment, equals('Түс реттеу'));
      expect(
        loc.color_profile_changed_to,
        equals('Ағымдағы түс профилі: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Сөздер арасындағы арақашықтықты азайту'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Әріптер арасындағы арақашықтықты азайту'),
      );
      expect(loc.decrement_line_height, equals('Жол биіктігін азайту'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Мәтін масштабы факторын азайту'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Сөздер арасындағы арақашықтықты ұлғайту'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Әріптер арасындағы арақашықтықты ұлғайту'),
      );
      expect(loc.increment_line_height, equals('Жол биіктігін ұлғайту'));
      expect(
        loc.increment_text_scale_factor,
        equals('Мәтін масштабы факторын ұлғайту'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Сөздер арасындағы арақашықтықты ұлғайту немесе азайту'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Әріптер арасындағы арақашықтықты ұлғайту немесе азайту'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Жол биіктігін ұлғайту немесе азайту'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Мәтін өлшемін ұлғайту немесе азайту'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Эффекттер'));
      expect(loc.expand_text, equals('Мәтінді ұлғайту'));
      expect(loc.font_size, equals('Қаріп өлшемі'));
      expect(loc.less_info, equals('Ақпаратты жасыру'));
      expect(
        loc.letter_spacing,
        equals('Әріптер арасындағы арақашықтық'),
      );
      expect(loc.line_height, equals('Жол биіктігі'));
      expect(loc.more_info, equals('Ақпаратты көрсету'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Азырақ оқу'));
      expect(loc.read_more, equals('Көбірек оқу'));
      expect(loc.reduce_effects, equals('Экран эффекттерін азайту'));
      expect(loc.reduce_text, equals('Мәтінді азайту'));
      expect(loc.restore_settings, equals('Параметрлерді қалпына келтіру'));
      expect(
        loc.restore_main_color,
        equals('Негізгі түсті қалпына келтіру'),
      );
      expect(
        loc.return_to_main_colors,
        equals('Негізгі түстерге оралу'),
      );
      expect(loc.settings, equals('Параметрлер'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Өлшем және мәтін көрсетілімі'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Сөздер арасындағы арақашықтықтың жылжымалы бақылауы'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Әріптер арасындағы арақашықтықтың жылжымалы бақылауы'),
      );
      expect(
        loc.slider_line_height,
        equals('Жол биіктігінің жылжымалы бақылауы'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Тақырып профилі танылмады'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Талмаудан қауіпсіз'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Көру қабілеті нашар'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD үшін қолайлы'),
      );
      expect(loc.theme_profile('none'), equals('Әдепкі'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Талмаудан қауіпсіз профиль'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Шағылысуларды жою және түстерді азайту'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Бұл профиль эпилепсия және талмау қаупі бар пайдаланушыларға '
          'жылтылдаған анимациялар мен қауіпті түс комбинацияларынан '
          'туындайтын талмау қаупін жою арқылы қауіпсіз шолуға мүмкіндік '
          'береді.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Көру қабілеті нашар профилі'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Қосымшаның көрінісін жақсарту'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Бұл профиль қосымшаны көру қабілеті нашар, туннельдік көру, '
          'катаракта, глаукома және басқа да көз зақымдануын '
          'азайтады.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-достық профилі'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Көбірек шоғырлану және аз алаңдату'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Бұл профиль алаңдатуды айтарлықтай азайтып, ADHD және '
          'нейродаму бұзылыстары бар адамдарға қосымшаның негізгі '
          'элементтерін оңай шарлауға, оқуға және назар салуға '
          'көмектеседі.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Параметрлер қалпына келтірілді.'),
      );
      expect(
        loc.toggle_dark_mode,
        equals('Қараңғы режимді қосу/өшіру'),
      );
      expect(
        loc.toggle_effects_mode,
        equals('Эффекттер режимін қосу/өшіру'),
      );
      expect(
        loc.toggle_font_weight,
        equals('Қаріп қалыңдығын қосу/өшіру'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('Тақырып профилін қосу/өшіру'),
      );
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Қалыпты'));
      expect(loc.color_profile('lowSaturation'), equals('Төмен қанықтылық'));
      expect(loc.color_profile('normal'), equals('Қалыпты'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Жоғары қанықтылық'),
      );
      expect(loc.color_profile('monochrome'), equals('Монохромды'));
      expect(loc.color_profile('highContrast'), equals('Жоғары контраст'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Түс танылмады'));
      expect(loc.color('cF44336'), equals('Қызыл'));
      expect(loc.color('cE91E63'), equals('Қызғылт'));
      expect(loc.color('c9C27B0'), equals('Қызыл көк'));
      expect(loc.color('c673AB7'), equals('Қоңыр қызыл көк'));
      expect(loc.color('c3F51B5'), equals('Индиго'));
      expect(loc.color('c2196F3'), equals('Көк'));
      expect(loc.color('c03A9F4'), equals('Ашық көк'));
      expect(loc.color('c00BCD4'), equals('Көгілдір'));
      expect(loc.color('c009688'), equals('Жасыл-көк'));
      expect(loc.color('c4CAF50'), equals('Жасыл'));
      expect(loc.color('c8BC34A'), equals('Ашық жасыл'));
      expect(loc.color('cCDDC39'), equals('Әк'));
      expect(loc.color('cFFEB3B'), equals('Сары'));
      expect(loc.color('cFFC107'), equals('Қызғылт сары'));
      expect(loc.color('cFF9800'), equals('Қызғылт-сары'));
      expect(loc.color('cFF5722'), equals('Қоңыр қызғылт-сары'));
      expect(loc.color('c795548'), equals('Қоңыр'));
      expect(loc.color('c9E9E9E'), equals('Сұр'));
      expect(loc.color('c607D8B'), equals('Көк сұр'));
    });
  });
}
