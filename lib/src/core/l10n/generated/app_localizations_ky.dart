// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AccessibilityLocalizationsKy extends AccessibilityLocalizations {
  AccessibilityLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get accessibility => 'Жеткиликтүүлүк';

  @override
  String get accessibility_settings => 'Жеткиликтүүлүк параметрлери';

  @override
  String get adjust_background_colors => 'Фон түстөрүн теңдөө';

  @override
  String get adjust_text_colors => 'Текст түстөрүн теңдөө';

  @override
  String get align_center => 'Борборго түзөө';

  @override
  String get align_left => 'Солго түзөө';

  @override
  String get align_right => 'Оңго түзөө';

  @override
  String get bold_text => 'Калың текст';

  @override
  String get change_bold_text => 'Калың текстти өзгөртүү';

  @override
  String get change_pages_background_color =>
      'Беттердин фон түсүн буга өзгөртүү: ';

  @override
  String get change_text_color => 'Тексттин түсүн буга өзгөртүү: ';

  @override
  String get change_text_color_shade => 'Түстүн тонун буга өзгөртүү: ';

  @override
  String get color_adjustment => 'Түс жөндөө';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Кадимки',
        'lowSaturation': 'Төмөн каныктырылган',
        'normal': 'Кадимки',
        'highSaturation': 'Жогорку каныктырылган',
        'monochrome': 'Монохром',
        'highContrast': 'Жогорку контраст',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Учурдагы түс профили: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Түс таанылган жок',
        'cF44336': 'Кызыл',
        'cE91E63': 'Кызгылт',
        'c9C27B0': 'Сыя',
        'c673AB7': 'Кочкул сыя',
        'c3F51B5': 'Индиго',
        'c2196F3': 'Көк',
        'c03A9F4': 'Ачык көк',
        'c00BCD4': 'Көгүлтүр',
        'c009688': 'Жашыл-көк',
        'c4CAF50': 'Жашыл',
        'c8BC34A': 'Ачык жашыл',
        'cCDDC39': 'Лайм',
        'cFFEB3B': 'Сары',
        'cFFC107': 'Янтарь',
        'cFF9800': 'Күрөң',
        'cFF5722': 'Кочкул күрөң',
        'c795548': 'Күрөң',
        'c9E9E9E': 'Боз',
        'c607D8B': 'Көк-боз',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Сөз аралыгын азайтуу';

  @override
  String get decrement_letter_spacing => 'Тамга аралыгын азайтуу';

  @override
  String get decrement_line_height => 'Сап бийиктигин азайтуу';

  @override
  String get decrement_text_scale_factor => 'Текст масштаб факторун азайтуу';

  @override
  String get effects => 'Эффекттер';

  @override
  String get expand_text => 'Текстти кеңейтүү';

  @override
  String get font_size => 'Шрифт өлчөмү';

  @override
  String get increase_or_decrease_word_spacing =>
      'Сөз аралыгын көбөйтүү же азайтуу';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Тамга аралыгын көбөйтүү же азайтуу';

  @override
  String get increase_or_decrease_line_height =>
      'Сап бийиктигин көбөйтүү же азайтуу';

  @override
  String get increase_or_decrease_text_size =>
      'Текст өлчөмүн көбөйтүү же азайтуу';

  @override
  String get increment_word_spacing => 'Сөз аралыгын көбөйтүү';

  @override
  String get increment_letter_spacing => 'Тамга аралыгын көбөйтүү';

  @override
  String get increment_line_height => 'Сап бийиктигин көбөйтүү';

  @override
  String get increment_text_scale_factor => 'Текст масштаб факторун көбөйтүү';

  @override
  String get less_info => 'Маалыматты жашыруу';

  @override
  String get letter_spacing => 'Тамга аралыгы';

  @override
  String get line_height => 'Сап бийиктиги';

  @override
  String get more_info => 'Маалыматты көрсөтүү';

  @override
  String get read_less => 'Азыраак окуу';

  @override
  String get read_more => 'Көбүрөөк окуу';

  @override
  String get reduce_effects => 'Экрандагы эффекттерди азайтуу';

  @override
  String get reduce_text => 'Текстти азайтуу';

  @override
  String get restore_settings => 'Орундарды калыбына келтирүү';

  @override
  String get restore_main_color => 'Башкы түстү калыбына келтирүү';

  @override
  String get return_to_main_colors => 'Башкы түстөргө кайтуу';

  @override
  String get settings => 'Орундар';

  @override
  String get size_and_text_display => 'Өлчөм жана текст көрсөтүү';

  @override
  String get slider_word_spacing => 'Сөз аралыгы слайдеры';

  @override
  String get slider_letter_spacing => 'Тамга аралыгы слайдеры';

  @override
  String get slider_line_height => 'Сап бийиктиги слайдеры';

  @override
  String get theme_mode => 'Тема режими';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Тема профили таанылган жок',
        'seizureSafe': 'Эпилепсияга ыңгайлуу',
        'visionImpaired': 'Көрүүгө тоскоолдуктуу',
        'adhdFriendly': 'ADHDга ыңгайлуу',
        'none': 'Калыпкая',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Эпилепсияга ыңгайлуу профиль';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Чагылуучу элементтерди алып салуу жана түстөрдү азайтуу';

  @override
  String get theme_profile_seizure_safe_description =>
      'Бул профиль эпилепсиясы бар жана талмалардын коркунучунда болгон колдонуучуларга жаркыраган анимациялардан жана коркунучтуу түс айкалыштарынан талмалардын коркунучун четтетүү менен коопсуз барактоого жардам берет.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Көрүүгө тоскоолдуктуу профиль';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Тиркеменин көрүнүшүн жакшыртуу';

  @override
  String get theme_profile_vision_impaired_description =>
      'Бул профиль көз көрүү начар, туннелдик көрүү, катаракта, глаукома жана башка сыяктуу жалпы көрүү жөндөмүнө байланыштуу мүмкүнчүлүктөрү чектелген колдонуучуларга ыңгайлуу болуш үчүн тиркемени ыңгайлаштырат.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHDга ыңгайлуу профиль';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Көбүрөөк көңүл буруучу, азыраак бөлүнүүчүлүк';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Бул профиль көңүл буруу азайтып, АДВГ жана неврологиялык бузулуулары бар адамдарга тиркеменин маанилүү бөлүктөрүнө көңүл топтоп, бир кылка окуп жана багыттоо оңойураак болушуна жардам берет.';

  @override
  String get the_settings_have_been_reset =>
      'Орнотуулар баштапкы абалына келтирилди.';

  @override
  String get toggle_dark_mode => 'Караңгы режимин которуу';

  @override
  String get toggle_effects_mode => 'Эффекттер режимин которуу';

  @override
  String get toggle_font_weight => 'Шрифт калыңдыгын которуу';

  @override
  String get toggle_theme_profile => 'Тема профилин которуу';

  @override
  String get word_spacing => 'Сөз аралыгы';

  @override
  String get accessible_font => 'Жеткиликтүү шрифт';

  @override
  String get accessible_font_subtitle =>
      'Жакшыраак окулуш үчүн Verdana шрифтин колдонуңуз';

  @override
  String get accessible_font_enabled => 'Жеткиликтүү шрифт иштетилди';

  @override
  String get accessible_font_disabled => 'Жеткиликтүү шрифт өчүрүлдү';

  @override
  String get toggle_accessible_font => 'Жеткиликтүү шрифтти которуу';
}
