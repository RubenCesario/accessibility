import 'package:accessibility/src/core/l10n/generated/app_localizations_hu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsHu', () {
    late AccessibilityLocalizationsHu loc;

    setUp(() {
      loc = AccessibilityLocalizationsHu();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('hu'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Akadálymentesítés'));
      expect(
        loc.accessibility_settings,
        equals('Akadálymentesítési beállítások'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Háttérszínek beállítása'),
      );
      expect(loc.adjust_text_colors, equals('Szövegszínek beállítása'));
      expect(loc.align_center, equals('Középre igazítás'));
      expect(loc.align_left, equals('Balra igazítás'));
      expect(loc.align_right, equals('Jobbra igazítás'));
      expect(loc.bold_text, equals('Félkövér szöveg'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Félkövér szöveg módosítása'));
      expect(
        loc.change_pages_background_color,
        equals('Az oldalak háttérszínének módosítása: '),
      );
      expect(
        loc.change_text_color,
        equals('A szöveg színének módosítása: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('A szín árnyalatának módosítása: '),
      );
      expect(loc.color_adjustment, equals('Színbeállítás'));
      expect(
        loc.color_profile_changed_to,
        equals('A jelenlegi színprofil: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Szóköz csökkentése'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Betűköz csökkentése'),
      );
      expect(
        loc.decrement_line_height,
        equals('Soroköz csökkentése'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Szövegméret csökkentése'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Szóköz növelése'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Betűköz növelése'),
      );
      expect(
        loc.increment_line_height,
        equals('Soroköz növelése'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Szövegméret növelése'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Szóköz növelése vagy csökkentése'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Betűköz növelése vagy csökkentése'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Soroköz növelése vagy csökkentése'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Szövegméret növelése vagy csökkentése'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effektek'));
      expect(loc.expand_text, equals('Szöveg kiterjesztése'));
      expect(loc.font_size, equals('Betűméret'));
      expect(loc.less_info, equals('Információk elrejtése'));
      expect(loc.letter_spacing, equals('Betűköz'));
      expect(loc.line_height, equals('Soroköz'));
      expect(loc.more_info, equals('Információk megjelenítése'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Kevesebb olvasása'));
      expect(loc.read_more, equals('Tovább olvasása'));
      expect(
        loc.reduce_effects,
        equals('Képernyőeffektek csökkentése'),
      );
      expect(loc.reduce_text, equals('Szöveg csökkentése'));
      expect(loc.restore_settings, equals('Beállítások visszaállítása'));
      expect(loc.restore_main_color, equals('Fő szín visszaállítása'));
      expect(
        loc.return_to_main_colors,
        equals('Vissza a fő színekhez'),
      );
      expect(loc.settings, equals('Beállítások'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Méret és szövegmegjelenítés'),
      );
      expect(loc.slider_word_spacing, equals('Szóköz csúszka'));
      expect(loc.slider_letter_spacing, equals('Betűköz csúszka'));
      expect(loc.slider_line_height, equals('Soroköz csúszka'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Profil nem felismerhető'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Epilepszia-biztos'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Gyengénlátóknak'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD-barát'),
      );
      expect(loc.theme_profile('none'), equals('Alapértelmezett'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepszia-biztos profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Tükrözések eltávolítása és színek csökkentése'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ez a profil lehetővé teszi az epilepsziával élő és rohamokra '
          'hajlamos felhasználóknak a biztonságos böngészést, megszüntetve '
          'a villogó animációkból és kockázatos szín kombinációkból '
          'eredő rohamok veszélyét.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Gyengénlátóknak készült profil'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Az alkalmazás láthatóságának javítása'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ez a profil úgy alakítja az alkalmazást, hogy hozzáférhető '
          'legyen a legtöbb látással kapcsolatos problémával küzdő '
          'személynek, például gyengénlátás, alagut-látás, szürkehalály, '
          'zöld hályog és más esetekhez.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-barát profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Jobb koncentráció és kevesebb figyelemelterelés'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ez a profil jelentősen csökkenti a figyelemelterelő '
          'tényezőket, segítve az ADHD-val és idegfejlődési '
          'zavarokkal élő embereket a könnyebb navigációban, '
          'olvasásban és az alkalmazás lényeges elemeire való '
          'koncentrálásban.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('A beállítások visszaállítva.'),
      );
      expect(loc.toggle_dark_mode, equals('Sötét mód váltása'));
      expect(loc.toggle_effects_mode, equals('Effekt mód váltása'));
      expect(loc.toggle_font_weight, equals('Betűvasédság váltása'));
      expect(loc.toggle_theme_profile, equals('Témaprofil váltása'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Normál'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Alacsony telítettség'),
      );
      expect(loc.color_profile('normal'), equals('Normál'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Magas telítettség'),
      );
      expect(loc.color_profile('monochrome'), equals('Egyszínű'));
      expect(loc.color_profile('highContrast'), equals('Magas kontraszt'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Szín nem felismerhető'));
      expect(loc.color('cF44336'), equals('Piros'));
      expect(loc.color('cE91E63'), equals('Rózsaszín'));
      expect(loc.color('c9C27B0'), equals('Lila'));
      expect(loc.color('c673AB7'), equals('Sötétlila'));
      expect(loc.color('c3F51B5'), equals('Indigó'));
      expect(loc.color('c2196F3'), equals('Kék'));
      expect(loc.color('c03A9F4'), equals('Világoskék'));
      expect(loc.color('c00BCD4'), equals('Cián'));
      expect(loc.color('c009688'), equals('Türkiz'));
      expect(loc.color('c4CAF50'), equals('Zöld'));
      expect(loc.color('c8BC34A'), equals('Világoszöld'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Sárga'));
      expect(loc.color('cFFC107'), equals('Borostyán'));
      expect(loc.color('cFF9800'), equals('Narancssárga'));
      expect(loc.color('cFF5722'), equals('Sötétnarancssárga'));
      expect(loc.color('c795548'), equals('Barna'));
      expect(loc.color('c9E9E9E'), equals('Szürke'));
      expect(loc.color('c607D8B'), equals('Kékeszürke'));
    });
  });
}
