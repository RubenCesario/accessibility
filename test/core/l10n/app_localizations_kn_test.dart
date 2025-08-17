import 'package:accessibility/src/core/l10n/generated/app_localizations_kn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsKn', () {
    late AccessibilityLocalizationsKn loc;

    setUp(() {
      loc = AccessibilityLocalizationsKn();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('kn'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ಪ್ರವೇಶದ ಸಾಧ್ಯತೆ'));
      expect(
        loc.accessibility_settings,
        equals('ಪ್ರವೇಶದ ಸಾಧ್ಯತೆ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳು'),
      );
      expect(
        loc.adjust_background_colors,
        equals('ಹಿನ್ನೆಲೆ ಬಣ್ಣಗಳನ್ನು ಹೊಂದಿಸಿ'),
      );
      expect(loc.adjust_text_colors, equals('ಪಠ್ಯ ಬಣ್ಣಗಳನ್ನು ಹೊಂದಿಸಿ'));
      expect(loc.align_center, equals('ಕೇಂದ್ರಕ್ಕೆ ಹೊಂದಿಸಿ'));
      expect(loc.align_left, equals('ಎಡಕ್ಕೆ ಹೊಂದಿಸಿ'));
      expect(loc.align_right, equals('ಬಲಕ್ಕೆ ಹೊಂದಿಸಿ'));
      expect(loc.bold_text, equals('ದಪ್ಪ ಪಠ್ಯ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ದಪ್ಪ ಪಠ್ಯವನ್ನು ಬದಲಾಯಿಸಿ'));
      expect(
        loc.change_pages_background_color,
        equals('ಪುಟಗಳ ಹಿನ್ನೆಲೆ ಬಣ್ಣವನ್ನು ಈ ರೀತಿಗೆ ಬದಲಾಯಿಸಿ: '),
      );
      expect(
        loc.change_text_color,
        equals('ಪಠ್ಯದ ಬಣ್ಣವನ್ನು ಈ ರೀತಿಗೆ ಬದಲಾಯಿಸಿ: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('ಬಣ್ಣದ ಶೇಡ್‌ ಅನ್ನು ಈ ರೀತಿಗೆ ಬದಲಾಯಿಸಿ: '),
      );
      expect(loc.color_adjustment, equals('ಬಣ್ಣ ಹೊಂದಾಣಿಕೆ'));
      expect(
        loc.color_profile_changed_to,
        equals('ಪ್ರಸ್ತುತ ಬಣ್ಣ ಪ್ರೊಫೈಲ್: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('ಪದ ಅಂತರ ಕಡಿಮೆಗೊಳಿಸಿ'));
      expect(
        loc.decrement_letter_spacing,
        equals('ಅಕ್ಷರ ಅಂತರ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(loc.decrement_line_height, equals('ಸಾಲಿನ ಎತ್ತರ ಕಡಿಮೆಗೊಳಿಸಿ'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ಪಠ್ಯ ಪ್ರಮಾಣ ಅಂಶ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(loc.increment_word_spacing, equals('ಪದ ಅಂತರ ಹೆಚ್ಚಿಸಿ'));
      expect(loc.increment_letter_spacing, equals('ಅಕ್ಷರ ಅಂತರ ಹೆಚ್ಚಿಸಿ'));
      expect(loc.increment_line_height, equals('ಸಾಲಿನ ಎತ್ತರ ಹೆಚ್ಚಿಸಿ'));
      expect(
        loc.increment_text_scale_factor,
        equals('ಪಠ್ಯ ಪ್ರಮಾಣ ಅಂಶ ಹೆಚ್ಚಿಸಿ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('ಪದ ಅಂತರ ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('ಅಕ್ಷರ ಅಂತರ ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('ಸಾಲಿನ ಎತ್ತರ ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ಪಠ್ಯ ಗಾತ್ರವನ್ನು ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ಪರಿಣಾಮಗಳು'));
      expect(loc.expand_text, equals('ಪಠ್ಯ ವಿಸ್ತರಿಸಿ'));
      expect(loc.font_size, equals('ಅಕ್ಷರ ಗಾತ್ರ'));
      expect(loc.less_info, equals('ಮಾಹಿತಿ ಮರೆಮಾಡಿ'));
      expect(loc.letter_spacing, equals('ಅಕ್ಷರ ಅಂತರ'));
      expect(loc.line_height, equals('ಸಾಲಿನ ಎತ್ತರ'));
      expect(loc.more_info, equals('ಮಾಹಿತಿ ತೋರಿಸಿ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ಕಡಿಮೆ ಓದಿ'));
      expect(loc.read_more, equals('ಹೆಚ್ಚು ಓದಿ'));
      expect(
        loc.reduce_effects,
        equals('ಪರದೆಗೆ ಪರಿಣಾಮಗಳನ್ನು ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(loc.reduce_text, equals('ಪಠ್ಯ ಕಡಿಮೆಗೊಳಿಸಿ'));
      expect(loc.restore_settings, equals('ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಮರುಸ್ಥಾಪಿಸಿ'));
      expect(loc.restore_main_color, equals('ಮುಖ್ಯ ಬಣ್ಣ ಮರುಸ್ಥಾಪಿಸಿ'));
      expect(loc.return_to_main_colors, equals('ಮುಖ್ಯ ಬಣ್ಣಗಳಿಗೆ ಹಿಂತಿರುಗಿ'));
      expect(loc.settings, equals('ಸೆಟ್ಟಿಂಗ್ಸ್'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ಗಾತ್ರ ಮತ್ತು ಪಠ್ಯ ಪ್ರದರ್ಶನ'),
      );
      expect(loc.slider_word_spacing, equals('ಸ್ಲೈಡರ್ ಪದ ಅಂತರ'));
      expect(loc.slider_letter_spacing, equals('ಸ್ಲೈಡರ್ ಅಕ್ಷರ ಅಂತರ'));
      expect(loc.slider_line_height, equals('ಸ್ಲೈಡರ್ ಸಾಲಿನ ಎತ್ತರ'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ಥೀಮ್'));
      expect(
        loc.theme_profile('other'),
        equals('ಥೀಮ್ ಪ್ರೊಫೈಲ್ ಗುರುತಿಸಲಾಗಿಲ್ಲ'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('ಮೂರ್ಛೆರೋಗಿಗಳಿಗೆ ಸುರಕ್ಷಿತ'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('ದೃಷ್ಟಿ ದೋಷ'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD ಸ್ನೇಹಿ'),
      );
      expect(loc.theme_profile('none'), equals('ಡಿಫಾಲ್ಟ್'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ಮೂರ್ಛೆರೋಗಿಗಳಿಗೆ ಸುರಕ್ಷಿತ ಪ್ರೊಫೈಲ್'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ಪ್ರತಿಬಿಂಬಗಳನ್ನು ತೆಗೆದುಹಾಕಿ ಮತ್ತು ಬಣ್ಣ ಕಡಿಮೆಗೊಳಿಸಿ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ಈ ಪ್ರೊಫೈಲ್ ಅಪಸ್ಮಾರ ರೋಗವಿರುವ ಮತ್ತು ಮೂರ್ಛೆ ಬರುವ ಅಪಾಯದಲ್ಲಿರುವ '
          'ಬಳಕೆದಾರರು ಮಿಂಚುವ ಅನಿಮೇಷನ್‌ಗಳು ಮತ್ತು ಅಪಾಯಕಾರಿ ಬಣ್ಣ '
          'ಸಂಯೋಜನೆಗಳಿಂದ ಉಂಟಾಗುವ ಮೂರ್ಛೆಗಳ ಅಪಾಯವನ್ನು ತೊಡೆದುಹಾಕುವ '
          'ಮೂಲಕ ಸುರಕ್ಷಿತವಾಗಿ ಬ್ರೌಸ್ ಮಾಡಲು ಅನುವು ಮಾಡಿಕೊಡುತ್ತದೆ.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('ದೃಷ್ಟಿ ದೋಷ ಪ್ರೊಫೈಲ್'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ಅಪ್ಲಿಕೇಶನ್‌ನ ದೃಶ್ಯತೆಯನ್ನು ಸುಧಾರಿಸಿ'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ಈ ಪ್ರೊಫೈಲ್ ದೃಷ್ಟಿ ದೋಷ, ಸುರಂಗ ದೃಷ್ಟಿ, ಮೋತಿಬಿಂದು, '
          'ಗ್ಲೌಕೋಮಾ ಮತ್ತು ಇತರ ಹಲವಾರು ದೃಷ್ಟಿ ದೋಷಗಳಿರುವವರು '
          'ಬಳಸಲು ಸಾಧ್ಯವಾಗುವಂತೆ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಹೊಂದಿಸುತ್ತದೆ.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-ಸ್ನೇಹಿ ಪ್ರೊಫೈಲ್'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ಹೆಚ್ಚಿನ ಏಕಾಗ್ರತೆ ಮತ್ತು ಕಡಿಮೆ ಗಮನ ಭಂಗ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ಈ ಪ್ರೊಫೈಲ್ ADHD ಮತ್ತು ನರಬೆಳವಣಿಗೆ ದೋಷಗಳನ್ನು ಹೊಂದಿರುವ '
          'ವ್ಯಕ್ತಿಗಳು ನ್ಯಾವಿಗೇಟ್ ಮಾಡಲು, ಓದಲು ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್‌ನ '
          'ಅತ್ಯಗತ್ಯ ಅಂಶಗಳ ಮೇಲೆ ಗಮನ ಹರಿಸಲು ಸಹಾಯ ಮಾಡಲು '
          'ಗಮನ ಭಂಗವನ್ನು ಗಣನೀಯವಾಗಿ ಕಡಿಮೆಗೊಳಿಸುತ್ತದೆ.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಮರುಹೊಂದಿಸಲಾಗಿದೆ.'),
      );
      expect(loc.toggle_dark_mode, equals('ಡಾರ್ಕ್ ಮೋಡ್ ಟಾಗಲ್ ಮಾಡಿ'));
      expect(loc.toggle_effects_mode, equals('ಪರಿಣಾಮಗಳ ಮೋಡ್ ಟಾಗಲ್ ಮಾಡಿ'));
      expect(loc.toggle_font_weight, equals('ಫಾಂಟ್ ತೂಕ ಟಾಗಲ್ ಮಾಡಿ'));
      expect(loc.toggle_theme_profile, equals('ಥೀಮ್ ಪ್ರೊಫೈಲ್ ಟಾಗಲ್ ಮಾಡಿ'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('ಸಾಮಾನ್ಯ'));
      expect(loc.color_profile('lowSaturation'), equals('ಕಡಿಮೆ ಸ್ಯಾಚುರೇಷನ್'));
      expect(loc.color_profile('normal'), equals('ಸಾಮಾನ್ಯ'));
      expect(
        loc.color_profile('highSaturation'),
        equals('ಹೆಚ್ಚಿನ ಸ್ಯಾಚುರೇಷನ್'),
      );
      expect(loc.color_profile('monochrome'), equals('ಮೋನೋಕ್ರೋಮ್'));
      expect(loc.color_profile('highContrast'), equals('ಹೆಚ್ಚಿನ ಕಾಂಟ್ರಾಸ್ಟ್'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('ಬಣ್ಣ ಗುರುತಿಸಲಾಗಿಲ್ಲ'));
      expect(loc.color('cF44336'), equals('ಕೆಂಪು'));
      expect(loc.color('cE91E63'), equals('ಗುಲಾಬಿ'));
      expect(loc.color('c9C27B0'), equals('ನೇರಳೆ'));
      expect(loc.color('c673AB7'), equals('ಗಾಢ ನೇರಳೆ'));
      expect(loc.color('c3F51B5'), equals('ಇಂಡಿಗೋ'));
      expect(loc.color('c2196F3'), equals('ನೀಲಿ'));
      expect(loc.color('c03A9F4'), equals('ತಿಳಿ ನೀಲಿ'));
      expect(loc.color('c00BCD4'), equals('ಸಿಯಾನ್'));
      expect(loc.color('c009688'), equals('ಟೀಲ್'));
      expect(loc.color('c4CAF50'), equals('ಹಸಿರು'));
      expect(loc.color('c8BC34A'), equals('ತಿಳಿ ಹಸಿರು'));
      expect(loc.color('cCDDC39'), equals('ಲೈಮ್'));
      expect(loc.color('cFFEB3B'), equals('ಹಳದಿ'));
      expect(loc.color('cFFC107'), equals('ಆಂಬರ್'));
      expect(loc.color('cFF9800'), equals('ಕಿತ್ತಳೆ'));
      expect(loc.color('cFF5722'), equals('ಗಾಢ ಕಿತ್ತಳೆ'));
      expect(loc.color('c795548'), equals('ಕಂದು'));
      expect(loc.color('c9E9E9E'), equals('ಬೂದು'));
      expect(loc.color('c607D8B'), equals('ನೀಲಿ ಬೂದು'));
    });
  });
}
