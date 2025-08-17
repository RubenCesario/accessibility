import 'package:accessibility/src/core/l10n/generated/app_localizations_lv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsLv', () {
    late AccessibilityLocalizationsLv loc;

    setUp(() {
      loc = AccessibilityLocalizationsLv();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('lv'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Pieejamība'));
      expect(
        loc.accessibility_settings,
        equals('Pieejamības iestatījumi'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Pielāgot fona krāsas'),
      );
      expect(loc.adjust_text_colors, equals('Pielāgot teksta krāsas'));
      expect(loc.align_center, equals('Līdzināt centrā'));
      expect(loc.align_left, equals('Līdzināt pa kreisi'));
      expect(loc.align_right, equals('Līdzināt pa labi'));
      expect(loc.bold_text, equals('Treknraksts'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Mainīt teksta treknumu'));
      expect(
        loc.change_pages_background_color,
        equals('Mainīt lapu fona krāsu uz: '),
      );
      expect(
        loc.change_text_color,
        equals('Mainīt teksta krāsu uz: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Mainīt krāsas toni uz: '),
      );
      expect(loc.color_adjustment, equals('Krāsu pielāgošana'));
      expect(
        loc.color_profile_changed_to,
        equals('Pašreizējais krāsu profils ir: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Samazināt vārdu atstarpi'));
      expect(
        loc.decrement_letter_spacing,
        equals('Samazināt burtu atstarpi'),
      );
      expect(loc.decrement_line_height, equals('Samazināt rindu augstumu'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Samazināt teksta mēroga koeficientu'),
      );
      expect(loc.increment_word_spacing, equals('Palielināt vārdu atstarpi'));
      expect(
        loc.increment_letter_spacing,
        equals('Palielināt burtu atstarpi'),
      );
      expect(loc.increment_line_height, equals('Palielināt rindu augstumu'));
      expect(
        loc.increment_text_scale_factor,
        equals('Palielināt teksta mēroga koeficientu'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Palielināt vai samazināt vārdu atstarpi'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Palielināt vai samazināt burtu atstarpi'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Palielināt vai samazināt rindu augstumu'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Palielināt vai samazināt teksta izmēru'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efekti'));
      expect(loc.expand_text, equals('Izvērst tekstu'));
      expect(loc.font_size, equals('Fonta izmērs'));
      expect(loc.less_info, equals('Slēpt informāciju'));
      expect(loc.letter_spacing, equals('Burtu atstarpe'));
      expect(loc.line_height, equals('Rindu augstums'));
      expect(loc.more_info, equals('Rādīt informāciju'));
      expect(loc.word_spacing, equals('Vārdu atstarpe'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Lasīt mazāk'));
      expect(loc.read_more, equals('Lasīt vairāk'));
      expect(
        loc.reduce_effects,
        equals('Samazināt ekrāna efektus'),
      );
      expect(loc.reduce_text, equals('Samazināt tekstu'));
      expect(loc.restore_settings, equals('Atjaunot iestatījumus'));
      expect(loc.restore_main_color, equals('Atjaunot galveno krāsu'));
      expect(
        loc.return_to_main_colors,
        equals('Atgriezties pie galvenajām krāsām'),
      );
      expect(loc.settings, equals('Iestatījumi'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Izmērs un teksta attēlojums'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Vārdu atstarpes slīdnis'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Burtu atstarpes slīdnis'),
      );
      expect(
        loc.slider_line_height,
        equals('Rindu augstuma slīdnis'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tēma'));
      expect(
        loc.theme_profile('other'),
        equals('Tēmas profils nav atpazīts'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Drošs pret lēkmēm'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Redzes traucējumi'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD draudzīgs'),
      );
      expect(loc.theme_profile('none'), equals('Noklusējuma'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Drošs pret lēkmēm profils'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Novērst atspīdēšanos un samazināt krāsas'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Šis profils ļauj lietotājiem, kuriem ir epilepsija un '
          'lēkmju risks, pārlūkot droši, novēršot lēkmju risku, ko '
          'izraisa mirgošana, animācijas un riskantās krāsu '
          'kombinācijas.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Vājredzīgo profils'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Uzlabot lietotnes redzamību'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Šis profils pielāgo lietotni, lai tā būtu pieejama '
          'vairākumam redzes traucējumu, piemēram, vājredzībai, '
          'tuneļa redzes, kataraktas, glaukomas un citu redzes '
          'problēmu gadījumos.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD draudzīgs profils'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Lielāka koncentrācija un mazāk novēršanās iespēju'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Šis profils ievērojami samazina uzmanības novēršanas '
          'faktorus, palīdzot cilvēkiem ar ADHD un '
          'neiroattīstības traucējumiem vieglāk pārlūkot, lasīt un '
          'koncentrēties uz būtiskajiem lietotnes elementiem.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Iestatījumi ir atiestatīti.'),
      );
      expect(loc.toggle_dark_mode, equals('Pārslēgt tumšo režīmu'));
      expect(loc.toggle_effects_mode, equals('Pārslēgt efektu režīmu'));
      expect(loc.toggle_font_weight, equals('Pārslēgt fonta biezumu'));
      expect(loc.toggle_theme_profile, equals('Pārslēgt tēmas profilu'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Normāls'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Zems piesātinājums'),
      );
      expect(loc.color_profile('normal'), equals('Normāls'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Augsts piesātinājums'),
      );
      expect(loc.color_profile('monochrome'), equals('Melnbalts'));
      expect(
        loc.color_profile('highContrast'),
        equals('Augsts kontrasts'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Krāsa nav atpazīta'));
      expect(loc.color('cF44336'), equals('Sarkana'));
      expect(loc.color('cE91E63'), equals('Rozā'));
      expect(loc.color('c9C27B0'), equals('Violeta'));
      expect(loc.color('c673AB7'), equals('Tumši violeta'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Zila'));
      expect(loc.color('c03A9F4'), equals('Gaiši zila'));
      expect(loc.color('c00BCD4'), equals('Ciāna'));
      expect(loc.color('c009688'), equals('Zilganzaļa'));
      expect(loc.color('c4CAF50'), equals('Zaļa'));
      expect(loc.color('c8BC34A'), equals('Gaiši zaļa'));
      expect(loc.color('cCDDC39'), equals('Laima'));
      expect(loc.color('cFFEB3B'), equals('Dzeltena'));
      expect(loc.color('cFFC107'), equals('Dzintara'));
      expect(loc.color('cFF9800'), equals('Oranža'));
      expect(loc.color('cFF5722'), equals('Tumši oranža'));
      expect(loc.color('c795548'), equals('Brūna'));
      expect(loc.color('c9E9E9E'), equals('Pelēka'));
      expect(loc.color('c607D8B'), equals('Zilpelēka'));
    });
  });
}
