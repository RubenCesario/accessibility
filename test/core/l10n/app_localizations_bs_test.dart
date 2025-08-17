import 'package:accessibility/src/core/l10n/generated/app_localizations_bs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsBs', () {
    late AccessibilityLocalizationsBs loc;

    setUp(() {
      loc = AccessibilityLocalizationsBs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('bs'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Pristupačnost'));
      expect(loc.accessibility_settings, equals('Postavke pristupačnosti'));
      expect(loc.adjust_background_colors, equals('Prilagodi pozadinske boje'));
      expect(loc.adjust_text_colors, equals('Prilagodi boje teksta'));
      expect(loc.align_center, equals('Poravnaj u sredinu'));
      expect(loc.align_left, equals('Poravnaj lijevo'));
      expect(loc.align_right, equals('Poravnaj desno'));
      expect(loc.bold_text, equals('Podebljani tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Promijeni podebljani tekst'));
      expect(
        loc.change_pages_background_color,
        equals('Promijeni pozadinsku boju stranica u: '),
      );
      expect(loc.change_text_color, equals('Promijeni boju teksta u: '));
      expect(loc.change_text_color_shade, equals('Promijeni nijansu boje u: '));
      expect(loc.color_adjustment, equals('Prilagodba boja'));
      expect(loc.color_profile_changed_to, equals('Trenutni profil boja je: '));
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Smanji razmak između riječi'));
      expect(
        loc.decrement_letter_spacing,
        equals('Smanji razmak između slova'),
      );
      expect(loc.decrement_line_height, equals('Smanji visinu linije'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Smanji faktor skaliranja teksta'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Povećaj razmak između riječi'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Povećaj razmak između slova'),
      );
      expect(loc.increment_line_height, equals('Povećaj visinu linije'));
      expect(
        loc.increment_text_scale_factor,
        equals('Povećaj faktor skaliranja teksta'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Povećaj ili smanji razmak između riječi'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Povećaj ili smanji razmak između slova'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Povećaj ili smanji visinu linije'),
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
      expect(loc.line_height, equals('Visina linije'));
      expect(loc.more_info, equals('Prikaži informacije'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Čitaj manje'));
      expect(loc.read_more, equals('Čitaj više'));
      expect(loc.reduce_effects, equals('Smanji efekte na ekranu'));
      expect(loc.reduce_text, equals('Smanji tekst'));
      expect(loc.restore_settings, equals('Vrati postavke'));
      expect(loc.restore_main_color, equals('Vrati glavnu boju'));
      expect(loc.return_to_main_colors, equals('Vrati se na glavne boje'));
      expect(loc.settings, equals('Postavke'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Veličina i prikaz teksta'));
      expect(
        loc.slider_word_spacing,
        equals('Klizač razmaka između riječi'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Klizač razmaka između slova'),
      );
      expect(loc.slider_line_height, equals('Klizač visine linije'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Profil teme nije prepoznat'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Zaštita od napada'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Za osobe oštećenog vida'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-prilagodljiv'));
      expect(loc.theme_profile('none'), equals('Zadano'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil siguran za epileptičare'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Uklanjanje refleksija i smanjenje boja'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ovaj profil omogućava korisnicima koji imaju epilepsiju '
          'i rizik od napada sigurno pregledavanje eliminisanjem '
          'rizika od napada koji mogu biti uzrokovani treptajućim '
          'animacijama i rizičnim kombinacijama boja.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil za osobe oštećenog vida'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Poboljšana vidljivost aplikacije'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ovaj profil prilagođava aplikaciju da bude pristupačna '
          'većini vizualnih oštećenja, kao što su slabovidnost, '
          'tunelski vid, katarakta, glaukom i drugo.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-prilagodljiv profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Veća koncentracija i manje ometanja'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ovaj profil značajno smanjuje ometanja, kako bi pomogao '
          'ljudima s ADHD-om i neurorazvojnim poremećajima '
          'da lakše navigiraju, čitaju i fokusiraju se na bitne '
          'elemente aplikacije.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Postavke su vraćene na početno stanje.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Uključi/isključi tamni mod'));
      expect(loc.toggle_effects_mode, equals('Uključi/isključi mod efekata'));
      expect(loc.toggle_font_weight, equals('Uključi/isključi debljinu fonta'));
      expect(loc.toggle_theme_profile, equals('Uključi/isključi profil teme'));
      expect(loc.word_spacing, equals('Razmak između riječi'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Niska saturacija'));
      expect(loc.color_profile('normal'), equals('Normalno'));
      expect(loc.color_profile('highSaturation'), equals('Visoka saturacija'));
      expect(loc.color_profile('monochrome'), equals('Monohrom'));
      expect(loc.color_profile('highContrast'), equals('Visok kontrast'));
      expect(loc.color_profile('unknown'), equals('Normalno'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Crvena'));
      expect(loc.color('cE91E63'), equals('Roze'));
      expect(loc.color('c9C27B0'), equals('Ljubičasta'));
      expect(loc.color('c673AB7'), equals('Tamno ljubičasta'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Plava'));
      expect(loc.color('c03A9F4'), equals('Svijetlo plava'));
      expect(loc.color('c00BCD4'), equals('Cijan'));
      expect(loc.color('c009688'), equals('Tirkizna'));
      expect(loc.color('c4CAF50'), equals('Zelena'));
      expect(loc.color('c8BC34A'), equals('Svijetlo zelena'));
      expect(loc.color('cCDDC39'), equals('Limeta'));
      expect(loc.color('cFFEB3B'), equals('Žuta'));
      expect(loc.color('cFFC107'), equals('Jantarna'));
      expect(loc.color('cFF9800'), equals('Narandžasta'));
      expect(loc.color('cFF5722'), equals('Tamno narandžasta'));
      expect(loc.color('c795548'), equals('Smeđa'));
      expect(loc.color('c9E9E9E'), equals('Siva'));
      expect(loc.color('c607D8B'), equals('Plavo-siva'));
      expect(loc.color('unknown'), equals('Boja nije prepoznata'));
    });
  });
}
