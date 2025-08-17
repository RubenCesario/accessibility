import 'package:accessibility/src/core/l10n/generated/app_localizations_ro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsRo', () {
    late AccessibilityLocalizationsRo loc;

    setUp(() {
      loc = AccessibilityLocalizationsRo();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ro'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accesibilitate'));
      expect(
        loc.accessibility_settings,
        equals('Setări de accesibilitate'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Ajustează culorile de fundal'),
      );
      expect(loc.adjust_text_colors, equals('Ajustează culorile textului'));
      expect(loc.align_center, equals('Aliniere centru'));
      expect(loc.align_left, equals('Aliniere stânga'));
      expect(loc.align_right, equals('Aliniere dreapta'));
      expect(loc.bold_text, equals('Text îngroșat'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Schimbă textul îngroșat'));
      expect(
        loc.change_pages_background_color,
        equals('Schimbă culoarea de fundal a paginilor în: '),
      );
      expect(loc.change_text_color, equals('Schimbă culoarea textului în: '));
      expect(
        loc.change_text_color_shade,
        equals('Schimbă nuanța culorii în: '),
      );
      expect(loc.color_adjustment, equals('Ajustare culoare'));
      expect(
        loc.color_profile_changed_to,
        equals('Profilul de culoare actual este: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Micșorează spațierea cuvintelor'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Micșorează spațierea literelor'),
      );
      expect(loc.decrement_line_height, equals('Micșorează înălțimea liniei'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Micșorează factorul de scalare a textului'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Mărește spațierea cuvintelor'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Mărește spațierea literelor'),
      );
      expect(loc.increment_line_height, equals('Mărește înălțimea liniei'));
      expect(
        loc.increment_text_scale_factor,
        equals('Mărește factorul de scalare a textului'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Mărește sau micșorează spațierea cuvintelor'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Mărește sau micșorează spațierea literelor'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Mărește sau micșorează înălțimea liniei'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Mărește sau micșorează dimensiunea textului'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efecte'));
      expect(loc.expand_text, equals('Extinde textul'));
      expect(loc.font_size, equals('Dimensiunea fontului'));
      expect(loc.less_info, equals('Ascunde informații'));
      expect(loc.letter_spacing, equals('Spațierea literelor'));
      expect(loc.line_height, equals('Înălțimea liniei'));
      expect(loc.more_info, equals('Arată informații'));
      expect(loc.word_spacing, equals('Spațierea cuvintelor'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Citește mai puțin'));
      expect(loc.read_more, equals('Citește mai mult'));
      expect(loc.reduce_effects, equals('Reduce efectele pe ecran'));
      expect(loc.reduce_text, equals('Reduce textul'));
      expect(loc.restore_settings, equals('Restaurează setările'));
      expect(
        loc.restore_main_color,
        equals('Restaurează culoarea principală'),
      );
      expect(
        loc.return_to_main_colors,
        equals('Revino la culorile principale'),
      );
      expect(loc.settings, equals('Setări'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Dimensiune și afișare text'));
      expect(
        loc.slider_word_spacing,
        equals('Glisor pentru spațierea cuvintelor'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Glisor pentru spațierea literelor'),
      );
      expect(
        loc.slider_line_height,
        equals('Glisor pentru înălțimea liniei'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Temă'));
      expect(
        loc.theme_profile('other'),
        equals('Profil de temă nerecunoscut'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Sigur pentru epilepsie'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Deficiență de vedere'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Prietenos pentru ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Implicit'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil sigur pentru epilepsie'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Elimină reflexiile și reduce culoarea'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Acest profil permite utilizatorilor care au '
          'epilepsie și sunt în risc de convulsii să '
          'navigheze în siguranță, eliminând riscul '
          'convulsiilor care rezultă din animații '
          'intermitente și combinații de culori riscante.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil pentru deficiențe de vedere'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Îmbunătățește vizibilitatea aplicației'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Acest profil adaptează aplicația pentru a fi '
          'accesibilă majorității deficiențelor vizuale, cum '
          'ar fi deficiența de vedere, vederea de tunel, '
          'cataracta, glaucomul și altele.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil prietenos pentru ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mai multă concentrare și mai puține distracții'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Acest profil reduce semnificativ distracțiile, '
          'pentru a ajuta persoanele cu ADHD și tulburări de '
          'neurodezvoltare să navigheze, să citească și să se '
          'concentreze pe elementele esențiale ale aplicației '
          'mai ușor.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Setările au fost resetate.'),
      );
      expect(loc.toggle_dark_mode, equals('Comută modul întunecat'));
      expect(loc.toggle_effects_mode, equals('Comută modul de efecte'));
      expect(loc.toggle_font_weight, equals('Comută grosimea fontului'));
      expect(loc.toggle_theme_profile, equals('Comută profilul de temă'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(loc.color_profile('lowSaturation'), equals('Saturație scăzută'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Saturație ridicată'));
      expect(loc.color_profile('monochrome'), equals('Monocrom'));
      expect(loc.color_profile('highContrast'), equals('Contrast ridicat'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Culoare nerecunoscută'));
      expect(loc.color('cF44336'), equals('Roșu'));
      expect(loc.color('cE91E63'), equals('Roz'));
      expect(loc.color('c9C27B0'), equals('Violet'));
      expect(loc.color('c673AB7'), equals('Violet închis'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Albastru'));
      expect(loc.color('c03A9F4'), equals('Albastru deschis'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Turcoaz'));
      expect(loc.color('c4CAF50'), equals('Verde'));
      expect(loc.color('c8BC34A'), equals('Verde deschis'));
      expect(loc.color('cCDDC39'), equals('Verde lime'));
      expect(loc.color('cFFEB3B'), equals('Galben'));
      expect(loc.color('cFFC107'), equals('Chihlimbar'));
      expect(loc.color('cFF9800'), equals('Portocaliu'));
      expect(loc.color('cFF5722'), equals('Portocaliu închis'));
      expect(loc.color('c795548'), equals('Maro'));
      expect(loc.color('c9E9E9E'), equals('Gri'));
      expect(loc.color('c607D8B'), equals('Gri-albastru'));
    });
  });
}
