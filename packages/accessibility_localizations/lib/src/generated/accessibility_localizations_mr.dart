// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AccessibilityLocalizationsMr extends AccessibilityLocalizations {
  AccessibilityLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get accessibility => 'सुगम्यता';

  @override
  String get accessibilitySettings => 'सुगम्यता सेटिंग्ज';

  @override
  String get adjustBackgroundColors => 'बॅकग्राउंड रंग समायोजित करा';

  @override
  String get adjustTextColors => 'मजकूर रंग समायोजित करा';

  @override
  String get alignCenter => 'मध्यभागी संरेखित करा';

  @override
  String get alignLeft => 'डावीकडे संरेखित करा';

  @override
  String get alignRight => 'उजवीकडे संरेखित करा';

  @override
  String get textAlignment => 'मजकूर संरेखण';

  @override
  String get boldText => 'ठळक मजकूर';

  @override
  String get changeBoldText => 'ठळक मजकूर बदला';

  @override
  String get changePagesBackgroundColor =>
      'पृष्ठांचा बॅकग्राउंड रंग यामध्ये बदला: ';

  @override
  String get changeTextColor => 'मजकुराचा रंग यामध्ये बदला: ';

  @override
  String get changeTextColorShade => 'रंगाची छटा यामध्ये बदला: ';

  @override
  String get colorAdjustment => 'रंग समायोजन';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'वर्तमान रंग प्रोफाइल आहे: ';

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
  String get decrementWordSpacing => 'शब्द अंतर कमी करा';

  @override
  String get decrementLetterSpacing => 'अक्षर अंतर कमी करा';

  @override
  String get decrementLineHeight => 'ओळ उंची कमी करा';

  @override
  String get decrementTextScaleFactor => 'मजकूर प्रमाण घटक कमी करा';

  @override
  String get effects => 'प्रभाव';

  @override
  String get expandText => 'मजकूर विस्तारित करा';

  @override
  String get fontSize => 'फॉन्ट आकार';

  @override
  String get increaseOrDecreaseWordSpacing => 'शब्द अंतर वाढवा किंवा कमी करा';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'अक्षर अंतर वाढवा किंवा कमी करा';

  @override
  String get increaseOrDecreaseLineHeight => 'ओळ उंची वाढवा किंवा कमी करा';

  @override
  String get increaseOrDecreaseTextSize => 'मजकूर आकार वाढवा किंवा कमी करा';

  @override
  String get incrementWordSpacing => 'शब्द अंतर वाढवा';

  @override
  String get incrementLetterSpacing => 'अक्षर अंतर वाढवा';

  @override
  String get incrementLineHeight => 'ओळ उंची वाढवा';

  @override
  String get incrementTextScaleFactor => 'मजकूर प्रमाण घटक वाढवा';

  @override
  String get lessInfo => 'माहिती लपवा';

  @override
  String get letterSpacing => 'अक्षर अंतर';

  @override
  String get lineHeight => 'ओळ उंची';

  @override
  String get moreInfo => 'माहिती दाखवा';

  @override
  String get readLess => 'कमी वाचा';

  @override
  String get readMore => 'अधिक वाचा';

  @override
  String get reduceEffects => 'स्क्रीनवरील प्रभाव कमी करा';

  @override
  String get reduceText => 'मजकूर कमी करा';

  @override
  String get restoreSettings => 'सेटिंग्ज पुनर्संचयित करा';

  @override
  String get restoreMainColor => 'मुख्य रंग पुनर्संचयित करा';

  @override
  String get returnToMainColors => 'मुख्य रंगांकडे परत जा';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get sizeAndTextDisplay => 'आकार आणि मजकूर प्रदर्शन';

  @override
  String get sliderWordSpacing => 'शब्द अंतर स्लायडर';

  @override
  String get sliderLetterSpacing => 'अक्षर अंतर स्लायडर';

  @override
  String get sliderLineHeight => 'ओळ उंची स्लायडर';

  @override
  String get themeMode => 'थीम';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'थीम प्रोफाइल ओळखले नाही',
      'seizureSafe': 'अपस्मार सुरक्षित',
      'visionImpaired': 'दृष्टी दोष आहे',
      'adhdFriendly': 'ADHD-अनुकूल',
      'none': 'डीफॉल्ट प्रोफाइल',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'अपस्मार सुरक्षित प्रोफाइल';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'प्रतिबिंब काढा आणि रंग कमी करा';

  @override
  String get themeProfileSeizureSafeDescription =>
      'हे प्रोफाइल फ्लॅशिंग अॅनिमेशन आणि जोखीमपूर्ण रंग संयोजनांमुळे होणार्या अपस्माराचा धोका दूर करून फिट्स आणि अपस्माराच्या धोक्यात असलेल्या वापरकर्त्यांना सुरक्षितपणे ब्राउझ करण्यास सक्षम करते.';

  @override
  String get themeProfileVisionImpairedTitle => 'दृष्टी-दोष प्रोफाइल';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'अनुप्रयोगाची दृश्यता सुधारा';

  @override
  String get themeProfileVisionImpairedDescription =>
      'हे प्रोफाइल दृष्टी दोष, टनेल व्हिजन, मोतिबिंदू, काचबिंदू आणि इतर बहुतेक दृश्य दोषांसाठी अनुप्रयोग सुगम करण्यासाठी अनुकूलित करते.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-अनुकूल प्रोफाइल';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'अधिक एकाग्रता आणि कमी विक्षेपण';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'हे प्रोफाइल ADHD आणि न्यूरोडेव्हलपमेंटल डिसऑर्डर असलेल्या लोकांना अनुप्रयोगाच्या आवश्यक घटकांवर सहजपणे नेव्हिगेट, वाचन आणि लक्ष केंद्रित करण्यास मदत करण्यासाठी विक्षेपण लक्षणीयरीत्या कमी करते.';

  @override
  String get theSettingsHaveBeenReset => 'सेटिंग्ज रीसेट केले गेले आहेत.';

  @override
  String get toggleDarkMode => 'डार्क मोड टॉगल करा';

  @override
  String get toggleEffectsMode => 'प्रभाव मोड टॉगल करा';

  @override
  String get toggleFontWeight => 'फॉन्ट वजन टॉगल करा';

  @override
  String get toggleThemeProfile => 'थीम प्रोफाइल टॉगल करा';

  @override
  String get wordSpacing => 'शब्द अंतर';

  @override
  String get accessibleFont => 'प्रवेशयोग्य फॉन्ट';

  @override
  String get accessibleFontSubtitle =>
      'अधिक चांगल्या वाचनीयतेसाठी प्रवेशयोग्य फॉन्ट वापरा';

  @override
  String get accessibleFontEnabled => 'प्रवेशयोग्य फॉन्ट सक्षम';

  @override
  String get accessibleFontDisabled => 'प्रवेशयोग्य फॉन्ट अक्षम';

  @override
  String get toggleAccessibleFont => 'प्रवेशयोग्य फॉन्ट टॉगल करा';

  @override
  String get settingsLoading => 'सुगम्यता सेटिंग्ज लोड होत आहेत…';

  @override
  String get settingsLoadFailed => 'सुगम्यता सेटिंग्ज लोड करता आली नाहीत.';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';
}
