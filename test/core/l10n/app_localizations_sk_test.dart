import 'package:accessibility/src/core/l10n/generated/app_localizations_sk.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsSk', () {
    late AccessibilityLocalizationsSk loc;

    setUp(() {
      loc = AccessibilityLocalizationsSk();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('sk'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Prístupnosť'));
      expect(
        loc.accessibility_settings,
        equals('Nastavenia prístupnosti'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Upraviť farby pozadia'),
      );
      expect(loc.adjust_text_colors, equals('Upraviť farby textu'));
      expect(loc.align_center, equals('Zarovnať na stred'));
      expect(loc.align_left, equals('Zarovnať doľava'));
      expect(loc.align_right, equals('Zarovnať doprava'));
      expect(loc.bold_text, equals('Tučný text'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Zmeniť tučný text'));
      expect(
        loc.change_pages_background_color,
        equals('Zmeniť farbu pozadia stránok na: '),
      );
      expect(loc.change_text_color, equals('Zmeniť farbu textu na: '));
      expect(
        loc.change_text_color_shade,
        equals('Zmeniť odtieň farby na: '),
      );
      expect(loc.color_adjustment, equals('Úprava farieb'));
      expect(
        loc.color_profile_changed_to,
        equals('Aktuálny farebný profil je: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Zmenšiť medzery medzi slovami'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Zmenšiť medzery medzi písmenami'),
      );
      expect(loc.decrement_line_height, equals('Zmenšiť výšku riadku'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Zmenšiť faktor veľkosti textu'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Zväčšiť medzery medzi slovami'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Zväčšiť medzery medzi písmenami'),
      );
      expect(loc.increment_line_height, equals('Zväčšiť výšku riadku'));
      expect(
        loc.increment_text_scale_factor,
        equals('Zväčšiť faktor veľkosti textu'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Zväčšiť alebo zmenšiť medzery medzi slovami'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Zväčšiť alebo zmenšiť medzery medzi písmenami'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Zväčšiť alebo zmenšiť výšku riadku'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Zväčšiť alebo zmenšiť veľkosť textu'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efekty'));
      expect(loc.expand_text, equals('Rozšíriť text'));
      expect(loc.font_size, equals('Veľkosť písma'));
      expect(loc.less_info, equals('Skryť informácie'));
      expect(loc.letter_spacing, equals('Medzery medzi písmenami'));
      expect(loc.line_height, equals('Výška riadku'));
      expect(loc.more_info, equals('Zobraziť informácie'));
      expect(loc.word_spacing, equals('Medzery medzi slovami'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Čítať menej'));
      expect(loc.read_more, equals('Čítať viac'));
      expect(
        loc.reduce_effects,
        equals('Znížiť efekty na obrazovke'),
      );
      expect(loc.reduce_text, equals('Zmenšiť text'));
      expect(loc.restore_settings, equals('Obnoviť nastavenia'));
      expect(loc.restore_main_color, equals('Obnoviť hlavnú farbu'));
      expect(
        loc.return_to_main_colors,
        equals('Návrat k hlavným farbám'),
      );
      expect(loc.settings, equals('Nastavenia'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Veľkosť a zobrazenie textu'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Posuvník medzier medzi slovami'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Posuvník medzier medzi písmenami'),
      );
      expect(loc.slider_line_height, equals('Posuvník výšky riadku'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Téma'));
      expect(
        loc.theme_profile('other'),
        equals('Profil témy nerozpoznaný'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Bezpečný pre epileptikov'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Pre zrakovo postihnutých'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Priateľský pre ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Predvolený'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil bezpečný pre epileptikov'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Odstrániť odrazy a znížiť farby'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Tento profil umožňuje používateľom, ktorí majú '
          'epilepsiu a sú ohrozéní záchvatmi, bezpečne '
          'prechádzať aplikáciou odstránením rizika '
          'záchvatov, ktoré vyplývajú z blikajúcich animácií '
          'a rizikových farebných kombinácií.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil pre zrakovo postihnutých'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Zlepšiť viditeľnosť aplikácie'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Tento profil prispôsobuje aplikáciu tak, aby bola '
          'prístupná pre väčšinu zrakových postihnutí, ako sú '
          'zrakové postihnutie, tunelové videnie, šedý zákal, '
          'glaukom a ďalšie.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil priateľský pre ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Viac koncentrácie a menej rušivých vplyvov'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Tento profil výrazne znižuje rušivé vplyvy, aby '
          'pomohol ľuďom s ADHD a vývinovými poruchami '
          'jednoduchšie navigovať, čítať a sústrediť sa na '
          'základné prvky aplikácie.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Nastavenia boli obnovené.'),
      );
      expect(loc.toggle_dark_mode, equals('Prepnúť tmavý režim'));
      expect(loc.toggle_effects_mode, equals('Prepnúť režim efektov'));
      expect(loc.toggle_font_weight, equals('Prepnúť hrubosť písma'));
      expect(loc.toggle_theme_profile, equals('Prepnúť profil témy'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normálny'));
      expect(loc.color_profile('lowSaturation'), equals('Nízka sýtosť'));
      expect(loc.color_profile('normal'), equals('Normálny'));
      expect(loc.color_profile('highSaturation'), equals('Vysoká sýtosť'));
      expect(loc.color_profile('monochrome'), equals('Monochromáticky'));
      expect(loc.color_profile('highContrast'), equals('Vysoký kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Farba nerozpoznaná'));
      expect(loc.color('cF44336'), equals('Červená'));
      expect(loc.color('cE91E63'), equals('Ružová'));
      expect(loc.color('c9C27B0'), equals('Fialová'));
      expect(loc.color('c673AB7'), equals('Tmavofialová'));
      expect(loc.color('c3F51B5'), equals('Indigová'));
      expect(loc.color('c2196F3'), equals('Modrá'));
      expect(loc.color('c03A9F4'), equals('Svetlomodrá'));
      expect(loc.color('c00BCD4'), equals('Azurová'));
      expect(loc.color('c009688'), equals('Tyrkysová'));
      expect(loc.color('c4CAF50'), equals('Zelená'));
      expect(loc.color('c8BC34A'), equals('Svetlozelená'));
      expect(loc.color('cCDDC39'), equals('Limetková'));
      expect(loc.color('cFFEB3B'), equals('Žltá'));
      expect(loc.color('cFFC107'), equals('Jantárová'));
      expect(loc.color('cFF9800'), equals('Oranžová'));
      expect(loc.color('cFF5722'), equals('Tmavoranžová'));
      expect(loc.color('c795548'), equals('Hnedá'));
      expect(loc.color('c9E9E9E'), equals('Sivá'));
      expect(loc.color('c607D8B'), equals('Modrosivá'));
    });
  });
}
