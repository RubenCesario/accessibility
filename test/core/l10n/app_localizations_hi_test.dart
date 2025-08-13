import 'package:accessibility/src/core/l10n/generated/app_localizations_hi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsHi', () {
    late AccessibilityLocalizationsHi loc;

    setUp(() {
      loc = AccessibilityLocalizationsHi();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('hi'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('पहुंचक्षमता'));
      expect(loc.accessibility_settings, equals('पहुंचक्षमता सेटिंग्स'));
      expect(
        loc.adjust_background_colors,
        equals('पृष्ठभूमि के रंगों को समायोजित करें'),
      );
      expect(
        loc.adjust_text_colors,
        equals('टेक्स्ट रंगों को समायोजित करें'),
      );
      expect(loc.align_center, equals('मध्य में संरेखित करें'));
      expect(loc.align_left, equals('बाएं संरेखित करें'));
      expect(loc.align_right, equals('दाएं संरेखित करें'));
      expect(loc.bold_text, equals('बोल्ड टेक्स्ट'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('बोल्ड टेक्स्ट बदलें'));
      expect(
        loc.change_pages_background_color,
        equals('पृष्ठों की पृष्ठभूमि का रंग बदलें: '),
      );
      expect(loc.change_text_color, equals('टेक्स्ट का रंग बदलें: '));
      expect(loc.change_text_color_shade, equals('रंग की छाया को बदलें: '));
      expect(loc.color_adjustment, equals('रंग समायोजन'));
      expect(
        loc.color_profile_changed_to,
        equals('वर्तमान रंग प्रोफाइल है: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('शब्द रिक्तता कम करें'));
      expect(loc.decrement_letter_spacing, equals('अक्षर रिक्तता कम करें'));
      expect(loc.decrement_line_height, equals('पंक्ति ऊंचाई कम करें'));
      expect(
        loc.decrement_text_scale_factor,
        equals('टेक्स्ट स्केल फैक्टर कम करें'),
      );
      expect(loc.increment_word_spacing, equals('शब्द रिक्तता बढ़ाएं'));
      expect(loc.increment_letter_spacing, equals('अक्षर रिक्तता बढ़ाएं'));
      expect(loc.increment_line_height, equals('पंक्ति ऊंचाई बढ़ाएं'));
      expect(
        loc.increment_text_scale_factor,
        equals('टेक्स्ट स्केल फैक्टर बढ़ाएं'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('शब्द रिक्तता बढ़ाएं या घटाएं'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('अक्षर रिक्तता बढ़ाएं या घटाएं'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('पंक्ति ऊंचाई बढ़ाएं या घटाएं'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('टेक्स्ट आकार बढ़ाएं या घटाएं'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('प्रभाव'));
      expect(loc.expand_text, equals('टेक्स्ट विस्तृत करें'));
      expect(loc.font_size, equals('फॉन्ट का आकार'));
      expect(loc.less_info, equals('जानकारी छिपाएं'));
      expect(loc.letter_spacing, equals('अक्षर रिक्तता'));
      expect(loc.line_height, equals('पंक्ति ऊंचाई'));
      expect(loc.more_info, equals('जानकारी दिखाएं'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('कम पढ़ें'));
      expect(loc.read_more, equals('और पढ़ें'));
      expect(loc.reduce_effects, equals('स्क्रीन पर प्रभावों को कम करें'));
      expect(loc.reduce_text, equals('टेक्स्ट कम करें'));
      expect(loc.restore_settings, equals('सेटिंग्स बहाल करें'));
      expect(loc.restore_main_color, equals('मुख्य रंग बहाल करें'));
      expect(
        loc.return_to_main_colors,
        equals('मुख्य रंगों पर वापस जाएं'),
      );
      expect(loc.settings, equals('सेटिंग्स'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('आकार और टेक्स्ट प्रदर्शन'));
      expect(loc.slider_word_spacing, equals('शब्द रिक्तता स्लाइडर'));
      expect(loc.slider_letter_spacing, equals('अक्षर रिक्तता स्लाइडर'));
      expect(loc.slider_line_height, equals('पंक्ति ऊंचाई स्लाइडर'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('थीम'));
      expect(
        loc.theme_profile('other'),
        equals('थीम प्रोफाइल पहचानी नहीं'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('दौरे से सुरक्षित'));
      expect(loc.theme_profile('visionImpaired'), equals('दृष्टि बाधित'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD अनुकूल'));
      expect(loc.theme_profile('none'), equals('डिफॉल्ट'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('दौरे से सुरक्षित प्रोफाइल'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('प्रतिबिंब हटाएं और रंग कम करें'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'यह प्रोफाइल मिरगी वाले और दौरे के जोखिम वाले उपयोगकर्ताओं '
          'को नज़र आने वाली एनिमेशन और जोखिम भरे रंग संयोजनों से '
          'होने वाले दौरे के जोखिम को खत्म करके सुरक्षित रूप से '
          'ब्राउज़ करने की अनुमति देती है।',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('दृष्टि बाधित प्रोफाइल'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ऐप्लिकेशन की दृश्यता में सुधार करें'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'यह प्रोफाइल ऐप्लिकेशन को अधिकांश दृश्य हानियों जैसे '
          'दृष्टि हानि, टनल विजन, मोतियाबिंद, ग्लूकोमा और अधिक के '
          'लिए सुलभ बनाती है।',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-अनुकूल प्रोफाइल'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('अधिक एकाग्रता और कम विकर्षण'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'यह प्रोफाइल ADHD और न्यूरोडेवलपमेंटल डिसऑर्डर वाले '
          'लोगों को ऐप्लिकेशन के आवश्यक तत्वों पर नेविगेट, पढ़ने '
          'और ध्यान केंद्रित करने में मदद करने के लिए विकर्षणों '
          'को काफी कम करती है।',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('सेटिंग्स रीसेट कर दी गई हैं।'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('डार्क मोड टॉगल करें'));
      expect(loc.toggle_effects_mode, equals('प्रभाव मोड टॉगल करें'));
      expect(loc.toggle_font_weight, equals('फॉन्ट वेट टॉगल करें'));
      expect(loc.toggle_theme_profile, equals('थीम प्रोफाइल टॉगल करें'));
      expect(loc.word_spacing, equals('शब्द रिक्तता'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('कम संतृप्ति'),
      );
      expect(loc.color_profile('normal'), equals('सामान्य'));
      expect(
        loc.color_profile('highSaturation'),
        equals('उच्च संतृप्ति'),
      );
      expect(loc.color_profile('monochrome'), equals('एक रंग'));
      expect(loc.color_profile('highContrast'), equals('उच्च कंट्रास्ट'));
      expect(loc.color_profile('unknown'), equals('सामान्य'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('लाल'));
      expect(loc.color('cE91E63'), equals('गुलाबी'));
      expect(loc.color('c9C27B0'), equals('बैंगनी'));
      expect(loc.color('c673AB7'), equals('गहरा बैंगनी'));
      expect(loc.color('c3F51B5'), equals('नीला-बैंगनी'));
      expect(loc.color('c2196F3'), equals('नीला'));
      expect(loc.color('c03A9F4'), equals('हल्का नीला'));
      expect(loc.color('c00BCD4'), equals('हरा-नीला'));
      expect(loc.color('c009688'), equals('गहरा हरा-नीला'));
      expect(loc.color('c4CAF50'), equals('हरा'));
      expect(loc.color('c8BC34A'), equals('हल्का हरा'));
      expect(loc.color('cCDDC39'), equals('नींबू रंग'));
      expect(loc.color('cFFEB3B'), equals('पीला'));
      expect(loc.color('cFFC107'), equals('अंबर'));
      expect(loc.color('cFF9800'), equals('नारंगी'));
      expect(loc.color('cFF5722'), equals('गहरा नारंगी'));
      expect(loc.color('c795548'), equals('भूरा'));
      expect(loc.color('c9E9E9E'), equals('स्लेटी'));
      expect(loc.color('c607D8B'), equals('नीला-स्लेटी'));
      expect(
        loc.color('unknown'),
        equals('रंग पहचाना नहीं'),
      );
    });
  });
}
