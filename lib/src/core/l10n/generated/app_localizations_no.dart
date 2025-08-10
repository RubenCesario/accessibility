// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AccessibilityLocalizationsNo extends AccessibilityLocalizations {
  AccessibilityLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get accessibility => 'Tilgjengelighet';

  @override
  String get accessibility_settings => 'Tilgjengelighetsinnstillinger';

  @override
  String get adjust_background_colors => 'Juster bakgrunnsfarger';

  @override
  String get adjust_text_colors => 'Juster tekstfarger';

  @override
  String get align_center => 'Sentrer';

  @override
  String get align_left => 'Venstrejuster';

  @override
  String get align_right => 'Høyrejuster';

  @override
  String get bold_text => 'Fet tekst';

  @override
  String get change_bold_text => 'Endre fet tekst';

  @override
  String get change_pages_background_color =>
      'Endre bakgrunnsfargen på sidene til: ';

  @override
  String get change_text_color => 'Endre fargen på teksten til: ';

  @override
  String get change_text_color_shade => 'Endre nyansen av fargen til: ';

  @override
  String get color_adjustment => 'Fargejustering';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Lav metning',
        'normal': 'Normal',
        'highSaturation': 'Høy metning',
        'monochrome': 'Monokrom',
        'highContrast': 'Høy kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Gjeldende fargeprofil er: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Farge ikke gjenkjent',
        'cF44336': 'Rød',
        'cE91E63': 'Rosa',
        'c9C27B0': 'Lilla',
        'c673AB7': 'Dyp lilla',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Blå',
        'c03A9F4': 'Lyseblå',
        'c00BCD4': 'Cyan',
        'c009688': 'Turkis',
        'c4CAF50': 'Grønn',
        'c8BC34A': 'Lysegrønn',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Gul',
        'cFFC107': 'Ravgul',
        'cFF9800': 'Oransje',
        'cFF5722': 'Dyp oransje',
        'c795548': 'Brun',
        'c9E9E9E': 'Grå',
        'c607D8B': 'Blågrå',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Reduser ordmellomrom';

  @override
  String get decrement_letter_spacing => 'Reduser bokstavmellomrom';

  @override
  String get decrement_line_height => 'Reduser linjehøyde';

  @override
  String get decrement_text_scale_factor => 'Reduser tekstskaleringsfaktor';

  @override
  String get effects => 'Effekter';

  @override
  String get expand_text => 'Utvid tekst';

  @override
  String get font_size => 'Skriftstørrelse';

  @override
  String get increase_or_decrease_word_spacing =>
      'Øk eller reduser ordmellomrom';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Øk eller reduser bokstavmellomrom';

  @override
  String get increase_or_decrease_line_height => 'Øk eller reduser linjehøyde';

  @override
  String get increase_or_decrease_text_size =>
      'Øk eller reduser tekststørrelse';

  @override
  String get increment_word_spacing => 'Øk ordmellomrom';

  @override
  String get increment_letter_spacing => 'Øk bokstavmellomrom';

  @override
  String get increment_line_height => 'Øk linjehøyde';

  @override
  String get increment_text_scale_factor => 'Øk tekstskaleringsfaktor';

  @override
  String get less_info => 'Skjul info';

  @override
  String get letter_spacing => 'Bokstavmellomrom';

  @override
  String get line_height => 'Linjehøyde';

  @override
  String get more_info => 'Vis info';

  @override
  String get read_less => 'Les mindre';

  @override
  String get read_more => 'Les mer';

  @override
  String get reduce_effects => 'Reduser effekter på skjermen';

  @override
  String get reduce_text => 'Reduser tekst';

  @override
  String get restore_settings => 'Gjenopprett innstillinger';

  @override
  String get restore_main_color => 'Gjenopprett hovedfarge';

  @override
  String get return_to_main_colors => 'Gå tilbake til hovedfarger';

  @override
  String get settings => 'Innstillinger';

  @override
  String get size_and_text_display => 'Størrelse og tekstvisning';

  @override
  String get slider_word_spacing => 'Glidebryter for ordmellomrom';

  @override
  String get slider_letter_spacing => 'Glidebryter for bokstavmellomrom';

  @override
  String get slider_line_height => 'Glidebryter for linjehøyde';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Temaprofil ikke gjenkjent',
        'seizureSafe': 'Epilepsisikker',
        'visionImpaired': 'Synshemmet',
        'adhdFriendly': 'ADHD-vennlig',
        'none': 'Standard',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsisikker profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Fjern refleksjoner og reduser farge';

  @override
  String get theme_profile_seizure_safe_description =>
      'Denne profilen gjør det mulig for brukere som har epilepsi og er i fare for anfall å surfe trygt ved å eliminere risikoen for anfall som skyldes blinkende animasjoner og risikable fargekombinasjoner.';

  @override
  String get theme_profile_vision_impaired_title => 'Profil for synshemmede';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Forbedre synligheten av applikasjonen';

  @override
  String get theme_profile_vision_impaired_description =>
      'Denne profilen tilpasser applikasjonen til å være tilgjengelig for de fleste synshemninger, som synshemming, tunnelsyn, grå stær, grønn stær og mer.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-vennlig profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mer konsentrasjon og mindre distraksjoner';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Denne profilen reduserer distraksjoner betydelig, for å hjelpe personer med ADHD og nevrologiske utviklingsforstyrrelser med å navigere, lese og fokusere på de essensielle elementene i applikasjonen enklere.';

  @override
  String get the_settings_have_been_reset => 'Innstillingene er tilbakestilt.';

  @override
  String get toggle_dark_mode => 'Slå på/av mørk modus';

  @override
  String get toggle_effects_mode => 'Slå på/av effektmodus';

  @override
  String get toggle_font_weight => 'Slå på/av skriftvekt';

  @override
  String get toggle_theme_profile => 'Slå på/av temaprofil';

  @override
  String get word_spacing => 'Ordmellomrom';
}
