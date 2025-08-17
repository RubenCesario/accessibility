import 'package:accessibility/src/core/l10n/generated/app_localizations_it.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsIt', () {
    late AccessibilityLocalizationsIt loc;

    setUp(() {
      loc = AccessibilityLocalizationsIt();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('it'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accessibilità'));
      expect(
        loc.accessibility_settings,
        equals('Impostazioni accessibilità'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Regola i colori dello sfondo'),
      );
      expect(
        loc.adjust_text_colors,
        equals('Regola i colori del testo'),
      );
      expect(loc.align_center, equals('Allinea al centro'));
      expect(loc.align_left, equals('Allinea a sinistra'));
      expect(loc.align_right, equals('Allinea a destra'));
      expect(loc.bold_text, equals('Testo in grassetto'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('Formatta tutto il testo in grassetto'),
      );
      expect(
        loc.change_pages_background_color,
        equals('Cambia il colore di sfondo delle pagine in: '),
      );
      expect(
        loc.change_text_color,
        equals('Cambia il colore del testo in: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Cambia la tonalità del colore scelto in: '),
      );
      expect(
        loc.color_adjustment,
        equals('Regolazione del colore'),
      );
      expect(
        loc.color_profile_changed_to,
        equals('Il profilo di colore corrente è: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Diminuisci spaziatura parole'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Diminuisci spaziatura lettere'),
      );
      expect(
        loc.decrement_line_height,
        equals('Diminuisci altezza righe'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Diminuisci dimensione carattere'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Aumenta la spaziatura delle parole'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Aumenta la spaziatura delle lettere'),
      );
      expect(
        loc.increment_line_height,
        equals("Aumenta l'interlinea"),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Aumenta la dimensione del carattere'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Aumenta o riduci lo spaziatura delle parole'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Aumenta o riduci lo spaziatura delle lettere'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals("Aumenta o riduci l'interlinea"),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Aumenta o riduci la dimensione del testo'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effetti'));
      expect(loc.expand_text, equals('Espandi testo'));
      expect(loc.font_size, equals('Dimensioni carattere'));
      expect(loc.less_info, equals('Nascondi info'));
      expect(loc.letter_spacing, equals('Spaziatura lettere'));
      expect(loc.line_height, equals('Altezza righe'));
      expect(loc.more_info, equals('Mostra info'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Mostra meno'));
      expect(loc.read_more, equals('Leggi tutto'));
      expect(loc.reduce_effects, equals('Meno effetti a schermo'));
      expect(loc.reduce_text, equals('Riduci testo'));
      expect(
        loc.restore_settings,
        equals('Ripristina impostazioni'),
      );
      expect(
        loc.restore_main_color,
        equals('Ripristina colore iniziale'),
      );
      expect(
        loc.return_to_main_colors,
        equals('Torna ai colori principali'),
      );
      expect(loc.settings, equals('Impostazioni'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Regolazione dei contenuti'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Slider Spaziatura parole'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Slider Spaziatura lettere'),
      );
      expect(
        loc.slider_line_height,
        equals('Slider Altezza righe'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_mode,
        equals('Tema'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('Cambia profilo tema a'),
      );
      expect(
        loc.theme_profile('other'),
        equals('Tema non riconosciuto'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Profilo a prova di convulsioni'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Profilo delle persone ipovedenti'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals("Profilo adattato all'ADHD"),
      );
      expect(
        loc.theme_profile('none'),
        equals('Default'),
      );
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profilo a prova di convulsioni'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Elimina i riflessi e riduce il colore'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Questo profilo consente agli utenti epilettici e a rischio di '
          'convulsioni di navigare in tutta sicurezza eliminando il rischio di '
          'convulsioni derivanti da animazioni lampeggianti e combinazioni di '
          'colori rischiose.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profilo delle persone ipovedenti'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals("Migliora la visibilità dell'applicazione"),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          "Questo profilo adatta l'applicazione in modo che sia "
          'accessibile alla maggior parte delle disabilità visive, '
          'come il deterioramento della vista, la visione a tunnel, '
          'la cataratta, il glaucoma e altre ancora.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals("Profilo adatto all'ADHD"),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Più concentrazione e meno distrazioni'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Questo profilo riduce in modo significativo le distrazioni, '
          'per aiutare le persone con ADHD e disturbi del neurosviluppo '
          'a navigare, leggere e concentrarsi più facilmente sugli elementi '
          "essenziali dell'applicazione.",
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Le impostazioni sono state ripristinate.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Passa al tema scuro'));
      expect(
        loc.toggle_effects_mode,
        equals('Cambia modalità effetti'),
      );
      expect(
        loc.toggle_font_weight,
        equals('Cambia peso del font'),
      );
      expect(loc.word_spacing, equals('Spaziatura parole'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Saturazione bassa'),
      );
      expect(loc.color_profile('normal'), equals('Tema normale'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Saturazione elevata'),
      );
      expect(
        loc.color_profile('monochrome'),
        equals('Monocromatico'),
      );
      expect(
        loc.color_profile('highContrast'),
        equals('Contrasto elevato'),
      );
      expect(
        loc.color_profile('unknown'),
        equals('Tema normale'),
      );
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Rosso'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Viola'));
      expect(loc.color('c673AB7'), equals('Viola scuro'));
      expect(loc.color('c3F51B5'), equals('Indaco'));
      expect(loc.color('c2196F3'), equals('Blu'));
      expect(loc.color('c03A9F4'), equals('Azzurro'));
      expect(loc.color('c00BCD4'), equals('Ciano'));
      expect(loc.color('c009688'), equals('Turchese'));
      expect(loc.color('c4CAF50'), equals('Verde'));
      expect(loc.color('c8BC34A'), equals('Verde chiaro'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Giallo'));
      expect(loc.color('cFFC107'), equals('Ambra'));
      expect(loc.color('cFF9800'), equals('Arancione'));
      expect(loc.color('cFF5722'), equals('Arancione scuro'));
      expect(loc.color('c795548'), equals('Marrone'));
      expect(loc.color('c9E9E9E'), equals('Grigio'));
      expect(loc.color('c607D8B'), equals('Grigio bluastro'));
      expect(
        loc.color('unknown'),
        equals('Colore non riconosciuto'),
      );
    });
  });
}
