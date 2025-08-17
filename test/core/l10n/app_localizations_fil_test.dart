import 'package:accessibility/src/core/l10n/generated/app_localizations_fil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsFil', () {
    late AccessibilityLocalizationsFil loc;

    setUp(() {
      loc = AccessibilityLocalizationsFil();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('fil'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Pagiging Madaling Gamitin'));
      expect(
        loc.accessibility_settings,
        equals('Mga Setting ng Pagiging Madaling Gamitin'),
      );
      expect(
        loc.adjust_background_colors,
        equals('I-adjust ang mga kulay ng background'),
      );
      expect(loc.adjust_text_colors, equals('I-adjust ang mga kulay ng text'));
      expect(loc.align_center, equals('I-align sa gitna'));
      expect(loc.align_left, equals('I-align sa kaliwa'));
      expect(loc.align_right, equals('I-align sa kanan'));
      expect(loc.bold_text, equals('Malalaking titik'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Baguhin ang malalaking titik'));
      expect(
        loc.change_pages_background_color,
        equals(
          'Baguhin ang kulay ng background ng mga pahina sa: ',
        ),
      );
      expect(
        loc.change_text_color,
        equals('Baguhin ang kulay ng text sa: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Baguhin ang shade ng kulay sa: '),
      );
      expect(loc.color_adjustment, equals('Pag-adjust ng kulay'));
      expect(
        loc.color_profile_changed_to,
        equals('Ang kasalukuyang profile ng kulay ay: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Bawasan ang pagitan ng mga salita'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Bawasan ang pagitan ng mga letra'),
      );
      expect(loc.decrement_line_height, equals('Bawasan ang taas ng linya'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Bawasan ang scale factor ng text'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Dagdagan ang pagitan ng mga salita'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Dagdagan ang pagitan ng mga letra'),
      );
      expect(loc.increment_line_height, equals('Dagdagan ang taas ng linya'));
      expect(
        loc.increment_text_scale_factor,
        equals('Dagdagan ang scale factor ng text'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Dagdagan o bawasan ang pagitan ng mga salita'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Dagdagan o bawasan ang pagitan ng mga letra'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Dagdagan o bawasan ang taas ng linya'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Dagdagan o bawasan ang laki ng text'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Mga epekto'));
      expect(loc.expand_text, equals('Palawakin ang text'));
      expect(loc.font_size, equals('Laki ng font'));
      expect(loc.less_info, equals('Itago ang impormasyon'));
      expect(loc.letter_spacing, equals('Pagitan ng mga letra'));
      expect(loc.line_height, equals('Taas ng linya'));
      expect(loc.more_info, equals('Ipakita ang impormasyon'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Magbasa ng mas kaunti'));
      expect(loc.read_more, equals('Magbasa pa'));
      expect(
        loc.reduce_effects,
        equals('Bawasan ang mga epekto sa screen'),
      );
      expect(loc.reduce_text, equals('Bawasan ang text'));
      expect(loc.restore_settings, equals('Ibalik ang mga setting'));
      expect(loc.restore_main_color, equals('Ibalik ang pangunahing kulay'));
      expect(
        loc.return_to_main_colors,
        equals('Bumalik sa mga pangunahing kulay'),
      );
      expect(loc.settings, equals('Mga Setting'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Laki at display ng text'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Slider ng pagitan ng mga salita'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Slider ng pagitan ng mga letra'),
      );
      expect(
        loc.slider_line_height,
        equals('Slider ng taas ng linya'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Hindi nakilala ang profile ng tema'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Ligtas sa seizure'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Para sa may problema sa paningin'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD friendly'),
      );
      expect(loc.theme_profile('none'), equals('Default'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profile na ligtas sa seizure'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Tanggalin ang mga reflection at bawasan ang kulay'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ang profile na ito ay tumutulong sa mga gumagamit na may '
          'epilepsy at nasa panganib ng seizure na mag-browse nang '
          'ligtas sa pamamagitan ng pag-alis ng panganib ng seizure na '
          'nagmumula sa mga kumikislap na animation at mga mapanganib '
          'na kombinasyon ng kulay.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profile para sa may problema sa paningin'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Pabutihin ang visibility ng application'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ang profile na ito ay nag-a-adjust sa application upang maging '
          'accessible sa karamihan ng mga problema sa paningin, tulad ng '
          'kapansanan sa paningin, tunnel vision, katarata, glaucoma at '
          'higit pa.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profile na ADHD-friendly'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mas mataas na konsentrasyon at mas kaunting mga '
            'nakakadistract'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ang profile na ito ay malaking nabawasan ang mga '
          'nakakadistract, upang tulungan ang mga taong may ADHD at '
          'mga kapansanan sa neurodevelopment na mag-navigate, '
          'magbasa, at tumuon sa mga mahahalagang elemento ng '
          'application nang mas madali.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Ang mga setting ay na-reset na.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('I-toggle ang dark mode'));
      expect(
        loc.toggle_effects_mode,
        equals('I-toggle ang mode ng mga epekto'),
      );
      expect(
        loc.toggle_font_weight,
        equals('I-toggle ang kapal ng font'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('I-toggle ang profile ng tema'),
      );
      expect(loc.word_spacing, equals('Pagitan ng mga salita'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Mababang saturation'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Mataas na saturation'),
      );
      expect(loc.color_profile('monochrome'), equals('Monochrome'));
      expect(loc.color_profile('highContrast'), equals('Mataas na contrast'));
      expect(loc.color_profile('unknown'), equals('Normal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Pula'));
      expect(loc.color('cE91E63'), equals('Pink'));
      expect(loc.color('c9C27B0'), equals('Lila'));
      expect(loc.color('c673AB7'), equals('Matingkad na lila'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Asul'));
      expect(loc.color('c03A9F4'), equals('Maliwanag na asul'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Teal'));
      expect(loc.color('c4CAF50'), equals('Berde'));
      expect(loc.color('c8BC34A'), equals('Maliwanag na berde'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Dilaw'));
      expect(loc.color('cFFC107'), equals('Amber'));
      expect(loc.color('cFF9800'), equals('Kahel'));
      expect(loc.color('cFF5722'), equals('Matingkad na kahel'));
      expect(loc.color('c795548'), equals('Kayumanggi'));
      expect(loc.color('c9E9E9E'), equals('Kulay-abo'));
      expect(loc.color('c607D8B'), equals('Bughaw na kulay-abo'));
      expect(
        loc.color('unknown'),
        equals('Hindi nakilala ang kulay'),
      );
    });
  });
}
