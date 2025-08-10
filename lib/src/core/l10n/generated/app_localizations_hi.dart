// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AccessibilityLocalizationsHi extends AccessibilityLocalizations {
  AccessibilityLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get accessibility => 'पहुंचक्षमता';

  @override
  String get accessibility_settings => 'पहुंचक्षमता सेटिंग्स';

  @override
  String get adjust_background_colors => 'पृष्ठभूमि के रंगों को समायोजित करें';

  @override
  String get adjust_text_colors => 'टेक्स्ट रंगों को समायोजित करें';

  @override
  String get align_center => 'मध्य में संरेखित करें';

  @override
  String get align_left => 'बाएं संरेखित करें';

  @override
  String get align_right => 'दाएं संरेखित करें';

  @override
  String get bold_text => 'बोल्ड टेक्स्ट';

  @override
  String get change_bold_text => 'बोल्ड टेक्स्ट बदलें';

  @override
  String get change_pages_background_color =>
      'पृष्ठों की पृष्ठभूमि का रंग बदलें: ';

  @override
  String get change_text_color => 'टेक्स्ट का रंग बदलें: ';

  @override
  String get change_text_color_shade => 'रंग की छाया को बदलें: ';

  @override
  String get color_adjustment => 'रंग समायोजन';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'सामान्य',
        'lowSaturation': 'कम संतृप्ति',
        'normal': 'सामान्य',
        'highSaturation': 'उच्च संतृप्ति',
        'monochrome': 'एक रंग',
        'highContrast': 'उच्च कंट्रास्ट',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'वर्तमान रंग प्रोफाइल है: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'रंग पहचाना नहीं',
        'cF44336': 'लाल',
        'cE91E63': 'गुलाबी',
        'c9C27B0': 'बैंगनी',
        'c673AB7': 'गहरा बैंगनी',
        'c3F51B5': 'नीला-बैंगनी',
        'c2196F3': 'नीला',
        'c03A9F4': 'हल्का नीला',
        'c00BCD4': 'हरा-नीला',
        'c009688': 'गहरा हरा-नीला',
        'c4CAF50': 'हरा',
        'c8BC34A': 'हल्का हरा',
        'cCDDC39': 'नींबू रंग',
        'cFFEB3B': 'पीला',
        'cFFC107': 'अंबर',
        'cFF9800': 'नारंगी',
        'cFF5722': 'गहरा नारंगी',
        'c795548': 'भूरा',
        'c9E9E9E': 'स्लेटी',
        'c607D8B': 'नीला-स्लेटी',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'शब्द रिक्तता कम करें';

  @override
  String get decrement_letter_spacing => 'अक्षर रिक्तता कम करें';

  @override
  String get decrement_line_height => 'पंक्ति ऊंचाई कम करें';

  @override
  String get decrement_text_scale_factor => 'टेक्स्ट स्केल फैक्टर कम करें';

  @override
  String get effects => 'प्रभाव';

  @override
  String get expand_text => 'टेक्स्ट विस्तृत करें';

  @override
  String get font_size => 'फॉन्ट का आकार';

  @override
  String get increase_or_decrease_word_spacing =>
      'शब्द रिक्तता बढ़ाएं या घटाएं';

  @override
  String get increase_or_decrease_letter_spacing =>
      'अक्षर रिक्तता बढ़ाएं या घटाएं';

  @override
  String get increase_or_decrease_line_height => 'पंक्ति ऊंचाई बढ़ाएं या घटाएं';

  @override
  String get increase_or_decrease_text_size => 'टेक्स्ट आकार बढ़ाएं या घटाएं';

  @override
  String get increment_word_spacing => 'शब्द रिक्तता बढ़ाएं';

  @override
  String get increment_letter_spacing => 'अक्षर रिक्तता बढ़ाएं';

  @override
  String get increment_line_height => 'पंक्ति ऊंचाई बढ़ाएं';

  @override
  String get increment_text_scale_factor => 'टेक्स्ट स्केल फैक्टर बढ़ाएं';

  @override
  String get less_info => 'जानकारी छिपाएं';

  @override
  String get letter_spacing => 'अक्षर रिक्तता';

  @override
  String get line_height => 'पंक्ति ऊंचाई';

  @override
  String get more_info => 'जानकारी दिखाएं';

  @override
  String get read_less => 'कम पढ़ें';

  @override
  String get read_more => 'और पढ़ें';

  @override
  String get reduce_effects => 'स्क्रीन पर प्रभावों को कम करें';

  @override
  String get reduce_text => 'टेक्स्ट कम करें';

  @override
  String get restore_settings => 'सेटिंग्स बहाल करें';

  @override
  String get restore_main_color => 'मुख्य रंग बहाल करें';

  @override
  String get return_to_main_colors => 'मुख्य रंगों पर वापस जाएं';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get size_and_text_display => 'आकार और टेक्स्ट प्रदर्शन';

  @override
  String get slider_word_spacing => 'शब्द रिक्तता स्लाइडर';

  @override
  String get slider_letter_spacing => 'अक्षर रिक्तता स्लाइडर';

  @override
  String get slider_line_height => 'पंक्ति ऊंचाई स्लाइडर';

  @override
  String get theme_mode => 'थीम';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'थीम प्रोफाइल पहचानी नहीं',
        'seizureSafe': 'दौरे से सुरक्षित',
        'visionImpaired': 'दृष्टि बाधित',
        'adhdFriendly': 'ADHD अनुकूल',
        'none': 'डिफॉल्ट',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'दौरे से सुरक्षित प्रोफाइल';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'प्रतिबिंब हटाएं और रंग कम करें';

  @override
  String get theme_profile_seizure_safe_description =>
      'यह प्रोफाइल मिरगी वाले और दौरे के जोखिम वाले उपयोगकर्ताओं को नज़र आने वाली एनिमेशन और जोखिम भरे रंग संयोजनों से होने वाले दौरे के जोखिम को खत्म करके सुरक्षित रूप से ब्राउज़ करने की अनुमति देती है।';

  @override
  String get theme_profile_vision_impaired_title => 'दृष्टि बाधित प्रोफाइल';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ऐप्लिकेशन की दृश्यता में सुधार करें';

  @override
  String get theme_profile_vision_impaired_description =>
      'यह प्रोफाइल ऐप्लिकेशन को अधिकांश दृश्य हानियों जैसे दृष्टि हानि, टनल विजन, मोतियाबिंद, ग्लूकोमा और अधिक के लिए सुलभ बनाती है।';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-अनुकूल प्रोफाइल';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'अधिक एकाग्रता और कम विकर्षण';

  @override
  String get theme_profile_adhd_friendly_description =>
      'यह प्रोफाइल ADHD और न्यूरोडेवलपमेंटल डिसऑर्डर वाले लोगों को ऐप्लिकेशन के आवश्यक तत्वों पर नेविगेट, पढ़ने और ध्यान केंद्रित करने में मदद करने के लिए विकर्षणों को काफी कम करती है।';

  @override
  String get the_settings_have_been_reset => 'सेटिंग्स रीसेट कर दी गई हैं।';

  @override
  String get toggle_dark_mode => 'डार्क मोड टॉगल करें';

  @override
  String get toggle_effects_mode => 'प्रभाव मोड टॉगल करें';

  @override
  String get toggle_font_weight => 'फॉन्ट वेट टॉगल करें';

  @override
  String get toggle_theme_profile => 'थीम प्रोफाइल टॉगल करें';

  @override
  String get word_spacing => 'शब्द रिक्तता';
}
