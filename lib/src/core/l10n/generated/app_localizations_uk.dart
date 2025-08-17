// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AccessibilityLocalizationsUk extends AccessibilityLocalizations {
  AccessibilityLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get accessibility => 'Доступність';

  @override
  String get accessibility_settings => 'Налаштування доступності';

  @override
  String get adjust_background_colors => 'Налаштувати кольори фону';

  @override
  String get adjust_text_colors => 'Налаштувати кольори тексту';

  @override
  String get align_center => 'Вирівняти по центру';

  @override
  String get align_left => 'Вирівняти ліворуч';

  @override
  String get align_right => 'Вирівняти праворуч';

  @override
  String get bold_text => 'Жирний текст';

  @override
  String get change_bold_text => 'Змінити жирний текст';

  @override
  String get change_pages_background_color =>
      'Змінити колір фону сторінок на: ';

  @override
  String get change_text_color => 'Змінити колір тексту на: ';

  @override
  String get change_text_color_shade => 'Змінити відтінок кольору на: ';

  @override
  String get color_adjustment => 'Налаштування кольору';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормальний',
      'lowSaturation': 'Низька насиченість',
      'normal': 'Нормальний',
      'highSaturation': 'Висока насиченість',
      'monochrome': 'Монохромний',
      'highContrast': 'Високий контраст',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Поточний кольоровий профіль: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Колір не розпізнано',
      'cF44336': 'Червоний',
      'cE91E63': 'Рожевий',
      'c9C27B0': 'Фіолетовий',
      'c673AB7': 'Темно-фіолетовий',
      'c3F51B5': 'Індиго',
      'c2196F3': 'Синій',
      'c03A9F4': 'Світло-синій',
      'c00BCD4': 'Бірюзовий',
      'c009688': 'Синьо-зелений',
      'c4CAF50': 'Зелений',
      'c8BC34A': 'Світло-зелений',
      'cCDDC39': 'Лаймовий',
      'cFFEB3B': 'Жовтий',
      'cFFC107': 'Бурштиновий',
      'cFF9800': 'Помаранчевий',
      'cFF5722': 'Темно-помаранчевий',
      'c795548': 'Коричневий',
      'c9E9E9E': 'Сірий',
      'c607D8B': 'Синьо-сірий',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Зменшити інтервал між словами';

  @override
  String get decrement_letter_spacing => 'Зменшити інтервал між літерами';

  @override
  String get decrement_line_height => 'Зменшити висоту рядка';

  @override
  String get decrement_text_scale_factor =>
      'Зменшити коефіцієнт масштабування тексту';

  @override
  String get effects => 'Ефекти';

  @override
  String get expand_text => 'Розгорнути текст';

  @override
  String get font_size => 'Розмір шрифту';

  @override
  String get increase_or_decrease_word_spacing =>
      'Збільшити або зменшити інтервал між словами';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Збільшити або зменшити інтервал між літерами';

  @override
  String get increase_or_decrease_line_height =>
      'Збільшити або зменшити висоту рядка';

  @override
  String get increase_or_decrease_text_size =>
      'Збільшити або зменшити розмір тексту';

  @override
  String get increment_word_spacing => 'Збільшити інтервал між словами';

  @override
  String get increment_letter_spacing => 'Збільшити інтервал між літерами';

  @override
  String get increment_line_height => 'Збільшити висоту рядка';

  @override
  String get increment_text_scale_factor =>
      'Збільшити коефіцієнт масштабування тексту';

  @override
  String get less_info => 'Сховати інформацію';

  @override
  String get letter_spacing => 'Інтервал між літерами';

  @override
  String get line_height => 'Висота рядка';

  @override
  String get more_info => 'Показати інформацію';

  @override
  String get read_less => 'Читати менше';

  @override
  String get read_more => 'Читати більше';

  @override
  String get reduce_effects => 'Зменшити ефекти екрану';

  @override
  String get reduce_text => 'Зменшити текст';

  @override
  String get restore_settings => 'Відновити налаштування';

  @override
  String get restore_main_color => 'Відновити основний колір';

  @override
  String get return_to_main_colors => 'Повернутися до основних кольорів';

  @override
  String get settings => 'Налаштування';

  @override
  String get size_and_text_display => 'Розмір та відображення тексту';

  @override
  String get slider_word_spacing => 'Повзунок інтервалу між словами';

  @override
  String get slider_letter_spacing => 'Повзунок інтервалу між літерами';

  @override
  String get slider_line_height => 'Повзунок висоти рядка';

  @override
  String get theme_mode => 'Тема';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Профіль теми не розпізнано',
      'seizureSafe': 'Безпечний для епілепсії',
      'visionImpaired': 'Для людей з порушенням зору',
      'adhdFriendly': 'Дружній до ADHD',
      'none': 'За замовчуванням',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Профіль безпечний для епілепсії';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Видалити відблиски та зменшити кольори';

  @override
  String get theme_profile_seizure_safe_description =>
      'Цей профіль дозволяє користувачам з епілепсією та ризиком нападів безпечно переглядати сторінки, усуваючи ризик нападів, що виникають через мерехтливі анімації та ризиковані комбінації кольорів.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Профіль для людей з порушенням зору';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Покращити видимість додатку';

  @override
  String get theme_profile_vision_impaired_description =>
      'Цей профіль адаптує додаток для доступності більшості порушень зору, таких як погіршення зору, тунельний зір, катаракта, глаукома та інші.';

  @override
  String get theme_profile_adhd_friendly_title => 'Профіль дружній до ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Більше концентрації та менше відволікань';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Цей профіль значно зменшує відволікання, щоб допомогти людям з ADHD та нейророзвитковими розладами легше орієнтуватися, читати та зосереджуватися на основних елементах додатку.';

  @override
  String get the_settings_have_been_reset => 'Налаштування було скинуто.';

  @override
  String get toggle_dark_mode => 'Перемкнути темний режим';

  @override
  String get toggle_effects_mode => 'Перемкнути режим ефектів';

  @override
  String get toggle_font_weight => 'Перемкнути товщину шрифту';

  @override
  String get toggle_theme_profile => 'Перемкнути профіль теми';

  @override
  String get word_spacing => 'Інтервал між словами';
}
