import 'package:accessibility/src/core/l10n/generated/app_localizations_it.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsIt', () {
    late AccessibilityLocalizationsIt localizationsIt;

    setUp(() {
      localizationsIt = AccessibilityLocalizationsIt();
    });

    test('should have the correct locale name', () {
      expect(localizationsIt.localeName, equals('it'));
    });

    test('should return the correct basic string values', () {
      expect(localizationsIt.accessibility, equals('Accessibilità'));
      expect(
        localizationsIt.accessibility_settings,
        equals('Impostazioni accessibilità'),
      );
      expect(
        localizationsIt.adjust_background_colors,
        equals('Regola i colori dello sfondo'),
      );
      expect(
        localizationsIt.adjust_text_colors,
        equals('Regola i colori del testo'),
      );
      expect(localizationsIt.align_center, equals('Allinea al centro'));
      expect(localizationsIt.align_left, equals('Allinea a sinistra'));
      expect(localizationsIt.align_right, equals('Allinea a destra'));
      expect(localizationsIt.bold_text, equals('Testo in grassetto'));
    });

    test('should return the correct change-related string values', () {
      expect(
        localizationsIt.change_bold_text,
        equals('Formatta tutto il testo in grassetto'),
      );
      expect(
        localizationsIt.change_pages_background_color,
        equals('Cambia il colore di sfondo delle pagine in: '),
      );
      expect(
        localizationsIt.change_text_color,
        equals('Cambia il colore del testo in: '),
      );
      expect(
        localizationsIt.change_text_color_shade,
        equals('Cambia la tonalità del colore scelto in: '),
      );
      expect(
        localizationsIt.color_adjustment,
        equals('Regolazione del colore'),
      );
      expect(
        localizationsIt.color_profile_changed_to,
        equals('Il profilo di colore corrente è: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        localizationsIt.decrement_word_spacing,
        equals('Diminuisci spaziatura parole'),
      );
      expect(
        localizationsIt.decrement_letter_spacing,
        equals('Diminuisci spaziatura lettere'),
      );
      expect(
        localizationsIt.decrement_line_height,
        equals('Diminuisci altezza righe'),
      );
      expect(
        localizationsIt.decrement_text_scale_factor,
        equals('Diminuisci dimensione carattere'),
      );
      expect(
        localizationsIt.increment_word_spacing,
        equals('Aumenta la spaziatura delle parole'),
      );
      expect(
        localizationsIt.increment_letter_spacing,
        equals('Aumenta la spaziatura delle lettere'),
      );
      expect(
        localizationsIt.increment_line_height,
        equals("Aumenta l'interlinea"),
      );
      expect(
        localizationsIt.increment_text_scale_factor,
        equals('Aumenta la dimensione del carattere'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        localizationsIt.increase_or_decrease_word_spacing,
        equals('Aumenta o riduci lo spaziatura delle parole'),
      );
      expect(
        localizationsIt.increase_or_decrease_letter_spacing,
        equals('Aumenta o riduci lo spaziatura delle lettere'),
      );
      expect(
        localizationsIt.increase_or_decrease_line_height,
        equals("Aumenta o riduci l'interlinea"),
      );
      expect(
        localizationsIt.increase_or_decrease_text_size,
        equals('Aumenta o riduci la dimensione del testo'),
      );
    });

    test('should return the correct feature string values', () {
      expect(localizationsIt.effects, equals('Effetti'));
      expect(localizationsIt.expand_text, equals('Espandi testo'));
      expect(localizationsIt.font_size, equals('Dimensioni carattere'));
      expect(localizationsIt.less_info, equals('Nascondi info'));
      expect(localizationsIt.letter_spacing, equals('Spaziatura lettere'));
      expect(localizationsIt.line_height, equals('Altezza righe'));
      expect(localizationsIt.more_info, equals('Mostra info'));
    });

    test('should return the correct action string values', () {
      expect(localizationsIt.read_less, equals('Mostra meno'));
      expect(localizationsIt.read_more, equals('Leggi tutto'));
      expect(localizationsIt.reduce_effects, equals('Meno effetti a schermo'));
      expect(localizationsIt.reduce_text, equals('Riduci testo'));
      expect(
        localizationsIt.restore_settings,
        equals('Ripristina impostazioni'),
      );
      expect(
        localizationsIt.restore_main_color,
        equals('Ripristina colore iniziale'),
      );
      expect(
        localizationsIt.return_to_main_colors,
        equals('Torna ai colori principali'),
      );
      expect(localizationsIt.settings, equals('Impostazioni'));
    });

    test('should return the correct settings string values', () {
      expect(
        localizationsIt.size_and_text_display,
        equals('Regolazione dei contenuti'),
      );
      expect(
        localizationsIt.slider_word_spacing,
        equals('Slider Spaziatura parole'),
      );
      expect(
        localizationsIt.slider_letter_spacing,
        equals('Slider Spaziatura lettere'),
      );
      expect(
        localizationsIt.slider_line_height,
        equals('Slider Altezza righe'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        localizationsIt.theme_mode,
        equals('Tema'),
      );
      expect(
        localizationsIt.toggle_theme_profile,
        equals('Cambia profilo tema a'),
      );
      expect(
        localizationsIt.theme_profile('other'),
        equals('Tema non riconosciuto'),
      );
      expect(
        localizationsIt.theme_profile('seizureSafe'),
        equals('Profilo a prova di convulsioni'),
      );
      expect(
        localizationsIt.theme_profile('visionImpaired'),
        equals('Profilo delle persone ipovedenti'),
      );
      expect(
        localizationsIt.theme_profile('adhdFriendly'),
        equals("Profilo adattato all'ADHD"),
      );
      expect(
        localizationsIt.theme_profile('none'),
        equals('Default'),
      );
      expect(
        localizationsIt.theme_profile_seizure_safe_title,
        equals('Profilo a prova di convulsioni'),
      );
      expect(
        localizationsIt.theme_profile_seizure_safe_subtitle,
        equals('Elimina i riflessi e riduce il colore'),
      );
      expect(
        localizationsIt.theme_profile_seizure_safe_description,
        equals(
          'Questo profilo consente agli utenti epilettici e a rischio di '
          'convulsioni di navigare in tutta sicurezza eliminando il rischio di '
          'convulsioni derivanti da animazioni lampeggianti e combinazioni di '
          'colori rischiose.',
        ),
      );
      expect(
        localizationsIt.theme_profile_vision_impaired_title,
        equals('Profilo delle persone ipovedenti'),
      );
      expect(
        localizationsIt.theme_profile_vision_impaired_subtitle,
        equals("Migliora la visibilità dell'applicazione"),
      );
      expect(
        localizationsIt.theme_profile_vision_impaired_description,
        equals(
          "Questo profilo adatta l'applicazione in modo che sia "
          'accessibile alla maggior parte delle disabilità visive, '
          'come il deterioramento della vista, la visione a tunnel, '
          'la cataratta, il glaucoma e altre ancora.',
        ),
      );
      expect(
        localizationsIt.theme_profile_adhd_friendly_title,
        equals("Profilo adatto all'ADHD"),
      );
      expect(
        localizationsIt.theme_profile_adhd_friendly_subtitle,
        equals('Più concentrazione e meno distrazioni'),
      );
      expect(
        localizationsIt.theme_profile_adhd_friendly_description,
        equals(
          'Questo profilo riduce in modo significativo le distrazioni, '
          'per aiutare le persone con ADHD e disturbi del neurosviluppo '
          'a navigare, leggere e concentrarsi più facilmente sugli elementi '
          "essenziali dell'applicazione.",
        ),
      );
      expect(
        localizationsIt.the_settings_have_been_reset,
        equals('Le impostazioni sono state ripristinate.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(localizationsIt.toggle_dark_mode, equals('Passa al tema scuro'));
      expect(
        localizationsIt.toggle_effects_mode,
        equals('Cambia modalità effetti'),
      );
      expect(
        localizationsIt.toggle_font_weight,
        equals('Cambia peso del font'),
      );
      expect(localizationsIt.word_spacing, equals('Spaziatura parole'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        localizationsIt.color_profile('lowSaturation'),
        equals('Saturazione bassa'),
      );
      expect(localizationsIt.color_profile('normal'), equals('Tema normale'));
      expect(
        localizationsIt.color_profile('highSaturation'),
        equals('Saturazione elevata'),
      );
      expect(
        localizationsIt.color_profile('monochrome'),
        equals('Monocromatico'),
      );
      expect(
        localizationsIt.color_profile('highContrast'),
        equals('Contrasto elevato'),
      );
      expect(
        localizationsIt.color_profile('unknown'),
        equals('Tema normale'),
      );
    });

    test('should handle color selection logic correctly', () {
      expect(localizationsIt.color('cF44336'), equals('Rosso'));
      expect(localizationsIt.color('cE91E63'), equals('Rosa'));
      expect(localizationsIt.color('c9C27B0'), equals('Viola'));
      expect(localizationsIt.color('c673AB7'), equals('Viola scuro'));
      expect(localizationsIt.color('c3F51B5'), equals('Indaco'));
      expect(localizationsIt.color('c2196F3'), equals('Blu'));
      expect(localizationsIt.color('c03A9F4'), equals('Azzurro'));
      expect(localizationsIt.color('c00BCD4'), equals('Ciano'));
      expect(localizationsIt.color('c009688'), equals('Turchese'));
      expect(localizationsIt.color('c4CAF50'), equals('Verde'));
      expect(localizationsIt.color('c8BC34A'), equals('Verde chiaro'));
      expect(localizationsIt.color('cCDDC39'), equals('Lime'));
      expect(localizationsIt.color('cFFEB3B'), equals('Giallo'));
      expect(localizationsIt.color('cFFC107'), equals('Ambra'));
      expect(localizationsIt.color('cFF9800'), equals('Arancione'));
      expect(localizationsIt.color('cFF5722'), equals('Arancione scuro'));
      expect(localizationsIt.color('c795548'), equals('Marrone'));
      expect(localizationsIt.color('c9E9E9E'), equals('Grigio'));
      expect(localizationsIt.color('c607D8B'), equals('Grigio bluastro'));
      expect(
        localizationsIt.color('unknown'),
        equals('Colore non riconosciuto'),
      );
    });
  });
}
