import 'package:accessibility/src/core/l10n/generated/app_localizations_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsEn', () {
    late AccessibilityLocalizationsEn localizationsEn;

    setUp(() {
      localizationsEn = AccessibilityLocalizationsEn();
    });

    test('should have the correct locale name', () {
      expect(localizationsEn.localeName, equals('en'));
    });

    test('should return the correct basic string values', () {
      expect(localizationsEn.accessibility, equals('Accessibility'));
      expect(
        localizationsEn.accessibility_settings,
        equals('Accessibility settings'),
      );
      expect(
        localizationsEn.adjust_background_colors,
        equals('Adjust background colors'),
      );
      expect(localizationsEn.adjust_text_colors, equals('Adjust text colors'));
      expect(localizationsEn.align_center, equals('Align center'));
      expect(localizationsEn.align_left, equals('Align left'));
      expect(localizationsEn.align_right, equals('Align right'));
      expect(localizationsEn.bold_text, equals('Bold text'));
    });

    test('should return the correct change-related string values', () {
      expect(localizationsEn.change_bold_text, equals('Change bold text'));
      expect(
        localizationsEn.change_pages_background_color,
        equals('Change the background color of the pages to: '),
      );
      expect(
        localizationsEn.change_text_color,
        equals('Change the color of the text to: '),
      );
      expect(
        localizationsEn.change_text_color_shade,
        equals('Change the shade of the color to: '),
      );
      expect(localizationsEn.color_adjustment, equals('Color adjustment'));
      expect(
        localizationsEn.color_profile_changed_to,
        equals('The current color profile is: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        localizationsEn.decrement_word_spacing,
        equals('Decrement word spacing'),
      );
      expect(
        localizationsEn.decrement_letter_spacing,
        equals('Decrement letter spacing'),
      );
      expect(
        localizationsEn.decrement_line_height,
        equals('Decrement line height'),
      );
      expect(
        localizationsEn.decrement_text_scale_factor,
        equals('Decrement text scale factor'),
      );
      expect(
        localizationsEn.increment_word_spacing,
        equals('Increment word spacing'),
      );
      expect(
        localizationsEn.increment_letter_spacing,
        equals('Increment letter spacing'),
      );
      expect(
        localizationsEn.increment_line_height,
        equals('Increment line height'),
      );
      expect(
        localizationsEn.increment_text_scale_factor,
        equals('Increment text scale factor'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        localizationsEn.increase_or_decrease_word_spacing,
        equals('Increase or decrease word spacing'),
      );
      expect(
        localizationsEn.increase_or_decrease_letter_spacing,
        equals('Increase or decrease letter spacing'),
      );
      expect(
        localizationsEn.increase_or_decrease_line_height,
        equals('Increase or decrease line height'),
      );
      expect(
        localizationsEn.increase_or_decrease_text_size,
        equals('Increase or decrease text size'),
      );
    });

    test('should return the correct feature string values', () {
      expect(localizationsEn.effects, equals('Effects'));
      expect(localizationsEn.expand_text, equals('Expand text'));
      expect(localizationsEn.font_size, equals('Font size'));
      expect(localizationsEn.less_info, equals('Hide info'));
      expect(localizationsEn.letter_spacing, equals('Letter spacing'));
      expect(localizationsEn.line_height, equals('Line height'));
      expect(localizationsEn.more_info, equals('Show info'));
    });

    test('should return the correct action string values', () {
      expect(localizationsEn.read_less, equals('Read less'));
      expect(localizationsEn.read_more, equals('Read more'));
      expect(
        localizationsEn.reduce_effects,
        equals('Reduce effects to screen'),
      );
      expect(localizationsEn.reduce_text, equals('Reduce text'));
      expect(localizationsEn.restore_settings, equals('Restore settings'));
      expect(localizationsEn.restore_main_color, equals('Restore main color'));
      expect(
        localizationsEn.return_to_main_colors,
        equals('Return to main colors'),
      );
      expect(localizationsEn.settings, equals('Settings'));
    });

    test('should return the correct settings string values', () {
      expect(
        localizationsEn.size_and_text_display,
        equals('Size and text display'),
      );
      expect(
        localizationsEn.slider_word_spacing,
        equals('Slider Word spacing'),
      );
      expect(
        localizationsEn.slider_letter_spacing,
        equals('Slider Letter spacing'),
      );
      expect(localizationsEn.slider_line_height, equals('Slider Line height'));
    });

    test('should return the correct theme string values', () {
      expect(
        localizationsEn.theme_profile('other'),
        equals('Theme profile not recognized'),
      );
      expect(
        localizationsEn.theme_profile('seizureSafe'),
        equals('Seizure safe'),
      );
      expect(
        localizationsEn.theme_profile('visionImpaired'),
        equals('Vision impaired'),
      );
      expect(
        localizationsEn.theme_profile('adhdFriendly'),
        equals('ADHD friendly'),
      );
      expect(localizationsEn.theme_profile('none'), equals('Default'));
      expect(
        localizationsEn.theme_profile_seizure_safe_title,
        equals('Seizure safe profile'),
      );
      expect(
        localizationsEn.theme_profile_seizure_safe_subtitle,
        equals('Remove reflections and reduce color'),
      );
      expect(
        localizationsEn.theme_profile_seizure_safe_description,
        equals(
          'This profile enables users who have epilepsy and are at risk'
          ' of seizures to browse safely by eliminating the risk of seizures'
          ' that result from flashing animations and risky color combinations.',
        ),
      );
      expect(
        localizationsEn.theme_profile_vision_impaired_title,
        equals('Vision-impaired profile'),
      );
      expect(
        localizationsEn.theme_profile_vision_impaired_subtitle,
        equals('Improve visibility of application'),
      );
      expect(
        localizationsEn.theme_profile_vision_impaired_description,
        equals(
          'This profile adapts the application to be accessible '
          'to most visual impairments, such as vision impairment, '
          'tunnel vision, cataracts, glaucoma and more.',
        ),
      );
      expect(
        localizationsEn.theme_profile_adhd_friendly_title,
        equals('ADHD-friendly profile'),
      );
      expect(
        localizationsEn.theme_profile_adhd_friendly_subtitle,
        equals('More concentration and less distractions'),
      );
      expect(
        localizationsEn.theme_profile_adhd_friendly_description,
        equals(
          'This profile significantly reduces distractions, '
          'to help people with ADHD and neurodevelopmental '
          'disorders navigate, read, and focus on the essential '
          'elements of the application more easily.',
        ),
      );
      expect(
        localizationsEn.the_settings_have_been_reset,
        equals('The settings have been reset.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(localizationsEn.toggle_dark_mode, equals('Toggle dark mode'));
      expect(
        localizationsEn.toggle_effects_mode,
        equals('Toggle effects mode'),
      );
      expect(localizationsEn.toggle_font_weight, equals('Toggle font weight'));
      expect(localizationsEn.word_spacing, equals('Word spacing'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        localizationsEn.color_profile('lowSaturation'),
        equals('Low saturation'),
      );
      expect(localizationsEn.color_profile('normal'), equals('Normal'));
      expect(
        localizationsEn.color_profile('highSaturation'),
        equals('High saturation'),
      );
      expect(localizationsEn.color_profile('monochrome'), equals('Monochrome'));
      expect(
        localizationsEn.color_profile('highContrast'),
        equals('High contrast'),
      );
      expect(
        localizationsEn.color_profile('unknown'),
        equals('Normal'),
      );
    });

    test('should handle color selection logic correctly', () {
      // Test a sample of colors
      expect(localizationsEn.color('cF44336'), equals('Red'));
      expect(localizationsEn.color('cE91E63'), equals('Pink'));
      expect(localizationsEn.color('c9C27B0'), equals('Purple'));
      expect(localizationsEn.color('c673AB7'), equals('Deep Purple'));
      expect(localizationsEn.color('c3F51B5'), equals('Indigo'));
      expect(localizationsEn.color('c2196F3'), equals('Blue'));
      expect(localizationsEn.color('c03A9F4'), equals('Light Blue'));
      expect(localizationsEn.color('c00BCD4'), equals('Cyan'));
      expect(localizationsEn.color('c009688'), equals('Teal'));
      expect(localizationsEn.color('c4CAF50'), equals('Green'));
      expect(localizationsEn.color('c8BC34A'), equals('Light Green'));
      expect(localizationsEn.color('cCDDC39'), equals('Lime'));
      expect(localizationsEn.color('cFFEB3B'), equals('Yellow'));
      expect(localizationsEn.color('cFFC107'), equals('Amber'));
      expect(localizationsEn.color('cFF9800'), equals('Orange'));
      expect(localizationsEn.color('cFF5722'), equals('Deep Orange'));
      expect(localizationsEn.color('c795548'), equals('Brown'));
      expect(localizationsEn.color('c9E9E9E'), equals('Grey'));
      expect(localizationsEn.color('c607D8B'), equals('Blue Grey'));
      expect(
        localizationsEn.color('unknown'),
        equals('Color not recognized'),
      );
    });
  });
}
