// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AccessibilityLocalizationsNe extends AccessibilityLocalizations {
  AccessibilityLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get accessibility => 'पहुँचयोग्यता';

  @override
  String get accessibility_settings => 'पहुँचयोग्यता सेटिङहरू';

  @override
  String get adjust_background_colors => 'पृष्ठभूमि रङहरू समायोजन गर्नुहोस्';

  @override
  String get adjust_text_colors => 'पाठ रङहरू समायोजन गर्नुहोस्';

  @override
  String get align_center => 'केन्द्रमा पङ्क्तिबद्ध गर्नुहोस्';

  @override
  String get align_left => 'बायाँ पङ्क्तिबद्ध गर्नुहोस्';

  @override
  String get align_right => 'दायाँ पङ्क्तिबद्ध गर्नुहोस्';

  @override
  String get bold_text => 'बोल्ड पाठ';

  @override
  String get change_bold_text => 'बोल्ड पाठ परिवर्तन गर्नुहोस्';

  @override
  String get change_pages_background_color =>
      'पृष्ठहरूको पृष्ठभूमि रङ यसमा परिवर्तन गर्नहोस्: ';

  @override
  String get change_text_color => 'पाठको रङ यसमा परिवर्तन गर्नुहोस्: ';

  @override
  String get change_text_color_shade => 'रङको छाया यसमा परिवर्तन गर्नुहोस्: ';

  @override
  String get color_adjustment => 'रङ समायोजन';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'सामान्य',
      'lowSaturation': 'कम स्याटुरेसन',
      'normal': 'सामान्य',
      'highSaturation': 'उच्च स्याटुरेसन',
      'monochrome': 'मोनोक्रोम',
      'highContrast': 'उच्च कंट्रास्ट',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'हालको रङ प्रोफाइल हो: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'रङ पहिचान गरिएको छैन',
      'cF44336': 'रातो',
      'cE91E63': 'गुलाबी',
      'c9C27B0': 'बैजनी',
      'c673AB7': 'गहिरो बैजनी',
      'c3F51B5': 'नीलो-बैजनी',
      'c2196F3': 'नीलो',
      'c03A9F4': 'हल्का नीलो',
      'c00BCD4': 'सायन',
      'c009688': 'टील',
      'c4CAF50': 'हरियो',
      'c8BC34A': 'हल्का हरियो',
      'cCDDC39': 'लाइम',
      'cFFEB3B': 'पहेंलो',
      'cFFC107': 'एम्बर',
      'cFF9800': 'सुन्तला',
      'cFF5722': 'गहिरो सुन्तला',
      'c795548': 'खैरो',
      'c9E9E9E': 'खरानी',
      'c607D8B': 'नीलो-खरानी',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'शब्द रिक्तता घटाउनुहोस्';

  @override
  String get decrement_letter_spacing => 'अक्षर रिक्तता घटाउनुहोस्';

  @override
  String get decrement_line_height => 'लाइन उचाई घटाउनुहोस्';

  @override
  String get decrement_text_scale_factor => 'पाठ स्केल फ्याक्टर घटाउनुहोस्';

  @override
  String get effects => 'प्रभावहरू';

  @override
  String get expand_text => 'पाठ विस्तार गर्नुहोस्';

  @override
  String get font_size => 'फन्ट आकार';

  @override
  String get increase_or_decrease_word_spacing =>
      'शब्द रिक्तता बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increase_or_decrease_letter_spacing =>
      'अक्षर रिक्तता बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increase_or_decrease_line_height =>
      'लाइन उचाई बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increase_or_decrease_text_size =>
      'पाठ आकार बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increment_word_spacing => 'शब्द रिक्तता बढाउनुहोस्';

  @override
  String get increment_letter_spacing => 'अक्षर रिक्तता बढाउनुहोस्';

  @override
  String get increment_line_height => 'लाइन उचाई बढाउनुहोस्';

  @override
  String get increment_text_scale_factor => 'पाठ स्केल फ्याक्टर बढाउनुहोस्';

  @override
  String get less_info => 'जानकारी लुकाउनुहोस्';

  @override
  String get letter_spacing => 'अक्षर रिक्तता';

  @override
  String get line_height => 'लाइन उचाई';

  @override
  String get more_info => 'जानकारी देखाउनुहोस्';

  @override
  String get read_less => 'कम पढ्नुहोस्';

  @override
  String get read_more => 'थप पढ्नुहोस्';

  @override
  String get reduce_effects => 'स्क्रिनमा प्रभावहरू कम गर्नुहोस्';

  @override
  String get reduce_text => 'पाठ घटाउनुहोस्';

  @override
  String get restore_settings => 'सेटिङहरू पुनर्स्थापना गर्नुहोस्';

  @override
  String get restore_main_color => 'मुख्य रङ पुनर्स्थापना गर्नुहोस्';

  @override
  String get return_to_main_colors => 'मुख्य रङहरूमा फर्कनुहोस्';

  @override
  String get settings => 'सेटिङहरू';

  @override
  String get size_and_text_display => 'आकार र पाठ प्रदर्शन';

  @override
  String get slider_word_spacing => 'शब्द रिक्तता स्लाइडर';

  @override
  String get slider_letter_spacing => 'अक्षर रिक्तता स्लाइडर';

  @override
  String get slider_line_height => 'लाइन उचाई स्लाइडर';

  @override
  String get theme_mode => 'थिम';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'थिम प्रोफाइल पहिचान गरिएको छैन',
      'seizureSafe': 'दौडा सुरक्षित',
      'visionImpaired': 'दृष्टि कमजोर',
      'adhdFriendly': 'ADHD मैत्रीपूर्ण',
      'none': 'पूर्वनिर्धारित',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'दौडा सुरक्षित प्रोफाइल';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'प्रतिबिम्बहरू हटाउनुहोस् र रङ कम गर्नुहोस्';

  @override
  String get theme_profile_seizure_safe_description =>
      'यो प्रोफाइलले छारेरोग भएका र दौडाको जोखिममा रहेका प्रयोगकर्ताहरूलाई चम्किलो एनिमेसन र जोखिमपूर्ण रङ संयोजनहरूबाट उत्पन्न हुने दौडाको जोखिम हटाएर सुरक्षित रूपमा ब्राउज गर्न सक्षम बनाउँछ।';

  @override
  String get theme_profile_vision_impaired_title => 'दृष्टि कमजोर प्रोफाइल';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'एप्लिकेशनको दृश्यता सुधार गर्नुहोस्';

  @override
  String get theme_profile_vision_impaired_description =>
      'यो प्रोफाइलले एप्लिकेशनलाई धेरैजसो दृश्य कमजोरीहरू, जस्तै दृष्टि कमजोरी, टनेल दृष्टि, मोतियाबिन्दु, ग्लुकोमा र अन्यको लागि पहुँचयोग्य बनाउन अनुकूलन गर्दछ।';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-मैत्रीपूर्ण प्रोफाइल';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'थप एकाग्रता र कम विकर्षणहरू';

  @override
  String get theme_profile_adhd_friendly_description =>
      'यो प्रोफाइलले ADHD र न्यूरोडेभलपमेन्टल विकारहरू भएका व्यक्तिहरूलाई एप्लिकेशनका आवश्यक तत्वहरूमा नेभिगेट गर्न, पढ्न र ध्यान केन्द्रित गर्न सहयोग गर्न विकर्षणहरू उल्लेखनीय रूपमा कम गर्दछ।';

  @override
  String get the_settings_have_been_reset => 'सेटिङहरू पुनःसेट गरिएका छन्।';

  @override
  String get toggle_dark_mode => 'डार्क मोड टगल गर्नुहोस्';

  @override
  String get toggle_effects_mode => 'प्रभाव मोड टगल गर्नुहोस्';

  @override
  String get toggle_font_weight => 'फन्ट वजन टगल गर्नुहोस्';

  @override
  String get toggle_theme_profile => 'थिम प्रोफाइल टगल गर्नुहोस्';

  @override
  String get word_spacing => 'शब्द रिक्तता';
}
