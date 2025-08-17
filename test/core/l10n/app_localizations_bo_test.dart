// ignore_for_file: lines_longer_than_80_chars

import 'package:accessibility/src/core/l10n/generated/app_localizations_bo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsBo', () {
    late AccessibilityLocalizationsBo loc;

    setUp(() {
      loc = AccessibilityLocalizationsBo();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('bo'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('འཇུག་སྤྱོད་ཚད་ལྡན་'));
      expect(
        loc.accessibility_settings,
        equals('འཇུག་སྤྱོད་ཚད་ལྡན་སྒྲིག་སྟངས་'),
      );
      expect(
        loc.adjust_background_colors,
        equals('རྒྱབ་སྤྱོད་ཀྱི་ཚོན་མདོག་སྒྲིག་འགོད་བྱོས་'),
      );
      expect(
        loc.adjust_text_colors,
        equals('ཡིག་དོན་ཀྱི་ཚོན་མདོག་སྒྲིག་འགོད་བྱོས་'),
      );
      expect(loc.align_center, equals('དབུས་སུ་བཀོལ་སྒྲིག་བྱོས་'));
      expect(loc.align_left, equals('གཡས་སུ་བཀོལ་སྒྲིག་བྱོས་'));
      expect(loc.align_right, equals('གཡོན་སུ་བཀོལ་སྒྲིག་བྱོས་'));
      expect(loc.bold_text, equals('རྒྱས་པའི་ཡིག་དོན་'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('རྒྱས་པའི་ཡིག་དོན་སྒྲིག་སྟངས་བརྗེ་བ་'),
      );
      expect(
        loc.change_pages_background_color,
        equals('ཤོག་ངོས་ཀྱི་རྒྱབ་སྤྱོད་ཚོན་མདོག་སོར་བཅོས་:'),
      );
      expect(loc.change_text_color, equals('ཡིག་དོན་ཀྱི་ཚོན་མདོག་སོར་བཅོས་:'));
      expect(
        loc.change_text_color_shade,
        equals('ཚོན་མདོག་གི་གདན་སྒྲིག་སོར་བཅོས་:'),
      );
      expect(loc.color_adjustment, equals('ཚོན་མདོག་སྒྲིག་འགོད་'));
      expect(
        loc.color_profile_changed_to,
        equals('ད་ལྟའི་ཚོན་མདོག་གི་སྤྱི་རྣམ་ནི: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('ཚིག་གི་བར་ཐག་ཉུང་བཏང་བ'));
      expect(
        loc.decrement_letter_spacing,
        equals('ཡིག་འབྲུའི་བར་ཐག་ཉུང་བཏང་བ'),
      );
      expect(loc.decrement_line_height, equals('ཐིག་ཚད་ཉུང་བཏང་བ'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ཡིག་ཆའི་ཚད་ཀྱི་ཆ་ཕྲ་ཉུང་བཏང་བ'),
      );
      expect(loc.increment_word_spacing, equals('ཚིག་གི་བར་ཐག་ཇེ་ཆེར་གཏོང་བ'));
      expect(
        loc.increment_letter_spacing,
        equals('ཡིག་འབྲུའི་བར་ཐག་ཇེ་ཆེར་གཏོང་བ'),
      );
      expect(loc.increment_line_height, equals('ཐིག་ཚད་ཇེ་མཐོར་གཏོང་བ'));
      expect(
        loc.increment_text_scale_factor,
        equals('ཡིག་ཆའི་ཚད་ཀྱི་ཆ་ཕྲ་ཇེ་ཆེར་གཏོང་བ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('ཚིག་གི་བར་ཐག་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('ཡིག་འབྲུའི་བར་ཐག་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('ཐིག་ཚད་ཇེ་མཐོར་ཡང་ན་ཇེ་དམན་དུ་གཏོང་བ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ཡིག་ཆའི་ཆེ་ཆུང་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('འབྲེལ་ཤུགས'));
      expect(loc.expand_text, equals('ཡིག་ཆ་རྒྱ་བསྐྱེད་བྱོས'));
      expect(loc.font_size, equals('ཡིག་གཟུགས་ཀྱི་ཆེ་ཆུང་'));
      expect(loc.less_info, equals('ཆ་འཕྲིན་སྦ་བ'));
      expect(loc.letter_spacing, equals('ཡིག་འབྲུའི་བར་ཐག'));
      expect(loc.line_height, equals('ཐིག་ཚད'));
      expect(loc.more_info, equals('ཆ་འཕྲིན་སྟོན་པ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ཉུང་ཙམ་ཀློག'));
      expect(loc.read_more, equals('མང་པོ་ཀློག'));
      expect(loc.reduce_effects, equals('འཆར་ངོས་སུ་འབྲེལ་ཤུགས་ཉུང་དུ་གཏོང་བ'));
      expect(loc.reduce_text, equals('ཡིག་ཆ་ཉུང་དུ་གཏོང་བ'));
      expect(loc.restore_settings, equals('སྔོན་གྱི་སྒྲིག་སྟངས་སུ་སླར་གསོ'));
      expect(loc.restore_main_color, equals('གཙོ་བོའི་ཚོན་མདོག་སླར་གསོ'));
      expect(loc.return_to_main_colors, equals('གཙོ་བོའི་ཚོན་མདོག་ཏུ་ལོག'));
      expect(loc.settings, equals('སྒྲིག་སྟངས'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('ཚད་དང་ཡིག་ཆའི་འཆར་སྟངས'));
      expect(loc.slider_word_spacing, equals('ཚིག་གི་བར་ཐག་སྒྲུང་འགྲིལ'));
      expect(loc.slider_letter_spacing, equals('ཡིག་འབྲུའི་བར་ཐག་སྒྲུང་འགྲིལ'));
      expect(loc.slider_line_height, equals('ཐིག་ཚད་སྒྲུང་འགྲིལ'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_profile('other'), equals('དཔེ་སྒྲོམ་ངོས་འཛིན་མ་བྱུང་'));
      expect(loc.theme_profile('seizureSafe'), equals('ཉེན་མེད'));
      expect(loc.theme_profile('visionImpaired'), equals('མིག་གི་ནུས་པ་ཉམས་པ'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD ལ་མཛའ་བ'));
      expect(loc.theme_profile('none'), equals('སྔོན་སྒྲིག'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ཉེན་མེད་ཀྱི་དཔེ་སྒྲོམ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('འོད་འཕྲོ་སྤངས་ཏེ་ཚོན་མདོག་ཉུང་དུ་གཏོང་བ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'འདི་ནི་ཉེན་མེད་ཀྱི་དཔེ་སྒྲོམ་ཡིན་པས་ཚོར་ཤུགས་ཀྱི་ནད་ཅན་དང་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་བདེ་འཇགས་སུ་བལྟ་ཐུབ་པ་དང་། འོད་འཕྲོ་དང་ཚོན་མདོག་གི་སྦྱོར་ཚུལ་སོགས་ཀྱིས་བྱུང་བའི་ཉེན་ཁ་སྤོང་བར་བྱེད་པ་ཡིན',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('མིག་གི་ནུས་པ་ཉམས་པའི་དཔེ་སྒྲོམ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ཆ་འཕྲིན་གྱི་མཐོང་རུང་ཡོད་པར་བྱེད་པ'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'འདི་ནི་མིག་གི་ནུས་པ་ཉམས་པ་དང་། མིག་ཤུལ་ཆུང་བ། མིག་སྨུག་རིམས་དང་མིག་ཁྲག་ཁྲ་བ་སོགས་ཀྱི་ནད་ཀྱིས་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་བདེ་བླག་ཏུ་བེད་སྤྱོད་བྱེད་ཐུབ་པའི་དཔེ་སྒྲོམ་ཞིག་ཡིན',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD ལ་མཛའ་བའི་དཔེ་སྒྲོམ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ཇེ་ཙོ་དང་ཡིད་འཕྲོག་ཉུང་བ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'འདི་ནི་ADHD དང་ཀླད་ཀྱི་འཕེལ་རིམ་ནད་ཀྱིས་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་ཆ་འཕྲིན་གྱི་གལ་ཆེའི་ཆ་ཤས་ལ་གཟིགས་ཐུབ་པ་དང་། ཀློག་པ་དང་ལག་ལེན་བྱེད་པར་བདེ་བླག་ཏུ་བྱེད་པའི་ཆེད་དུ་ཡིད་འཕྲོག་པ་ཉུང་དུ་གཏོང་བའི་དཔེ་སྒྲོམ་ཞིག་ཡིན',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('སྒྲིག་སྟངས་ཚང་མ་སྔོན་གྱི་གནས་སུ་ཕྱིར་བསྒྱུར་བྱུང་སོང་'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('མུན་ནག་གི་དཔེ་སྒྲོམ་བརྗེ་བ'));
      expect(
        loc.toggle_effects_mode,
        equals('འབྲེལ་ཤུགས་ཀྱི་དཔེ་སྒྲོམ་བརྗེ་བ'),
      );
      expect(loc.toggle_font_weight, equals('ཡིག་གཟུགས་ཀྱི་ལྗིད་ཚད་བརྗེ་བ'));
      expect(loc.word_spacing, equals('ཚིག་གི་བར་ཐག'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('ཆུ་ཚད་ཉུང་བ'));
      expect(loc.color_profile('normal'), equals('སྤྱི་ཚད'));
      expect(loc.color_profile('highSaturation'), equals('ཆུ་ཚད་མང་བ'));
      expect(loc.color_profile('monochrome'), equals('ཚོན་མདོག་གཅིག་པ'));
      expect(loc.color_profile('highContrast'), equals('ཀོན་ཐྲ་ཆེ་བ'));
      expect(loc.color_profile('unknown'), equals('སྤྱི་ཚད'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('དམར་པོ'));
      expect(loc.color('cE91E63'), equals('སྤྲེར་སྔོན་པོ'));
      expect(loc.color('c9C27B0'), equals('སྨུག་པོ'));
      expect(loc.color('c673AB7'), equals('སྨུག་པོ་མདོག་ཆེན་པོ'));
      expect(loc.color('c3F51B5'), equals('མཐིང་ནག'));
      expect(loc.color('c2196F3'), equals('སྔོན་པོ'));
      expect(loc.color('c03A9F4'), equals('སྔོན་པོ་ཡལ་བ'));
      expect(loc.color('c00BCD4'), equals('མཐིང་སྔོན་པ'));
      expect(loc.color('c009688'), equals('ནུབ་ཆུ'));
      expect(loc.color('c4CAF50'), equals('ལྗང་ཁུ'));
      expect(loc.color('c8BC34A'), equals('ལྗང་ཁུ་ཡལ་བ'));
      expect(loc.color('cCDDC39'), equals('ཚོས་གཞོང་'));
      expect(loc.color('cFFEB3B'), equals('སེར་པོ'));
      expect(loc.color('cFFC107'), equals('གསེར་སེར'));
      expect(loc.color('cFF9800'), equals('ལི་ཅི'));
      expect(loc.color('cFF5722'), equals('ལི་ཅི་དམར་པོ'));
      expect(loc.color('c795548'), equals('སྨུག་པོ'));
      expect(loc.color('c9E9E9E'), equals('དཀར་པོ'));
      expect(loc.color('c607D8B'), equals('སྔོན་པོ་སྨུག་པ'));
      expect(loc.color('unknown'), equals('ཚོན་མདོག་ངོས་འཛིན་མ་བྱུང་'));
    });
  });
}
