import 'package:accessibility/src/core/l10n/generated/app_localizations_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsEn', () {
    late AccessibilityLocalizationsEn loc;

    setUp(() {
      loc = AccessibilityLocalizationsEn();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('en'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Accessibility'));
      expect(
        loc.accessibility_settings,
        equals('Accessibility settings'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Adjust background colors'),
      );
      expect(loc.adjust_text_colors, equals('Adjust text colors'));
      expect(loc.align_center, equals('Align center'));
      expect(loc.align_left, equals('Align left'));
      expect(loc.align_right, equals('Align right'));
      expect(loc.bold_text, equals('Bold text'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Change bold text'));
      expect(
        loc.change_pages_background_color,
        equals('Change the background color of the pages to: '),
      );
      expect(
        loc.change_text_color,
        equals('Change the color of the text to: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Change the shade of the color to: '),
      );
      expect(loc.color_adjustment, equals('Color adjustment'));
      expect(
        loc.color_profile_changed_to,
        equals('The current color profile is: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Decrement word spacing'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Decrement letter spacing'),
      );
      expect(
        loc.decrement_line_height,
        equals('Decrement line height'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Decrement text scale factor'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Increment word spacing'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Increment letter spacing'),
      );
      expect(
        loc.increment_line_height,
        equals('Increment line height'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Increment text scale factor'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Increase or decrease word spacing'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Increase or decrease letter spacing'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Increase or decrease line height'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Increase or decrease text size'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effects'));
      expect(loc.expand_text, equals('Expand text'));
      expect(loc.font_size, equals('Font size'));
      expect(loc.less_info, equals('Hide info'));
      expect(loc.letter_spacing, equals('Letter spacing'));
      expect(loc.line_height, equals('Line height'));
      expect(loc.more_info, equals('Show info'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Read less'));
      expect(loc.read_more, equals('Read more'));
      expect(
        loc.reduce_effects,
        equals('Reduce effects to screen'),
      );
      expect(loc.reduce_text, equals('Reduce text'));
      expect(loc.restore_settings, equals('Restore settings'));
      expect(loc.restore_main_color, equals('Restore main color'));
      expect(
        loc.return_to_main_colors,
        equals('Return to main colors'),
      );
      expect(loc.settings, equals('Settings'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Size and text display'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Slider Word spacing'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Slider Letter spacing'),
      );
      expect(loc.slider_line_height, equals('Slider Line height'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Theme profile not recognized'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Seizure safe'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Vision impaired'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD friendly'),
      );
      expect(loc.theme_profile('none'), equals('Default'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Seizure safe profile'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Remove reflections and reduce color'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'This profile enables users who have epilepsy and are at risk'
          ' of seizures to browse safely by eliminating the risk of seizures'
          ' that result from flashing animations and risky color combinations.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Vision-impaired profile'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Improve visibility of application'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'This profile adapts the application to be accessible '
          'to most visual impairments, such as vision impairment, '
          'tunnel vision, cataracts, glaucoma and more.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-friendly profile'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('More concentration and less distractions'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'This profile significantly reduces distractions, '
          'to help people with ADHD and neurodevelopmental '
          'disorders navigate, read, and focus on the essential '
          'elements of the application more easily.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('The settings have been reset.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Toggle dark mode'));
      expect(
        loc.toggle_effects_mode,
        equals('Toggle effects mode'),
      );
      expect(loc.toggle_font_weight, equals('Toggle font weight'));
      expect(loc.word_spacing, equals('Word spacing'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('Low saturation'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('High saturation'),
      );
      expect(loc.color_profile('monochrome'), equals('Monochrome'));
      expect(
        loc.color_profile('highContrast'),
        equals('High contrast'),
      );
      expect(
        loc.color_profile('unknown'),
        equals('Normal'),
      );
    });

    test('should handle color selection logic correctly', () {
      // Test a sample of colors
      expect(loc.color('cF44336'), equals('Red'));
      expect(loc.color('cE91E63'), equals('Pink'));
      expect(loc.color('c9C27B0'), equals('Purple'));
      expect(loc.color('c673AB7'), equals('Deep Purple'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blue'));
      expect(loc.color('c03A9F4'), equals('Light Blue'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Teal'));
      expect(loc.color('c4CAF50'), equals('Green'));
      expect(loc.color('c8BC34A'), equals('Light Green'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Yellow'));
      expect(loc.color('cFFC107'), equals('Amber'));
      expect(loc.color('cFF9800'), equals('Orange'));
      expect(loc.color('cFF5722'), equals('Deep Orange'));
      expect(loc.color('c795548'), equals('Brown'));
      expect(loc.color('c9E9E9E'), equals('Grey'));
      expect(loc.color('c607D8B'), equals('Blue Grey'));
      expect(
        loc.color('unknown'),
        equals('Color not recognized'),
      );
    });
  });
}
