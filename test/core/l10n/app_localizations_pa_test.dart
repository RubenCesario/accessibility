import 'package:accessibility/src/core/l10n/generated/app_localizations_pa.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsPa', () {
    late AccessibilityLocalizationsPa loc;

    setUp(() {
      loc = AccessibilityLocalizationsPa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('pa'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ਪਹੁੰਚਯੋਗਤਾ'));
      expect(loc.accessibility_settings, equals('ਪਹੁੰਚਯੋਗਤਾ ਸੈਟਿੰਗਾਂ'));
      expect(
        loc.adjust_background_colors,
        equals('ਪਿਛੋਕੜ ਦੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ'),
      );
      expect(
        loc.adjust_text_colors,
        equals('ਟੈਕਸਟ ਦੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ'),
      );
      expect(loc.align_center, equals('ਵਿਚਕਾਰ ਸਜਾਓ'));
      expect(loc.align_left, equals('ਖੱਬੇ ਸਜਾਓ'));
      expect(loc.align_right, equals('ਸੱਜੇ ਸਜਾਓ'));
      expect(loc.bold_text, equals('ਮੋਟਾ ਟੈਕਸਟ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ਮੋਟੇ ਟੈਕਸਟ ਨੂੰ ਬਦਲੋ'));
      expect(
        loc.change_pages_background_color,
        equals('ਪੰਨਿਆਂ ਦੇ ਪਿਛੋਕੜ ਦੇ ਰੰਗ ਨੂੰ ਬਦਲੋ: '),
      );
      expect(loc.change_text_color, equals('ਟੈਕਸਟ ਦੇ ਰੰਗ ਨੂੰ ਬਦਲੋ: '));
      expect(loc.change_text_color_shade, equals('ਰੰਗ ਦੀ ਛਾਂ ਨੂੰ ਬਦਲੋ: '));
      expect(loc.color_adjustment, equals('ਰੰਗ ਵਿਵਸਥਾ'));
      expect(
        loc.color_profile_changed_to,
        equals('ਮੌਜੂਦਾ ਰੰਗ ਪ੍ਰੋਫਾਈਲ ਹੈ: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਘਟਾਓ'));
      expect(
        loc.decrement_letter_spacing,
        equals('ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਘਟਾਓ'),
      );
      expect(loc.decrement_line_height, equals('ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਘਟਾਓ'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ਟੈਕਸਟ ਸਕੇਲ ਫੈਕਟਰ ਨੂੰ ਘਟਾਓ'),
      );
      expect(loc.increment_word_spacing, equals('ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਵਧਾਓ'));
      expect(loc.increment_letter_spacing, equals('ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਵਧਾਓ'));
      expect(loc.increment_line_height, equals('ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਵਧਾਓ'));
      expect(
        loc.increment_text_scale_factor,
        equals('ਟੈਕਸਟ ਸਕੇਲ ਫੈਕਟਰ ਨੂੰ ਵਧਾਓ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('ਸ਼ਬਦ ਦੂਰੀ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('ਅੱਖਰ ਦੂਰੀ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('ਲਾਈਨ ਉਚਾਈ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ਟੈਕਸਟ ਆਕਾਰ ਨੂੰ ਵਧਾਓ ਜਾਂ ਘਟਾਓ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ਅਸਰ'));
      expect(loc.expand_text, equals('ਟੈਕਸਟ ਨੂੰ ਵਿਸਤਾਰ ਕਰੋ'));
      expect(loc.font_size, equals('ਫੌਂਟ ਆਕਾਰ'));
      expect(loc.less_info, equals('ਜਾਣਕਾਰੀ ਲੁਕਾਓ'));
      expect(loc.letter_spacing, equals('ਅੱਖਰ ਦੂਰੀ'));
      expect(loc.line_height, equals('ਲਾਈਨ ਉਚਾਈ'));
      expect(loc.more_info, equals('ਜਾਣਕਾਰੀ ਦਿਖਾਓ'));
      expect(loc.word_spacing, equals('ਸ਼ਬਦ ਦੂਰੀ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ਘੱਟ ਪੜ੍ਹੋ'));
      expect(loc.read_more, equals('ਵੱਧ ਪੜ੍ਹੋ'));
      expect(loc.reduce_effects, equals('ਅਸਰਾਂ ਨੂੰ ਘਟਾਓ'));
      expect(loc.reduce_text, equals('ਟੈਕਸਟ ਨੂੰ ਘਟਾਓ'));
      expect(loc.restore_settings, equals('ਸੈਟਿੰਗਾਂ ਨੂੰ ਮੁੜ ਸਥਾਪਤ ਕਰੋ'));
      expect(
        loc.restore_main_color,
        equals('ਮੁੱਖ ਰੰਗ ਨੂੰ ਮੁੜ ਸਥਾਪਤ ਕਰੋ'),
      );
      expect(loc.return_to_main_colors, equals('ਮੁੱਖ ਰੰਗਾਂ ਨੂੰ ਮੁੜ ਪਰਤੋ'));
      expect(loc.settings, equals('ਸੈਟਿੰਗਾਂ'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ਆਕਾਰ ਅਤੇ ਟੈਕਸਟ ਪ੍ਰਦਰਸ਼ਨ'),
      );
      expect(loc.slider_word_spacing, equals('ਸ਼ਬਦ ਦੂਰੀ ਸਲਾਈਡਰ'));
      expect(loc.slider_letter_spacing, equals('ਅੱਖਰ ਦੂਰੀ ਸਲਾਈਡਰ'));
      expect(loc.slider_line_height, equals('ਲਾਈਨ ਉਚਾਈ ਸਲਾਈਡਰ'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ਥੀਮ'));
      expect(
        loc.theme_profile('other'),
        equals('ਥੀਮ ਪ੍ਰੋਫਾਈਲ ਨਹੀਂ ਪਛਾਣਿਆ ਗਿਆ'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('ਦੌਰਾ ਸੁਰੱਖਿਅਤ'));
      expect(loc.theme_profile('visionImpaired'), equals('ਦ੍ਰਿਸ਼ਟੀ ਪ੍ਰਭਾਵਿਤ'));
      expect(loc.theme_profile('adhdFriendly'), equals('ਏਡੀਏਚਡੀ ਦੋਸਤਾਨਾ'));
      expect(loc.theme_profile('none'), equals('ਡਿਫਾਲਟ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ਦੌਰਾ ਸੁਰੱਖਿਅਤ ਪ੍ਰੋਫਾਈਲ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ਪ੍ਰਤਿਬਿੰਬ ਹਟਾਓ ਅਤੇ ਰੰਗ ਘਟਾਓ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ਇਹ ਪ੍ਰੋਫਾਈਲ ਉਹਨਾਂ ਵਰਤੋਂਕਾਰਾਂ ਨੂੰ ਜਿਨ੍ਹਾਂ ਨੂੰ ਮਿਰਗੀ ਹੈ '
          'ਅਤੇ ਦੌਰੇ ਪੈਣ ਦਾ ਖਤਰਾ ਹੈ, ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ '
          'ਬ੍ਰਾਉਜ਼ ਕਰਨ ਦੀ ਸਹੂਲਤ ਦਿੰਦੀ ਹੈ, ਚਮਕਦਾਰ ਐਨੀਮੇਸ਼ਨਾਂ '
          'ਅਤੇ ਜੋਖਮ ਭਰੇ ਰੰਗ ਸੰਯੋਜਨਾਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ '
          'ਦੌਰਿਆਂ ਦੇ ਜੋਖਮ ਨੂੰ ਖਤਮ ਕਰਕੇ.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('ਦ੍ਰਿਸ਼ਟੀ ਪ੍ਰਭਾਵਿਤ ਪ੍ਰੋਫਾਈਲ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਦਿਖਾਈ ਵਿੱਚ ਸੁਧਾਰ ਕਰੋ'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ਇਹ ਪ੍ਰੋਫਾਈਲ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਜ਼ਿਆਦਾਤਰ ਦ੍ਰਿਸ਼ਟੀ '
          'ਵਿਕਾਰਾਂ ਲਈ ਪਹੁੰਚਯੋਗ ਬਣਾਉਂਦੀ ਹੈ, ਜਿਵੇਂ ਕਿ '
          'ਦ੍ਰਿਸ਼ਟੀ ਵਿਕਾਰ, ਟਨਲ ਦ੍ਰਿਸ਼ਟੀ, ਮੋਤੀਆਬਿੰਦ, '
          'ਗਲੂਕੋਮਾ ਅਤੇ ਹੋਰ.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ਏਡੀਏਚਡੀ ਦੋਸਤਾਨਾ ਪ੍ਰੋਫਾਈਲ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ਵਧੇਰੇ ਇਕਾਗਰਤਾ ਅਤੇ ਘੱਟ ਵਿਘਨ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ਇਹ ਪ੍ਰੋਫਾਈਲ ਵਿਘਨਾਂ ਨੂੰ ਮਹੱਤਵਪੂਰਨ ਰੂਪ ਵਿੱਚ '
          'ਘਟਾਉਂਦੀ ਹੈ, ਏਡੀਏਚਡੀ ਅਤੇ ਨਿਉਰੋਡਿਵੈਲਪਮੈਂਟਲ '
          'ਵਿਕਾਰਾਂ ਵਾਲੇ ਲੋਕਾਂ ਦੀ ਨੈਵੀਗੇਟ, ਪੜ੍ਹਨ ਅਤੇ '
          'ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਜ਼ਰੂਰੀ ਤੱਤਾਂ ਤੇ ਧਿਆਨ ਕੇਂਦਰਿਤ '
          'ਕਰਨ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰਦੀ ਹੈ.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ਸੈਟਿੰਗਾਂ ਨੂੰ ਰੀਸੈੱਟ ਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ.'),
      );
      expect(loc.toggle_dark_mode, equals('ਡਾਰਕ ਮੋਡ ਟੌਗਲ ਕਰੋ'));
      expect(loc.toggle_effects_mode, equals('ਪ੍ਰਭਾਵ ਮੋਡ ਟੌਗਲ ਕਰੋ'));
      expect(loc.toggle_font_weight, equals('ਫੌਂਟ ਭਾਰ ਟੌਗਲ ਕਰੋ'));
      expect(loc.toggle_theme_profile, equals('ਥੀਮ ਪ੍ਰੋਫਾਈਲ ਟੌਗਲ ਕਰੋ'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('ਸਧਾਰਨ'));
      expect(loc.color_profile('lowSaturation'), equals('ਘੱਟ ਸੰਤ੍ਰਿਪਤੀ'));
      expect(loc.color_profile('normal'), equals('ਸਧਾਰਨ'));
      expect(loc.color_profile('highSaturation'), equals('ਉੱਚ ਸੰਤ੍ਰਿਪਤੀ'));
      expect(loc.color_profile('monochrome'), equals('ਇਕਰੰਗਾ'));
      expect(loc.color_profile('highContrast'), equals('ਉੱਚ ਕੰਟਰਾਸਟ'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('ਰੰਗ ਪਛਾਣਿਆ ਨਹੀਂ'));
      expect(loc.color('cF44336'), equals('ਲਾਲ'));
      expect(loc.color('cE91E63'), equals('ਗੁਲਾਬੀ'));
      expect(loc.color('c9C27B0'), equals('ਬੈਂਗਣੀ'));
      expect(loc.color('c673AB7'), equals('ਗੂੜ੍ਹਾ ਬੈਂਗਣੀ'));
      expect(loc.color('c3F51B5'), equals('ਨੀਲਾ ਬੈਂਗਣੀ'));
      expect(loc.color('c2196F3'), equals('ਨੀਲਾ'));
      expect(loc.color('c03A9F4'), equals('ਹਲਕਾ ਨੀਲਾ'));
      expect(loc.color('c00BCD4'), equals('ਸਾਇਨ'));
      expect(loc.color('c009688'), equals('ਟੀਲ'));
      expect(loc.color('c4CAF50'), equals('ਹਰਾ'));
      expect(loc.color('c8BC34A'), equals('ਹਲਕਾ ਹਰਾ'));
      expect(loc.color('cCDDC39'), equals('ਲਾਈਮ'));
      expect(loc.color('cFFEB3B'), equals('ਪੀਲਾ'));
      expect(loc.color('cFFC107'), equals('ਅੰਬਰ'));
      expect(loc.color('cFF9800'), equals('ਸੰਤਰੀ'));
      expect(loc.color('cFF5722'), equals('ਗੂੜ੍ਹਾ ਸੰਤਰੀ'));
      expect(loc.color('c795548'), equals('ਭੂਰਾ'));
      expect(loc.color('c9E9E9E'), equals('ਸਲੇਟੀ'));
      expect(loc.color('c607D8B'), equals('ਨੀਲਾ ਸਲੇਟੀ'));
    });
  });
}
