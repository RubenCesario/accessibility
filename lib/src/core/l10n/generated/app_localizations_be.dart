// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AccessibilityLocalizationsBe extends AccessibilityLocalizations {
  AccessibilityLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get accessibility => 'Доступнасць';

  @override
  String get accessibility_settings => 'Налады доступнасці';

  @override
  String get adjust_background_colors => 'Падвышэнне фонавых колераў';

  @override
  String get adjust_text_colors => 'Падвышэнне колераў тэксту';

  @override
  String get align_center => 'Выраўнаваць па цэнтры';

  @override
  String get align_left => 'Выраўнаваць па левым краі';

  @override
  String get align_right => 'Выраўнаваць па правым краі';

  @override
  String get bold_text => 'Тоўсты тэкст';

  @override
  String get change_bold_text => 'Змяніць тоўсты тэкст';

  @override
  String get change_pages_background_color =>
      'Змяніць колер фону старонак на: ';

  @override
  String get change_text_color => 'Змяніць колер тэксту на: ';

  @override
  String get change_text_color_shade => 'Змяніць адценне колеру на: ';

  @override
  String get color_adjustment => 'Карэкцыя колеру';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Звычайны',
        'lowSaturation': 'Нізкая насычанасць',
        'normal': 'Звычайны',
        'highSaturation': 'Высокая насычанасць',
        'monochrome': 'Манаграма',
        'highContrast': 'Высокі кантраст',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Цяперашні профіль колеру: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Колер не распазнаны',
        'cF44336': 'Чырвоны',
        'cE91E63': 'Ружовы',
        'c9C27B0': 'Фіялетавы',
        'c673AB7': 'Цёмна-фіялетавы',
        'c3F51B5': 'Індыга',
        'c2196F3': 'Сіні',
        'c03A9F4': 'Светла-сіні',
        'c00BCD4': 'Блакітны',
        'c009688': 'Цёмна-зялёны',
        'c4CAF50': 'Зялёны',
        'c8BC34A': 'Светла-зялёны',
        'cCDDC39': 'Лайм',
        'cFFEB3B': 'Жоўты',
        'cFFC107': 'Бурштынавы',
        'cFF9800': 'Аранжавы',
        'cFF5722': 'Цёмна-аранджавы',
        'c795548': 'Карычневы',
        'c9E9E9E': 'Шэры',
        'c607D8B': 'Сіне-шэры',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Зменшыць інтэрвал паміж словамі';

  @override
  String get decrement_letter_spacing => 'Зменшыць інтэрвал паміж літарамі';

  @override
  String get decrement_line_height => 'Зменшыць вышыню радка';

  @override
  String get decrement_text_scale_factor => 'Зменшыць памер тэксту';

  @override
  String get effects => 'Візуальныя эфекты';

  @override
  String get expand_text => 'Разгарнуць тэкст';

  @override
  String get font_size => 'Памер шрыфта';

  @override
  String get increase_or_decrease_word_spacing =>
      'Павялічыць або зменшыць інтэрвал паміж словамі';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Павялічыць або зменшыць інтэрвал паміж літарамі';

  @override
  String get increase_or_decrease_line_height =>
      'Павялічыць або зменшыць вышыню радка';

  @override
  String get increase_or_decrease_text_size =>
      'Павялічыць або зменшыць памер тэксту';

  @override
  String get increment_word_spacing => 'Павялічыць інтэрвал паміж словамі';

  @override
  String get increment_letter_spacing => 'Павялічыць інтэрвал паміж літарамі';

  @override
  String get increment_line_height => 'Павялічыць вышыню радка';

  @override
  String get increment_text_scale_factor => 'Павялічыць памер тэксту';

  @override
  String get less_info => 'Схаваць інфармацыю';

  @override
  String get letter_spacing => 'Інтэрвал паміж літарамі';

  @override
  String get line_height => 'Вышыня радка';

  @override
  String get more_info => 'Паказаць інфармацыю';

  @override
  String get read_less => 'Чытаць менш';

  @override
  String get read_more => 'Чытаць больш';

  @override
  String get reduce_effects => 'Зменшыць эфекты на экране';

  @override
  String get reduce_text => 'Скараціць тэкст';

  @override
  String get restore_settings => 'Аднавіць налады';

  @override
  String get restore_main_color => 'Аднавіць асноўны колер';

  @override
  String get return_to_main_colors => 'Вярнуцца да асноўных колераў';

  @override
  String get settings => 'Налады';

  @override
  String get size_and_text_display => 'Памер і адлюстраванне тэксту';

  @override
  String get slider_word_spacing => 'Паўзунок інтэрвалу паміж словамі';

  @override
  String get slider_letter_spacing => 'Паўзунок інтэрвалу паміж літарамі';

  @override
  String get slider_line_height => 'Паўзунок вышыні радка';

  @override
  String get theme_mode => 'Тэма';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Профіль тэмы не распазнаны',
        'seizureSafe': 'Бяспечная пры эпілепсіі',
        'visionImpaired': 'Для людзей з парушэннямі зроку',
        'adhdFriendly': 'Падыходзіць для ADHD',
        'none': 'Стандартная',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Профіль бяспечны пры эпілепсіі';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Прыбярыце адбіткі і паменшыце колер';

  @override
  String get theme_profile_seizure_safe_description =>
      'Гэты профіль дазваляе людзям з эпілепсіяй або рызыкай прыступаў бяспечна карыстацца дадаткам, выдаляючы небяспечныя анімацыі і каляровыя спалучэнні.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Профіль для людзей з парушэннямі зроку';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Паляпшэнне бачнасці прыкладання';

  @override
  String get theme_profile_vision_impaired_description =>
      'Гэты профіль робіць дадатак даступным для людзей з рознымі парушэннямі зроку, такімі як тунэльнае зрок, катаракта, глаўкома і інш.';

  @override
  String get theme_profile_adhd_friendly_title => 'Профіль, прыдатны для ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Больш канцэнтрацыі, менш адцягнення';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Гэты профіль значна памяншае адцягненне, каб дапамагчы людзям з ADHD і неўраразвіццёвымі парушэннямі лягчэй арыентавацца, чытаць і канцэнтравацца на галоўных элементах прыкладання.';

  @override
  String get the_settings_have_been_reset => 'Налады былі скінуты.';

  @override
  String get toggle_dark_mode => 'Пераключыць цёмны рэжым';

  @override
  String get toggle_effects_mode => 'Пераключыць эфекты';

  @override
  String get toggle_font_weight => 'Пераключыць таўшчыню шрыфта';

  @override
  String get toggle_theme_profile => 'Пераключыць профіль тэмы';

  @override
  String get word_spacing => 'Інтэрвал паміж словамі';

  @override
  String get accessible_font => 'Даступны шрыфт';

  @override
  String get accessible_font_subtitle =>
      'Выкарыстоўвайце шрыфт Verdana для лепшай чытальнасці';

  @override
  String get accessible_font_enabled => 'Даступны шрыфт уключаны';

  @override
  String get accessible_font_disabled => 'Даступны шрыфт выключаны';

  @override
  String get toggle_accessible_font => 'Пераключыць даступны шрыфт';
}
