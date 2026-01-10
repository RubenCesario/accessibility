// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AccessibilityLocalizationsAf extends AccessibilityLocalizations {
  AccessibilityLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get accessibility => 'Toeganklikheid';

  @override
  String get accessibility_settings => 'Toeganklikheidsinstellinge';

  @override
  String get adjust_background_colors => 'Aanpasbare agtergrondkleur';

  @override
  String get adjust_text_colors => 'Aanpasbare tekstkleur';

  @override
  String get align_center => 'Gelyk';

  @override
  String get align_left => 'Links';

  @override
  String get align_right => 'Regs';

  @override
  String get bold_text => 'Vetgedrukte teks';

  @override
  String get change_bold_text => 'Verander vetgedrukte teks';

  @override
  String get change_pages_background_color => 'Agtergrondkleur verander';

  @override
  String get change_text_color => 'Tekstkleur verander';

  @override
  String get change_text_color_shade => 'Tekstkleur skakering verander';

  @override
  String get color_adjustment => 'Kleur aanpassing';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normaal',
        'lowSaturation': 'Laag satuur',
        'normal': 'Normaal',
        'highSaturation': 'Hoog satuur',
        'monochrome': 'Monochroom',
        'highContrast': 'Hoog contrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Die huidige kleurprofiel is: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Kleur ongekend',
        'cF44336': 'Rooi',
        'cE91E63': 'Pienk',
        'c9C27B0': 'Pers',
        'c673AB7': 'Diep Pers',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Blou',
        'c03A9F4': 'Lig Blou',
        'c00BCD4': 'Siaan',
        'c009688': 'Blougroen',
        'c4CAF50': 'Groen',
        'c8BC34A': 'Lig Groen',
        'cCDDC39': 'Lemmetjie',
        'cFFEB3B': 'Geel',
        'cFFC107': 'Amber',
        'cFF9800': 'Oranje',
        'cFF5722': 'Diep Oranje',
        'c795548': 'Bruin',
        'c9E9E9E': 'Grys',
        'c607D8B': 'Blougrys',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Vermindering van die woordafstand';

  @override
  String get decrement_letter_spacing => 'Vermindering van die letterafstand';

  @override
  String get decrement_line_height => 'Vermindering van die reëlhoogte';

  @override
  String get decrement_text_scale_factor =>
      'Vermindering van die teksskaalfaktor';

  @override
  String get effects => 'Effekte';

  @override
  String get expand_text => 'Teks uitbreiding';

  @override
  String get font_size => 'Lettergrootte';

  @override
  String get increase_or_decrease_word_spacing =>
      'Verhoog of verlaag die woordafstand';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Verhoog of verlaag die letterafstand';

  @override
  String get increase_or_decrease_line_height =>
      'Verhoog of verlaag die reëlhoogte';

  @override
  String get increase_or_decrease_text_size =>
      'Verhoog of verlaag die tekstgrootte';

  @override
  String get increment_word_spacing => 'Verhoog die woordafstand';

  @override
  String get increment_letter_spacing => 'Verhoog die letterafstand';

  @override
  String get increment_line_height => 'Verhoog die reëlhoogte';

  @override
  String get increment_text_scale_factor => 'Verhoog die teksskaalfaktor';

  @override
  String get less_info => 'Verberg info';

  @override
  String get letter_spacing => 'Letterspasiëring';

  @override
  String get line_height => 'Reëlhoogte';

  @override
  String get more_info => 'Toon info';

  @override
  String get read_less => 'Lees minder';

  @override
  String get read_more => 'Lees meer';

  @override
  String get reduce_effects => 'Vermindering van die effekte';

  @override
  String get reduce_text => 'Vermindering van die tekst';

  @override
  String get restore_settings => 'Herstel instellinge';

  @override
  String get restore_main_color => 'Herstel hoofkleur';

  @override
  String get return_to_main_colors => 'Terug na hoofkleur';

  @override
  String get settings => 'Instellinge';

  @override
  String get size_and_text_display => 'Grootte en tekstuitstelling';

  @override
  String get slider_word_spacing => 'Skuifbalk vir woordafstand';

  @override
  String get slider_letter_spacing => 'Skuifbalk vir letterspasiëring';

  @override
  String get slider_line_height => 'Skuifbalk vir reëlhoogte';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Temaprofiel nie herken nie',
        'seizureSafe': 'Epilepsie-veilig',
        'visionImpaired': 'Gesiggestrem',
        'adhdFriendly': 'ADHD-vriendelik',
        'none': 'Verstek',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsie-veilige profiel';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Verwyder weerkaatsings en verminder kleur';

  @override
  String get theme_profile_seizure_safe_description =>
      'Hierdie profiel stel gebruikers met epilepsie en diegene met risiko vir toevalle in staat om veilig te blaai deur die risiko van toevalle wat veroorsaak word deur flikkerende animasies en riskante kleurkombinasies te verminder.';

  @override
  String get theme_profile_vision_impaired_title => 'Gesiggestremde profiel';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Verbeter die sigbaarheid van die toepassing';

  @override
  String get theme_profile_vision_impaired_description =>
      'Hierdie profiel pas die toepassing aan om toeganklik te wees vir die meeste visuele gestremdhede, soos gesiggestremdheid, tonnelsig, katarakte, gloukoom en meer.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-vriendelike profiel';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Meer konsentrasie en minder afleidings';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Hierdie profiel verminder afleidings beduidend om mense met ADHD en neuro-ontwikkelingsversteurings te help om makliker deur die toepassing te navigeer, te lees en op die noodsaaklike elemente te fokus.';

  @override
  String get the_settings_have_been_reset => 'Die instellinge is herstel.';

  @override
  String get toggle_dark_mode => 'Wissel donker modus';

  @override
  String get toggle_effects_mode => 'Wissel effekte modus';

  @override
  String get toggle_font_weight => 'Wissel font gewicht';

  @override
  String get toggle_theme_profile => 'Wissel temaprofiel';

  @override
  String get word_spacing => 'Woordafstand';

  @override
  String get accessible_font => 'Toeganklike lettertipe';

  @override
  String get accessible_font_subtitle =>
      'Gebruik Verdana-lettertipe vir beter leesbaarheid';

  @override
  String get accessible_font_enabled => 'Toeganklike lettertipe geaktiveer';

  @override
  String get accessible_font_disabled => 'Toeganklike lettertipe gedeaktiveer';

  @override
  String get toggle_accessible_font => 'Wissel toeganklike lettertipe';
}
