import 'package:accessibility/src/core/l10n/generated/app_localizations_sl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsSl', () {
    late AccessibilityLocalizationsSl loc;

    setUp(() {
      loc = AccessibilityLocalizationsSl();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('sl'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Dostopnost'));
      expect(
        loc.accessibility_settings,
        equals('Nastavitve dostopnosti'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Prilagodi barve ozadja'),
      );
      expect(loc.adjust_text_colors, equals('Prilagodi barve besedila'));
      expect(loc.align_center, equals('Poravnaj na sredino'));
      expect(loc.align_left, equals('Poravnaj levo'));
      expect(loc.align_right, equals('Poravnaj desno'));
      expect(loc.bold_text, equals('Krepko besedilo'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Spremeni krepko besedilo'));
      expect(
        loc.change_pages_background_color,
        equals('Spremeni barvo ozadja strani na: '),
      );
      expect(loc.change_text_color, equals('Spremeni barvo besedila na: '));
      expect(
        loc.change_text_color_shade,
        equals('Spremeni odtenek barve na: '),
      );
      expect(loc.color_adjustment, equals('Prilagoditev barv'));
      expect(
        loc.color_profile_changed_to,
        equals('Trenutni barvni profil je: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Zmanjšaj razmik med besedami'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Zmanjšaj razmik med črkami'),
      );
      expect(loc.decrement_line_height, equals('Zmanjšaj višino vrstice'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Zmanjšaj faktor velikosti besedila'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Povečaj razmik med besedami'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Povečaj razmik med črkami'),
      );
      expect(loc.increment_line_height, equals('Povečaj višino vrstice'));
      expect(
        loc.increment_text_scale_factor,
        equals('Povečaj faktor velikosti besedila'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Povečaj ali zmanjšaj razmik med besedami'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Povečaj ali zmanjšaj razmik med črkami'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Povečaj ali zmanjšaj višino vrstice'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Povečaj ali zmanjšaj velikost besedila'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Učinki'));
      expect(loc.expand_text, equals('Razširi besedilo'));
      expect(loc.font_size, equals('Velikost pisave'));
      expect(loc.less_info, equals('Skrij informacije'));
      expect(loc.letter_spacing, equals('Razmik med črkami'));
      expect(loc.line_height, equals('Višina vrstice'));
      expect(loc.more_info, equals('Prikaži informacije'));
      expect(loc.word_spacing, equals('Razmik med besedami'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Preberi manj'));
      expect(loc.read_more, equals('Preberi več'));
      expect(
        loc.reduce_effects,
        equals('Zmanjšaj učinke na zaslonu'),
      );
      expect(loc.reduce_text, equals('Zmanjšaj besedilo'));
      expect(loc.restore_settings, equals('Obnovi nastavitve'));
      expect(loc.restore_main_color, equals('Obnovi glavno barvo'));
      expect(
        loc.return_to_main_colors,
        equals('Vrni se na glavne barve'),
      );
      expect(loc.settings, equals('Nastavitve'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Velikost in prikaz besedila'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Drsnik za razmik med besedami'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Drsnik za razmik med črkami'),
      );
      expect(loc.slider_line_height, equals('Drsnik za višino vrstice'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Profil teme ni prepoznan'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Varno za epileptike'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Za slabovidne'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Prijazno za ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Privzeto'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil varen za epileptike'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Odstrani odseve in zmanjšaj barve'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ta profil omogoča uporabnikom z epilepsijo in '
          'tveganjem za napade varno brskanje z odpravo '
          'tveganja napadov, ki so posledica utripajočih '
          'animacij in tveganih barvnih kombinacij.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil za slabovidne'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Izboljšaj vidljivost aplikacije'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ta profil prilagodi aplikacijo tako, da je '
          'dostopna večini vidnih okvar, kot so '
          'slabovidnost, tunelski vid, siva mrena, glavkom '
          'in drugo.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil prijazen za ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Več koncentracije in manj motenj'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ta profil občutno zmanjša motnje, da pomaga '
          'ljudem z ADHD in razvojnimi motnjami lažje '
          'krmariti, brati in se osredotočiti na bistvene '
          'elemente aplikacije.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Nastavitve so bile ponastavljene.'),
      );
      expect(loc.toggle_dark_mode, equals('Preklopi temni način'));
      expect(loc.toggle_effects_mode, equals('Preklopi način učinkov'));
      expect(loc.toggle_font_weight, equals('Preklopi debelino pisave'));
      expect(loc.toggle_theme_profile, equals('Preklopi profil teme'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normalno'));
      expect(loc.color_profile('lowSaturation'), equals('Nizka nasičenost'));
      expect(loc.color_profile('normal'), equals('Normalno'));
      expect(loc.color_profile('highSaturation'), equals('Visoka nasičenost'));
      expect(loc.color_profile('monochrome'), equals('Enobarvno'));
      expect(loc.color_profile('highContrast'), equals('Visok kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Barva ni prepoznana'));
      expect(loc.color('cF44336'), equals('Rdeča'));
      expect(loc.color('cE91E63'), equals('Roza'));
      expect(loc.color('c9C27B0'), equals('Vijolična'));
      expect(loc.color('c673AB7'), equals('Temno vijolična'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Modra'));
      expect(loc.color('c03A9F4'), equals('Svetlo modra'));
      expect(loc.color('c00BCD4'), equals('Cijan'));
      expect(loc.color('c009688'), equals('Turkizna'));
      expect(loc.color('c4CAF50'), equals('Zelena'));
      expect(loc.color('c8BC34A'), equals('Svetlo zelena'));
      expect(loc.color('cCDDC39'), equals('Limeta'));
      expect(loc.color('cFFEB3B'), equals('Rumena'));
      expect(loc.color('cFFC107'), equals('Jantarna'));
      expect(loc.color('cFF9800'), equals('Oranžna'));
      expect(loc.color('cFF5722'), equals('Temno oranžna'));
      expect(loc.color('c795548'), equals('Rjava'));
      expect(loc.color('c9E9E9E'), equals('Siva'));
      expect(loc.color('c607D8B'), equals('Modro siva'));
    });
  });
}
