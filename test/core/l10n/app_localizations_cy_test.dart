import 'package:accessibility/src/core/l10n/generated/app_localizations_cy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsCy', () {
    late AccessibilityLocalizationsCy loc;

    setUp(() {
      loc = AccessibilityLocalizationsCy();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('cy'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Hygyrchedd'));
      expect(loc.accessibility_settings, equals('Gosodiadau hygyrchedd'));
      expect(loc.adjust_background_colors, equals('Addasu lliwiau cefndir'));
      expect(loc.adjust_text_colors, equals('Addasu lliwiau testun'));
      expect(loc.align_center, equals("Alinio i'r canol"));
      expect(loc.align_left, equals("Alinio i'r chwith"));
      expect(loc.align_right, equals("Alinio i'r dde"));
      expect(loc.bold_text, equals('Testun bras'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Newid testun bras'));
      expect(
        loc.change_pages_background_color,
        equals('Newid lliw cefndir y tudalennau i: '),
      );
      expect(loc.change_text_color, equals('Newid lliw testun i: '));
      expect(loc.change_text_color_shade, equals('Newid arlliw lliw i: '));
      expect(loc.color_adjustment, equals('Addasiad lliw'));
      expect(
        loc.color_profile_changed_to,
        equals('Y proffil lliw presennol yw: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Lleihau bylchau rhwng geiriau'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Lleihau bylchau rhwng llythrennau'),
      );
      expect(loc.decrement_line_height, equals('Lleihau uchder llinell'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Lleihau ffactor graddio testun'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Cynyddu bylchau rhwng geiriau'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Cynyddu bylchau rhwng llythrennau'),
      );
      expect(loc.increment_line_height, equals('Cynyddu uchder llinell'));
      expect(
        loc.increment_text_scale_factor,
        equals('Cynyddu ffactor graddio testun'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Cynyddu neu leihau bylchau rhwng geiriau'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Cynyddu neu leihau bylchau rhwng llythrennau'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Cynyddu neu leihau uchder llinell'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Cynyddu neu leihau maint testun'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effeithiau'));
      expect(loc.expand_text, equals('Ehangu testun'));
      expect(loc.font_size, equals('Maint ffont'));
      expect(loc.less_info, equals('Cuddio gwybodaeth'));
      expect(loc.letter_spacing, equals('Bylchau llythrennau'));
      expect(loc.line_height, equals('Uchder llinell'));
      expect(loc.more_info, equals('Dangos gwybodaeth'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Darllen llai'));
      expect(loc.read_more, equals('Darllen mwy'));
      expect(loc.reduce_effects, equals('Lleihau effeithiau ar y sgrin'));
      expect(loc.reduce_text, equals('Lleihau testun'));
      expect(loc.restore_settings, equals('Adfer gosodiadau'));
      expect(loc.restore_main_color, equals('Adfer prif liw'));
      expect(loc.return_to_main_colors, equals("Dychwelyd i'r prif liwiau"));
      expect(loc.settings, equals('Gosodiadau'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Maint a dangosiad testun'));
      expect(loc.slider_word_spacing, equals('Llithrydd bylchau geiriau'));
      expect(
        loc.slider_letter_spacing,
        equals('Llithrydd bylchau llythrennau'),
      );
      expect(loc.slider_line_height, equals('Llithrydd uchder llinell'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Proffil thema heb ei gydnabod'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Diogel rhag ffit'));
      expect(loc.theme_profile('visionImpaired'), equals('Nam ar y golwg'));
      expect(loc.theme_profile('adhdFriendly'), equals('Cyfeillgar i ADHD'));
      expect(loc.theme_profile('none'), equals('Rhagosodedig'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Proffil diogel rhag ffit'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Dileu adlewyrchiadau a lleihau lliw'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          "Mae'r proffil hwn yn galluogi defnyddwyr sydd ag epilepsi "
          "ac sydd mewn perygl o ffitiau i bori'n ddiogel trwy ddileu'r "
          "risg o ffitiau sy'n deillio o animeiddiadau fflachio a chyfuniadau "
          'lliw peryglus.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Proffil nam ar y golwg'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Gwella gwelededd y rhaglen'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          "Mae'r proffil hwn yn addasu'r rhaglen i fod yn hygyrch "
          "i'r rhan fwyaf o namau ar y golwg, megis nam ar y golwg, "
          'golwg twnnel, cataractau, glawcoma a mwy.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Proffil cyfeillgar i ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mwy o ganolbwyntio a llai o dargyfeiriadau'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          "Mae'r proffil hwn yn lleihau tynnu sylw yn sylweddol, "
          'i helpu pobl ag ADHD ac anhwylderau niwroddatblygiadol i lywio, '
          'darllen, a chanolbwyntio ar elfennau hanfodol y rhaglen yn haws.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals("Mae'r gosodiadau wedi'u hailosod."),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Toglo modd tywyll'));
      expect(loc.toggle_effects_mode, equals('Toglo modd effeithiau'));
      expect(loc.toggle_font_weight, equals('Toglo pwysau ffont'));
      expect(loc.toggle_theme_profile, equals('Toglo proffil thema'));
      expect(loc.word_spacing, equals('Bylchau geiriau'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Dirlawnder isel'));
      expect(loc.color_profile('normal'), equals('Arferol'));
      expect(loc.color_profile('highSaturation'), equals('Dirlawnder uchel'));
      expect(loc.color_profile('monochrome'), equals('Du a gwyn'));
      expect(loc.color_profile('highContrast'), equals('Cyferbyniad uchel'));
      expect(loc.color_profile('unknown'), equals('Arferol'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Coch'));
      expect(loc.color('cE91E63'), equals('Pinc'));
      expect(loc.color('c9C27B0'), equals('Porffor'));
      expect(loc.color('c673AB7'), equals('Porffor Tywyll'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Glas'));
      expect(loc.color('c03A9F4'), equals('Glas Golau'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Gwyrddlas'));
      expect(loc.color('c4CAF50'), equals('Gwyrdd'));
      expect(loc.color('c8BC34A'), equals('Gwyrdd Golau'));
      expect(loc.color('cCDDC39'), equals('Leim'));
      expect(loc.color('cFFEB3B'), equals('Melyn'));
      expect(loc.color('cFFC107'), equals('Ambr'));
      expect(loc.color('cFF9800'), equals('Oren'));
      expect(loc.color('cFF5722'), equals('Oren Tywyll'));
      expect(loc.color('c795548'), equals('Brown'));
      expect(loc.color('c9E9E9E'), equals('Llwyd'));
      expect(loc.color('c607D8B'), equals('Llwyd Glas'));
      expect(loc.color('unknown'), equals('Lliw heb ei gydnabod'));
    });
  });
}
