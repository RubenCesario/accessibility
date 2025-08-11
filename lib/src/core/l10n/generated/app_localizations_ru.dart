// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AccessibilityLocalizationsRu extends AccessibilityLocalizations {
  AccessibilityLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get accessibility => 'Доступность';

  @override
  String get accessibility_settings => 'Настройки доступности';

  @override
  String get adjust_background_colors => 'Настроить цвета фона';

  @override
  String get adjust_text_colors => 'Настроить цвета текста';

  @override
  String get align_center => 'Выровнять по центру';

  @override
  String get align_left => 'Выровнять по левому краю';

  @override
  String get align_right => 'Выровнять по правому краю';

  @override
  String get bold_text => 'Жирный текст';

  @override
  String get change_bold_text => 'Изменить жирный текст';

  @override
  String get change_pages_background_color => 'Изменить цвет фона страниц на: ';

  @override
  String get change_text_color => 'Изменить цвет текста на: ';

  @override
  String get change_text_color_shade => 'Изменить оттенок цвета на: ';

  @override
  String get color_adjustment => 'Настройка цвета';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормальный',
      'lowSaturation': 'Низкая насыщенность',
      'normal': 'Нормальный',
      'highSaturation': 'Высокая насыщенность',
      'monochrome': 'Монохромный',
      'highContrast': 'Высокий контраст',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Текущий профиль цвета: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Цвет не распознан',
      'cF44336': 'Красный',
      'cE91E63': 'Розовый',
      'c9C27B0': 'Фиолетовый',
      'c673AB7': 'Тёмно-фиолетовый',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Синий',
      'c03A9F4': 'Светло-синий',
      'c00BCD4': 'Голубой',
      'c009688': 'Бирюзовый',
      'c4CAF50': 'Зелёный',
      'c8BC34A': 'Светло-зелёный',
      'cCDDC39': 'Лайм',
      'cFFEB3B': 'Жёлтый',
      'cFFC107': 'Янтарный',
      'cFF9800': 'Оранжевый',
      'cFF5722': 'Тёмно-оранжевый',
      'c795548': 'Коричневый',
      'c9E9E9E': 'Серый',
      'c607D8B': 'Сине-серый',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Уменьшить интервал между словами';

  @override
  String get decrement_letter_spacing => 'Уменьшить интервал между буквами';

  @override
  String get decrement_line_height => 'Уменьшить высоту строки';

  @override
  String get decrement_text_scale_factor =>
      'Уменьшить коэффициент масштабирования текста';

  @override
  String get effects => 'Эффекты';

  @override
  String get expand_text => 'Развернуть текст';

  @override
  String get font_size => 'Размер шрифта';

  @override
  String get increase_or_decrease_word_spacing =>
      'Увеличить или уменьшить интервал между словами';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Увеличить или уменьшить интервал между буквами';

  @override
  String get increase_or_decrease_line_height =>
      'Увеличить или уменьшить высоту строки';

  @override
  String get increase_or_decrease_text_size =>
      'Увеличить или уменьшить размер текста';

  @override
  String get increment_word_spacing => 'Увеличить интервал между словами';

  @override
  String get increment_letter_spacing => 'Увеличить интервал между буквами';

  @override
  String get increment_line_height => 'Увеличить высоту строки';

  @override
  String get increment_text_scale_factor =>
      'Увеличить коэффициент масштабирования текста';

  @override
  String get less_info => 'Скрыть информацию';

  @override
  String get letter_spacing => 'Интервал между буквами';

  @override
  String get line_height => 'Высота строки';

  @override
  String get more_info => 'Показать информацию';

  @override
  String get read_less => 'Читать меньше';

  @override
  String get read_more => 'Читать больше';

  @override
  String get reduce_effects => 'Уменьшить эффекты на экране';

  @override
  String get reduce_text => 'Свернуть текст';

  @override
  String get restore_settings => 'Восстановить настройки';

  @override
  String get restore_main_color => 'Восстановить основной цвет';

  @override
  String get return_to_main_colors => 'Вернуться к основным цветам';

  @override
  String get settings => 'Настройки';

  @override
  String get size_and_text_display => 'Размер и отображение текста';

  @override
  String get slider_word_spacing => 'Ползунок интервала между словами';

  @override
  String get slider_letter_spacing => 'Ползунок интервала между буквами';

  @override
  String get slider_line_height => 'Ползунок высоты строки';

  @override
  String get theme_mode => 'Тема';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Профиль темы не распознан',
      'seizureSafe': 'Безопасный для эпилептиков',
      'visionImpaired': 'Для слабовидящих',
      'adhdFriendly': 'Для людей с СДВГ',
      'none': 'По умолчанию',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Безопасный профиль для эпилептиков';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Убрать отражения и уменьшить цвет';

  @override
  String get theme_profile_seizure_safe_description =>
      'Этот профиль позволяет пользователям с эпилепсией и риском приступов безопасно пользоваться приложением, устраняя риск приступов, вызванных мерцающими анимациями и опасными цветовыми комбинациями.';

  @override
  String get theme_profile_vision_impaired_title => 'Профиль для слабовидящих';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Улучшить видимость приложения';

  @override
  String get theme_profile_vision_impaired_description =>
      'Этот профиль адаптирует приложение для доступности большинству людей с нарушениями зрения, такими как слабовидение, туннельное зрение, катаракта, глаукома и другие.';

  @override
  String get theme_profile_adhd_friendly_title => 'Профиль для людей с СДВГ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Больше концентрации и меньше отвлечений';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Этот профиль значительно уменьшает отвлекающие факторы, чтобы помочь людям с СДВГ и нейроразвитийными расстройствами легче ориентироваться, читать и сосредоточиться на важных элементах приложения.';

  @override
  String get the_settings_have_been_reset => 'Настройки были сброшены.';

  @override
  String get toggle_dark_mode => 'Переключить тёмный режим';

  @override
  String get toggle_effects_mode => 'Переключить режим эффектов';

  @override
  String get toggle_font_weight => 'Переключить толщину шрифта';

  @override
  String get toggle_theme_profile => 'Переключить профиль темы';

  @override
  String get word_spacing => 'Интервал между словами';
}
