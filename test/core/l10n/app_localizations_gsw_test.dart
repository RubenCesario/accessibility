import 'package:accessibility/src/core/l10n/generated/app_localizations_gsw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsGsw', () {
    late AccessibilityLocalizationsGsw loc;

    setUp(() {
      loc = AccessibilityLocalizationsGsw();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('gsw'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Barrierefreiheit'));
      expect(
        loc.accessibility_settings,
        equals('Istellige für Barrierefreiheit'),
      );
      expect(loc.adjust_background_colors, equals('Hindergrundfarbe apasse'));
      expect(loc.adjust_text_colors, equals('Textfarbe apasse'));
      expect(loc.align_center, equals('Zäntriere'));
      expect(loc.align_left, equals('Links usrichte'));
      expect(loc.align_right, equals('Rächts usrichte'));
      expect(loc.bold_text, equals('Fätte Text'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Fätte Text ändere'));
      expect(
        loc.change_pages_background_color,
        equals('Hindergrundfarbe vo de Site ändere uf: '),
      );
      expect(loc.change_text_color, equals('Textfarbe ändere uf: '));
      expect(loc.change_text_color_shade, equals('Farbtoon ändere uf: '));
      expect(loc.color_adjustment, equals('Farbappassig'));
      expect(
        loc.color_profile_changed_to,
        equals('S aktuelle Farbprofil isch: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Wortzwischeruum verchlinere'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Buechschtabezwischeruum verchlinere'),
      );
      expect(loc.decrement_line_height, equals('Zilehöchi verchlinere'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Textskalierigsfaktor verchlinere'),
      );
      expect(loc.increment_word_spacing, equals('Wortzwischeruum vergrössere'));
      expect(
        loc.increment_letter_spacing,
        equals('Buechschtabezwischeruum vergrössere'),
      );
      expect(loc.increment_line_height, equals('Zilehöchi vergrössere'));
      expect(
        loc.increment_text_scale_factor,
        equals('Textskalierigsfaktor vergrössere'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Wortzwischeruum vergrössere oder verchlinere'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Buechschtabezwischeruum vergrössere oder verchlinere'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Zilehöchi vergrössere oder verchlinere'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Textgrössi vergrössere oder verchlinere'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effekt'));
      expect(loc.expand_text, equals('Text erwiiitere'));
      expect(loc.font_size, equals('Schriftgrössi'));
      expect(loc.less_info, equals('Info verstecke'));
      expect(loc.letter_spacing, equals('Buechschtabezwischeruum'));
      expect(loc.line_height, equals('Zilehöchi'));
      expect(loc.more_info, equals('Info azeige'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Weniger läse'));
      expect(loc.read_more, equals('Meh läse'));
      expect(
        loc.reduce_effects,
        equals('Effekt uf em Bildschirm verringere'),
      );
      expect(loc.reduce_text, equals('Text verchlinere'));
      expect(loc.restore_settings, equals('Istellige zruggsetze'));
      expect(loc.restore_main_color, equals('Hauptfarb zruggsetze'));
      expect(loc.return_to_main_colors, equals('Zrugg zu de Hauptfarbe'));
      expect(loc.settings, equals('Istellige'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Grössi und Textazeig'));
      expect(
        loc.slider_word_spacing,
        equals('Schieberegler Wortzwischeruum'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Schieberegler Buechschtabezwischeruum'),
      );
      expect(loc.slider_line_height, equals('Schieberegler Zilehöchi'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Thema'));
      expect(
        loc.theme_profile('other'),
        equals('Themaprofil nid erkannt'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Epilepsiesicher'));
      expect(loc.theme_profile('visionImpaired'), equals('Sehbehinderet'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHS-fründlich'));
      expect(loc.theme_profile('none'), equals('Standard'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsiesicheres Profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Reflektione entferne und Farb reduziere'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Das Profil ermöglicht Benutzer mit Epilepsie und '
          "Afalsgfahre sicher z'surfe, indem s'Risiko vo Afäll, "
          'die dürch flimmerndi Animatione und riskanti '
          'Farbkombinations entstoh, usgsschloss wird.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Sehbehinderede-Profil'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Sichtbarkeit vo de App verbessere'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Das Profil passt d App a, dass si für die meischte '
          'Seebhinderige zugänglich isch, wie Sehbhinderig, '
          'Tunnelblick, grauer Star, Gloukom und meh.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHS-fründlichs Profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Meh Konzentration und weniger Ablenkige'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Das Profil reduziert Ablenkige deutlich, um Persone mit '
          "ADHS und neurologische Entwicklungsstörige z'helfe, "
          "eifacher z'navigiere, z'läse und sich uf die wichtige "
          "Element vo dr App z'konzentriere.",
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals("D'Istellige sin zrugggsetzt worde."),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Dunkelmodus umschalte'));
      expect(loc.toggle_effects_mode, equals('Effektmodus umschalte'));
      expect(loc.toggle_font_weight, equals('Schriftstärki umschalte'));
      expect(loc.toggle_theme_profile, equals('Themaprofil umschalte'));
      expect(loc.word_spacing, equals('Wortzwischeruum'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Niedrigi Sättigung'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Hochi Sättigung'),
      );
      expect(loc.color_profile('monochrome'), equals('Eifarbig'));
      expect(loc.color_profile('highContrast'), equals('Hoche Kontrast'));
      expect(loc.color_profile('unknown'), equals('Normal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Rot'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Violett'));
      expect(loc.color('c673AB7'), equals('Tiefsviolett'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blau'));
      expect(loc.color('c03A9F4'), equals('Hellblau'));
      expect(loc.color('c00BCD4'), equals('Türkis'));
      expect(loc.color('c009688'), equals('Teal'));
      expect(loc.color('c4CAF50'), equals('Grüeñ'));
      expect(loc.color('c8BC34A'), equals('Hellgrüeñ'));
      expect(loc.color('cCDDC39'), equals('Limette'));
      expect(loc.color('cFFEB3B'), equals('Gääl'));
      expect(loc.color('cFFC107'), equals('Amberfarbig'));
      expect(loc.color('cFF9800'), equals('Orange'));
      expect(loc.color('cFF5722'), equals('Tiefsorange'));
      expect(loc.color('c795548'), equals('Brun'));
      expect(loc.color('c9E9E9E'), equals('Grau'));
      expect(loc.color('c607D8B'), equals('Blaugrau'));
      expect(
        loc.color('unknown'),
        equals('Farb nid erkannt'),
      );
    });
  });
}
