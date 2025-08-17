import 'package:accessibility/src/core/l10n/generated/app_localizations_fi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsFi', () {
    late AccessibilityLocalizationsFi loc;

    setUp(() {
      loc = AccessibilityLocalizationsFi();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('fi'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Esteettömyys'));
      expect(
        loc.accessibility_settings,
        equals('Esteettömyysasetukset'),
      );
      expect(loc.adjust_background_colors, equals('Säädä taustavärejä'));
      expect(loc.adjust_text_colors, equals('Säädä tekstin värejä'));
      expect(loc.align_center, equals('Keskitä'));
      expect(loc.align_left, equals('Tasaa vasemmalle'));
      expect(loc.align_right, equals('Tasaa oikealle'));
      expect(loc.bold_text, equals('Lihavoitu teksti'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Muuta lihavoitua tekstiä'));
      expect(
        loc.change_pages_background_color,
        equals('Muuta sivujen taustaväri: '),
      );
      expect(loc.change_text_color, equals('Muuta tekstin väri: '));
      expect(loc.change_text_color_shade, equals('Muuta värin sävyä: '));
      expect(loc.color_adjustment, equals('Värien säätäminen'));
      expect(
        loc.color_profile_changed_to,
        equals('Nykyinen väriprofiili on: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Pienennä sanaetäisyyttä'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Pienennä kirjainvälejä'),
      );
      expect(loc.decrement_line_height, equals('Pienennä rivikorkeuttä'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Pienennä tekstin skaalauskerrointa'),
      );
      expect(loc.increment_word_spacing, equals('Kasvata sanaetäisyyttä'));
      expect(loc.increment_letter_spacing, equals('Kasvata kirjainvälejä'));
      expect(loc.increment_line_height, equals('Kasvata rivikorkeutta'));
      expect(
        loc.increment_text_scale_factor,
        equals('Kasvata tekstin skaalauskerrointa'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Lisää tai vähennä sanaetäisyyttä'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Lisää tai vähennä kirjainvälejä'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Lisää tai vähennä rivikorkeutta'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Lisää tai vähennä tekstin kokoa'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Tehosteet'));
      expect(loc.expand_text, equals('Laajenna tekstiä'));
      expect(loc.font_size, equals('Fonttikoko'));
      expect(loc.less_info, equals('Piilota tiedot'));
      expect(loc.letter_spacing, equals('Kirjainväli'));
      expect(loc.line_height, equals('Rivikorkeus'));
      expect(loc.more_info, equals('Näytä tiedot'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Lue vähemmän'));
      expect(loc.read_more, equals('Lue lisää'));
      expect(loc.reduce_effects, equals('Vähennä näytön tehosteita'));
      expect(loc.reduce_text, equals('Pienennä tekstiä'));
      expect(loc.restore_settings, equals('Palauta asetukset'));
      expect(loc.restore_main_color, equals('Palauta pääväri'));
      expect(loc.return_to_main_colors, equals('Palaa pääväreihin'));
      expect(loc.settings, equals('Asetukset'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Koko ja tekstin näyttö'));
      expect(loc.slider_word_spacing, equals('Sanaetäisyyden liukusäädin'));
      expect(loc.slider_letter_spacing, equals('Kirjainvälin liukusäädin'));
      expect(loc.slider_line_height, equals('Rivikorkeuden liukusäädin'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Teemaprofiilia ei tunnistettu'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Kohtausturvallinen'));
      expect(loc.theme_profile('visionImpaired'), equals('Näkövammainen'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-ystävällinen'));
      expect(loc.theme_profile('none'), equals('Oletus'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Kohtausturvallinen profiili'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Poista heijastukset ja vähennä väriä'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Tämä profiili mahdollistaa käyttäjille, joilla on epilepsia ja '
          'jotka ovat alttiita kohtauksille, turvallisen selaamisen '
          'poistamalla välkkyvien animaatioiden ja riskialttiiden '
          'väriyhdistelmien aiheuttamat kohtausriskit.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Näkövammainen profiili'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Paranna sovelluksen näkyvyyttä'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Tämä profiili mukauttaa sovelluksen saavutettavaksi '
          'useimmille näkövammoille, kuten näkövammaisuus, putkinäkö, '
          'kaihi, glaukooma ja muut.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-ystävällinen profiili'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Enemmän keskittymistä ja vähemmän häiriöitä'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Tämä profiili vähentää merkittävästi häiriötekijöitä '
          'auttaakseen ADHD:sta ja neuropsykiatrisista häiriöistä '
          'kärsiviä ihmisiä navigoimaan, lukemaan ja keskittymään '
          'sovelluksen olennaisiin elementteihin helpommin.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Asetukset on palautettu.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Vaihda tumma tila'));
      expect(loc.toggle_effects_mode, equals('Vaihda tehosteita'));
      expect(loc.toggle_font_weight, equals('Vaihda fontin paksuutta'));
      expect(loc.toggle_theme_profile, equals('Vaihda teemaprofiilia'));
      expect(loc.word_spacing, equals('Sanaetäisyys'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Matala värikylläisyys'),
      );
      expect(loc.color_profile('normal'), equals('Normaali'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Korkea värikylläisyys'),
      );
      expect(loc.color_profile('monochrome'), equals('Mustavalko'));
      expect(loc.color_profile('highContrast'), equals('Korkea kontrasti'));
      expect(loc.color_profile('unknown'), equals('Normaali'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Punainen'));
      expect(loc.color('cE91E63'), equals('Pinkki'));
      expect(loc.color('c9C27B0'), equals('Violetti'));
      expect(loc.color('c673AB7'), equals('Tumma violetti'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Sininen'));
      expect(loc.color('c03A9F4'), equals('Vaalean sininen'));
      expect(loc.color('c00BCD4'), equals('Syaani'));
      expect(loc.color('c009688'), equals('Turkoosi'));
      expect(loc.color('c4CAF50'), equals('Vihreä'));
      expect(loc.color('c8BC34A'), equals('Vaalean vihreä'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Keltainen'));
      expect(loc.color('cFFC107'), equals('Meripihka'));
      expect(loc.color('cFF9800'), equals('Oranssi'));
      expect(loc.color('cFF5722'), equals('Syvä oranssi'));
      expect(loc.color('c795548'), equals('Ruskea'));
      expect(loc.color('c9E9E9E'), equals('Harmaa'));
      expect(loc.color('c607D8B'), equals('Siniharmaa'));
      expect(
        loc.color('unknown'),
        equals('Väriä ei tunnistettu'),
      );
    });
  });
}
