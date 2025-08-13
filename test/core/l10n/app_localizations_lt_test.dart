import 'package:accessibility/src/core/l10n/generated/app_localizations_lt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsLt', () {
    late AccessibilityLocalizationsLt loc;

    setUp(() {
      loc = AccessibilityLocalizationsLt();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('lt'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Prieinamumas'));
      expect(
        loc.accessibility_settings,
        equals('Prieinamumo nustatymai'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Koreguoti fono spalvas'),
      );
      expect(loc.adjust_text_colors, equals('Koreguoti teksto spalvas'));
      expect(loc.align_center, equals('Lygiuoti centre'));
      expect(loc.align_left, equals('Lygiuoti kairėje'));
      expect(loc.align_right, equals('Lygiuoti dešinėje'));
      expect(loc.bold_text, equals('Paryškintas tekstas'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Keisti teksto paryškinimą'));
      expect(
        loc.change_pages_background_color,
        equals('Keisti puslapių fono spalvą į: '),
      );
      expect(
        loc.change_text_color,
        equals('Keisti teksto spalvą į: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Keisti spalvos atspalvį į: '),
      );
      expect(loc.color_adjustment, equals('Spalvų koregavimas'));
      expect(
        loc.color_profile_changed_to,
        equals('Dabartinis spalvų profilis yra: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Mažinti žodžių tarpą'));
      expect(
        loc.decrement_letter_spacing,
        equals('Mažinti raidžių tarpą'),
      );
      expect(loc.decrement_line_height, equals('Mažinti eilutės aukštį'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Mažinti teksto mastelio koeficientą'),
      );
      expect(loc.increment_word_spacing, equals('Padidinti žodžių tarpą'));
      expect(
        loc.increment_letter_spacing,
        equals('Padidinti raidžių tarpą'),
      );
      expect(loc.increment_line_height, equals('Padidinti eilutės aukštį'));
      expect(
        loc.increment_text_scale_factor,
        equals('Padidinti teksto mastelio koeficientą'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Padidinti arba sumažinti žodžių tarpą'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Padidinti arba sumažinti raidžių tarpą'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Padidinti arba sumažinti eilutės aukštį'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Padidinti arba sumažinti teksto dydį'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efektai'));
      expect(loc.expand_text, equals('Išplėsti tekstą'));
      expect(loc.font_size, equals('Šrifto dydis'));
      expect(loc.less_info, equals('Slėpti informaciją'));
      expect(loc.letter_spacing, equals('Raidžių tarpas'));
      expect(loc.line_height, equals('Eilutės aukštis'));
      expect(loc.more_info, equals('Rodyti informaciją'));
      expect(loc.word_spacing, equals('Žodžių tarpas'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Skaityti mažiau'));
      expect(loc.read_more, equals('Skaityti daugiau'));
      expect(
        loc.reduce_effects,
        equals('Sumažinti efektus ekrane'),
      );
      expect(loc.reduce_text, equals('Sumažinti tekstą'));
      expect(loc.restore_settings, equals('Atstatyti nustatymus'));
      expect(
        loc.restore_main_color,
        equals('Atstatyti pagrindinę spalvą'),
      );
      expect(
        loc.return_to_main_colors,
        equals('Grįžti į pagrindines spalvas'),
      );
      expect(loc.settings, equals('Nustatymai'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Dydis ir teksto rodymas'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Žodžių tarpo slankiklis'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Raidžių tarpo slankiklis'),
      );
      expect(
        loc.slider_line_height,
        equals('Eilutės aukščio slankiklis'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Temos profilis neatpažintas'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Saugus nuo priepuolių'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Silpnaregiams'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD draugiškas'),
      );
      expect(loc.theme_profile('none'), equals('Numatytasis'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Saugus nuo priepuolių profilis'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Pašalinti atspindžius ir sumažinti spalvas'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Šis profilis leidžia vartotojams, sergantiems epilepsija ir '
          'turintiems priepuolių riziką, naršyti saugiai pašalinant '
          'priepuolių, kuriuos sukelia mirksintys animaciniai '
          'elementai ir rizikingos spalvų kombinacijos, riziką.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Silpnaregių profilis'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Pagerinti programos matomumą'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Šis profilis pritaiko programą, kad ji būtų prieinama '
          'daugumai regėjimo sutrikimų, tokiems kaip silpnaregystė, '
          'tunelio regėjimas, katarakta, glaukoma ir kitiems.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD draugiškas profilis'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Didesnis susikaupimas ir mažiau blaškomų veiksnių'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Šis profilis žymiai sumažina blaškančius veiksnius, '
          'padėdamas žmonėms su ADHD ir neuroraidos sutrikimais '
          'lengviau naršyti, skaityti ir sutelkti dėmesį į '
          'esminius programos elementus.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Nustatymai buvo atstatyti.'),
      );
      expect(loc.toggle_dark_mode, equals('Perjungti tamsų režimą'));
      expect(loc.toggle_effects_mode, equals('Perjungti efektų režimą'));
      expect(loc.toggle_font_weight, equals('Perjungti šrifto storį'));
      expect(loc.toggle_theme_profile, equals('Perjungti temos profilį'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Įprastas'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Žemas sotīs'),
      );
      expect(loc.color_profile('normal'), equals('Įprastas'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Aukštas sotīs'),
      );
      expect(loc.color_profile('monochrome'), equals('Vienspalvis'));
      expect(
        loc.color_profile('highContrast'),
        equals('Didelis kontrastas'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Spalva neatpažinta'));
      expect(loc.color('cF44336'), equals('Raudona'));
      expect(loc.color('cE91E63'), equals('Rožinė'));
      expect(loc.color('c9C27B0'), equals('Violetinė'));
      expect(loc.color('c673AB7'), equals('Tamsiai violetine'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Mėlyna'));
      expect(loc.color('c03A9F4'), equals('Šviesi mėlyna'));
      expect(loc.color('c00BCD4'), equals('Žydra'));
      expect(loc.color('c009688'), equals('Smaragdinė'));
      expect(loc.color('c4CAF50'), equals('Žalia'));
      expect(loc.color('c8BC34A'), equals('Šviesi žalia'));
      expect(loc.color('cCDDC39'), equals('Žalsvai geltona'));
      expect(loc.color('cFFEB3B'), equals('Geltona'));
      expect(loc.color('cFFC107'), equals('Gintarinė'));
      expect(loc.color('cFF9800'), equals('Oranžinė'));
      expect(loc.color('cFF5722'), equals('Tamsiai oranžinė'));
      expect(loc.color('c795548'), equals('Ruda'));
      expect(loc.color('c9E9E9E'), equals('Pilka'));
      expect(loc.color('c607D8B'), equals('Melsvai pilka'));
    });
  });
}
