// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AccessibilityLocalizationsEn extends AccessibilityLocalizations {
  AccessibilityLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accessibility => 'Accessibility';

  @override
  String get accessibility_settings => 'Accessibility settings';

  @override
  String get adjust_background_colors => 'Adjust background colors';

  @override
  String get adjust_text_colors => 'Adjust text colors';

  @override
  String get align_center => 'Align center';

  @override
  String get align_left => 'Align left';

  @override
  String get align_right => 'Align right';

  @override
  String get bold_text => 'Bold text';

  @override
  String get change_bold_text => 'Change bold text';

  @override
  String get change_pages_background_color =>
      'Change the background color of the pages to: ';

  @override
  String get change_text_color => 'Change the color of the text to: ';

  @override
  String get change_text_color_shade => 'Change the shade of the color to: ';

  @override
  String get color_adjustment => 'Color adjustment';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Low saturation',
        'normal': 'Normal',
        'highSaturation': 'High saturation',
        'monochrome': 'Monochrome',
        'highContrast': 'High contrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'The current color profile is: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Color not recognized',
        'cF44336': 'Red',
        'cE91E63': 'Pink',
        'c9C27B0': 'Purple',
        'c673AB7': 'Deep Purple',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Blue',
        'c03A9F4': 'Light Blue',
        'c00BCD4': 'Cyan',
        'c009688': 'Teal',
        'c4CAF50': 'Green',
        'c8BC34A': 'Light Green',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Yellow',
        'cFFC107': 'Amber',
        'cFF9800': 'Orange',
        'cFF5722': 'Deep Orange',
        'c795548': 'Brown',
        'c9E9E9E': 'Grey',
        'c607D8B': 'Blue Grey',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Decrement word spacing';

  @override
  String get decrement_letter_spacing => 'Decrement letter spacing';

  @override
  String get decrement_line_height => 'Decrement line height';

  @override
  String get decrement_text_scale_factor => 'Decrement text scale factor';

  @override
  String get effects => 'Effects';

  @override
  String get expand_text => 'Expand text';

  @override
  String get font_size => 'Font size';

  @override
  String get increase_or_decrease_word_spacing =>
      'Increase or decrease word spacing';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Increase or decrease letter spacing';

  @override
  String get increase_or_decrease_line_height =>
      'Increase or decrease line height';

  @override
  String get increase_or_decrease_text_size => 'Increase or decrease text size';

  @override
  String get increment_word_spacing => 'Increment word spacing';

  @override
  String get increment_letter_spacing => 'Increment letter spacing';

  @override
  String get increment_line_height => 'Increment line height';

  @override
  String get increment_text_scale_factor => 'Increment text scale factor';

  @override
  String get less_info => 'Hide info';

  @override
  String get letter_spacing => 'Letter spacing';

  @override
  String get line_height => 'Line height';

  @override
  String get more_info => 'Show info';

  @override
  String get read_less => 'Read less';

  @override
  String get read_more => 'Read more';

  @override
  String get reduce_effects => 'Reduce effects to screen';

  @override
  String get reduce_text => 'Reduce text';

  @override
  String get restore_settings => 'Restore settings';

  @override
  String get restore_main_color => 'Restore main color';

  @override
  String get return_to_main_colors => 'Return to main colors';

  @override
  String get settings => 'Settings';

  @override
  String get size_and_text_display => 'Size and text display';

  @override
  String get slider_word_spacing => 'Slider Word spacing';

  @override
  String get slider_letter_spacing => 'Slider Letter spacing';

  @override
  String get slider_line_height => 'Slider Line height';

  @override
  String get theme_mode => 'Theme';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Theme profile not recognized',
        'seizureSafe': 'Seizure safe',
        'visionImpaired': 'Vision impaired',
        'adhdFriendly': 'ADHD friendly',
        'none': 'Default',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Seizure safe profile';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Remove reflections and reduce color';

  @override
  String get theme_profile_seizure_safe_description =>
      'This profile enables users who have epilepsy and are at risk of seizures to browse safely by eliminating the risk of seizures that result from flashing animations and risky color combinations.';

  @override
  String get theme_profile_vision_impaired_title => 'Vision-impaired profile';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Improve visibility of application';

  @override
  String get theme_profile_vision_impaired_description =>
      'This profile adapts the application to be accessible to most visual impairments, such as vision impairment, tunnel vision, cataracts, glaucoma and more.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-friendly profile';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'More concentration and less distractions';

  @override
  String get theme_profile_adhd_friendly_description =>
      'This profile significantly reduces distractions, to help people with ADHD and neurodevelopmental disorders navigate, read, and focus on the essential elements of the application more easily.';

  @override
  String get the_settings_have_been_reset => 'The settings have been reset.';

  @override
  String get toggle_dark_mode => 'Toggle dark mode';

  @override
  String get toggle_effects_mode => 'Toggle effects mode';

  @override
  String get toggle_font_weight => 'Toggle font weight';

  @override
  String get toggle_theme_profile => 'Toggle theme profile';

  @override
  String get word_spacing => 'Word spacing';

  @override
  String get accessible_font => 'Accessible font';

  @override
  String get accessible_font_subtitle =>
      'Use Verdana font for better readability';

  @override
  String get accessible_font_enabled => 'Accessible font enabled';

  @override
  String get accessible_font_disabled => 'Accessible font disabled';

  @override
  String get toggle_accessible_font => 'Toggle accessible font';
}
