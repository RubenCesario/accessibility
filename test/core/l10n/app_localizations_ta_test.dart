import 'package:accessibility/src/core/l10n/generated/app_localizations_ta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsTa', () {
    late AccessibilityLocalizationsTa loc;

    setUp(() {
      loc = AccessibilityLocalizationsTa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ta'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('அணுகல்தன்மை'));
      expect(
        loc.accessibility_settings,
        equals('அணுகல்தன்மை அமைப்புகள்'),
      );
      expect(
        loc.adjust_background_colors,
        equals('பின்னணி வண்ணங்களை சரிசெய்க'),
      );
      expect(loc.adjust_text_colors, equals('உரை வண்ணங்களை சரிசெய்க'));
      expect(loc.align_center, equals('மையத்தில் சீரமைக்க'));
      expect(loc.align_left, equals('இடதுபுறம் சீரமைக்க'));
      expect(loc.align_right, equals('வலதுபுறம் சீரமைக்க'));
      expect(loc.bold_text, equals('தடிமனான உரை'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('தடிமனான உரையை மாற்று'));
      expect(
        loc.change_pages_background_color,
        equals('பக்கங்களின் பின்னணி வண்ணத்தை இதற்கு மாற்று: '),
      );
      expect(
        loc.change_text_color,
        equals('உரையின் வண்ணத்தை இதற்கு மாற்று: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('வண்ணத்தின் நிழலை இதற்கு மாற்று: '),
      );
      expect(loc.color_adjustment, equals('வண்ண சரிசெய்தல்'));
      expect(
        loc.color_profile_changed_to,
        equals('தற்போதைய வண்ண விவரக்குறிப்பு: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('சொல் இடைவெளியை குறைக்க'));
      expect(
        loc.decrement_letter_spacing,
        equals('எழுத்து இடைவெளியை குறைக்க'),
      );
      expect(loc.decrement_line_height, equals('வரி உயரத்தை குறைக்க'));
      expect(
        loc.decrement_text_scale_factor,
        equals('உரை அளவு காரணியை குறைக்க'),
      );
      expect(loc.increment_word_spacing, equals('சொல் இடைவெளியை அதிகரிக்க'));
      expect(
        loc.increment_letter_spacing,
        equals('எழுத்து இடைவெளியை அதிகரிக்க'),
      );
      expect(loc.increment_line_height, equals('வரி உயரத்தை அதிகரிக்க'));
      expect(
        loc.increment_text_scale_factor,
        equals('உரை அளவு காரணியை அதிகரிக்க'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('சொல் இடைவெளியை அதிகரிக்க அல்லது குறைக்க'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('எழுத்து இடைவெளியை அதிகரிக்க அல்லது குறைக்க'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('வரி உயரத்தை அதிகரிக்க அல்லது குறைக்க'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('உரை அளவை அதிகரிக்க அல்லது குறைக்க'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('விளைவுகள்'));
      expect(loc.expand_text, equals('உரையை விரிவுபடுத்து'));
      expect(loc.font_size, equals('எழுத்துரு அளவு'));
      expect(loc.less_info, equals('தகவலை மறைக்க'));
      expect(loc.letter_spacing, equals('எழுத்து இடைவெளி'));
      expect(loc.line_height, equals('வரி உயரம்'));
      expect(loc.more_info, equals('தகவலை காட்ட'));
      expect(loc.word_spacing, equals('சொல் இடைவெளி'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('குறைவாக படிக்க'));
      expect(loc.read_more, equals('மேலும் படிக்க'));
      expect(
        loc.reduce_effects,
        equals('திரைக்கான விளைவுகளை குறைக்க'),
      );
      expect(loc.reduce_text, equals('உரையை குறைக்க'));
      expect(loc.restore_settings, equals('அமைப்புகளை மீட்டமைக்க'));
      expect(loc.restore_main_color, equals('முதன்மை வண்ணத்தை மீட்டமைக்க'));
      expect(
        loc.return_to_main_colors,
        equals('முதன்மை வண்ணங்களுக்கு திரும்ப'),
      );
      expect(loc.settings, equals('அமைப்புகள்'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('அளவு மற்றும் உரை காட்சி'),
      );
      expect(
        loc.slider_word_spacing,
        equals('சொல் இடைவெளி சருக்கி'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('எழுத்து இடைவெளி சருக்கி'),
      );
      expect(loc.slider_line_height, equals('வரி உயரம் சருக்கி'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('தீம்'));
      expect(
        loc.theme_profile('other'),
        equals('தீம் விவரக்குறிப்பு அங்கீகரிக்கப்படவில்லை'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('வலிப்பு பாதுகாப்பு'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('பார்வை குறைபாடு'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD நட்பு'),
      );
      expect(loc.theme_profile('none'), equals('இயல்பு'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('வலிப்பு பாதுகாப்பு விவரக்குறிப்பு'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('பிரதிபலிப்புகளை நீக்கி வண்ணத்தை குறைக்க'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'இந்த விவரக்குறிப்பு காக்கைவலிப்பு உள்ள மற்றும் '
          'வலிப்பு அபாயத்தில் உள்ள பயனர்கள் மின்னும் '
          'அனிமேஷன்கள் மற்றும் ஆபத்தான வண்ண கலவைகளால் '
          'ஏற்படும் வலிப்பு அபாயத்தை நீக்குவதன் மூலம் '
          'பாதுகாப்பாக உலாவ அனுமதிக்கிறது.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('பார்வை குறைபாடு விவரக்குறிப்பு'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('பயன்பாட்டின் தெரிவுத்தன்மையை மேம்படுத்துக'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'இந்த விவரக்குறிப்பு பார்வைக் குறைபாடு, டனல் '
          'பார்வை, கண்புரை, களாகோமா மற்றும் பல போன்ற '
          'பெரும்பாலான பார்வைக் குறைபாடுகளுக்கு '
          'அணுகக்கூடியதாக பயன்பாட்டை தகவமைக்கிறது.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD நட்பு விவரக்குறிப்பு'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('அதிக கவனம் மற்றும் குறைவான கவனச்சிதறல்கள்'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'இந்த விவரக்குறிப்பு கவனச்சிதறல்களை கணிசமாக '
          'குறைக்கிறது, ADHD மற்றும் நரம்பியல் வளர்ச்சி '
          'குறைபாடுகள் உள்ள மக்களுக்கு வழிநடத்த, படிக்க '
          'மற்றும் பயன்பாட்டின் அத்தியாவசிய கூறுகளில் '
          'கவனம் செலுத்த உதவுகிறது.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('அமைப்புகள் மீட்டமைக்கப்பட்டுள்ளன.'),
      );
      expect(loc.toggle_dark_mode, equals('இருண்ட பயன்முறையை மாற்று'));
      expect(loc.toggle_effects_mode, equals('விளைவுகள் பயன்முறையை மாற்று'));
      expect(loc.toggle_font_weight, equals('எழுத்துரு எடையை மாற்று'));
      expect(loc.toggle_theme_profile, equals('தீம் விவரக்குறிப்பை மாற்று'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('சாதாரணம்'));
      expect(loc.color_profile('lowSaturation'), equals('குறைந்த தெவிட்டு'));
      expect(loc.color_profile('normal'), equals('சாதாரணம்'));
      expect(
        loc.color_profile('highSaturation'),
        equals('அதிக தெவிட்டு'),
      );
      expect(loc.color_profile('monochrome'), equals('ஒரு வண்ணம்'));
      expect(
        loc.color_profile('highContrast'),
        equals('அதிக மாறுபாடு'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('வண்ணம் அங்கீகரிக்கப்படவில்லை'));
      expect(loc.color('cF44336'), equals('சிவப்பு'));
      expect(loc.color('cE91E63'), equals('இளஞ்சிவப்பு'));
      expect(loc.color('c9C27B0'), equals('ஊதா'));
      expect(loc.color('c673AB7'), equals('அடர் ஊதா'));
      expect(loc.color('c3F51B5'), equals('கருநீலம்'));
      expect(loc.color('c2196F3'), equals('நீலம்'));
      expect(loc.color('c03A9F4'), equals('இளநீலம்'));
      expect(loc.color('c00BCD4'), equals('சயன்'));
      expect(loc.color('c009688'), equals('நீலப்பச்சை'));
      expect(loc.color('c4CAF50'), equals('பச்சை'));
      expect(loc.color('c8BC34A'), equals('இளம் பச்சை'));
      expect(loc.color('cCDDC39'), equals('எலுமிச்சை'));
      expect(loc.color('cFFEB3B'), equals('மஞ்சள்'));
      expect(loc.color('cFFC107'), equals('ஆம்பர்'));
      expect(loc.color('cFF9800'), equals('ஆரஞ்சு'));
      expect(loc.color('cFF5722'), equals('அடர் ஆரஞ்சு'));
      expect(loc.color('c795548'), equals('பழுப்பு'));
      expect(loc.color('c9E9E9E'), equals('சாம்பல்'));
      expect(loc.color('c607D8B'), equals('நீல சாம்பல்'));
    });
  });
}
