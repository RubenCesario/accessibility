// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swiss German Alemannic Alsatian (`gsw`).
class AccessibilityLocalizationsGsw extends AccessibilityLocalizations {
  AccessibilityLocalizationsGsw([String locale = 'gsw']) : super(locale);

  @override
  String get accessibility => 'Barrierefreiheit';

  @override
  String get accessibility_settings => 'Istellige für Barrierefreiheit';

  @override
  String get adjust_background_colors => 'Hindergrundfarbe apasse';

  @override
  String get adjust_text_colors => 'Textfarbe apasse';

  @override
  String get align_center => 'Zäntriere';

  @override
  String get align_left => 'Links usrichte';

  @override
  String get align_right => 'Rächts usrichte';

  @override
  String get bold_text => 'Fätte Text';

  @override
  String get change_bold_text => 'Fätte Text ändere';

  @override
  String get change_pages_background_color =>
      'Hindergrundfarbe vo de Site ändere uf: ';

  @override
  String get change_text_color => 'Textfarbe ändere uf: ';

  @override
  String get change_text_color_shade => 'Farbtoon ändere uf: ';

  @override
  String get color_adjustment => 'Farbappassig';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Niedrigi Sättigung',
      'normal': 'Normal',
      'highSaturation': 'Hochi Sättigung',
      'monochrome': 'Eifarbig',
      'highContrast': 'Hoche Kontrast',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'S aktuelle Farbprofil isch: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Farb nid erkannt',
      'cF44336': 'Rot',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Violett',
      'c673AB7': 'Tiefsviolett',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blau',
      'c03A9F4': 'Hellblau',
      'c00BCD4': 'Türkis',
      'c009688': 'Teal',
      'c4CAF50': 'Grüeñ',
      'c8BC34A': 'Hellgrüeñ',
      'cCDDC39': 'Limette',
      'cFFEB3B': 'Gääl',
      'cFFC107': 'Amberfarbig',
      'cFF9800': 'Orange',
      'cFF5722': 'Tiefsorange',
      'c795548': 'Brun',
      'c9E9E9E': 'Grau',
      'c607D8B': 'Blaugrau',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Wortzwischeruum verchlinere';

  @override
  String get decrement_letter_spacing => 'Buechschtabezwischeruum verchlinere';

  @override
  String get decrement_line_height => 'Zilehöchi verchlinere';

  @override
  String get decrement_text_scale_factor => 'Textskalierigsfaktor verchlinere';

  @override
  String get effects => 'Effekt';

  @override
  String get expand_text => 'Text erwiiitere';

  @override
  String get font_size => 'Schriftgrössi';

  @override
  String get increase_or_decrease_word_spacing =>
      'Wortzwischeruum vergrössere oder verchlinere';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Buechschtabezwischeruum vergrössere oder verchlinere';

  @override
  String get increase_or_decrease_line_height =>
      'Zilehöchi vergrössere oder verchlinere';

  @override
  String get increase_or_decrease_text_size =>
      'Textgrössi vergrössere oder verchlinere';

  @override
  String get increment_word_spacing => 'Wortzwischeruum vergrössere';

  @override
  String get increment_letter_spacing => 'Buechschtabezwischeruum vergrössere';

  @override
  String get increment_line_height => 'Zilehöchi vergrössere';

  @override
  String get increment_text_scale_factor => 'Textskalierigsfaktor vergrössere';

  @override
  String get less_info => 'Info verstecke';

  @override
  String get letter_spacing => 'Buechschtabezwischeruum';

  @override
  String get line_height => 'Zilehöchi';

  @override
  String get more_info => 'Info azeige';

  @override
  String get read_less => 'Weniger läse';

  @override
  String get read_more => 'Meh läse';

  @override
  String get reduce_effects => 'Effekt uf em Bildschirm verringere';

  @override
  String get reduce_text => 'Text verchlinere';

  @override
  String get restore_settings => 'Istellige zruggsetze';

  @override
  String get restore_main_color => 'Hauptfarb zruggsetze';

  @override
  String get return_to_main_colors => 'Zrugg zu de Hauptfarbe';

  @override
  String get settings => 'Istellige';

  @override
  String get size_and_text_display => 'Grössi und Textazeig';

  @override
  String get slider_word_spacing => 'Schieberegler Wortzwischeruum';

  @override
  String get slider_letter_spacing => 'Schieberegler Buechschtabezwischeruum';

  @override
  String get slider_line_height => 'Schieberegler Zilehöchi';

  @override
  String get theme_mode => 'Thema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Themaprofil nid erkannt',
      'seizureSafe': 'Epilepsiesicher',
      'visionImpaired': 'Sehbehinderet',
      'adhdFriendly': 'ADHS-fründlich',
      'none': 'Standard',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsiesicheres Profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Reflektione entferne und Farb reduziere';

  @override
  String get theme_profile_seizure_safe_description =>
      'Das Profil ermöglicht Benutzer mit Epilepsie und Afalsgfahre sicher z\'surfe, indem s\'Risiko vo Afäll, die dürch flimmerndi Animatione und riskanti Farbkombinations entstoh, usgsschloss wird.';

  @override
  String get theme_profile_vision_impaired_title => 'Sehbehinderede-Profil';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Sichtbarkeit vo de App verbessere';

  @override
  String get theme_profile_vision_impaired_description =>
      'Das Profil passt d App a, dass si für die meischte Seebhinderige zugänglich isch, wie Sehbhinderig, Tunnelblick, grauer Star, Gloukom und meh.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHS-fründlichs Profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Meh Konzentration und weniger Ablenkige';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Das Profil reduziert Ablenkige deutlich, um Persone mit ADHS und neurologische Entwicklungsstörige z\'helfe, eifacher z\'navigiere, z\'läse und sich uf die wichtige Element vo dr App z\'konzentriere.';

  @override
  String get the_settings_have_been_reset =>
      'D\'Istellige sin zrugggsetzt worde.';

  @override
  String get toggle_dark_mode => 'Dunkelmodus umschalte';

  @override
  String get toggle_effects_mode => 'Effektmodus umschalte';

  @override
  String get toggle_font_weight => 'Schriftstärki umschalte';

  @override
  String get toggle_theme_profile => 'Themaprofil umschalte';

  @override
  String get word_spacing => 'Wortzwischeruum';
}
