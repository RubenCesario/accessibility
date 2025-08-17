import 'package:accessibility/src/core/l10n/generated/app_localizations_af.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsAf', () {
    late AccessibilityLocalizationsAf l10n;

    setUp(() {
      l10n = AccessibilityLocalizationsAf();
    });

    test('should have the correct locale name', () {
      expect(l10n.localeName, equals('af'));
    });

    test('should return the correct basic string values', () {
      expect(l10n.accessibility, equals('Toeganklikheid'));
      expect(l10n.accessibility_settings, equals('Toeganklikheidsinstellinge'));
      expect(
        l10n.adjust_background_colors,
        equals('Aanpasbare agtergrondkleur'),
      );
      expect(l10n.adjust_text_colors, equals('Aanpasbare tekstkleur'));
      expect(l10n.align_center, equals('Gelyk'));
      expect(l10n.align_left, equals('Links'));
      expect(l10n.align_right, equals('Regs'));
      expect(l10n.bold_text, equals('Vetgedrukte teks'));
    });

    test('should return the correct change-related string values', () {
      expect(l10n.change_bold_text, equals('Verander vetgedrukte teks'));
      expect(
        l10n.change_pages_background_color,
        equals('Agtergrondkleur verander'),
      );
      expect(l10n.change_text_color, equals('Tekstkleur verander'));
      expect(
        l10n.change_text_color_shade,
        equals('Tekstkleur skakering verander'),
      );
      expect(l10n.color_adjustment, equals('Kleur aanpassing'));
      expect(
        l10n.color_profile_changed_to,
        equals('Die huidige kleurprofiel is: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        l10n.decrement_word_spacing,
        equals('Vermindering van die woordafstand'),
      );
      expect(
        l10n.decrement_letter_spacing,
        equals('Vermindering van die letterafstand'),
      );
      expect(
        l10n.decrement_line_height,
        equals('Vermindering van die reëlhoogte'),
      );
      expect(
        l10n.decrement_text_scale_factor,
        equals('Vermindering van die teksskaalfaktor'),
      );
      expect(l10n.increment_word_spacing, equals('Verhoog die woordafstand'));
      expect(
        l10n.increment_letter_spacing,
        equals('Verhoog die letterafstand'),
      );
      expect(l10n.increment_line_height, equals('Verhoog die reëlhoogte'));
      expect(
        l10n.increment_text_scale_factor,
        equals('Verhoog die teksskaalfaktor'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        l10n.increase_or_decrease_word_spacing,
        equals('Verhoog of verlaag die woordafstand'),
      );
      expect(
        l10n.increase_or_decrease_letter_spacing,
        equals('Verhoog of verlaag die letterafstand'),
      );
      expect(
        l10n.increase_or_decrease_line_height,
        equals('Verhoog of verlaag die reëlhoogte'),
      );
      expect(
        l10n.increase_or_decrease_text_size,
        equals('Verhoog of verlaag die tekstgrootte'),
      );
    });

    test('should return the correct feature string values', () {
      expect(l10n.effects, equals('Effekte'));
      expect(l10n.expand_text, equals('Teks uitbreiding'));
      expect(l10n.font_size, equals('Lettergrootte'));
      expect(l10n.less_info, equals('Verberg info'));
      expect(l10n.letter_spacing, equals('Letterspasiëring'));
      expect(l10n.line_height, equals('Reëlhoogte'));
      expect(l10n.more_info, equals('Toon info'));
    });

    test('should return the correct action string values', () {
      expect(l10n.read_less, equals('Lees minder'));
      expect(l10n.read_more, equals('Lees meer'));
      expect(l10n.reduce_effects, equals('Vermindering van die effekte'));
      expect(l10n.reduce_text, equals('Vermindering van die tekst'));
      expect(l10n.restore_settings, equals('Herstel instellinge'));
      expect(l10n.restore_main_color, equals('Herstel hoofkleur'));
      expect(l10n.return_to_main_colors, equals('Terug na hoofkleur'));
      expect(l10n.settings, equals('Instellinge'));
    });

    test('should return the correct settings string values', () {
      expect(l10n.size_and_text_display, equals('Grootte en tekstuitstelling'));
      expect(l10n.slider_word_spacing, equals('Skuifbalk vir woordafstand'));
      expect(
        l10n.slider_letter_spacing,
        equals('Skuifbalk vir letterspasiëring'),
      );
      expect(l10n.slider_line_height, equals('Skuifbalk vir reëlhoogte'));
    });

    test('should return the correct theme string values', () {
      expect(l10n.theme_profile('other'), equals('Temaprofiel nie herken nie'));
      expect(l10n.theme_profile('seizureSafe'), equals('Epilepsie-veilig'));
      expect(l10n.theme_profile('visionImpaired'), equals('Gesiggestrem'));
      expect(l10n.theme_profile('adhdFriendly'), equals('ADHD-vriendelik'));
      expect(l10n.theme_profile('none'), equals('Verstek'));
      expect(
        l10n.theme_profile_seizure_safe_title,
        equals('Epilepsie-veilige profiel'),
      );
      expect(
        l10n.theme_profile_seizure_safe_subtitle,
        equals('Verwyder weerkaatsings en verminder kleur'),
      );
      expect(
        l10n.theme_profile_seizure_safe_description,
        equals(
          'Hierdie profiel stel gebruikers met epilepsie en '
          'diegene met risiko vir toevalle in staat om veilig te blaai '
          'deur die risiko van toevalle wat veroorsaak word deur '
          'flikkerende animasies en riskante kleurkombinasies te verminder.',
        ),
      );
      expect(
        l10n.theme_profile_vision_impaired_title,
        equals('Gesiggestremde profiel'),
      );
      expect(
        l10n.theme_profile_vision_impaired_subtitle,
        equals('Verbeter die sigbaarheid van die toepassing'),
      );
      expect(
        l10n.theme_profile_vision_impaired_description,
        equals(
          'Hierdie profiel pas die toepassing aan om toeganklik te wees '
          'vir die meeste visuele gestremdhede, soos gesiggestremdheid, '
          'tonnelsig, katarakte, gloukoom en meer.',
        ),
      );
      expect(
        l10n.theme_profile_adhd_friendly_title,
        equals('ADHD-vriendelike profiel'),
      );
      expect(
        l10n.theme_profile_adhd_friendly_subtitle,
        equals('Meer konsentrasie en minder afleidings'),
      );
      expect(
        l10n.theme_profile_adhd_friendly_description,
        equals(
          'Hierdie profiel verminder afleidings beduidend om mense met ADHD en '
          'neuro-ontwikkelingsversteurings te help om makliker deur die '
          'toepassing te navigeer, te lees en op die noodsaaklike '
          'elemente te fokus.',
        ),
      );
      expect(
        l10n.the_settings_have_been_reset,
        equals('Die instellinge is herstel.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(l10n.toggle_dark_mode, equals('Wissel donker modus'));
      expect(l10n.toggle_effects_mode, equals('Wissel effekte modus'));
      expect(l10n.toggle_font_weight, equals('Wissel font gewicht'));
      expect(l10n.word_spacing, equals('Woordafstand'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(l10n.color_profile('lowSaturation'), equals('Laag satuur'));
      expect(l10n.color_profile('normal'), equals('Normaal'));
      expect(l10n.color_profile('highSaturation'), equals('Hoog satuur'));
      expect(l10n.color_profile('monochrome'), equals('Monochroom'));
      expect(l10n.color_profile('highContrast'), equals('Hoog contrast'));
      expect(l10n.color_profile('unknown'), equals('Normaal'));
    });

    test('should handle color selection logic correctly', () {
      expect(l10n.color('cF44336'), equals('Rooi'));
      expect(l10n.color('cE91E63'), equals('Pienk'));
      expect(l10n.color('c9C27B0'), equals('Pers'));
      expect(l10n.color('c673AB7'), equals('Diep Pers'));
      expect(l10n.color('c3F51B5'), equals('Indigo'));
      expect(l10n.color('c2196F3'), equals('Blou'));
      expect(l10n.color('c03A9F4'), equals('Lig Blou'));
      expect(l10n.color('c00BCD4'), equals('Siaan'));
      expect(l10n.color('c009688'), equals('Blougroen'));
      expect(l10n.color('c4CAF50'), equals('Groen'));
      expect(l10n.color('c8BC34A'), equals('Lig Groen'));
      expect(l10n.color('cCDDC39'), equals('Lemmetjie'));
      expect(l10n.color('cFFEB3B'), equals('Geel'));
      expect(l10n.color('cFFC107'), equals('Amber'));
      expect(l10n.color('cFF9800'), equals('Oranje'));
      expect(l10n.color('cFF5722'), equals('Diep Oranje'));
      expect(l10n.color('c795548'), equals('Bruin'));
      expect(l10n.color('c9E9E9E'), equals('Grys'));
      expect(l10n.color('c607D8B'), equals('Blougrys'));
      expect(l10n.color('unknown'), equals('Kleur ongekend'));
    });
  });
}
