// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AccessibilityLocalizationsNl extends AccessibilityLocalizations {
  AccessibilityLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get accessibility => 'Toegankelijkheid';

  @override
  String get accessibility_settings => 'Toegankelijkheidsinstellingen';

  @override
  String get adjust_background_colors => 'Achtergrondkleuren aanpassen';

  @override
  String get adjust_text_colors => 'Tekstkleuren aanpassen';

  @override
  String get align_center => 'Centreren';

  @override
  String get align_left => 'Links uitlijnen';

  @override
  String get align_right => 'Rechts uitlijnen';

  @override
  String get bold_text => 'Vetgedrukte tekst';

  @override
  String get change_bold_text => 'Vetgedrukte tekst wijzigen';

  @override
  String get change_pages_background_color =>
      'Verander de achtergrondkleur van de pagina\'s naar: ';

  @override
  String get change_text_color => 'Verander de kleur van de tekst naar: ';

  @override
  String get change_text_color_shade => 'Verander de tint van de kleur naar: ';

  @override
  String get color_adjustment => 'Kleuraanpassing';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normaal',
      'lowSaturation': 'Lage verzadiging',
      'normal': 'Normaal',
      'highSaturation': 'Hoge verzadiging',
      'monochrome': 'Monochroom',
      'highContrast': 'Hoge contrast',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Het huidige kleurprofiel is: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Kleur niet herkend',
      'cF44336': 'Rood',
      'cE91E63': 'Roze',
      'c9C27B0': 'Paars',
      'c673AB7': 'Diep paars',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blauw',
      'c03A9F4': 'Lichtblauw',
      'c00BCD4': 'Cyaan',
      'c009688': 'Groenblauw',
      'c4CAF50': 'Groen',
      'c8BC34A': 'Lichtgroen',
      'cCDDC39': 'Limoen',
      'cFFEB3B': 'Geel',
      'cFFC107': 'Amber',
      'cFF9800': 'Oranje',
      'cFF5722': 'Diep oranje',
      'c795548': 'Bruin',
      'c9E9E9E': 'Grijs',
      'c607D8B': 'Blauwgrijs',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Woordafstand verkleinen';

  @override
  String get decrement_letter_spacing => 'Letterafstand verkleinen';

  @override
  String get decrement_line_height => 'Regelhoogte verkleinen';

  @override
  String get decrement_text_scale_factor => 'Tekstschaalfactor verkleinen';

  @override
  String get effects => 'Effecten';

  @override
  String get expand_text => 'Tekst uitbreiden';

  @override
  String get font_size => 'Lettergrootte';

  @override
  String get increase_or_decrease_word_spacing =>
      'Woordafstand vergroten of verkleinen';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Letterafstand vergroten of verkleinen';

  @override
  String get increase_or_decrease_line_height =>
      'Regelhoogte vergroten of verkleinen';

  @override
  String get increase_or_decrease_text_size =>
      'Tekstgrootte vergroten of verkleinen';

  @override
  String get increment_word_spacing => 'Woordafstand vergroten';

  @override
  String get increment_letter_spacing => 'Letterafstand vergroten';

  @override
  String get increment_line_height => 'Regelhoogte vergroten';

  @override
  String get increment_text_scale_factor => 'Tekstschaalfactor vergroten';

  @override
  String get less_info => 'Info verbergen';

  @override
  String get letter_spacing => 'Letterafstand';

  @override
  String get line_height => 'Regelhoogte';

  @override
  String get more_info => 'Info tonen';

  @override
  String get read_less => 'Minder lezen';

  @override
  String get read_more => 'Meer lezen';

  @override
  String get reduce_effects => 'Effecten op scherm verminderen';

  @override
  String get reduce_text => 'Tekst verkleinen';

  @override
  String get restore_settings => 'Instellingen herstellen';

  @override
  String get restore_main_color => 'Hoofdkleur herstellen';

  @override
  String get return_to_main_colors => 'Terug naar hoofdkleuren';

  @override
  String get settings => 'Instellingen';

  @override
  String get size_and_text_display => 'Grootte en tekstweergave';

  @override
  String get slider_word_spacing => 'Schuifregelaar woordafstand';

  @override
  String get slider_letter_spacing => 'Schuifregelaar letterafstand';

  @override
  String get slider_line_height => 'Schuifregelaar regelhoogte';

  @override
  String get theme_mode => 'Thema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Themaprofiel niet herkend',
      'seizureSafe': 'Epilepsieveilig',
      'visionImpaired': 'Visueel beperkt',
      'adhdFriendly': 'ADHD-vriendelijk',
      'none': 'Standaard',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsieveilig profiel';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Reflecties verwijderen en kleur verminderen';

  @override
  String get theme_profile_seizure_safe_description =>
      'Dit profiel stelt gebruikers met epilepsie en risico op aanvallen in staat om veilig te browsen door het risico op aanvallen te elimineren die het gevolg zijn van flitsende animaties en risicovolle kleurencombinaties.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profiel voor visueel beperkten';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Verbeter zichtbaarheid van de applicatie';

  @override
  String get theme_profile_vision_impaired_description =>
      'Dit profiel past de applicatie aan zodat deze toegankelijk is voor de meeste visuele beperkingen, zoals slechtziendheid, tunnelvisie, staar, glaucoom en meer.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-vriendelijk profiel';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Meer concentratie en minder afleiding';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Dit profiel vermindert afleidingen aanzienlijk, om mensen met ADHD en neurologische ontwikkelingsstoornissen te helpen bij het navigeren, lezen en zich te concentreren op de essentiële elementen van de applicatie.';

  @override
  String get the_settings_have_been_reset => 'De instellingen zijn hersteld.';

  @override
  String get toggle_dark_mode => 'Donkere modus aan/uit';

  @override
  String get toggle_effects_mode => 'Effectenmodus aan/uit';

  @override
  String get toggle_font_weight => 'Letterdikte aan/uit';

  @override
  String get toggle_theme_profile => 'Themaprofiel aan/uit';

  @override
  String get word_spacing => 'Woordafstand';
}
