// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AccessibilityLocalizationsSk extends AccessibilityLocalizations {
  AccessibilityLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get accessibility => 'Prístupnosť';

  @override
  String get accessibility_settings => 'Nastavenia prístupnosti';

  @override
  String get adjust_background_colors => 'Upraviť farby pozadia';

  @override
  String get adjust_text_colors => 'Upraviť farby textu';

  @override
  String get align_center => 'Zarovnať na stred';

  @override
  String get align_left => 'Zarovnať doľava';

  @override
  String get align_right => 'Zarovnať doprava';

  @override
  String get bold_text => 'Tučný text';

  @override
  String get change_bold_text => 'Zmeniť tučný text';

  @override
  String get change_pages_background_color =>
      'Zmeniť farbu pozadia stránok na: ';

  @override
  String get change_text_color => 'Zmeniť farbu textu na: ';

  @override
  String get change_text_color_shade => 'Zmeniť odtieň farby na: ';

  @override
  String get color_adjustment => 'Úprava farieb';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normálny',
        'lowSaturation': 'Nízka sýtosť',
        'normal': 'Normálny',
        'highSaturation': 'Vysoká sýtosť',
        'monochrome': 'Monochromáticky',
        'highContrast': 'Vysoký kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Aktuálny farebný profil je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Farba nerozpoznaná',
        'cF44336': 'Červená',
        'cE91E63': 'Ružová',
        'c9C27B0': 'Fialová',
        'c673AB7': 'Tmavofialová',
        'c3F51B5': 'Indigová',
        'c2196F3': 'Modrá',
        'c03A9F4': 'Svetlomodrá',
        'c00BCD4': 'Azurová',
        'c009688': 'Tyrkysová',
        'c4CAF50': 'Zelená',
        'c8BC34A': 'Svetlozelená',
        'cCDDC39': 'Limetková',
        'cFFEB3B': 'Žltá',
        'cFFC107': 'Jantárová',
        'cFF9800': 'Oranžová',
        'cFF5722': 'Tmavoranžová',
        'c795548': 'Hnedá',
        'c9E9E9E': 'Sivá',
        'c607D8B': 'Modrosivá',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Zmenšiť medzery medzi slovami';

  @override
  String get decrement_letter_spacing => 'Zmenšiť medzery medzi písmenami';

  @override
  String get decrement_line_height => 'Zmenšiť výšku riadku';

  @override
  String get decrement_text_scale_factor => 'Zmenšiť faktor veľkosti textu';

  @override
  String get effects => 'Efekty';

  @override
  String get expand_text => 'Rozšíriť text';

  @override
  String get font_size => 'Veľkosť písma';

  @override
  String get increase_or_decrease_word_spacing =>
      'Zväčšiť alebo zmenšiť medzery medzi slovami';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Zväčšiť alebo zmenšiť medzery medzi písmenami';

  @override
  String get increase_or_decrease_line_height =>
      'Zväčšiť alebo zmenšiť výšku riadku';

  @override
  String get increase_or_decrease_text_size =>
      'Zväčšiť alebo zmenšiť veľkosť textu';

  @override
  String get increment_word_spacing => 'Zväčšiť medzery medzi slovami';

  @override
  String get increment_letter_spacing => 'Zväčšiť medzery medzi písmenami';

  @override
  String get increment_line_height => 'Zväčšiť výšku riadku';

  @override
  String get increment_text_scale_factor => 'Zväčšiť faktor veľkosti textu';

  @override
  String get less_info => 'Skryť informácie';

  @override
  String get letter_spacing => 'Medzery medzi písmenami';

  @override
  String get line_height => 'Výška riadku';

  @override
  String get more_info => 'Zobraziť informácie';

  @override
  String get read_less => 'Čítať menej';

  @override
  String get read_more => 'Čítať viac';

  @override
  String get reduce_effects => 'Znížiť efekty na obrazovke';

  @override
  String get reduce_text => 'Zmenšiť text';

  @override
  String get restore_settings => 'Obnoviť nastavenia';

  @override
  String get restore_main_color => 'Obnoviť hlavnú farbu';

  @override
  String get return_to_main_colors => 'Návrat k hlavným farbám';

  @override
  String get settings => 'Nastavenia';

  @override
  String get size_and_text_display => 'Veľkosť a zobrazenie textu';

  @override
  String get slider_word_spacing => 'Posuvník medzier medzi slovami';

  @override
  String get slider_letter_spacing => 'Posuvník medzier medzi písmenami';

  @override
  String get slider_line_height => 'Posuvník výšky riadku';

  @override
  String get theme_mode => 'Téma';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil témy nerozpoznaný',
        'seizureSafe': 'Bezpečný pre epileptikov',
        'visionImpaired': 'Pre zrakovo postihnutých',
        'adhdFriendly': 'Priateľský pre ADHD',
        'none': 'Predvolený',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil bezpečný pre epileptikov';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Odstrániť odrazy a znížiť farby';

  @override
  String get theme_profile_seizure_safe_description =>
      'Tento profil umožňuje používateľom, ktorí majú epilepsiu a sú ohrozéní záchvatmi, bezpečne prechádzať aplikáciou odstránením rizika záchvatov, ktoré vyplývajú z blikajúcich animácií a rizikových farebných kombinácií.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil pre zrakovo postihnutých';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Zlepšiť viditeľnosť aplikácie';

  @override
  String get theme_profile_vision_impaired_description =>
      'Tento profil prispôsobuje aplikáciu tak, aby bola prístupná pre väčšinu zrakových postihnutí, ako sú zrakové postihnutie, tunelové videnie, šedý zákal, glaukom a ďalšie.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil priateľský pre ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Viac koncentrácie a menej rušivých vplyvov';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Tento profil výrazne znižuje rušivé vplyvy, aby pomohol ľuďom s ADHD a vývinovými poruchami jednoduchšie navigovať, čítať a sústrediť sa na základné prvky aplikácie.';

  @override
  String get the_settings_have_been_reset => 'Nastavenia boli obnovené.';

  @override
  String get toggle_dark_mode => 'Prepnúť tmavý režim';

  @override
  String get toggle_effects_mode => 'Prepnúť režim efektov';

  @override
  String get toggle_font_weight => 'Prepnúť hrubosť písma';

  @override
  String get toggle_theme_profile => 'Prepnúť profil témy';

  @override
  String get word_spacing => 'Medzery medzi slovami';
}
