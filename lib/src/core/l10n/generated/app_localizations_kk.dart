// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AccessibilityLocalizationsKk extends AccessibilityLocalizations {
  AccessibilityLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get accessibility => 'Қолжетімділік';

  @override
  String get accessibility_settings => 'Қолжетімділік параметрлері';

  @override
  String get adjust_background_colors => 'Фон түстерін реттеу';

  @override
  String get adjust_text_colors => 'Мәтін түстерін реттеу';

  @override
  String get align_center => 'Ортаға туралау';

  @override
  String get align_left => 'Солға туралау';

  @override
  String get align_right => 'Оңға туралау';

  @override
  String get bold_text => 'Қалың мәтін';

  @override
  String get change_bold_text => 'Қалың мәтінді өзгерту';

  @override
  String get change_pages_background_color =>
      'Беттердің фон түсін келесіге өзгерту: ';

  @override
  String get change_text_color => 'Мәтіннің түсін келесіге өзгерту: ';

  @override
  String get change_text_color_shade => 'Түстің реңкін келесіге өзгерту: ';

  @override
  String get color_adjustment => 'Түс реттеу';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Қалыпты',
        'lowSaturation': 'Төмен қанықтылық',
        'normal': 'Қалыпты',
        'highSaturation': 'Жоғары қанықтылық',
        'monochrome': 'Монохромды',
        'highContrast': 'Жоғары контраст',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Ағымдағы түс профилі: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Түс танылмады',
        'cF44336': 'Қызыл',
        'cE91E63': 'Қызғылт',
        'c9C27B0': 'Қызыл көк',
        'c673AB7': 'Қоңыр қызыл көк',
        'c3F51B5': 'Индиго',
        'c2196F3': 'Көк',
        'c03A9F4': 'Ашық көк',
        'c00BCD4': 'Көгілдір',
        'c009688': 'Жасыл-көк',
        'c4CAF50': 'Жасыл',
        'c8BC34A': 'Ашық жасыл',
        'cCDDC39': 'Әк',
        'cFFEB3B': 'Сары',
        'cFFC107': 'Қызғылт сары',
        'cFF9800': 'Қызғылт-сары',
        'cFF5722': 'Қоңыр қызғылт-сары',
        'c795548': 'Қоңыр',
        'c9E9E9E': 'Сұр',
        'c607D8B': 'Көк сұр',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Сөздер арасындағы арақашықтықты азайту';

  @override
  String get decrement_letter_spacing =>
      'Әріптер арасындағы арақашықтықты азайту';

  @override
  String get decrement_line_height => 'Жол биіктігін азайту';

  @override
  String get decrement_text_scale_factor => 'Мәтін масштабы факторын азайту';

  @override
  String get effects => 'Эффекттер';

  @override
  String get expand_text => 'Мәтінді ұлғайту';

  @override
  String get font_size => 'Қаріп өлшемі';

  @override
  String get increase_or_decrease_word_spacing =>
      'Сөздер арасындағы арақашықтықты ұлғайту немесе азайту';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Әріптер арасындағы арақашықтықты ұлғайту немесе азайту';

  @override
  String get increase_or_decrease_line_height =>
      'Жол биіктігін ұлғайту немесе азайту';

  @override
  String get increase_or_decrease_text_size =>
      'Мәтін өлшемін ұлғайту немесе азайту';

  @override
  String get increment_word_spacing =>
      'Сөздер арасындағы арақашықтықты ұлғайту';

  @override
  String get increment_letter_spacing =>
      'Әріптер арасындағы арақашықтықты ұлғайту';

  @override
  String get increment_line_height => 'Жол биіктігін ұлғайту';

  @override
  String get increment_text_scale_factor => 'Мәтін масштабы факторын ұлғайту';

  @override
  String get less_info => 'Ақпаратты жасыру';

  @override
  String get letter_spacing => 'Әріптер арасындағы арақашықтық';

  @override
  String get line_height => 'Жол биіктігі';

  @override
  String get more_info => 'Ақпаратты көрсету';

  @override
  String get read_less => 'Азырақ оқу';

  @override
  String get read_more => 'Көбірек оқу';

  @override
  String get reduce_effects => 'Экран эффекттерін азайту';

  @override
  String get reduce_text => 'Мәтінді азайту';

  @override
  String get restore_settings => 'Параметрлерді қалпына келтіру';

  @override
  String get restore_main_color => 'Негізгі түсті қалпына келтіру';

  @override
  String get return_to_main_colors => 'Негізгі түстерге оралу';

  @override
  String get settings => 'Параметрлер';

  @override
  String get size_and_text_display => 'Өлшем және мәтін көрсетілімі';

  @override
  String get slider_word_spacing =>
      'Сөздер арасындағы арақашықтықтың жылжымалы бақылауы';

  @override
  String get slider_letter_spacing =>
      'Әріптер арасындағы арақашықтықтың жылжымалы бақылауы';

  @override
  String get slider_line_height => 'Жол биіктігінің жылжымалы бақылауы';

  @override
  String get theme_mode => 'Тақырып';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Тақырып профилі танылмады',
        'seizureSafe': 'Талмаудан қауіпсіз',
        'visionImpaired': 'Көру қабілеті нашар',
        'adhdFriendly': 'ADHD үшін қолайлы',
        'none': 'Әдепкі',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Талмаудан қауіпсіз профиль';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Шағылысуларды жою және түстерді азайту';

  @override
  String get theme_profile_seizure_safe_description =>
      'Бұл профиль эпилепсия және талмау қаупі бар пайдаланушыларға жылтылдаған анимациялар мен қауіпті түс комбинацияларынан туындайтын талмау қаупін жою арқылы қауіпсіз шолуға мүмкіндік береді.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Көру қабілеті нашар профилі';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Қосымшаның көрінісін жақсарту';

  @override
  String get theme_profile_vision_impaired_description =>
      'Бұл профиль қосымшаны көру қабілеті нашар, туннельдік көру, катаракта, глаукома және басқа да көз зақымдануын азайтады.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-достық профилі';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Көбірек шоғырлану және аз алаңдату';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Бұл профиль алаңдатуды айтарлықтай азайтып, ADHD және нейродаму бұзылыстары бар адамдарға қосымшаның негізгі элементтерін оңай шарлауға, оқуға және назар салуға көмектеседі.';

  @override
  String get the_settings_have_been_reset => 'Параметрлер қалпына келтірілді.';

  @override
  String get toggle_dark_mode => 'Қараңғы режимді қосу/өшіру';

  @override
  String get toggle_effects_mode => 'Эффекттер режимін қосу/өшіру';

  @override
  String get toggle_font_weight => 'Қаріп қалыңдығын қосу/өшіру';

  @override
  String get toggle_theme_profile => 'Тақырып профилін қосу/өшіру';

  @override
  String get word_spacing => 'Сөздер арасындағы арақашықтық';

  @override
  String get accessible_font => 'Қол жетімді қаріп';

  @override
  String get accessible_font_subtitle =>
      'Жақсы оқылу үшін Verdana қаріпін пайдаланыңыз';

  @override
  String get accessible_font_enabled => 'Қол жетімді қаріп қосулы';

  @override
  String get accessible_font_disabled => 'Қол жетімді қаріп өшірулі';

  @override
  String get toggle_accessible_font => 'Қол жетімді қаріпті қосу/өшіру';
}
