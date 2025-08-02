// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AccessibilityLocalizationsIt extends AccessibilityLocalizations {
  AccessibilityLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get accessibility => 'Accessibilità';

  @override
  String get accessibility_settings => 'Impostazioni accessibilità';

  @override
  String get adjust_background_colors => 'Regola i colori dello sfondo';

  @override
  String get adjust_text_colors => 'Regola i colori del testo';

  @override
  String get align_center => 'Allinea al centro';

  @override
  String get align_left => 'Allinea a sinistra';

  @override
  String get align_right => 'Allinea a destra';

  @override
  String get bold_text => 'Testo in grassetto';

  @override
  String get change_bold_text => 'Formatta tutto il testo in grassetto';

  @override
  String get change_pages_background_color =>
      'Cambia il colore di sfondo delle pagine in: ';

  @override
  String get change_text_color => 'Cambia il colore del testo in: ';

  @override
  String get change_text_color_shade =>
      'Cambia la tonalità del colore scelto in: ';

  @override
  String get color_adjustment => 'Regolazione del colore';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Tema normale',
        'lowSaturation': 'Saturazione bassa',
        'normal': 'Tema normale',
        'highSaturation': 'Saturazione elevata',
        'monochrome': 'Monocromatico',
        'highContrast': 'Contrasto elevato',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Il profilo di colore corrente è: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Colore non riconosciuto',
        'cF44336': 'Rosso',
        'cE91E63': 'Rosa',
        'c9C27B0': 'Viola',
        'c673AB7': 'Viola scuro',
        'c3F51B5': 'Indaco',
        'c2196F3': 'Blu',
        'c03A9F4': 'Azzurro',
        'c00BCD4': 'Ciano',
        'c009688': 'Turchese',
        'c4CAF50': 'Verde',
        'c8BC34A': 'Verde chiaro',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Giallo',
        'cFFC107': 'Ambra',
        'cFF9800': 'Arancione',
        'cFF5722': 'Arancione scuro',
        'c795548': 'Marrone',
        'c9E9E9E': 'Grigio',
        'c607D8B': 'Grigio bluastro',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Diminuisci spaziatura parole';

  @override
  String get decrement_letter_spacing => 'Diminuisci spaziatura lettere';

  @override
  String get decrement_line_height => 'Diminuisci altezza righe';

  @override
  String get decrement_text_scale_factor => 'Diminuisci dimensione carattere';

  @override
  String get effects => 'Effetti';

  @override
  String get expand_text => 'Espandi testo';

  @override
  String get font_size => 'Dimensioni carattere';

  @override
  String get increase_or_decrease_word_spacing =>
      'Aumenta o riduci lo spaziatura delle parole';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Aumenta o riduci lo spaziatura delle lettere';

  @override
  String get increase_or_decrease_line_height =>
      'Aumenta o riduci l\'interlinea';

  @override
  String get increase_or_decrease_text_size =>
      'Aumenta o riduci la dimensione del testo';

  @override
  String get increment_word_spacing => 'Aumenta la spaziatura delle parole';

  @override
  String get increment_letter_spacing => 'Aumenta la spaziatura delle lettere';

  @override
  String get increment_line_height => 'Aumenta l\'interlinea';

  @override
  String get increment_text_scale_factor =>
      'Aumenta la dimensione del carattere';

  @override
  String get less_info => 'Nascondi info';

  @override
  String get letter_spacing => 'Spaziatura lettere';

  @override
  String get line_height => 'Altezza righe';

  @override
  String get more_info => 'Mostra info';

  @override
  String get read_less => 'Mostra meno';

  @override
  String get read_more => 'Leggi tutto';

  @override
  String get reduce_effects => 'Meno effetti a schermo';

  @override
  String get reduce_text => 'Riduci testo';

  @override
  String get restore_settings => 'Ripristina impostazioni';

  @override
  String get restore_main_color => 'Ripristina colore iniziale';

  @override
  String get return_to_main_colors => 'Torna ai colori principali';

  @override
  String get settings => 'Impostazioni';

  @override
  String get size_and_text_display => 'Regolazione dei contenuti';

  @override
  String get slider_word_spacing => 'Slider Spaziatura parole';

  @override
  String get slider_letter_spacing => 'Slider Spaziatura lettere';

  @override
  String get slider_line_height => 'Slider Altezza righe';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Tema non riconosciuto',
        'seizureSafe': 'Profilo a prova di convulsioni',
        'visionImpaired': 'Profilo delle persone ipovedenti',
        'adhdFriendly': 'Profilo adattato all\'ADHD',
        'none': 'Default',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profilo a prova di convulsioni';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Elimina i riflessi e riduce il colore';

  @override
  String get theme_profile_seizure_safe_description =>
      'Questo profilo consente agli utenti epilettici e a rischio di convulsioni di navigare in tutta sicurezza eliminando il rischio di convulsioni derivanti da animazioni lampeggianti e combinazioni di colori rischiose.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profilo delle persone ipovedenti';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Migliora la visibilità dell\'applicazione';

  @override
  String get theme_profile_vision_impaired_description =>
      'Questo profilo adatta l\'applicazione in modo che sia accessibile alla maggior parte delle disabilità visive, come il deterioramento della vista, la visione a tunnel, la cataratta, il glaucoma e altre ancora.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profilo adatto all\'ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Più concentrazione e meno distrazioni';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Questo profilo riduce in modo significativo le distrazioni, per aiutare le persone con ADHD e disturbi del neurosviluppo a navigare, leggere e concentrarsi più facilmente sugli elementi essenziali dell\'applicazione.';

  @override
  String get the_settings_have_been_reset =>
      'Le impostazioni sono state ripristinate.';

  @override
  String get toggle_dark_mode => 'Passa al tema scuro';

  @override
  String get toggle_effects_mode => 'Cambia modalità effetti';

  @override
  String get toggle_font_weight => 'Cambia peso del font';

  @override
  String get toggle_theme_profile => 'Cambia profilo tema a';

  @override
  String get word_spacing => 'Spaziatura parole';
}
