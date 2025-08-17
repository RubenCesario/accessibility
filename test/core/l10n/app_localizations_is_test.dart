import 'package:accessibility/src/core/l10n/generated/app_localizations_is.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsIs', () {
    late AccessibilityLocalizationsIs loc;

    setUp(() {
      loc = AccessibilityLocalizationsIs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('is'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Aðgengi'));
      expect(
        loc.accessibility_settings,
        equals('Aðgengistillingar'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Stilltu bakgrunnslit'),
      );
      expect(loc.adjust_text_colors, equals('Stilltu textafeitt'));
      expect(loc.align_center, equals('Jafna miðju'));
      expect(loc.align_left, equals('Vinstri jöfnun'));
      expect(loc.align_right, equals('Hægri jöfnun'));
      expect(loc.bold_text, equals('Feitt letur'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Breyta feitri stafa'));
      expect(
        loc.change_pages_background_color,
        equals('Breyta bakgrunnslit síðunnar í: '),
      );
      expect(
        loc.change_text_color,
        equals('Breyta lit textans í: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Breyta litbrigðum í: '),
      );
      expect(loc.color_adjustment, equals('Litastilling'));
      expect(
        loc.color_profile_changed_to,
        equals('Núverandi litaprófíll er: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Minnka orðabil'));
      expect(loc.decrement_letter_spacing, equals('Minnka stafafjægð'));
      expect(loc.decrement_line_height, equals('Minnka línuhæð'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Minnka stærðarstuðul texta'),
      );
      expect(loc.increment_word_spacing, equals('Auka orðabil'));
      expect(loc.increment_letter_spacing, equals('Auka stafafjægð'));
      expect(loc.increment_line_height, equals('Auka línuhæð'));
      expect(
        loc.increment_text_scale_factor,
        equals('Auka stærðarstuðul texta'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Auka eða minnka orðabil'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Auka eða minnka stafafjægð'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Auka eða minnka línuhæð'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Auka eða minnka textastærð'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Áhrif'));
      expect(loc.expand_text, equals('Stækka texta'));
      expect(loc.font_size, equals('Leturstærð'));
      expect(loc.less_info, equals('Fela upplýsingar'));
      expect(loc.letter_spacing, equals('Stafafjægð'));
      expect(loc.line_height, equals('Línuhæð'));
      expect(loc.more_info, equals('Sýna upplýsingar'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Lesa minna'));
      expect(loc.read_more, equals('Lesa meira'));
      expect(loc.reduce_effects, equals('Minnka áhrif á skjá'));
      expect(loc.reduce_text, equals('Minnka texta'));
      expect(loc.restore_settings, equals('Endurstilla stillingar'));
      expect(loc.restore_main_color, equals('Endurstilla aðallit'));
      expect(loc.return_to_main_colors, equals('Aftur í aðalliti'));
      expect(loc.settings, equals('Stillingar'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Stærð og birtingarmáti texta'),
      );
      expect(loc.slider_word_spacing, equals('Slæða fyrir orðabil'));
      expect(loc.slider_letter_spacing, equals('Slæða fyrir stafafjægð'));
      expect(loc.slider_line_height, equals('Slæða fyrir línuhæð'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Þémaprófíll ekki þekktur'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Flöguöruggt'));
      expect(loc.theme_profile('visionImpaired'), equals('Sjónskertur'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD vænt'));
      expect(loc.theme_profile('none'), equals('Sjálfgefið'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Flöguöruggt snið'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Fjarlægja endurkast og draga úr lit'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Þetta snið gerir notendum með flögur og áhættu á flögum kleift '
          'að vafra örugglega með því að útrýma hættu á flögum sem stafa af '
          'blikkandi hreyfingum og áhættusomum litasamsetningum.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Snið fyrir sjónskerta'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Bæta sýnileika forritsins'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Þetta snið aðlagar forritið til að vera aðgengilegt fyrir flest '
          'sjóntröflun, svo sem sjónskerðing, göngusjón, drérsjón, gláka '
          'og fleira.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD vænt snið'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Meiri einbeiting og minni truflun'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Þetta snið minnkar verulega truflanir, til að hjálpa fólki með '
          'ADHD og taugaþróunarraskanir að sigla, lesa og einbeita sér að '
          'mikilægum hlutum forritsins á auðveldari hátt.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Stillingarnar hafa verið endurstilltar.'),
      );
      expect(loc.toggle_dark_mode, equals('Víxla dökku þmu'));
      expect(loc.toggle_effects_mode, equals('Víxla áhrifa ham'));
      expect(loc.toggle_font_weight, equals('Víxla leturfeiti'));
      expect(loc.toggle_theme_profile, equals('Víxla þémaprófíl'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Venjulegt'));
      expect(loc.color_profile('lowSaturation'), equals('Lág mettun'));
      expect(loc.color_profile('normal'), equals('Venjulegt'));
      expect(loc.color_profile('highSaturation'), equals('Há mettun'));
      expect(loc.color_profile('monochrome'), equals('Einlitur'));
      expect(loc.color_profile('highContrast'), equals('Hár kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Litur ekki þekktur'));
      expect(loc.color('cF44336'), equals('Rauður'));
      expect(loc.color('cE91E63'), equals('Bleikur'));
      expect(loc.color('c9C27B0'), equals('Fjólublár'));
      expect(loc.color('c673AB7'), equals('Dökkfjólublár'));
      expect(loc.color('c3F51B5'), equals('Indigóblár'));
      expect(loc.color('c2196F3'), equals('Blár'));
      expect(loc.color('c03A9F4'), equals('Ljósblár'));
      expect(loc.color('c00BCD4'), equals('Blágrænn'));
      expect(loc.color('c009688'), equals('Djúpblágrænn'));
      expect(loc.color('c4CAF50'), equals('Grænn'));
      expect(loc.color('c8BC34A'), equals('Ljósgrænn'));
      expect(loc.color('cCDDC39'), equals('Límgrænn'));
      expect(loc.color('cFFEB3B'), equals('Gulur'));
      expect(loc.color('cFFC107'), equals('Rafgulur'));
      expect(loc.color('cFF9800'), equals('Appelsínugulur'));
      expect(loc.color('cFF5722'), equals('Djúp appelsínugulur'));
      expect(loc.color('c795548'), equals('Brúnn'));
      expect(loc.color('c9E9E9E'), equals('Grár'));
      expect(loc.color('c607D8B'), equals('Blágrátt'));
    });
  });
}
