import 'package:accessibility/src/core/l10n/generated/app_localizations_ne.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsNe', () {
    late AccessibilityLocalizationsNe loc;

    setUp(() {
      loc = AccessibilityLocalizationsNe();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ne'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('पहुँचयोग्यता'));
      expect(
        loc.accessibility_settings,
        equals('पहुँचयोग्यता सेटिङहरू'),
      );
      expect(
        loc.adjust_background_colors,
        equals('पृष्ठभूमि रङहरू समायोजन गर्नुहोस्'),
      );
      expect(
        loc.adjust_text_colors,
        equals('पाठ रङहरू समायोजन गर्नुहोस्'),
      );
      expect(
        loc.align_center,
        equals('केन्द्रमा पङ्क्तिबद्ध गर्नुहोस्'),
      );
      expect(loc.align_left, equals('बायाँ पङ्क्तिबद्ध गर्नुहोस्'));
      expect(loc.align_right, equals('दायाँ पङ्क्तिबद्ध गर्नुहोस्'));
      expect(loc.bold_text, equals('बोल्ड पाठ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('बोल्ड पाठ परिवर्तन गर्नुहोस्'));
      expect(
        loc.change_pages_background_color,
        equals('पृष्ठहरूको पृष्ठभूमि रङ यसमा परिवर्तन गर्नहोस्: '),
      );
      expect(
        loc.change_text_color,
        equals('पाठको रङ यसमा परिवर्तन गर्नुहोस्: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('रङको छाया यसमा परिवर्तन गर्नुहोस्: '),
      );
      expect(loc.color_adjustment, equals('रङ समायोजन'));
      expect(
        loc.color_profile_changed_to,
        equals('हालको रङ प्रोफाइल हो: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('शब्द रिक्तता घटाउनुहोस्'));
      expect(
        loc.decrement_letter_spacing,
        equals('अक्षर रिक्तता घटाउनुहोस्'),
      );
      expect(loc.decrement_line_height, equals('लाइन उचाई घटाउनुहोस्'));
      expect(
        loc.decrement_text_scale_factor,
        equals('पाठ स्केल फ्याक्टर घटाउनुहोस्'),
      );
      expect(loc.increment_word_spacing, equals('शब्द रिक्तता बढाउनुहोस्'));
      expect(
        loc.increment_letter_spacing,
        equals('अक्षर रिक्तता बढाउनुहोस्'),
      );
      expect(loc.increment_line_height, equals('लाइन उचाई बढाउनुहोस्'));
      expect(
        loc.increment_text_scale_factor,
        equals('पाठ स्केल फ्याक्टर बढाउनुहोस्'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('शब्द रिक्तता बढाउनुहोस् वा घटाउनुहोस्'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('अक्षर रिक्तता बढाउनुहोस् वा घटाउनुहोस्'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('लाइन उचाई बढाउनुहोस् वा घटाउनुहोस्'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('पाठ आकार बढाउनुहोस् वा घटाउनुहोस्'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('प्रभावहरू'));
      expect(loc.expand_text, equals('पाठ विस्तार गर्नुहोस्'));
      expect(loc.font_size, equals('फन्ट आकार'));
      expect(loc.less_info, equals('जानकारी लुकाउनुहोस्'));
      expect(loc.letter_spacing, equals('अक्षर रिक्तता'));
      expect(loc.line_height, equals('लाइन उचाई'));
      expect(loc.more_info, equals('जानकारी देखाउनुहोस्'));
      expect(loc.word_spacing, equals('शब्द रिक्तता'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('कम पढ्नुहोस्'));
      expect(loc.read_more, equals('थप पढ्नुहोस्'));
      expect(
        loc.reduce_effects,
        equals('स्क्रिनमा प्रभावहरू कम गर्नुहोस्'),
      );
      expect(loc.reduce_text, equals('पाठ घटाउनुहोस्'));
      expect(loc.restore_settings, equals('सेटिङहरू पुनर्स्थापना गर्नुहोस्'));
      expect(loc.restore_main_color, equals('मुख्य रङ पुनर्स्थापना गर्नुहोस्'));
      expect(
        loc.return_to_main_colors,
        equals('मुख्य रङहरूमा फर्कनुहोस्'),
      );
      expect(loc.settings, equals('सेटिङहरू'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('आकार र पाठ प्रदर्शन'),
      );
      expect(
        loc.slider_word_spacing,
        equals('शब्द रिक्तता स्लाइडर'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('अक्षर रिक्तता स्लाइडर'),
      );
      expect(
        loc.slider_line_height,
        equals('लाइन उचाई स्लाइडर'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('थिम'));
      expect(
        loc.theme_profile('other'),
        equals('थिम प्रोफाइल पहिचान गरिएको छैन'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('दौडा सुरक्षित'));
      expect(loc.theme_profile('visionImpaired'), equals('दृष्टि कमजोर'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD मैत्रीपूर्ण'));
      expect(loc.theme_profile('none'), equals('पूर्वनिर्धारित'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('दौडा सुरक्षित प्रोफाइल'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('प्रतिबिम्बहरू हटाउनुहोस् र रङ कम गर्नुहोस्'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'यो प्रोफाइलले छारेरोग भएका र दौडाको जोखिममा रहेका '
          'प्रयोगकर्ताहरूलाई चम्किलो एनिमेसन र जोखिमपूर्ण रङ '
          'संयोजनहरूबाट उत्पन्न हुने दौडाको जोखिम हटाएर सुरक्षित '
          'रूपमा ब्राउज गर्न सक्षम बनाउँछ।',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('दृष्टि कमजोर प्रोफाइल'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('एप्लिकेशनको दृश्यता सुधार गर्नुहोस्'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'यो प्रोफाइलले एप्लिकेशनलाई धेरैजसो दृश्य कमजोरीहरू, '
          'जस्तै दृष्टि कमजोरी, टनेल दृष्टि, मोतियाबिन्दु, '
          'ग्लुकोमा र अन्यको लागि पहुँचयोग्य बनाउन अनुकूलन '
          'गर्दछ।',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-मैत्रीपूर्ण प्रोफाइल'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('थप एकाग्रता र कम विकर्षणहरू'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'यो प्रोफाइलले ADHD र न्यूरोडेभलपमेन्टल विकारहरू '
          'भएका व्यक्तिहरूलाई एप्लिकेशनका आवश्यक तत्वहरूमा '
          'नेभिगेट गर्न, पढ्न र ध्यान केन्द्रित गर्न सहयोग गर्न '
          'विकर्षणहरू उल्लेखनीय रूपमा कम गर्दछ।',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('सेटिङहरू पुनःसेट गरिएका छन्।'),
      );
      expect(loc.toggle_dark_mode, equals('डार्क मोड टगल गर्नुहोस्'));
      expect(loc.toggle_effects_mode, equals('प्रभाव मोड टगल गर्नुहोस्'));
      expect(loc.toggle_font_weight, equals('फन्ट वजन टगल गर्नुहोस्'));
      expect(loc.toggle_theme_profile, equals('थिम प्रोफाइल टगल गर्नुहोस्'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('सामान्य'));
      expect(loc.color_profile('lowSaturation'), equals('कम स्याटुरेसन'));
      expect(loc.color_profile('normal'), equals('सामान्य'));
      expect(loc.color_profile('highSaturation'), equals('उच्च स्याटुरेसन'));
      expect(loc.color_profile('monochrome'), equals('मोनोक्रोम'));
      expect(loc.color_profile('highContrast'), equals('उच्च कंट्रास्ट'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('रङ पहिचान गरिएको छैन'));
      expect(loc.color('cF44336'), equals('रातो'));
      expect(loc.color('cE91E63'), equals('गुलाबी'));
      expect(loc.color('c9C27B0'), equals('बैजनी'));
      expect(loc.color('c673AB7'), equals('गहिरो बैजनी'));
      expect(loc.color('c3F51B5'), equals('नीलो-बैजनी'));
      expect(loc.color('c2196F3'), equals('नीलो'));
      expect(loc.color('c03A9F4'), equals('हल्का नीलो'));
      expect(loc.color('c00BCD4'), equals('सायन'));
      expect(loc.color('c009688'), equals('टील'));
      expect(loc.color('c4CAF50'), equals('हरियो'));
      expect(loc.color('c8BC34A'), equals('हल्का हरियो'));
      expect(loc.color('cCDDC39'), equals('लाइम'));
      expect(loc.color('cFFEB3B'), equals('पहेंलो'));
      expect(loc.color('cFFC107'), equals('एम्बर'));
      expect(loc.color('cFF9800'), equals('सुन्तला'));
      expect(loc.color('cFF5722'), equals('गहिरो सुन्तला'));
      expect(loc.color('c795548'), equals('खैरो'));
      expect(loc.color('c9E9E9E'), equals('खरानी'));
      expect(loc.color('c607D8B'), equals('नीलो-खरानी'));
    });
  });
}
