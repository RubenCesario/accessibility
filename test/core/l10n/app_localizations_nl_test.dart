import 'package:accessibility/src/core/l10n/generated/app_localizations_nl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsNl', () {
    late AccessibilityLocalizationsNl loc;

    setUp(() {
      loc = AccessibilityLocalizationsNl();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('nl'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Toegankelijkheid'));
      expect(
        loc.accessibility_settings,
        equals('Toegankelijkheidsinstellingen'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Achtergrondkleuren aanpassen'),
      );
      expect(loc.adjust_text_colors, equals('Tekstkleuren aanpassen'));
      expect(loc.align_center, equals('Centreren'));
      expect(loc.align_left, equals('Links uitlijnen'));
      expect(loc.align_right, equals('Rechts uitlijnen'));
      expect(loc.bold_text, equals('Vetgedrukte tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Vetgedrukte tekst wijzigen'));
      expect(
        loc.change_pages_background_color,
        equals("Verander de achtergrondkleur van de pagina's naar: "),
      );
      expect(
        loc.change_text_color,
        equals('Verander de kleur van de tekst naar: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Verander de tint van de kleur naar: '),
      );
      expect(loc.color_adjustment, equals('Kleuraanpassing'));
      expect(
        loc.color_profile_changed_to,
        equals('Het huidige kleurprofiel is: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Woordafstand verkleinen'));
      expect(
        loc.decrement_letter_spacing,
        equals('Letterafstand verkleinen'),
      );
      expect(loc.decrement_line_height, equals('Regelhoogte verkleinen'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Tekstschaalfactor verkleinen'),
      );
      expect(loc.increment_word_spacing, equals('Woordafstand vergroten'));
      expect(loc.increment_letter_spacing, equals('Letterafstand vergroten'));
      expect(loc.increment_line_height, equals('Regelhoogte vergroten'));
      expect(
        loc.increment_text_scale_factor,
        equals('Tekstschaalfactor vergroten'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Woordafstand vergroten of verkleinen'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Letterafstand vergroten of verkleinen'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Regelhoogte vergroten of verkleinen'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Tekstgrootte vergroten of verkleinen'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effecten'));
      expect(loc.expand_text, equals('Tekst uitbreiden'));
      expect(loc.font_size, equals('Lettergrootte'));
      expect(loc.less_info, equals('Info verbergen'));
      expect(loc.letter_spacing, equals('Letterafstand'));
      expect(loc.line_height, equals('Regelhoogte'));
      expect(loc.more_info, equals('Info tonen'));
      expect(loc.word_spacing, equals('Woordafstand'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Minder lezen'));
      expect(loc.read_more, equals('Meer lezen'));
      expect(
        loc.reduce_effects,
        equals('Effecten op scherm verminderen'),
      );
      expect(loc.reduce_text, equals('Tekst verkleinen'));
      expect(loc.restore_settings, equals('Instellingen herstellen'));
      expect(loc.restore_main_color, equals('Hoofdkleur herstellen'));
      expect(
        loc.return_to_main_colors,
        equals('Terug naar hoofdkleuren'),
      );
      expect(loc.settings, equals('Instellingen'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Grootte en tekstweergave'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Schuifregelaar woordafstand'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Schuifregelaar letterafstand'),
      );
      expect(
        loc.slider_line_height,
        equals('Schuifregelaar regelhoogte'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Thema'));
      expect(
        loc.theme_profile('other'),
        equals('Themaprofiel niet herkend'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Epilepsieveilig'));
      expect(loc.theme_profile('visionImpaired'), equals('Visueel beperkt'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-vriendelijk'));
      expect(loc.theme_profile('none'), equals('Standaard'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsieveilig profiel'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Reflecties verwijderen en kleur verminderen'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Dit profiel stelt gebruikers met epilepsie en risico op '
          'aanvallen in staat om veilig te browsen door het risico '
          'op aanvallen te elimineren die het gevolg zijn van '
          'flitsende animaties en risicovolle '
          'kleurencombinaties.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profiel voor visueel beperkten'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Verbeter zichtbaarheid van de applicatie'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Dit profiel past de applicatie aan zodat deze '
          'toegankelijk is voor de meeste visuele beperkingen, '
          'zoals slechtziendheid, tunnelvisie, staar, glaucoom en '
          'meer.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-vriendelijk profiel'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Meer concentratie en minder afleiding'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Dit profiel vermindert afleidingen aanzienlijk, om '
          'mensen met ADHD en neurologische '
          'ontwikkelingsstoornissen te helpen bij het navigeren, '
          'lezen en zich te concentreren op de essentiële '
          'elementen van de applicatie.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('De instellingen zijn hersteld.'),
      );
      expect(loc.toggle_dark_mode, equals('Donkere modus aan/uit'));
      expect(loc.toggle_effects_mode, equals('Effectenmodus aan/uit'));
      expect(loc.toggle_font_weight, equals('Letterdikte aan/uit'));
      expect(loc.toggle_theme_profile, equals('Themaprofiel aan/uit'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normaal'));
      expect(loc.color_profile('lowSaturation'), equals('Lage verzadiging'));
      expect(loc.color_profile('normal'), equals('Normaal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Hoge verzadiging'),
      );
      expect(loc.color_profile('monochrome'), equals('Monochroom'));
      expect(loc.color_profile('highContrast'), equals('Hoge contrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Kleur niet herkend'));
      expect(loc.color('cF44336'), equals('Rood'));
      expect(loc.color('cE91E63'), equals('Roze'));
      expect(loc.color('c9C27B0'), equals('Paars'));
      expect(loc.color('c673AB7'), equals('Diep paars'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blauw'));
      expect(loc.color('c03A9F4'), equals('Lichtblauw'));
      expect(loc.color('c00BCD4'), equals('Cyaan'));
      expect(loc.color('c009688'), equals('Groenblauw'));
      expect(loc.color('c4CAF50'), equals('Groen'));
      expect(loc.color('c8BC34A'), equals('Lichtgroen'));
      expect(loc.color('cCDDC39'), equals('Limoen'));
      expect(loc.color('cFFEB3B'), equals('Geel'));
      expect(loc.color('cFFC107'), equals('Amber'));
      expect(loc.color('cFF9800'), equals('Oranje'));
      expect(loc.color('cFF5722'), equals('Diep oranje'));
      expect(loc.color('c795548'), equals('Bruin'));
      expect(loc.color('c9E9E9E'), equals('Grijs'));
      expect(loc.color('c607D8B'), equals('Blauwgrijs'));
    });
  });
}
