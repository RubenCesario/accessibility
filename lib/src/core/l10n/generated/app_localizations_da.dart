// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AccessibilityLocalizationsDa extends AccessibilityLocalizations {
  AccessibilityLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get accessibility => 'Tilgængelighed';

  @override
  String get accessibility_settings => 'Tilgængelighedsindstillinger';

  @override
  String get adjust_background_colors => 'Juster baggrundsfarver';

  @override
  String get adjust_text_colors => 'Juster tekstfarver';

  @override
  String get align_center => 'Centrér tekst';

  @override
  String get align_left => 'Venstrejustér tekst';

  @override
  String get align_right => 'Højrejustér tekst';

  @override
  String get bold_text => 'Fed tekst';

  @override
  String get change_bold_text => 'Skift fed tekst';

  @override
  String get change_pages_background_color =>
      'Skift baggrundsfarve på siderne til: ';

  @override
  String get change_text_color => 'Skift tekstfarve til: ';

  @override
  String get change_text_color_shade => 'Skift farvens nuance til: ';

  @override
  String get color_adjustment => 'Farvejustering';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Lav mætning',
        'normal': 'Normal',
        'highSaturation': 'Høj mætning',
        'monochrome': 'Monokrom',
        'highContrast': 'Høj kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Den aktuelle farveprofil er: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Farve ikke genkendt',
        'cF44336': 'Rød',
        'cE91E63': 'Pink',
        'c9C27B0': 'Lilla',
        'c673AB7': 'Dyb lilla',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Blå',
        'c03A9F4': 'Lyseblå',
        'c00BCD4': 'Cyan',
        'c009688': 'Blågrøn',
        'c4CAF50': 'Grøn',
        'c8BC34A': 'Lysegrøn',
        'cCDDC39': 'Limegrøn',
        'cFFEB3B': 'Gul',
        'cFFC107': 'Rav',
        'cFF9800': 'Orange',
        'cFF5722': 'Dyb orange',
        'c795548': 'Brun',
        'c9E9E9E': 'Grå',
        'c607D8B': 'Blågrå',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Formindsk ordmellemrum';

  @override
  String get decrement_letter_spacing => 'Formindsk bogstavmellemrum';

  @override
  String get decrement_line_height => 'Formindsk linjehøjde';

  @override
  String get decrement_text_scale_factor => 'Formindsk tekststorhedsfaktor';

  @override
  String get effects => 'Effekter';

  @override
  String get expand_text => 'Udvid tekst';

  @override
  String get font_size => 'Skriftstørrelse';

  @override
  String get increase_or_decrease_word_spacing =>
      'Forøg eller formindsk ordmellemrum';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Forøg eller formindsk bogstavmellemrum';

  @override
  String get increase_or_decrease_line_height =>
      'Forøg eller formindsk linjehøjde';

  @override
  String get increase_or_decrease_text_size =>
      'Forøg eller formindsk tekststørrelse';

  @override
  String get increment_word_spacing => 'Forøg ordmellemrum';

  @override
  String get increment_letter_spacing => 'Forøg bogstavmellemrum';

  @override
  String get increment_line_height => 'Forøg linjehøjde';

  @override
  String get increment_text_scale_factor => 'Forøg tekststorhedsfaktor';

  @override
  String get less_info => 'Skjul info';

  @override
  String get letter_spacing => 'Bogstavmellemrum';

  @override
  String get line_height => 'Linjehøjde';

  @override
  String get more_info => 'Vis info';

  @override
  String get read_less => 'Læs mindre';

  @override
  String get read_more => 'Læs mere';

  @override
  String get reduce_effects => 'Reducer effekter på skærmen';

  @override
  String get reduce_text => 'Reducer tekst';

  @override
  String get restore_settings => 'Gendan indstillinger';

  @override
  String get restore_main_color => 'Gendan hovedfarve';

  @override
  String get return_to_main_colors => 'Vend tilbage til hovedfarver';

  @override
  String get settings => 'Indstillinger';

  @override
  String get size_and_text_display => 'Størrelse og tekstvisning';

  @override
  String get slider_word_spacing => 'Skydekontrol til ordmellemrum';

  @override
  String get slider_letter_spacing => 'Skydekontrol til bogstavmellemrum';

  @override
  String get slider_line_height => 'Skydekontrol til linjehøjde';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Temaprofil ikke genkendt',
        'seizureSafe': 'Epilepsivenlig',
        'visionImpaired': 'Synshandicapvenlig',
        'adhdFriendly': 'ADHD-venlig',
        'none': 'Standard',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsivenlig profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Fjern refleksioner og reducer farve';

  @override
  String get theme_profile_seizure_safe_description =>
      'Denne profil gør det muligt for brugere, der har epilepsi og er i risiko for anfæld, at bruge applikationen sikkert ved at eliminere risikoen for anfæld, der skyldes blinkende animationer og risikable farvekombinationer.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil for synshandicappede';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Forbedrer synligheden af applikationen';

  @override
  String get theme_profile_vision_impaired_description =>
      'Denne profil tilpasser applikationen til at være tilgængelig for de fleste synshandicap, såsom synsnedsættelse, tunnelsyn, grå stær, gløjde og mere.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-venlig profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mere koncentration og færre distraktioner';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Denne profil reducerer væsentligt distraktioner for at hjælpe personer med ADHD og neuroudviklingsmæssige forstyrrelser med at navigere, læse og fokusere på de væsentlige elementer i applikationen mere enkelt.';

  @override
  String get the_settings_have_been_reset =>
      'Indstillingerne er blevet nulstillet.';

  @override
  String get toggle_dark_mode => 'Skift mørk tilstand';

  @override
  String get toggle_effects_mode => 'Skift effekttilstand';

  @override
  String get toggle_font_weight => 'Skift skrifttyngde';

  @override
  String get toggle_theme_profile => 'Skift temaprofil';

  @override
  String get word_spacing => 'Ordmellemrum';

  @override
  String get accessible_font => 'Tilgængelig skrifttype';

  @override
  String get accessible_font_subtitle =>
      'Brug Verdana-skrifttype for bedre læsbarhed';

  @override
  String get accessible_font_enabled => 'Tilgængelig skrifttype aktiveret';

  @override
  String get accessible_font_disabled => 'Tilgængelig skrifttype deaktiveret';

  @override
  String get toggle_accessible_font => 'Skift tilgængelig skrifttype';
}
