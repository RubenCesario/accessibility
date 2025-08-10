// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AccessibilityLocalizationsDe extends AccessibilityLocalizations {
  AccessibilityLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get accessibility => 'Barrierefreiheit';

  @override
  String get accessibility_settings => 'Barrierefreiheit-Einstellungen';

  @override
  String get adjust_background_colors => 'Hintergrundfarben anpassen';

  @override
  String get adjust_text_colors => 'Textfarben anpassen';

  @override
  String get align_center => 'Zentriert ausrichten';

  @override
  String get align_left => 'Linksbündig ausrichten';

  @override
  String get align_right => 'Rechtsbündig ausrichten';

  @override
  String get bold_text => 'Fettschrift';

  @override
  String get change_bold_text => 'Fettschrift ändern';

  @override
  String get change_pages_background_color =>
      'Hintergrundfarbe der Seiten ändern zu: ';

  @override
  String get change_text_color => 'Farbe des Textes ändern zu: ';

  @override
  String get change_text_color_shade => 'Schattierung der Farbe ändern zu: ';

  @override
  String get color_adjustment => 'Farbanpassung';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Geringe Sättigung',
        'normal': 'Normal',
        'highSaturation': 'Hohe Sättigung',
        'monochrome': 'Monochrom',
        'highContrast': 'Hoher Kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Das aktuelle Farbprofil ist: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Farbe nicht erkannt',
        'cF44336': 'Rot',
        'cE91E63': 'Pink',
        'c9C27B0': 'Lila',
        'c673AB7': 'Dunkellila',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Blau',
        'c03A9F4': 'Hellblau',
        'c00BCD4': 'Cyan',
        'c009688': 'Türkis',
        'c4CAF50': 'Grün',
        'c8BC34A': 'Hellgrün',
        'cCDDC39': 'Limette',
        'cFFEB3B': 'Gelb',
        'cFFC107': 'Bernstein',
        'cFF9800': 'Orange',
        'cFF5722': 'Dunkelorange',
        'c795548': 'Braun',
        'c9E9E9E': 'Grau',
        'c607D8B': 'Blaugrau',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Wortabstand verringern';

  @override
  String get decrement_letter_spacing => 'Buchstabenabstand verringern';

  @override
  String get decrement_line_height => 'Zeilenhöhe verringern';

  @override
  String get decrement_text_scale_factor => 'Textskalierungsfaktor verringern';

  @override
  String get effects => 'Effekte';

  @override
  String get expand_text => 'Text erweitern';

  @override
  String get font_size => 'Schriftgröße';

  @override
  String get increase_or_decrease_word_spacing =>
      'Wortabstand erhöhen oder verringern';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Buchstabenabstand erhöhen oder verringern';

  @override
  String get increase_or_decrease_line_height =>
      'Zeilenhöhe erhöhen oder verringern';

  @override
  String get increase_or_decrease_text_size =>
      'Textgröße erhöhen oder verringern';

  @override
  String get increment_word_spacing => 'Wortabstand erhöhen';

  @override
  String get increment_letter_spacing => 'Buchstabenabstand erhöhen';

  @override
  String get increment_line_height => 'Zeilenhöhe erhöhen';

  @override
  String get increment_text_scale_factor => 'Textskalierungsfaktor erhöhen';

  @override
  String get less_info => 'Info ausblenden';

  @override
  String get letter_spacing => 'Buchstabenabstand';

  @override
  String get line_height => 'Zeilenhöhe';

  @override
  String get more_info => 'Info anzeigen';

  @override
  String get read_less => 'Weniger lesen';

  @override
  String get read_more => 'Mehr lesen';

  @override
  String get reduce_effects => 'Bildschirmeffekte reduzieren';

  @override
  String get reduce_text => 'Text verkleinern';

  @override
  String get restore_settings => 'Einstellungen zurücksetzen';

  @override
  String get restore_main_color => 'Hauptfarbe wiederherstellen';

  @override
  String get return_to_main_colors => 'Zurück zu Hauptfarben';

  @override
  String get settings => 'Einstellungen';

  @override
  String get size_and_text_display => 'Größe und Textanzeige';

  @override
  String get slider_word_spacing => 'Schieberegler für Wortabstand';

  @override
  String get slider_letter_spacing => 'Schieberegler für Buchstabenabstand';

  @override
  String get slider_line_height => 'Schieberegler für Zeilenhöhe';

  @override
  String get theme_mode => 'Thema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Themaprofil nicht erkannt',
        'seizureSafe': 'Epilepsie-sicher',
        'visionImpaired': 'Für Sehbehinderung',
        'adhdFriendly': 'ADHS-freundlich',
        'none': 'Standard',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsie-sicheres Profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Reflexionen entfernen und Farbe reduzieren';

  @override
  String get theme_profile_seizure_safe_description =>
      'Dieses Profil ermöglicht Benutzern mit Epilepsie und erhöhtem Anfallsrisiko eine sichere Nutzung, indem es das Risiko von Anfällen durch blinkende Animationen und riskante Farbkombinationen verringert.';

  @override
  String get theme_profile_vision_impaired_title => 'Profil für Sehbehinderung';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Verbessert die Sichtbarkeit der Anwendung';

  @override
  String get theme_profile_vision_impaired_description =>
      'Dieses Profil passt die Anwendung an, um für die meisten Sehbehinderungen zugänglich zu sein, wie z.B. Sehschwäche, Tunnelblick, Katarakte, Glaukom und mehr.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHS-freundliches Profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mehr Konzentration und weniger Ablenkung';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Dieses Profil reduziert Ablenkungen erheblich, um Menschen mit ADHS und neurologischen Entwicklungsstörungen zu helfen, leichter zu navigieren, zu lesen und sich auf die wesentlichen Elemente der Anwendung zu konzentrieren.';

  @override
  String get the_settings_have_been_reset =>
      'Die Einstellungen wurden zurückgesetzt.';

  @override
  String get toggle_dark_mode => 'Dunkelmodus umschalten';

  @override
  String get toggle_effects_mode => 'Effektmodus umschalten';

  @override
  String get toggle_font_weight => 'Schriftstärke umschalten';

  @override
  String get toggle_theme_profile => 'Themaprofil umschalten';

  @override
  String get word_spacing => 'Wortabstand';
}
