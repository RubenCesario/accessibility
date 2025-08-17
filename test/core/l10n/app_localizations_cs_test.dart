import 'package:accessibility/src/core/l10n/generated/app_localizations_cs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsCs', () {
    late AccessibilityLocalizationsCs loc;

    setUp(() {
      loc = AccessibilityLocalizationsCs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('cs'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Přístupnost'));
      expect(loc.accessibility_settings, equals('Nastavení přístupnosti'));
      expect(loc.adjust_background_colors, equals('Upravit barvy pozadí'));
      expect(loc.adjust_text_colors, equals('Upravit barvy textu'));
      expect(loc.align_center, equals('Zarovnat na střed'));
      expect(loc.align_left, equals('Zarovnat doleva'));
      expect(loc.align_right, equals('Zarovnat doprava'));
      expect(loc.bold_text, equals('Tučný text'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Změnit tučný text'));
      expect(
        loc.change_pages_background_color,
        equals('Změnit barvu pozadí stránek na: '),
      );
      expect(loc.change_text_color, equals('Změnit barvu textu na: '));
      expect(loc.change_text_color_shade, equals('Změnit odstín barvy na: '));
      expect(loc.color_adjustment, equals('Nastavení barev'));
      expect(
        loc.color_profile_changed_to,
        equals('Aktuální profil barev je: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Snížit mezery mezi slovy'));
      expect(
        loc.decrement_letter_spacing,
        equals('Snížit mezery mezi písmeny'),
      );
      expect(loc.decrement_line_height, equals('Snížit výšku řádku'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Snížit faktor velikosti textu'),
      );
      expect(loc.increment_word_spacing, equals('Zvětšit mezery mezi slovy'));
      expect(
        loc.increment_letter_spacing,
        equals('Zvětšit mezery mezi písmeny'),
      );
      expect(loc.increment_line_height, equals('Zvětšit výšku řádku'));
      expect(
        loc.increment_text_scale_factor,
        equals('Zvětšit faktor velikosti textu'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Zvětšit nebo zmenšit mezery mezi slovy'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Zvětšit nebo zmenšit mezery mezi písmeny'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Zvětšit nebo zmenšit výšku řádku'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Zvětšit nebo zmenšit velikost textu'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efekty'));
      expect(loc.expand_text, equals('Rozšířit text'));
      expect(loc.font_size, equals('Velikost písma'));
      expect(loc.less_info, equals('Skrýt informace'));
      expect(loc.letter_spacing, equals('Mezery mezi písmeny'));
      expect(loc.line_height, equals('Výška řádku'));
      expect(loc.more_info, equals('Zobrazit informace'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Číst méně'));
      expect(loc.read_more, equals('Číst více'));
      expect(loc.reduce_effects, equals('Snížit efekty na obrazovce'));
      expect(loc.reduce_text, equals('Zmenšit text'));
      expect(loc.restore_settings, equals('Obnovit nastavení'));
      expect(loc.restore_main_color, equals('Obnovit hlavní barvu'));
      expect(loc.return_to_main_colors, equals('Návrat k hlavním barvám'));
      expect(loc.settings, equals('Nastavení'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Velikost a zobrazení textu'));
      expect(loc.slider_word_spacing, equals('Posuvník mezer mezi slovy'));
      expect(loc.slider_letter_spacing, equals('Posuvník mezer mezi písmeny'));
      expect(loc.slider_line_height, equals('Posuvník výšky řádku'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Profil motivu nerozpoznán'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Bezpečný pro epileptiky'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Pro zrakově postižené'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('Přívětivý pro ADHD'));
      expect(loc.theme_profile('none'), equals('Výchozí'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil bezpečný pro epileptiky'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Odstranit odrazy a snížit barvy'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Tento profil umožňuje uživatelům, kteří mají epilepsii '
          'a jsou ohroženi záchvaty, bezpečně procházet stránky '
          'odstraněním rizika záchvatů, které mohou být vyvolany '
          'blikajícími animacemi a rizikovými kombinacemi barev.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil pro zrakově postižené'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Zlepšit viditelnost aplikace'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Tento profil přizpůsobuje aplikaci tak, aby byla přístupná '
          'pro většinu zrakových postižení, jako je zraková vada, '
          'tunelové vidění, šedý zákal, glaukom a další.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil přívětivý pro ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Lepší soustředění a méně rušivých vlivů'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Tento profil významně snižuje rušivé vlivy, aby pomohl '
          'lidem s ADHD a vývojovými neurologickými poruchami '
          'snadněji navigovat, číst a soustředit se na základní '
          'prvky aplikace.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Nastavení bylo obnoveno.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Přepnout tmavý režim'));
      expect(loc.toggle_effects_mode, equals('Přepnout režim efektů'));
      expect(loc.toggle_font_weight, equals('Přepnout tučnost písma'));
      expect(loc.toggle_theme_profile, equals('Přepnout profil motivu'));
      expect(loc.word_spacing, equals('Mezery mezi slovy'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Nízká saturace'));
      expect(loc.color_profile('normal'), equals('Normální'));
      expect(loc.color_profile('highSaturation'), equals('Vysoká saturace'));
      expect(loc.color_profile('monochrome'), equals('Monochromatické'));
      expect(loc.color_profile('highContrast'), equals('Vysoký kontrast'));
      expect(loc.color_profile('unknown'), equals('Normální'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Červená'));
      expect(loc.color('cE91E63'), equals('Růžová'));
      expect(loc.color('c9C27B0'), equals('Fialová'));
      expect(loc.color('c673AB7'), equals('Tmavě fialová'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Modrá'));
      expect(loc.color('c03A9F4'), equals('Světle modrá'));
      expect(loc.color('c00BCD4'), equals('Azurová'));
      expect(loc.color('c009688'), equals('Modrozeloná'));
      expect(loc.color('c4CAF50'), equals('Zelená'));
      expect(loc.color('c8BC34A'), equals('Světle zelená'));
      expect(loc.color('cCDDC39'), equals('Limetková'));
      expect(loc.color('cFFEB3B'), equals('Žlutá'));
      expect(loc.color('cFFC107'), equals('Jantarová'));
      expect(loc.color('cFF9800'), equals('Oranžová'));
      expect(loc.color('cFF5722'), equals('Tmavě oranžová'));
      expect(loc.color('c795548'), equals('Hnědá'));
      expect(loc.color('c9E9E9E'), equals('Šedá'));
      expect(loc.color('c607D8B'), equals('Modrošedá'));
      expect(loc.color('unknown'), equals('Barva nerozpoznána'));
    });
  });
}
