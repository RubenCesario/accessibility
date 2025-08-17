import 'package:accessibility/src/core/l10n/generated/app_localizations_nb.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsNb', () {
    late AccessibilityLocalizationsNb loc;

    setUp(() {
      loc = AccessibilityLocalizationsNb();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('nb'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Tilgjengelighet'));
      expect(
        loc.accessibility_settings,
        equals('Tilgjengelighetsinnstillinger'),
      );
      expect(loc.adjust_background_colors, equals('Juster bakgrunnsfarger'));
      expect(loc.adjust_text_colors, equals('Juster tekstfarger'));
      expect(loc.align_center, equals('Sentralignert'));
      expect(loc.align_left, equals('Venstrejustert'));
      expect(loc.align_right, equals('Høyrejustert'));
      expect(loc.bold_text, equals('Fet tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Endre fet tekst'));
      expect(
        loc.change_pages_background_color,
        equals('Endre bakgrunnsfarge på sidene til: '),
      );
      expect(
        loc.change_text_color,
        equals('Endre tekstfarge til: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Endre fargenyans til: '),
      );
      expect(loc.color_adjustment, equals('Fargejustering'));
      expect(
        loc.color_profile_changed_to,
        equals('Gjeldende fargeprofil er: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Reduser ordmellomrom'));
      expect(
        loc.decrement_letter_spacing,
        equals('Reduser bokstavmellomrom'),
      );
      expect(loc.decrement_line_height, equals('Reduser linjehøyde'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Reduser tekstskalering'),
      );
      expect(loc.increment_word_spacing, equals('Øk ordmellomrom'));
      expect(loc.increment_letter_spacing, equals('Øk bokstavmellomrom'));
      expect(loc.increment_line_height, equals('Øk linjehøyde'));
      expect(loc.increment_text_scale_factor, equals('Øk tekstskalering'));
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Øk eller reduser ordmellomrom'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Øk eller reduser bokstavmellomrom'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Øk eller reduser linjehøyde'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Øk eller reduser tekststørrelse'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effekter'));
      expect(loc.expand_text, equals('Utvid tekst'));
      expect(loc.font_size, equals('Skriftstørrelse'));
      expect(loc.less_info, equals('Skjul info'));
      expect(loc.letter_spacing, equals('Bokstavmellomrom'));
      expect(loc.line_height, equals('Linjehøyde'));
      expect(loc.more_info, equals('Vis info'));
      expect(loc.word_spacing, equals('Ordmellomrom'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Les mindre'));
      expect(loc.read_more, equals('Les mer'));
      expect(
        loc.reduce_effects,
        equals('Reduser effekter på skjermen'),
      );
      expect(loc.reduce_text, equals('Reduser tekst'));
      expect(loc.restore_settings, equals('Gjenopprett innstillinger'));
      expect(loc.restore_main_color, equals('Gjenopprett hovedfarge'));
      expect(
        loc.return_to_main_colors,
        equals('Gå tilbake til hovedfarger'),
      );
      expect(loc.settings, equals('Innstillinger'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Størrelse og tekstvisning'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Glidebryter for ordmellomrom'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Glidebryter for bokstavmellomrom'),
      );
      expect(
        loc.slider_line_height,
        equals('Glidebryter for linjehøyde'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Temaprofil ikke gjenkjent'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Epilepsivennlig'));
      expect(loc.theme_profile('visionImpaired'), equals('Synshemming'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-vennlig'));
      expect(loc.theme_profile('none'), equals('Standard'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsivennlig profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Fjern refleksjoner og reduser farger'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Denne profilen gjør det mulig for brukere med epilepsi '
          'og risiko for anfall å surfe trygt ved å eliminere '
          'risikoen for anfall som skyldes blinkende animasjoner '
          'og risikable fargekombinasjoner.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil for synshemmede'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Forbedre synligheten av applikasjonen'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Denne profilen tilpasser applikasjonen for å være '
          'tilgjengelig for de fleste synshemminger, som '
          'synssvekkelse, tunnelsyn, grå stær, grønn stær og mer.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-vennlig profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mer konsentrasjon og mindre distraksjoner'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Denne profilen reduserer distraksjoner betydelig for å '
          'hjelpe personer med ADHD og nevrologiske '
          'utviklingsforstyrrelser med å navigere, lese og fokusere '
          'på de viktigste elementene i applikasjonen enklere.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Innstillingene er tilbakestilt.'),
      );
      expect(loc.toggle_dark_mode, equals('Veksle mørk modus'));
      expect(loc.toggle_effects_mode, equals('Veksle effektmodus'));
      expect(loc.toggle_font_weight, equals('Veksle skriftvekt'));
      expect(loc.toggle_theme_profile, equals('Veksle temaprofil'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(loc.color_profile('lowSaturation'), equals('Lav metning'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Høy metning'));
      expect(loc.color_profile('monochrome'), equals('Monokrom'));
      expect(loc.color_profile('highContrast'), equals('Høy kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Farge ikke gjenkjent'));
      expect(loc.color('cF44336'), equals('Rød'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Lilla'));
      expect(loc.color('c673AB7'), equals('Dyp lilla'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blå'));
      expect(loc.color('c03A9F4'), equals('Lyseblå'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Blågrønn'));
      expect(loc.color('c4CAF50'), equals('Grønn'));
      expect(loc.color('c8BC34A'), equals('Lysegrønn'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Gul'));
      expect(loc.color('cFFC107'), equals('Ravgul'));
      expect(loc.color('cFF9800'), equals('Oransje'));
      expect(loc.color('cFF5722'), equals('Dyp oransje'));
      expect(loc.color('c795548'), equals('Brun'));
      expect(loc.color('c9E9E9E'), equals('Grå'));
      expect(loc.color('c607D8B'), equals('Blågrå'));
    });
  });
}
