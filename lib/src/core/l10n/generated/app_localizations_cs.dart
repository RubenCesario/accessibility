// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AccessibilityLocalizationsCs extends AccessibilityLocalizations {
  AccessibilityLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get accessibility => 'Přístupnost';

  @override
  String get accessibility_settings => 'Nastavení přístupnosti';

  @override
  String get adjust_background_colors => 'Upravit barvy pozadí';

  @override
  String get adjust_text_colors => 'Upravit barvy textu';

  @override
  String get align_center => 'Zarovnat na střed';

  @override
  String get align_left => 'Zarovnat doleva';

  @override
  String get align_right => 'Zarovnat doprava';

  @override
  String get bold_text => 'Tučný text';

  @override
  String get change_bold_text => 'Změnit tučný text';

  @override
  String get change_pages_background_color =>
      'Změnit barvu pozadí stránek na: ';

  @override
  String get change_text_color => 'Změnit barvu textu na: ';

  @override
  String get change_text_color_shade => 'Změnit odstín barvy na: ';

  @override
  String get color_adjustment => 'Nastavení barev';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normální',
      'lowSaturation': 'Nízká saturace',
      'normal': 'Normální',
      'highSaturation': 'Vysoká saturace',
      'monochrome': 'Monochromatické',
      'highContrast': 'Vysoký kontrast',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Aktuální profil barev je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Barva nerozpoznána',
      'cF44336': 'Červená',
      'cE91E63': 'Růžová',
      'c9C27B0': 'Fialová',
      'c673AB7': 'Tmavě fialová',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Modrá',
      'c03A9F4': 'Světle modrá',
      'c00BCD4': 'Azurová',
      'c009688': 'Modrozeloná',
      'c4CAF50': 'Zelená',
      'c8BC34A': 'Světle zelená',
      'cCDDC39': 'Limetková',
      'cFFEB3B': 'Žlutá',
      'cFFC107': 'Jantarová',
      'cFF9800': 'Oranžová',
      'cFF5722': 'Tmavě oranžová',
      'c795548': 'Hnědá',
      'c9E9E9E': 'Šedá',
      'c607D8B': 'Modrošedá',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Snížit mezery mezi slovy';

  @override
  String get decrement_letter_spacing => 'Snížit mezery mezi písmeny';

  @override
  String get decrement_line_height => 'Snížit výšku řádku';

  @override
  String get decrement_text_scale_factor => 'Snížit faktor velikosti textu';

  @override
  String get effects => 'Efekty';

  @override
  String get expand_text => 'Rozšířit text';

  @override
  String get font_size => 'Velikost písma';

  @override
  String get increase_or_decrease_word_spacing =>
      'Zvětšit nebo zmenšit mezery mezi slovy';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Zvětšit nebo zmenšit mezery mezi písmeny';

  @override
  String get increase_or_decrease_line_height =>
      'Zvětšit nebo zmenšit výšku řádku';

  @override
  String get increase_or_decrease_text_size =>
      'Zvětšit nebo zmenšit velikost textu';

  @override
  String get increment_word_spacing => 'Zvětšit mezery mezi slovy';

  @override
  String get increment_letter_spacing => 'Zvětšit mezery mezi písmeny';

  @override
  String get increment_line_height => 'Zvětšit výšku řádku';

  @override
  String get increment_text_scale_factor => 'Zvětšit faktor velikosti textu';

  @override
  String get less_info => 'Skrýt informace';

  @override
  String get letter_spacing => 'Mezery mezi písmeny';

  @override
  String get line_height => 'Výška řádku';

  @override
  String get more_info => 'Zobrazit informace';

  @override
  String get read_less => 'Číst méně';

  @override
  String get read_more => 'Číst více';

  @override
  String get reduce_effects => 'Snížit efekty na obrazovce';

  @override
  String get reduce_text => 'Zmenšit text';

  @override
  String get restore_settings => 'Obnovit nastavení';

  @override
  String get restore_main_color => 'Obnovit hlavní barvu';

  @override
  String get return_to_main_colors => 'Návrat k hlavním barvám';

  @override
  String get settings => 'Nastavení';

  @override
  String get size_and_text_display => 'Velikost a zobrazení textu';

  @override
  String get slider_word_spacing => 'Posuvník mezer mezi slovy';

  @override
  String get slider_letter_spacing => 'Posuvník mezer mezi písmeny';

  @override
  String get slider_line_height => 'Posuvník výšky řádku';

  @override
  String get theme_mode => 'Motiv';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil motivu nerozpoznán',
      'seizureSafe': 'Bezpečný pro epileptiky',
      'visionImpaired': 'Pro zrakově postižené',
      'adhdFriendly': 'Přívětivý pro ADHD',
      'none': 'Výchozí',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil bezpečný pro epileptiky';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Odstranit odrazy a snížit barvy';

  @override
  String get theme_profile_seizure_safe_description =>
      'Tento profil umožňuje uživatelům, kteří mají epilepsii a jsou ohroženi záchvaty, bezpečně procházet stránky odstraněním rizika záchvatů, které mohou být vyvolany blikajícími animacemi a rizikovými kombinacemi barev.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil pro zrakově postižené';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Zlepšit viditelnost aplikace';

  @override
  String get theme_profile_vision_impaired_description =>
      'Tento profil přizpůsobuje aplikaci tak, aby byla přístupná pro většinu zrakových postižení, jako je zraková vada, tunelové vidění, šedý zákal, glaukom a další.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil přívětivý pro ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Lepší soustředění a méně rušivých vlivů';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Tento profil významně snižuje rušivé vlivy, aby pomohl lidem s ADHD a vývojovými neurologickými poruchami snadněji navigovat, číst a soustředit se na základní prvky aplikace.';

  @override
  String get the_settings_have_been_reset => 'Nastavení bylo obnoveno.';

  @override
  String get toggle_dark_mode => 'Přepnout tmavý režim';

  @override
  String get toggle_effects_mode => 'Přepnout režim efektů';

  @override
  String get toggle_font_weight => 'Přepnout tučnost písma';

  @override
  String get toggle_theme_profile => 'Přepnout profil motivu';

  @override
  String get word_spacing => 'Mezery mezi slovy';
}
