import 'package:accessibility/src/core/l10n/generated/app_localizations_ky.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsKy', () {
    late AccessibilityLocalizationsKy loc;

    setUp(() {
      loc = AccessibilityLocalizationsKy();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ky'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Жеткиликтүүлүк'));
      expect(
        loc.accessibility_settings,
        equals('Жеткиликтүүлүк параметрлери'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Фон түстөрүн теңдөө'),
      );
      expect(loc.adjust_text_colors, equals('Текст түстөрүн теңдөө'));
      expect(loc.align_center, equals('Борборго түзөө'));
      expect(loc.align_left, equals('Солго түзөө'));
      expect(loc.align_right, equals('Оңго түзөө'));
      expect(loc.bold_text, equals('Калың текст'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Калың текстти өзгөртүү'));
      expect(
        loc.change_pages_background_color,
        equals('Беттердин фон түсүн буга өзгөртүү: '),
      );
      expect(
        loc.change_text_color,
        equals('Тексттин түсүн буга өзгөртүү: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Түстүн тонун буга өзгөртүү: '),
      );
      expect(loc.color_adjustment, equals('Түс жөндөө'));
      expect(
        loc.color_profile_changed_to,
        equals('Учурдагы түс профили: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Сөз аралыгын азайтуу'));
      expect(loc.decrement_letter_spacing, equals('Тамга аралыгын азайтуу'));
      expect(loc.decrement_line_height, equals('Сап бийиктигин азайтуу'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Текст масштаб факторун азайтуу'),
      );
      expect(loc.increment_word_spacing, equals('Сөз аралыгын көбөйтүү'));
      expect(loc.increment_letter_spacing, equals('Тамга аралыгын көбөйтүү'));
      expect(loc.increment_line_height, equals('Сап бийиктигин көбөйтүү'));
      expect(
        loc.increment_text_scale_factor,
        equals('Текст масштаб факторун көбөйтүү'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Сөз аралыгын көбөйтүү же азайтуу'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Тамга аралыгын көбөйтүү же азайтуу'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Сап бийиктигин көбөйтүү же азайтуу'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Текст өлчөмүн көбөйтүү же азайтуу'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Эффекттер'));
      expect(loc.expand_text, equals('Текстти кеңейтүү'));
      expect(loc.font_size, equals('Шрифт өлчөмү'));
      expect(loc.less_info, equals('Маалыматты жашыруу'));
      expect(loc.letter_spacing, equals('Тамга аралыгы'));
      expect(loc.line_height, equals('Сап бийиктиги'));
      expect(loc.more_info, equals('Маалыматты көрсөтүү'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Азыраак окуу'));
      expect(loc.read_more, equals('Көбүрөөк окуу'));
      expect(
        loc.reduce_effects,
        equals('Экрандагы эффекттерди азайтуу'),
      );
      expect(loc.reduce_text, equals('Текстти азайтуу'));
      expect(loc.restore_settings, equals('Орундарды калыбына келтирүү'));
      expect(loc.restore_main_color, equals('Башкы түстү калыбына келтирүү'));
      expect(loc.return_to_main_colors, equals('Башкы түстөргө кайтуу'));
      expect(loc.settings, equals('Орундар'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Өлчөм жана текст көрсөтүү'),
      );
      expect(loc.slider_word_spacing, equals('Сөз аралыгы слайдеры'));
      expect(loc.slider_letter_spacing, equals('Тамга аралыгы слайдеры'));
      expect(loc.slider_line_height, equals('Сап бийиктиги слайдеры'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Тема режими'));
      expect(
        loc.theme_profile('other'),
        equals('Тема профили таанылган жок'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Эпилепсияга ыңгайлуу'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Көрүүгө тоскоолдуктуу'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHDга ыңгайлуу'),
      );
      expect(loc.theme_profile('none'), equals('Калыпкая'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Эпилепсияга ыңгайлуу профиль'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Чагылуучу элементтерди алып салуу жана түстөрдү азайтуу'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Бул профиль эпилепсиясы бар жана талмалардын коркунучунда '
          'болгон колдонуучуларга жаркыраган анимациялардан жана '
          'коркунучтуу түс айкалыштарынан талмалардын коркунучун '
          'четтетүү менен коопсуз барактоого жардам берет.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Көрүүгө тоскоолдуктуу профиль'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Тиркеменин көрүнүшүн жакшыртуу'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Бул профиль көз көрүү начар, туннелдик көрүү, катаракта, '
          'глаукома жана башка сыяктуу жалпы көрүү жөндөмүнө '
          'байланыштуу мүмкүнчүлүктөрү чектелген колдонуучуларга '
          'ыңгайлуу болуш үчүн тиркемени ыңгайлаштырат.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHDга ыңгайлуу профиль'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Көбүрөөк көңүл буруучу, азыраак бөлүнүүчүлүк'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Бул профиль көңүл буруу азайтып, АДВГ жана неврологиялык '
          'бузулуулары бар адамдарга тиркеменин маанилүү бөлүктөрүнө '
          'көңүл топтоп, бир кылка окуп жана багыттоо оңойураак '
          'болушуна жардам берет.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Орнотуулар баштапкы абалына келтирилди.'),
      );
      expect(loc.toggle_dark_mode, equals('Караңгы режимин которуу'));
      expect(loc.toggle_effects_mode, equals('Эффекттер режимин которуу'));
      expect(loc.toggle_font_weight, equals('Шрифт калыңдыгын которуу'));
      expect(loc.toggle_theme_profile, equals('Тема профилин которуу'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Кадимки'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Төмөн каныктырылган'),
      );
      expect(loc.color_profile('normal'), equals('Кадимки'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Жогорку каныктырылган'),
      );
      expect(loc.color_profile('monochrome'), equals('Монохром'));
      expect(loc.color_profile('highContrast'), equals('Жогорку контраст'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Түс таанылган жок'));
      expect(loc.color('cF44336'), equals('Кызыл'));
      expect(loc.color('cE91E63'), equals('Кызгылт'));
      expect(loc.color('c9C27B0'), equals('Сыя'));
      expect(loc.color('c673AB7'), equals('Кочкул сыя'));
      expect(loc.color('c3F51B5'), equals('Индиго'));
      expect(loc.color('c2196F3'), equals('Көк'));
      expect(loc.color('c03A9F4'), equals('Ачык көк'));
      expect(loc.color('c00BCD4'), equals('Көгүлтүр'));
      expect(loc.color('c009688'), equals('Жашыл-көк'));
      expect(loc.color('c4CAF50'), equals('Жашыл'));
      expect(loc.color('c8BC34A'), equals('Ачык жашыл'));
      expect(loc.color('cCDDC39'), equals('Лайм'));
      expect(loc.color('cFFEB3B'), equals('Сары'));
      expect(loc.color('cFFC107'), equals('Янтарь'));
      expect(loc.color('cFF9800'), equals('Күрөң'));
      expect(loc.color('cFF5722'), equals('Кочкул күрөң'));
      expect(loc.color('c795548'), equals('Күрөң'));
      expect(loc.color('c9E9E9E'), equals('Боз'));
      expect(loc.color('c607D8B'), equals('Көк-боз'));
    });
  });
}
