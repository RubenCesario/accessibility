import 'package:accessibility/src/core/l10n/generated/app_localizations_sr.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsSr', () {
    late AccessibilityLocalizationsSr loc;

    setUp(() {
      loc = AccessibilityLocalizationsSr();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('sr'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Pristupačnost'));
      expect(
        loc.accessibility_settings,
        equals('Podešavanja pristupačnosti'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Prilagodi pozadinske boje'),
      );
      expect(loc.adjust_text_colors, equals('Prilagodi boje teksta'));
      expect(loc.align_center, equals('Poravnaj po sredini'));
      expect(loc.align_left, equals('Poravnaj levo'));
      expect(loc.align_right, equals('Poravnaj desno'));
      expect(loc.bold_text, equals('Podebljan tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('Promeni podebljanje teksta'),
      );
      expect(
        loc.change_pages_background_color,
        equals('Promeni pozadinsku boju stranica na: '),
      );
      expect(
        loc.change_text_color,
        equals('Promeni boju teksta na: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Promeni nijansu boje na: '),
      );
      expect(loc.color_adjustment, equals('Podešavanje boja'));
      expect(
        loc.color_profile_changed_to,
        equals('Trenutni profil boja je: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Smanji razmak između reči'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Smanji razmak između slova'),
      );
      expect(loc.decrement_line_height, equals('Smanji visinu reda'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Smanji faktor skaliranja teksta'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Povećaj razmak između reči'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Povećaj razmak između slova'),
      );
      expect(loc.increment_line_height, equals('Povećaj visinu reda'));
      expect(
        loc.increment_text_scale_factor,
        equals('Povećaj faktor skaliranja teksta'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Povećaj ili smanji razmak između reči'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Povećaj ili smanji razmak između slova'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Povećaj ili smanji visinu reda'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Povećaj ili smanji veličinu teksta'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efekti'));
      expect(loc.expand_text, equals('Proširi tekst'));
      expect(loc.font_size, equals('Veličina fonta'));
      expect(loc.less_info, equals('Sakrij informacije'));
      expect(loc.letter_spacing, equals('Razmak između slova'));
      expect(loc.line_height, equals('Visina reda'));
      expect(loc.more_info, equals('Prikaži informacije'));
      expect(loc.word_spacing, equals('Razmak između reči'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Pročitaj manje'));
      expect(loc.read_more, equals('Pročitaj više'));
      expect(
        loc.reduce_effects,
        equals('Smanji efekte na ekranu'),
      );
      expect(loc.reduce_text, equals('Smanji tekst'));
      expect(loc.restore_settings, equals('Vrati podešavanja'));
      expect(loc.restore_main_color, equals('Vrati glavnu boju'));
      expect(
        loc.return_to_main_colors,
        equals('Vrati se na glavne boje'),
      );
      expect(loc.settings, equals('Podešavanja'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Veličina i prikaz teksta'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Klizač za razmak između reči'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Klizač za razmak između slova'),
      );
      expect(loc.slider_line_height, equals('Klizač za visinu reda'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Profil teme nije prepoznat'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Bezbedno za epilepsiju'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Oštećen vid'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Prilagođeno za ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Podrazumevano'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil bezbedan za epilepsiju'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Ukloni refleksije i smanji boje'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ovaj profil omogućava korisnicima koji imaju '
          'epilepsiju i rizik od napada da bezbedno '
          'pretražuju eliminisanjem rizika od napada koji '
          'nastaju zbog treptajućih animacija i rizičnih '
          'kombinacija boja.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil za oštećen vid'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Poboljšaj vidljivost aplikacije'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ovaj profil prilagođava aplikaciju da bude '
          'pristupačna za većinu oštećenja vida, kao što su '
          'oštećenje vida, tunelski vid, katarakta, glaukom '
          'i drugo.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil prilagođen za ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Više koncentracije i manje ometanja'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ovaj profil značajno smanjuje ometanja, kako bi '
          'pomogao osobama sa ADHD-om i neurorazvojnim '
          'poremećajima da lakše navigiraju, čitaju i '
          'fokusiraju se na suštinske elemente aplikacije.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals(
          'Podešavanja su vraćena na početne vrednosti.',
        ),
      );
      expect(loc.toggle_dark_mode, equals('Uključi/isključi tamni režim'));
      expect(loc.toggle_effects_mode, equals('Uključi/isključi režim efekata'));
      expect(loc.toggle_font_weight, equals('Promeni debljinu fonta'));
      expect(loc.toggle_theme_profile, equals('Promeni profil teme'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normalno'));
      expect(loc.color_profile('lowSaturation'), equals('Niska zasićenost'));
      expect(loc.color_profile('normal'), equals('Normalno'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Visoka zasićenost'),
      );
      expect(loc.color_profile('monochrome'), equals('Monohromatski'));
      expect(loc.color_profile('highContrast'), equals('Visoki kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Boja nije prepoznata'));
      expect(loc.color('cF44336'), equals('Crvena'));
      expect(loc.color('cE91E63'), equals('Roze'));
      expect(loc.color('c9C27B0'), equals('Ljubičasta'));
      expect(loc.color('c673AB7'), equals('Tamno ljubičasta'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Plava'));
      expect(loc.color('c03A9F4'), equals('Svetlo plava'));
      expect(loc.color('c00BCD4'), equals('Cijan'));
      expect(loc.color('c009688'), equals('Tirkizna'));
      expect(loc.color('c4CAF50'), equals('Zelena'));
      expect(loc.color('c8BC34A'), equals('Svetlo zelena'));
      expect(loc.color('cCDDC39'), equals('Limeta'));
      expect(loc.color('cFFEB3B'), equals('Žuta'));
      expect(loc.color('cFFC107'), equals('Ćilibar'));
      expect(loc.color('cFF9800'), equals('Narandžasta'));
      expect(loc.color('cFF5722'), equals('Tamno narandžasta'));
      expect(loc.color('c795548'), equals('Braon'));
      expect(loc.color('c9E9E9E'), equals('Siva'));
      expect(loc.color('c607D8B'), equals('Plavo-siva'));
    });
  });
}
