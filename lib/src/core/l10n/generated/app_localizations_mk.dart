// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AccessibilityLocalizationsMk extends AccessibilityLocalizations {
  AccessibilityLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get accessibility => 'Пристапност';

  @override
  String get accessibility_settings => 'Поставки за пристапност';

  @override
  String get adjust_background_colors => 'Прилагоди бои на позадината';

  @override
  String get adjust_text_colors => 'Прилагоди бои на текстот';

  @override
  String get align_center => 'Порамни во средина';

  @override
  String get align_left => 'Порамни лево';

  @override
  String get align_right => 'Порамни десно';

  @override
  String get bold_text => 'Задебелен текст';

  @override
  String get change_bold_text => 'Промени задебеленост на текст';

  @override
  String get change_pages_background_color =>
      'Промени ја бојата на позадината на страниците во: ';

  @override
  String get change_text_color => 'Промени ја бојата на текстот во: ';

  @override
  String get change_text_color_shade => 'Промени ја нијансата на бојата во: ';

  @override
  String get color_adjustment => 'Прилагодување на бои';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Нормално',
        'lowSaturation': 'Ниска заситеност',
        'normal': 'Нормално',
        'highSaturation': 'Висока заситеност',
        'monochrome': 'Монохроматско',
        'highContrast': 'Висок контраст',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Тековниот профил на бои е: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Бојата не е препознаена',
        'cF44336': 'Црвена',
        'cE91E63': 'Розова',
        'c9C27B0': 'Виолетова',
        'c673AB7': 'Темно виолетова',
        'c3F51B5': 'Индиго',
        'c2196F3': 'Сина',
        'c03A9F4': 'Светло сина',
        'c00BCD4': 'Тиркизна',
        'c009688': 'Теал',
        'c4CAF50': 'Зелена',
        'c8BC34A': 'Светло зелена',
        'cCDDC39': 'Лимета',
        'cFFEB3B': 'Жолта',
        'cFFC107': 'Ќилибарна',
        'cFF9800': 'Портокалова',
        'cFF5722': 'Темно портокалова',
        'c795548': 'Кафеава',
        'c9E9E9E': 'Сива',
        'c607D8B': 'Сино-сива',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Намали растојание помеѓу зборови';

  @override
  String get decrement_letter_spacing => 'Намали растојание помеѓу букви';

  @override
  String get decrement_line_height => 'Намали висина на линија';

  @override
  String get decrement_text_scale_factor =>
      'Намали фактор на зголемување на текст';

  @override
  String get effects => 'Ефекти';

  @override
  String get expand_text => 'Прошири текст';

  @override
  String get font_size => 'Големина на фонт';

  @override
  String get increase_or_decrease_word_spacing =>
      'Зголеми или намали растојание помеѓу зборови';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Зголеми или намали растојание помеѓу букви';

  @override
  String get increase_or_decrease_line_height =>
      'Зголеми или намали висина на линија';

  @override
  String get increase_or_decrease_text_size =>
      'Зголеми или намали големина на текст';

  @override
  String get increment_word_spacing => 'Зголеми растојание помеѓу зборови';

  @override
  String get increment_letter_spacing => 'Зголеми растојание помеѓу букви';

  @override
  String get increment_line_height => 'Зголеми висина на линија';

  @override
  String get increment_text_scale_factor =>
      'Зголеми фактор на зголемување на текст';

  @override
  String get less_info => 'Скриј информации';

  @override
  String get letter_spacing => 'Растојание помеѓу букви';

  @override
  String get line_height => 'Висина на линија';

  @override
  String get more_info => 'Покажи информации';

  @override
  String get read_less => 'Читај помалку';

  @override
  String get read_more => 'Читај повеќе';

  @override
  String get reduce_effects => 'Намали ефекти на екранот';

  @override
  String get reduce_text => 'Намали текст';

  @override
  String get restore_settings => 'Врати поставки';

  @override
  String get restore_main_color => 'Врати ја главната боја';

  @override
  String get return_to_main_colors => 'Врати се на главните бои';

  @override
  String get settings => 'Поставки';

  @override
  String get size_and_text_display => 'Големина и приказ на текст';

  @override
  String get slider_word_spacing => 'Лизгач за растојание помеѓу зборови';

  @override
  String get slider_letter_spacing => 'Лизгач за растојание помеѓу букви';

  @override
  String get slider_line_height => 'Лизгач за висина на линија';

  @override
  String get theme_mode => 'Тема';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Профилот на тема не е препознаен',
        'seizureSafe': 'Безбеден за напади',
        'visionImpaired': 'Прилагоден за лица со слаб вид',
        'adhdFriendly': 'Пријателски за АДХД',
        'none': 'Стандардно',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Безбеден профил за напади';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Отстрани одблесоци и намали бои';

  @override
  String get theme_profile_seizure_safe_description =>
      'Овој профил им овозможува на корисниците кои имаат епилепсија и се изложени на ризик од напади да прелистуваат безбедно со елиминирање на ризикот од напади предизвикани од трепкави анимации и ризични комбинации на бои.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Профил за лица со оштетен вид';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Подобри видливост на апликацијата';

  @override
  String get theme_profile_vision_impaired_description =>
      'Овој профил ја прилагодува апликацијата да биде достапна за повеќето визуелни оштетувања, како што се оштетен вид, тунелски вид, катаракта, глауком и друго.';

  @override
  String get theme_profile_adhd_friendly_title => 'Профил пријателски за АДХД';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Поголема концентрација и помалку одвлекувања';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Овој профил значително ги намалува одвлекувањата, за да им помогне на луѓето со АДХД и невроразвојни нарушувања да навигираат, читаат и се фокусираат на суштинските елементи на апликацијата полесно.';

  @override
  String get the_settings_have_been_reset => 'Поставките се ресетирани.';

  @override
  String get toggle_dark_mode => 'Вклучи/исклучи темен режим';

  @override
  String get toggle_effects_mode => 'Вклучи/исклучи режим на ефекти';

  @override
  String get toggle_font_weight => 'Вклучи/исклучи дебелина на фонт';

  @override
  String get toggle_theme_profile => 'Вклучи/исклучи профил на тема';

  @override
  String get word_spacing => 'Растојание помеѓу зборови';

  @override
  String get accessible_font => 'Пристапен фонт';

  @override
  String get accessible_font_subtitle =>
      'Користете Verdana фонт за подобра читливост';

  @override
  String get accessible_font_enabled => 'Пристапен фонт вклучен';

  @override
  String get accessible_font_disabled => 'Пристапен фонт исклучен';

  @override
  String get toggle_accessible_font => 'Вклучи/исклучи пристапен фонт';
}
