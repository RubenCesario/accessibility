// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AccessibilityLocalizationsMr extends AccessibilityLocalizations {
  AccessibilityLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get accessibility => 'सुगम्यता';

  @override
  String get accessibility_settings => 'सुगम्यता सेटिंग्ज';

  @override
  String get adjust_background_colors => 'बॅकग्राउंड रंग समायोजित करा';

  @override
  String get adjust_text_colors => 'मजकूर रंग समायोजित करा';

  @override
  String get align_center => 'मध्यभागी संरेखित करा';

  @override
  String get align_left => 'डावीकडे संरेखित करा';

  @override
  String get align_right => 'उजवीकडे संरेखित करा';

  @override
  String get bold_text => 'ठळक मजकूर';

  @override
  String get change_bold_text => 'ठळक मजकूर बदला';

  @override
  String get change_pages_background_color =>
      'पृष्ठांचा बॅकग्राउंड रंग यामध्ये बदला: ';

  @override
  String get change_text_color => 'मजकुराचा रंग यामध्ये बदला: ';

  @override
  String get change_text_color_shade => 'रंगाची छटा यामध्ये बदला: ';

  @override
  String get color_adjustment => 'रंग समायोजन';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'सामान्य',
      'lowSaturation': 'कमी संपृक्तता',
      'normal': 'सामान्य',
      'highSaturation': 'उच्च संपृक्तता',
      'monochrome': 'मोनोक्रोम',
      'highContrast': 'उच्च कॉन्ट्रास्ट',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'वर्तमान रंग प्रोफाइल आहे: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'रंग ओळखला नाही',
      'cF44336': 'लाल',
      'cE91E63': 'गुलाबी',
      'c9C27B0': 'जांभळा',
      'c673AB7': 'गडद जांभळा',
      'c3F51B5': 'इंडिगो',
      'c2196F3': 'निळा',
      'c03A9F4': 'प्रकाश निळा',
      'c00BCD4': 'सायन',
      'c009688': 'टील',
      'c4CAF50': 'हिरवा',
      'c8BC34A': 'प्रकाश हिरवा',
      'cCDDC39': 'लिंबू',
      'cFFEB3B': 'पिवळा',
      'cFFC107': 'अँबर',
      'cFF9800': 'नारिंगी',
      'cFF5722': 'गडद नारिंगी',
      'c795548': 'भूरा',
      'c9E9E9E': 'राखाडी',
      'c607D8B': 'निळसर राखाडी',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'शब्द अंतर कमी करा';

  @override
  String get decrement_letter_spacing => 'अक्षर अंतर कमी करा';

  @override
  String get decrement_line_height => 'ओळ उंची कमी करा';

  @override
  String get decrement_text_scale_factor => 'मजकूर प्रमाण घटक कमी करा';

  @override
  String get effects => 'प्रभाव';

  @override
  String get expand_text => 'मजकूर विस्तारित करा';

  @override
  String get font_size => 'फॉन्ट आकार';

  @override
  String get increase_or_decrease_word_spacing =>
      'शब्द अंतर वाढवा किंवा कमी करा';

  @override
  String get increase_or_decrease_letter_spacing =>
      'अक्षर अंतर वाढवा किंवा कमी करा';

  @override
  String get increase_or_decrease_line_height => 'ओळ उंची वाढवा किंवा कमी करा';

  @override
  String get increase_or_decrease_text_size => 'मजकूर आकार वाढवा किंवा कमी करा';

  @override
  String get increment_word_spacing => 'शब्द अंतर वाढवा';

  @override
  String get increment_letter_spacing => 'अक्षर अंतर वाढवा';

  @override
  String get increment_line_height => 'ओळ उंची वाढवा';

  @override
  String get increment_text_scale_factor => 'मजकूर प्रमाण घटक वाढवा';

  @override
  String get less_info => 'माहिती लपवा';

  @override
  String get letter_spacing => 'अक्षर अंतर';

  @override
  String get line_height => 'ओळ उंची';

  @override
  String get more_info => 'माहिती दाखवा';

  @override
  String get read_less => 'कमी वाचा';

  @override
  String get read_more => 'अधिक वाचा';

  @override
  String get reduce_effects => 'स्क्रीनवरील प्रभाव कमी करा';

  @override
  String get reduce_text => 'मजकूर कमी करा';

  @override
  String get restore_settings => 'सेटिंग्ज पुनर्संचयित करा';

  @override
  String get restore_main_color => 'मुख्य रंग पुनर्संचयित करा';

  @override
  String get return_to_main_colors => 'मुख्य रंगांकडे परत जा';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get size_and_text_display => 'आकार आणि मजकूर प्रदर्शन';

  @override
  String get slider_word_spacing => 'शब्द अंतर स्लायडर';

  @override
  String get slider_letter_spacing => 'अक्षर अंतर स्लायडर';

  @override
  String get slider_line_height => 'ओळ उंची स्लायडर';

  @override
  String get theme_mode => 'थीम';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'थीम प्रोफाइल ओळखले नाही',
      'seizureSafe': 'अपस्मार सुरक्षित',
      'visionImpaired': 'दृष्टी दोष आहे',
      'adhdFriendly': 'ADHD-अनुकूल',
      'none': 'डीफॉल्ट',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'अपस्मार सुरक्षित प्रोफाइल';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'प्रतिबिंब काढा आणि रंग कमी करा';

  @override
  String get theme_profile_seizure_safe_description =>
      'हे प्रोफाइल फ्लॅशिंग अॅनिमेशन आणि जोखीमपूर्ण रंग संयोजनांमुळे होणार्या अपस्माराचा धोका दूर करून फिट्स आणि अपस्माराच्या धोक्यात असलेल्या वापरकर्त्यांना सुरक्षितपणे ब्राउझ करण्यास सक्षम करते.';

  @override
  String get theme_profile_vision_impaired_title => 'दृष्टी-दोष प्रोफाइल';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'अनुप्रयोगाची दृश्यता सुधारा';

  @override
  String get theme_profile_vision_impaired_description =>
      'हे प्रोफाइल दृष्टी दोष, टनेल व्हिजन, मोतिबिंदू, काचबिंदू आणि इतर बहुतेक दृश्य दोषांसाठी अनुप्रयोग सुगम करण्यासाठी अनुकूलित करते.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-अनुकूल प्रोफाइल';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'अधिक एकाग्रता आणि कमी विक्षेपण';

  @override
  String get theme_profile_adhd_friendly_description =>
      'हे प्रोफाइल ADHD आणि न्यूरोडेव्हलपमेंटल डिसऑर्डर असलेल्या लोकांना अनुप्रयोगाच्या आवश्यक घटकांवर सहजपणे नेव्हिगेट, वाचन आणि लक्ष केंद्रित करण्यास मदत करण्यासाठी विक्षेपण लक्षणीयरीत्या कमी करते.';

  @override
  String get the_settings_have_been_reset => 'सेटिंग्ज रीसेट केले गेले आहेत.';

  @override
  String get toggle_dark_mode => 'डार्क मोड टॉगल करा';

  @override
  String get toggle_effects_mode => 'प्रभाव मोड टॉगल करा';

  @override
  String get toggle_font_weight => 'फॉन्ट वजन टॉगल करा';

  @override
  String get toggle_theme_profile => 'थीम प्रोफाइल टॉगल करा';

  @override
  String get word_spacing => 'शब्द अंतर';
}
