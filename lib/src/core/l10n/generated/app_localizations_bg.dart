// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AccessibilityLocalizationsBg extends AccessibilityLocalizations {
  AccessibilityLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get accessibility => 'Достъпност';

  @override
  String get accessibility_settings => 'Настройки за достъпност';

  @override
  String get adjust_background_colors => 'Настройване на фоновите цветове';

  @override
  String get adjust_text_colors => 'Настройване на цветовете на текста';

  @override
  String get align_center => 'Центриране';

  @override
  String get align_left => 'Подравняване вляво';

  @override
  String get align_right => 'Подравняване вдясно';

  @override
  String get bold_text => 'Удебелен текст';

  @override
  String get change_bold_text => 'Промяна на удебелен текст';

  @override
  String get change_pages_background_color =>
      'Промяна на фоновия цвят на страниците на: ';

  @override
  String get change_text_color => 'Промяна на цвета на текста на: ';

  @override
  String get change_text_color_shade => 'Промяна на нюанса на цвета на: ';

  @override
  String get color_adjustment => 'Настройка на цветовете';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормален',
      'lowSaturation': 'Ниска наситеност',
      'normal': 'Нормален',
      'highSaturation': 'Висока наситеност',
      'monochrome': 'Монохромен',
      'highContrast': 'Висок контраст',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Текущият цветови профил е: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Цветът не е разпознат',
      'cF44336': 'Червен',
      'cE91E63': 'Розов',
      'c9C27B0': 'Лилав',
      'c673AB7': 'Тъмнолилав',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Син',
      'c03A9F4': 'Светлосин',
      'c00BCD4': 'Циан',
      'c009688': 'Тъмнозелен',
      'c4CAF50': 'Зелен',
      'c8BC34A': 'Светлозелен',
      'cCDDC39': 'Лайм',
      'cFFEB3B': 'Жълт',
      'cFFC107': 'Кехлибарен',
      'cFF9800': 'Оранжев',
      'cFF5722': 'Тъмнооранжев',
      'c795548': 'Кафяв',
      'c9E9E9E': 'Сив',
      'c607D8B': 'Синьо-сив',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing =>
      'Намаляване на разстоянието между думите';

  @override
  String get decrement_letter_spacing =>
      'Намаляване на разстоянието между буквите';

  @override
  String get decrement_line_height => 'Намаляване на височината на реда';

  @override
  String get decrement_text_scale_factor => 'Намаляване на размера на текста';

  @override
  String get effects => 'Ефекти';

  @override
  String get expand_text => 'Разширяване на текста';

  @override
  String get font_size => 'Размер на шрифта';

  @override
  String get increase_or_decrease_word_spacing =>
      'Увеличаване или намаляване на разстоянието между думите';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Увеличаване или намаляване на разстоянието между буквите';

  @override
  String get increase_or_decrease_line_height =>
      'Увеличаване или намаляване на височината на реда';

  @override
  String get increase_or_decrease_text_size =>
      'Увеличаване или намаляване на размера на текста';

  @override
  String get increment_word_spacing =>
      'Увеличаване на разстоянието между думите';

  @override
  String get increment_letter_spacing =>
      'Увеличаване на разстоянието между буквите';

  @override
  String get increment_line_height => 'Увеличаване на височината на реда';

  @override
  String get increment_text_scale_factor => 'Увеличаване на размера на текста';

  @override
  String get less_info => 'Скрий информацията';

  @override
  String get letter_spacing => 'Разстояние между буквите';

  @override
  String get line_height => 'Височина на реда';

  @override
  String get more_info => 'Покажи информацията';

  @override
  String get read_less => 'Прочети по-малко';

  @override
  String get read_more => 'Прочети повече';

  @override
  String get reduce_effects => 'Намали ефектите на екрана';

  @override
  String get reduce_text => 'Намали текста';

  @override
  String get restore_settings => 'Възстанови настройките';

  @override
  String get restore_main_color => 'Възстанови основния цвят';

  @override
  String get return_to_main_colors => 'Върни се към основните цветове';

  @override
  String get settings => 'Настройки';

  @override
  String get size_and_text_display => 'Размер и показване на текста';

  @override
  String get slider_word_spacing => 'Плъзгач за разстояние между думите';

  @override
  String get slider_letter_spacing => 'Плъзгач за разстояние между буквите';

  @override
  String get slider_line_height => 'Плъзгач за височина на реда';

  @override
  String get theme_mode => 'Тема';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Темата не е разпозната',
      'seizureSafe': 'Безопасна при епилепсия',
      'visionImpaired': 'За хора с нарушено зрение',
      'adhdFriendly': 'Подходяща за ADHD',
      'none': 'Стандартна',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Профил безопасен при епилепсия';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Премахни отблясъците и намали цветовете';

  @override
  String get theme_profile_seizure_safe_description =>
      'Този профил позволява на хора с епилепсия или риск от пристъпи да използват приложението безопасно, като премахва опасни анимации и цветови комбинации.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Профил за хора с нарушено зрение';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Подобри видимостта на приложението';

  @override
  String get theme_profile_vision_impaired_description =>
      'Този профил прави приложението достъпно за хора с различни зрителни увреждания като тунелно зрение, катаракта, глаукома и други.';

  @override
  String get theme_profile_adhd_friendly_title => 'Профил подходящ за ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Повече концентрация, по-малко разсейване';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Този профил значително намалява разсейването, за да помогне на хора с ADHD и невроразвитийни затруднения да се ориентират, четат и фокусират върху важните елементи на приложението.';

  @override
  String get the_settings_have_been_reset =>
      'Настройките бяха върнати в начално състояние.';

  @override
  String get toggle_dark_mode => 'Превключи тъмен режим';

  @override
  String get toggle_effects_mode => 'Превключи ефекти';

  @override
  String get toggle_font_weight => 'Превключи дебелина на шрифта';

  @override
  String get toggle_theme_profile => 'Превключи профил на тема';

  @override
  String get word_spacing => 'Разстояние между думите';
}
