import 'package:accessibility/src/core/l10n/generated/app_localizations_da.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsDa', () {
    late AccessibilityLocalizationsDa loc;

    setUp(() {
      loc = AccessibilityLocalizationsDa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('da'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Tilgængelighed'));
      expect(
        loc.accessibility_settings,
        equals('Tilgængelighedsindstillinger'),
      );
      expect(loc.adjust_background_colors, equals('Juster baggrundsfarver'));
      expect(loc.adjust_text_colors, equals('Juster tekstfarver'));
      expect(loc.align_center, equals('Centrér tekst'));
      expect(loc.align_left, equals('Venstrejustér tekst'));
      expect(loc.align_right, equals('Højrejustér tekst'));
      expect(loc.bold_text, equals('Fed tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Skift fed tekst'));
      expect(
        loc.change_pages_background_color,
        equals('Skift baggrundsfarve på siderne til: '),
      );
      expect(loc.change_text_color, equals('Skift tekstfarve til: '));
      expect(loc.change_text_color_shade, equals('Skift farvens nuance til: '));
      expect(loc.color_adjustment, equals('Farvejustering'));
      expect(
        loc.color_profile_changed_to,
        equals('Den aktuelle farveprofil er: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Formindsk ordmellemrum'));
      expect(
        loc.decrement_letter_spacing,
        equals('Formindsk bogstavmellemrum'),
      );
      expect(loc.decrement_line_height, equals('Formindsk linjehøjde'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Formindsk tekststorhedsfaktor'),
      );
      expect(loc.increment_word_spacing, equals('Forøg ordmellemrum'));
      expect(loc.increment_letter_spacing, equals('Forøg bogstavmellemrum'));
      expect(loc.increment_line_height, equals('Forøg linjehøjde'));
      expect(
        loc.increment_text_scale_factor,
        equals('Forøg tekststorhedsfaktor'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Forøg eller formindsk ordmellemrum'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Forøg eller formindsk bogstavmellemrum'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Forøg eller formindsk linjehøjde'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Forøg eller formindsk tekststørrelse'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effekter'));
      expect(loc.expand_text, equals('Udvid tekst'));
      expect(loc.font_size, equals('Skriftstørrelse'));
      expect(loc.less_info, equals('Skjul info'));
      expect(loc.letter_spacing, equals('Bogstavmellemrum'));
      expect(loc.line_height, equals('Linjehøjde'));
      expect(loc.more_info, equals('Vis info'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Læs mindre'));
      expect(loc.read_more, equals('Læs mere'));
      expect(loc.reduce_effects, equals('Reducer effekter på skærmen'));
      expect(loc.reduce_text, equals('Reducer tekst'));
      expect(loc.restore_settings, equals('Gendan indstillinger'));
      expect(loc.restore_main_color, equals('Gendan hovedfarve'));
      expect(loc.return_to_main_colors, equals('Vend tilbage til hovedfarver'));
      expect(loc.settings, equals('Indstillinger'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Størrelse og tekstvisning'));
      expect(loc.slider_word_spacing, equals('Skydekontrol til ordmellemrum'));
      expect(
        loc.slider_letter_spacing,
        equals('Skydekontrol til bogstavmellemrum'),
      );
      expect(loc.slider_line_height, equals('Skydekontrol til linjehøjde'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Temaprofil ikke genkendt'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Epilepsivenlig'));
      expect(loc.theme_profile('visionImpaired'), equals('Synshandicapvenlig'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-venlig'));
      expect(loc.theme_profile('none'), equals('Standard'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsivenlig profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Fjern refleksioner og reducer farve'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Denne profil gør det muligt for brugere, der har epilepsi '
          'og er i risiko for anfæld, at bruge applikationen sikkert '
          'ved at eliminere risikoen for anfæld, der skyldes blinkende '
          'animationer og risikable farvekombinationer.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil for synshandicappede'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Forbedrer synligheden af applikationen'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Denne profil tilpasser applikationen til at være tilgængelig '
          'for de fleste synshandicap, såsom synsnedsættelse, tunnelsyn, '
          'grå stær, gløjde og mere.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-venlig profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mere koncentration og færre distraktioner'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Denne profil reducerer væsentligt distraktioner for at hjælpe '
          'personer med ADHD og neuroudviklingsmæssige forstyrrelser med '
          'at navigere, læse og fokusere på de væsentlige elementer '
          'i applikationen mere enkelt.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Indstillingerne er blevet nulstillet.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Skift mørk tilstand'));
      expect(loc.toggle_effects_mode, equals('Skift effekttilstand'));
      expect(loc.toggle_font_weight, equals('Skift skrifttyngde'));
      expect(loc.toggle_theme_profile, equals('Skift temaprofil'));
      expect(loc.word_spacing, equals('Ordmellemrum'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Lav mætning'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Høj mætning'));
      expect(loc.color_profile('monochrome'), equals('Monokrom'));
      expect(loc.color_profile('highContrast'), equals('Høj kontrast'));
      expect(loc.color_profile('unknown'), equals('Normal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Rød'));
      expect(loc.color('cE91E63'), equals('Pink'));
      expect(loc.color('c9C27B0'), equals('Lilla'));
      expect(loc.color('c673AB7'), equals('Dyb lilla'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blå'));
      expect(loc.color('c03A9F4'), equals('Lyseblå'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Blågrøn'));
      expect(loc.color('c4CAF50'), equals('Grøn'));
      expect(loc.color('c8BC34A'), equals('Lysegrøn'));
      expect(loc.color('cCDDC39'), equals('Limegrøn'));
      expect(loc.color('cFFEB3B'), equals('Gul'));
      expect(loc.color('cFFC107'), equals('Rav'));
      expect(loc.color('cFF9800'), equals('Orange'));
      expect(loc.color('cFF5722'), equals('Dyb orange'));
      expect(loc.color('c795548'), equals('Brun'));
      expect(loc.color('c9E9E9E'), equals('Grå'));
      expect(loc.color('c607D8B'), equals('Blågrå'));
      expect(loc.color('unknown'), equals('Farve ikke genkendt'));
    });
  });
}
