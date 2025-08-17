import 'package:accessibility/src/core/l10n/generated/app_localizations_eu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsEu', () {
    late AccessibilityLocalizationsEu loc;

    setUp(() {
      loc = AccessibilityLocalizationsEu();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('eu'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Irisgarritasuna'));
      expect(
        loc.accessibility_settings,
        equals('Irisgarritasun ezarpenak'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Doitu atzeko planoko koloreak'),
      );
      expect(loc.adjust_text_colors, equals('Doitu testuaren koloreak'));
      expect(loc.align_center, equals('Erdiratu'));
      expect(loc.align_left, equals('Ezkerrera lerrokatu'));
      expect(loc.align_right, equals('Eskuinera lerrokatu'));
      expect(loc.bold_text, equals('Testu lodia'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Aldatu testuaren lodiera'));
      expect(
        loc.change_pages_background_color,
        equals('Aldatu orrien atzeko planoaren kolorea honetara: '),
      );
      expect(
        loc.change_text_color,
        equals('Aldatu testuaren kolorea honetara: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Aldatu kolorearen itzala honetara: '),
      );
      expect(loc.color_adjustment, equals('Koloreen doikuntza'));
      expect(
        loc.color_profile_changed_to,
        equals('Uneko kolore profila hau da: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Gutxitu hitzen arteko espazioa'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Gutxitu letren arteko espazioa'),
      );
      expect(loc.decrement_line_height, equals('Gutxitu lerroaren altuera'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Gutxitu testuaren eskala faktorea'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Handitu hitzen arteko espazioa'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Handitu letren arteko espazioa'),
      );
      expect(loc.increment_line_height, equals('Handitu lerroaren altuera'));
      expect(
        loc.increment_text_scale_factor,
        equals('Handitu testuaren eskala faktorea'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Handitu edo gutxitu hitzen arteko espazioa'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Handitu edo gutxitu letren arteko espazioa'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Handitu edo gutxitu lerroaren altuera'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Handitu edo gutxitu testuaren tamaina'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efektuak'));
      expect(loc.expand_text, equals('Zabaldu testua'));
      expect(loc.font_size, equals('Letra tamaina'));
      expect(loc.less_info, equals('Ezkutatu informazioa'));
      expect(loc.letter_spacing, equals('Letren arteko espazioa'));
      expect(loc.line_height, equals('Lerroaren altuera'));
      expect(loc.more_info, equals('Erakutsi informazioa'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Irakurri gutxiago'));
      expect(loc.read_more, equals('Irakurri gehiago'));
      expect(
        loc.reduce_effects,
        equals('Gutxitu pantailaren efektuak'),
      );
      expect(loc.reduce_text, equals('Txikiagotu testua'));
      expect(loc.restore_settings, equals('Leheneratu ezarpenak'));
      expect(loc.restore_main_color, equals('Leheneratu kolore nagusia'));
      expect(
        loc.return_to_main_colors,
        equals('Itzuli kolore nagusietara'),
      );
      expect(loc.settings, equals('Ezarpenak'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Tamaina eta testu bistaratzea'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Hitzen arteko espazioa irristatzailearekin'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Letren arteko espazioa irristatzailearekin'),
      );
      expect(
        loc.slider_line_height,
        equals('Lerro altuera irristatzailearekin'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Ez da gai profila ezagutzen'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Krisi epileptikoetarako segurua'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Ikusmen urritasunerako'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('AGNH-lagungarria'),
      );
      expect(loc.theme_profile('none'), equals('Lehenetsia'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Krisi epileptikoetarako profil segurua'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Kendu islak eta murriztu kolorea'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Profil honek epilepsia duten eta krisi epileptikoen arriskuan '
          'dauden erabiltzaileei modu seguruan nabigatzeko aukera ematen '
          'die, animazio distiratsuek eta kolore konbinazio arriskutsuek '
          'eragin ditzaketen krisien arriskuak ezabatuz.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Ikusmen urritasunerako profila'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Hobetu aplikazioaren ikusgaitasuna'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Profil honek aplikazioa ikusmen urritasun gehienetarako '
          'irisgarria izateko moldatzen du, hala nola ikusmen urritasuna, '
          'tunel ikusmena, kataratak, glaukoma eta abar.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('AGNH-lagungarri profila'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Kontzentrazio gehiago eta distrakzio gutxiago'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Profil honek nabarmen gutxitzen ditu distrakzioak, AGNH '
          '(Arreta Gabe eta Hiperaktibitate Nahasmendua) eta garapen '
          'neurologikoko nahasmenduak dituzten pertsonei aplikazioaren '
          'funtsezko elementuetan errazago nabigatzen, irakurtzen eta '
          'arreta jartzen laguntzeko.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Ezarpenak berrezarri dira.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Modu iluna txandakatu'));
      expect(loc.toggle_effects_mode, equals('Efektuen modua txandakatu'));
      expect(loc.toggle_font_weight, equals('Letraren pisua txandakatu'));
      expect(loc.toggle_theme_profile, equals('Gai profila txandakatu'));
      expect(loc.word_spacing, equals('Hitzen arteko espazioa'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Saturazioa baxua'));
      expect(loc.color_profile('normal'), equals('Normala'));
      expect(loc.color_profile('highSaturation'), equals('Saturazioa altua'));
      expect(loc.color_profile('monochrome'), equals('Monokromatikoa'));
      expect(loc.color_profile('highContrast'), equals('Kontraste altua'));
      expect(loc.color_profile('unknown'), equals('Normala'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Gorria'));
      expect(loc.color('cE91E63'), equals('Arrosa'));
      expect(loc.color('c9C27B0'), equals('Morea'));
      expect(loc.color('c673AB7'), equals('More sakona'));
      expect(loc.color('c3F51B5'), equals('Indigoa'));
      expect(loc.color('c2196F3'), equals('Urdina'));
      expect(loc.color('c03A9F4'), equals('Urdin argia'));
      expect(loc.color('c00BCD4'), equals('Ziana'));
      expect(loc.color('c009688'), equals('Urdin berdexka'));
      expect(loc.color('c4CAF50'), equals('Berdea'));
      expect(loc.color('c8BC34A'), equals('Berde argia'));
      expect(loc.color('cCDDC39'), equals('Lima'));
      expect(loc.color('cFFEB3B'), equals('Horia'));
      expect(loc.color('cFFC107'), equals('Anbar'));
      expect(loc.color('cFF9800'), equals('Laranja'));
      expect(loc.color('cFF5722'), equals('Laranja sakona'));
      expect(loc.color('c795548'), equals('Marroia'));
      expect(loc.color('c9E9E9E'), equals('Grisa'));
      expect(loc.color('c607D8B'), equals('Urdin grisaxka'));
      expect(loc.color('unknown'), equals('Kolorea ez da ezagutu'));
    });
  });
}
