import 'package:accessibility/src/core/l10n/generated/app_localizations_et.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsEt', () {
    late AccessibilityLocalizationsEt loc;

    setUp(() {
      loc = AccessibilityLocalizationsEt();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('et'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Ligipääsetavus'));
      expect(
        loc.accessibility_settings,
        equals('Ligipääsetavuse seaded'),
      );
      expect(loc.adjust_background_colors, equals('Kohanda taustavärve'));
      expect(loc.adjust_text_colors, equals('Kohanda tekstivärve'));
      expect(loc.align_center, equals('Joonda keskele'));
      expect(loc.align_left, equals('Joonda vasakule'));
      expect(loc.align_right, equals('Joonda paremale'));
      expect(loc.bold_text, equals('Rasvane tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Muuda teksti paksust'));
      expect(
        loc.change_pages_background_color,
        equals('Muuda lehtede taustavärv järgnevaks: '),
      );
      expect(
        loc.change_text_color,
        equals('Muuda teksti värv järgnevaks: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Muuda värvitooni järgnevaks: '),
      );
      expect(loc.color_adjustment, equals('Värvikorrektsioon'));
      expect(
        loc.color_profile_changed_to,
        equals('Praegune värviprofiil on: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Vähenda sõnadevahelisi vahesid'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Vähenda tähtede vahesid'),
      );
      expect(loc.decrement_line_height, equals('Vähenda reavahet'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Vähenda teksti skaalat'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Suurenda sõnadevahelisi vahesid'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Suurenda tähtede vahesid'),
      );
      expect(loc.increment_line_height, equals('Suurenda reavahet'));
      expect(
        loc.increment_text_scale_factor,
        equals('Suurenda teksti skaalat'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Suurenda või vähenda sõnadevahelisi vahesid'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Suurenda või vähenda tähtede vahesid'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Suurenda või vähenda reavahet'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Suurenda või vähenda teksti suurust'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efektid'));
      expect(loc.expand_text, equals('Laienda teksti'));
      expect(loc.font_size, equals('Fondi suurus'));
      expect(loc.less_info, equals('Peida info'));
      expect(loc.letter_spacing, equals('Tähtede vahed'));
      expect(loc.line_height, equals('Reavahe'));
      expect(loc.more_info, equals('Näita infot'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Loe vähem'));
      expect(loc.read_more, equals('Loe rohkem'));
      expect(loc.reduce_effects, equals('Vähenda ekraani efekte'));
      expect(loc.reduce_text, equals('Vähenda teksti'));
      expect(loc.restore_settings, equals('Taasta seaded'));
      expect(loc.restore_main_color, equals('Taasta põhivärv'));
      expect(
        loc.return_to_main_colors,
        equals('Naase põhivärvide juurde'),
      );
      expect(loc.settings, equals('Seaded'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Suurus ja teksti kuva'));
      expect(loc.slider_word_spacing, equals('Sõnavahed liuguriga'));
      expect(loc.slider_letter_spacing, equals('Tähevahed liuguriga'));
      expect(loc.slider_line_height, equals('Reavahe liuguriga'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Teemaprofiile ei tuvastatud'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Epilepsia-ohutu'));
      expect(loc.theme_profile('visionImpaired'), equals('Nägemispuudega'));
      expect(loc.theme_profile('adhdFriendly'), equals('ATH-sõbralik'));
      expect(loc.theme_profile('none'), equals('Vaikimisi'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsia-ohutu profiil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Eemalda peegeldused ja vähenda värve'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'See profiil võimaldab epilepsiaga ja epilepsiahoogude riskiga '
          'kasutajatel sirvida ohutult, kõrvaldades vilkuvatest '
          'animatsioonidest ja ohtlikest värvikombinatsioonidest tulenevate '
          'hoogude riski.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Nägemispuudega profiil'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Paranda rakenduse nähtavust'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'See profiil kohandab rakendust, et see oleks juurdepääsetav '
          'enamikule nägemispuuetele, nagu nägemislangus, tunnelnägemine, '
          'kataraktid, glaukoom ja muud.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ATH-sõbralik profiil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Rohkem keskendumist ja vähem häirefaktoreid'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'See profiil vähendab oluliselt tähelepanu hajumist, et aidata ATH '
          'ja neuroarenguhäiretega inimestel lihtsamini navigeerida, lugeda '
          'ja keskenduda rakenduse olulistele elementidele.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Seaded on lähtestatud.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Lülita tumedat režiimi'));
      expect(loc.toggle_effects_mode, equals('Lülita efektide režiimi'));
      expect(loc.toggle_font_weight, equals('Lülita fondi paksust'));
      expect(loc.toggle_theme_profile, equals('Lülita teemaprofiili'));
      expect(loc.word_spacing, equals('Sõnadevahelised vahed'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Madal küllastus'));
      expect(loc.color_profile('normal'), equals('Normaal'));
      expect(loc.color_profile('highSaturation'), equals('Kõrge küllastus'));
      expect(loc.color_profile('monochrome'), equals('Monokroomne'));
      expect(loc.color_profile('highContrast'), equals('Kõrge kontrastsus'));
      expect(loc.color_profile('unknown'), equals('Normaal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Punane'));
      expect(loc.color('cE91E63'), equals('Roosa'));
      expect(loc.color('c9C27B0'), equals('Lilla'));
      expect(loc.color('c673AB7'), equals('Tumesinine'));
      expect(loc.color('c3F51B5'), equals('Indigovärvine'));
      expect(loc.color('c2196F3'), equals('Sinine'));
      expect(loc.color('c03A9F4'), equals('Helesinine'));
      expect(loc.color('c00BCD4'), equals('Tsüaan'));
      expect(loc.color('c009688'), equals('Rohekassinine'));
      expect(loc.color('c4CAF50'), equals('Roheline'));
      expect(loc.color('c8BC34A'), equals('Heleroheline'));
      expect(loc.color('cCDDC39'), equals('Laimiroheline'));
      expect(loc.color('cFFEB3B'), equals('Kollane'));
      expect(loc.color('cFFC107'), equals('Merevaikkollane'));
      expect(loc.color('cFF9800'), equals('Oranž'));
      expect(loc.color('cFF5722'), equals('Tumeoranž'));
      expect(loc.color('c795548'), equals('Pruun'));
      expect(loc.color('c9E9E9E'), equals('Hall'));
      expect(loc.color('c607D8B'), equals('Sinakashall'));
      expect(loc.color('unknown'), equals('Värvi ei tunta ära'));
    });
  });
}
