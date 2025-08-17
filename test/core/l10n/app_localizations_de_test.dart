import 'package:accessibility/src/core/l10n/generated/app_localizations_de.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsDe', () {
    late AccessibilityLocalizationsDe loc;

    setUp(() {
      loc = AccessibilityLocalizationsDe();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('de'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Barrierefreiheit'));
      expect(
        loc.accessibility_settings,
        equals('Barrierefreiheit-Einstellungen'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Hintergrundfarben anpassen'),
      );
      expect(loc.adjust_text_colors, equals('Textfarben anpassen'));
      expect(loc.align_center, equals('Zentriert ausrichten'));
      expect(loc.align_left, equals('Linksbündig ausrichten'));
      expect(loc.align_right, equals('Rechtsbündig ausrichten'));
      expect(loc.bold_text, equals('Fettschrift'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Fettschrift ändern'));
      expect(
        loc.change_pages_background_color,
        equals('Hintergrundfarbe der Seiten ändern zu: '),
      );
      expect(
        loc.change_text_color,
        equals('Farbe des Textes ändern zu: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Schattierung der Farbe ändern zu: '),
      );
      expect(loc.color_adjustment, equals('Farbanpassung'));
      expect(
        loc.color_profile_changed_to,
        equals('Das aktuelle Farbprofil ist: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Wortabstand verringern'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Buchstabenabstand verringern'),
      );
      expect(
        loc.decrement_line_height,
        equals('Zeilenhöhe verringern'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Textskalierungsfaktor verringern'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Wortabstand erhöhen'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Buchstabenabstand erhöhen'),
      );
      expect(
        loc.increment_line_height,
        equals('Zeilenhöhe erhöhen'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Textskalierungsfaktor erhöhen'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Wortabstand erhöhen oder verringern'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Buchstabenabstand erhöhen oder verringern'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Zeilenhöhe erhöhen oder verringern'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Textgröße erhöhen oder verringern'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effekte'));
      expect(loc.expand_text, equals('Text erweitern'));
      expect(loc.font_size, equals('Schriftgröße'));
      expect(loc.less_info, equals('Info ausblenden'));
      expect(loc.letter_spacing, equals('Buchstabenabstand'));
      expect(loc.line_height, equals('Zeilenhöhe'));
      expect(loc.more_info, equals('Info anzeigen'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Weniger lesen'));
      expect(loc.read_more, equals('Mehr lesen'));
      expect(
        loc.reduce_effects,
        equals('Bildschirmeffekte reduzieren'),
      );
      expect(loc.reduce_text, equals('Text verkleinern'));
      expect(loc.restore_settings, equals('Einstellungen zurücksetzen'));
      expect(loc.restore_main_color, equals('Hauptfarbe wiederherstellen'));
      expect(
        loc.return_to_main_colors,
        equals('Zurück zu Hauptfarben'),
      );
      expect(loc.settings, equals('Einstellungen'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Größe und Textanzeige'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Schieberegler für Wortabstand'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Schieberegler für Buchstabenabstand'),
      );
      expect(loc.slider_line_height, equals('Schieberegler für Zeilenhöhe'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Themaprofil nicht erkannt'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Epilepsie-sicher'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Für Sehbehinderung'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHS-freundlich'),
      );
      expect(loc.theme_profile('none'), equals('Standard'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsie-sicheres Profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Reflexionen entfernen und Farbe reduzieren'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Dieses Profil ermöglicht Benutzern mit Epilepsie und erhöhtem '
          'Anfallsrisiko eine sichere Nutzung, indem es das Risiko von '
          'Anfällen durch blinkende Animationen und riskante Farbkombinationen '
          'verringert.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil für Sehbehinderung'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Verbessert die Sichtbarkeit der Anwendung'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Dieses Profil passt die Anwendung an, um für die meisten'
          ' Sehbehinderungen zugänglich zu sein, wie z.B. '
          'Sehschwäche, Tunnelblick, Katarakte, Glaukom und mehr.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHS-freundliches Profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mehr Konzentration und weniger Ablenkung'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Dieses Profil reduziert Ablenkungen erheblich, um Menschen '
          'mit ADHS und neurologischen Entwicklungsstörungen zu helfen,'
          ' leichter zu navigieren, zu lesen und sich auf die '
          'wesentlichen Elemente der Anwendung zu konzentrieren.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Die Einstellungen wurden zurückgesetzt.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Dunkelmodus umschalten'));
      expect(
        loc.toggle_effects_mode,
        equals('Effektmodus umschalten'),
      );
      expect(loc.toggle_font_weight, equals('Schriftstärke umschalten'));
      expect(loc.word_spacing, equals('Wortabstand'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Geringe Sättigung'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Hohe Sättigung'),
      );
      expect(loc.color_profile('monochrome'), equals('Monochrom'));
      expect(
        loc.color_profile('highContrast'),
        equals('Hoher Kontrast'),
      );
      expect(
        loc.color_profile('unknown'),
        equals('Normal'),
      );
    });

    test('should handle color selection logic correctly', () {
      // Test a sample of colors
      expect(loc.color('cF44336'), equals('Rot'));
      expect(loc.color('cE91E63'), equals('Pink'));
      expect(loc.color('c9C27B0'), equals('Lila'));
      expect(loc.color('c673AB7'), equals('Dunkellila'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blau'));
      expect(loc.color('c03A9F4'), equals('Hellblau'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Türkis'));
      expect(loc.color('c4CAF50'), equals('Grün'));
      expect(loc.color('c8BC34A'), equals('Hellgrün'));
      expect(loc.color('cCDDC39'), equals('Limette'));
      expect(loc.color('cFFEB3B'), equals('Gelb'));
      expect(loc.color('cFFC107'), equals('Bernstein'));
      expect(loc.color('cFF9800'), equals('Orange'));
      expect(loc.color('cFF5722'), equals('Dunkelorange'));
      expect(loc.color('c795548'), equals('Braun'));
      expect(loc.color('c9E9E9E'), equals('Grau'));
      expect(loc.color('c607D8B'), equals('Blaugrau'));
      expect(
        loc.color('unknown'),
        equals('Farbe nicht erkannt'),
      );
    });
  });
}
