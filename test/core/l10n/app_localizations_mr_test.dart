import 'package:accessibility/src/core/l10n/generated/app_localizations_mr.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsMr', () {
    late AccessibilityLocalizationsMr loc;

    setUp(() {
      loc = AccessibilityLocalizationsMr();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('mr'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('सुगम्यता'));
      expect(loc.accessibility_settings, equals('सुगम्यता सेटिंग्ज'));
      expect(
        loc.adjust_background_colors,
        equals('बॅकग्राउंड रंग समायोजित करा'),
      );
      expect(loc.adjust_text_colors, equals('मजकूर रंग समायोजित करा'));
      expect(loc.align_center, equals('मध्यभागी संरेखित करा'));
      expect(loc.align_left, equals('डावीकडे संरेखित करा'));
      expect(loc.align_right, equals('उजवीकडे संरेखित करा'));
      expect(loc.bold_text, equals('ठळक मजकूर'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ठळक मजकूर बदला'));
      expect(
        loc.change_pages_background_color,
        equals('पृष्ठांचा बॅकग्राउंड रंग यामध्ये बदला: '),
      );
      expect(
        loc.change_text_color,
        equals('मजकुराचा रंग यामध्ये बदला: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('रंगाची छटा यामध्ये बदला: '),
      );
      expect(loc.color_adjustment, equals('रंग समायोजन'));
      expect(
        loc.color_profile_changed_to,
        equals('वर्तमान रंग प्रोफाइल आहे: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('शब्द अंतर कमी करा'));
      expect(loc.decrement_letter_spacing, equals('अक्षर अंतर कमी करा'));
      expect(loc.decrement_line_height, equals('ओळ उंची कमी करा'));
      expect(
        loc.decrement_text_scale_factor,
        equals('मजकूर प्रमाण घटक कमी करा'),
      );
      expect(loc.increment_word_spacing, equals('शब्द अंतर वाढवा'));
      expect(loc.increment_letter_spacing, equals('अक्षर अंतर वाढवा'));
      expect(loc.increment_line_height, equals('ओळ उंची वाढवा'));
      expect(
        loc.increment_text_scale_factor,
        equals('मजकूर प्रमाण घटक वाढवा'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('प्रभाव'));
      expect(loc.expand_text, equals('मजकूर विस्तारित करा'));
      expect(loc.font_size, equals('फॉन्ट आकार'));
      expect(loc.less_info, equals('माहिती लपवा'));
      expect(loc.letter_spacing, equals('अक्षर अंतर'));
      expect(loc.line_height, equals('ओळ उंची'));
      expect(loc.more_info, equals('माहिती दाखवा'));
      expect(loc.word_spacing, equals('शब्द अंतर'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('कमी वाचा'));
      expect(loc.read_more, equals('अधिक वाचा'));
      expect(loc.reduce_effects, equals('स्क्रीनवरील प्रभाव कमी करा'));
      expect(loc.reduce_text, equals('मजकूर कमी करा'));
      expect(loc.restore_settings, equals('सेटिंग्ज पुनर्संचयित करा'));
      expect(loc.restore_main_color, equals('मुख्य रंग पुनर्संचयित करा'));
      expect(loc.return_to_main_colors, equals('मुख्य रंगांकडे परत जा'));
      expect(loc.settings, equals('सेटिंग्ज'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('आकार आणि मजकूर प्रदर्शन'),
      );
      expect(loc.slider_word_spacing, equals('शब्द अंतर स्लायडर'));
      expect(loc.slider_letter_spacing, equals('अक्षर अंतर स्लायडर'));
      expect(loc.slider_line_height, equals('ओळ उंची स्लायडर'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('थीम'));
      expect(
        loc.theme_profile('other'),
        equals('थीम प्रोफाइल ओळखले नाही'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('अपस्मार सुरक्षित'));
      expect(loc.theme_profile('visionImpaired'), equals('दृष्टी दोष आहे'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-अनुकूल'));
      expect(loc.theme_profile('none'), equals('डीफॉल्ट'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('अपस्मार सुरक्षित प्रोफाइल'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('प्रतिबिंब काढा आणि रंग कमी करा'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'हे प्रोफाइल फ्लॅशिंग अॅनिमेशन आणि जोखीमपूर्ण रंग '
          'संयोजनांमुळे होणार्या अपस्माराचा धोका दूर करून '
          'फिट्स आणि अपस्माराच्या धोक्यात असलेल्या '
          'वापरकर्त्यांना सुरक्षितपणे ब्राउझ करण्यास सक्षम '
          'करते.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('दृष्टी-दोष प्रोफाइल'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('अनुप्रयोगाची दृश्यता सुधारा'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'हे प्रोफाइल दृष्टी दोष, टनेल व्हिजन, मोतिबिंदू, '
          'काचबिंदू आणि इतर बहुतेक दृश्य दोषांसाठी अनुप्रयोग '
          'सुगम करण्यासाठी अनुकूलित करते.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-अनुकूल प्रोफाइल'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('अधिक एकाग्रता आणि कमी विक्षेपण'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'हे प्रोफाइल ADHD आणि न्यूरोडेव्हलपमेंटल डिसऑर्डर '
          'असलेल्या लोकांना अनुप्रयोगाच्या आवश्यक घटकांवर '
          'सहजपणे नेव्हिगेट, वाचन आणि लक्ष केंद्रित करण्यास '
          'मदत करण्यासाठी विक्षेपण लक्षणीयरीत्या कमी करते.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('सेटिंग्ज रीसेट केले गेले आहेत.'),
      );
      expect(loc.toggle_dark_mode, equals('डार्क मोड टॉगल करा'));
      expect(loc.toggle_effects_mode, equals('प्रभाव मोड टॉगल करा'));
      expect(loc.toggle_font_weight, equals('फॉन्ट वजन टॉगल करा'));
      expect(loc.toggle_theme_profile, equals('थीम प्रोफाइल टॉगल करा'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('सामान्य'));
      expect(loc.color_profile('lowSaturation'), equals('कमी संपृक्तता'));
      expect(loc.color_profile('normal'), equals('सामान्य'));
      expect(loc.color_profile('highSaturation'), equals('उच्च संपृक्तता'));
      expect(loc.color_profile('monochrome'), equals('मोनोक्रोम'));
      expect(loc.color_profile('highContrast'), equals('उच्च कॉन्ट्रास्ट'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('रंग ओळखला नाही'));
      expect(loc.color('cF44336'), equals('लाल'));
      expect(loc.color('cE91E63'), equals('गुलाबी'));
      expect(loc.color('c9C27B0'), equals('जांभळा'));
      expect(loc.color('c673AB7'), equals('गडद जांभळा'));
      expect(loc.color('c3F51B5'), equals('इंडिगो'));
      expect(loc.color('c2196F3'), equals('निळा'));
      expect(loc.color('c03A9F4'), equals('प्रकाश निळा'));
      expect(loc.color('c00BCD4'), equals('सायन'));
      expect(loc.color('c009688'), equals('टील'));
      expect(loc.color('c4CAF50'), equals('हिरवा'));
      expect(loc.color('c8BC34A'), equals('प्रकाश हिरवा'));
      expect(loc.color('cCDDC39'), equals('लिंबू'));
      expect(loc.color('cFFEB3B'), equals('पिवळा'));
      expect(loc.color('cFFC107'), equals('अँबर'));
      expect(loc.color('cFF9800'), equals('नारिंगी'));
      expect(loc.color('cFF5722'), equals('गडद नारिंगी'));
      expect(loc.color('c795548'), equals('भूरा'));
      expect(loc.color('c9E9E9E'), equals('राखाडी'));
      expect(loc.color('c607D8B'), equals('निळसर राखाडी'));
    });
  });
}
