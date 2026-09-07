// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AccessibilityLocalizationsEn extends AccessibilityLocalizations {
  AccessibilityLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accessibility => 'Accessibility';

  @override
  String get accessibilitySettings => 'Accessibility settings';

  @override
  String get adjustBackgroundColors => 'Adjust background colors';

  @override
  String get adjustTextColors => 'Adjust text colors';

  @override
  String get alignCenter => 'Align center';

  @override
  String get alignLeft => 'Align left';

  @override
  String get alignRight => 'Align right';

  @override
  String get textAlignment => 'Text alignment';

  @override
  String get boldText => 'Bold text';

  @override
  String get changeBoldText => 'Change bold text';

  @override
  String get changePagesBackgroundColor =>
      'Change the background color of the pages to: ';

  @override
  String get changeTextColor => 'Change the color of the text to: ';

  @override
  String get changeTextColorShade => 'Change the shade of the color to: ';

  @override
  String get colorAdjustment => 'Color adjustment';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Low saturation',
      'normal': 'Normal',
      'highSaturation': 'High saturation',
      'monochrome': 'Monochrome',
      'highContrast': 'High contrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'The current color profile is: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Decrement word spacing';

  @override
  String get decrementLetterSpacing => 'Decrement letter spacing';

  @override
  String get decrementLineHeight => 'Decrement line height';

  @override
  String get decrementTextScaleFactor => 'Decrement text scale factor';

  @override
  String get effects => 'Effects';

  @override
  String get expandText => 'Expand text';

  @override
  String get fontSize => 'Font size';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Increase or decrease word spacing';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Increase or decrease letter spacing';

  @override
  String get increaseOrDecreaseLineHeight => 'Increase or decrease line height';

  @override
  String get increaseOrDecreaseTextSize => 'Increase or decrease text size';

  @override
  String get incrementWordSpacing => 'Increment word spacing';

  @override
  String get incrementLetterSpacing => 'Increment letter spacing';

  @override
  String get incrementLineHeight => 'Increment line height';

  @override
  String get incrementTextScaleFactor => 'Increment text scale factor';

  @override
  String get lessInfo => 'Hide info';

  @override
  String get letterSpacing => 'Letter spacing';

  @override
  String get lineHeight => 'Line height';

  @override
  String get moreInfo => 'Show info';

  @override
  String get readLess => 'Read less';

  @override
  String get readMore => 'Read more';

  @override
  String get reduceEffects => 'Reduce effects to screen';

  @override
  String get reduceText => 'Reduce text';

  @override
  String get restoreSettings => 'Restore settings';

  @override
  String get restoreMainColor => 'Restore main color';

  @override
  String get returnToMainColors => 'Return to main colors';

  @override
  String get settings => 'Settings';

  @override
  String get sizeAndTextDisplay => 'Size and text display';

  @override
  String get sliderWordSpacing => 'Slider Word spacing';

  @override
  String get sliderLetterSpacing => 'Slider Letter spacing';

  @override
  String get sliderLineHeight => 'Slider Line height';

  @override
  String get themeMode => 'Theme';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Theme profile not recognized',
      'seizureSafe': 'Seizure safe',
      'visionImpaired': 'Vision impaired',
      'adhdFriendly': 'ADHD friendly',
      'none': 'Default profile',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Seizure safe profile';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Remove reflections and reduce color';

  @override
  String get themeProfileSeizureSafeDescription =>
      'This profile enables users who have epilepsy and are at risk of seizures to browse safely by eliminating the risk of seizures that result from flashing animations and risky color combinations.';

  @override
  String get themeProfileVisionImpairedTitle => 'Vision-impaired profile';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Improve visibility of application';

  @override
  String get themeProfileVisionImpairedDescription =>
      'This profile adapts the application to be accessible to most visual impairments, such as vision impairment, tunnel vision, cataracts, glaucoma and more.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-friendly profile';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'More concentration and less distractions';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'This profile significantly reduces distractions, to help people with ADHD and neurodevelopmental disorders navigate, read, and focus on the essential elements of the application more easily.';

  @override
  String get theSettingsHaveBeenReset => 'The settings have been reset.';

  @override
  String get toggleDarkMode => 'Toggle dark mode';

  @override
  String get toggleEffectsMode => 'Toggle effects mode';

  @override
  String get toggleFontWeight => 'Toggle font weight';

  @override
  String get toggleThemeProfile => 'Toggle theme profile';

  @override
  String get wordSpacing => 'Word spacing';

  @override
  String get accessibleFont => 'Accessible font';

  @override
  String get accessibleFontSubtitle =>
      'Use an accessible font for better readability';

  @override
  String get accessibleFontEnabled => 'Accessible font enabled';

  @override
  String get accessibleFontDisabled => 'Accessible font disabled';

  @override
  String get toggleAccessibleFont => 'Toggle accessible font';

  @override
  String get settingsLoading => 'Loading the accessibility settings…';

  @override
  String get settingsLoadFailed =>
      'The accessibility settings could not be loaded.';

  @override
  String get retry => 'Retry';
}
