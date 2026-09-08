// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AccessibilityLocalizationsHi extends AccessibilityLocalizations {
  AccessibilityLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get accessibility => 'पहुंचक्षमता';

  @override
  String get accessibilitySettings => 'पहुंचक्षमता सेटिंग्स';

  @override
  String get adjustBackgroundColors => 'पृष्ठभूमि के रंगों को समायोजित करें';

  @override
  String get adjustTextColors => 'टेक्स्ट रंगों को समायोजित करें';

  @override
  String get alignCenter => 'मध्य में संरेखित करें';

  @override
  String get alignLeft => 'बाएं संरेखित करें';

  @override
  String get alignRight => 'दाएं संरेखित करें';

  @override
  String get textAlignment => 'टेक्स्ट संरेखण';

  @override
  String get boldText => 'बोल्ड टेक्स्ट';

  @override
  String get changeBoldText => 'बोल्ड टेक्स्ट बदलें';

  @override
  String get changePagesBackgroundColor =>
      'पृष्ठों की पृष्ठभूमि का रंग बदलें: ';

  @override
  String get changeTextColor => 'टेक्स्ट का रंग बदलें: ';

  @override
  String get changeTextColorShade => 'रंग की छाया को बदलें: ';

  @override
  String get colorAdjustment => 'रंग समायोजन';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'सामान्य',
      'lowSaturation': 'कम संतृप्ति',
      'normal': 'सामान्य',
      'highSaturation': 'उच्च संतृप्ति',
      'monochrome': 'एक रंग',
      'highContrast': 'उच्च कंट्रास्ट',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'वर्तमान रंग प्रोफाइल है: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'शब्द रिक्तता कम करें';

  @override
  String get decrementLetterSpacing => 'अक्षर रिक्तता कम करें';

  @override
  String get decrementLineHeight => 'पंक्ति ऊंचाई कम करें';

  @override
  String get decrementTextScaleFactor => 'टेक्स्ट स्केल फैक्टर कम करें';

  @override
  String get effects => 'प्रभाव';

  @override
  String get expandText => 'टेक्स्ट विस्तृत करें';

  @override
  String get fontSize => 'फॉन्ट का आकार';

  @override
  String get increaseOrDecreaseWordSpacing => 'शब्द रिक्तता बढ़ाएं या घटाएं';

  @override
  String get increaseOrDecreaseLetterSpacing => 'अक्षर रिक्तता बढ़ाएं या घटाएं';

  @override
  String get increaseOrDecreaseLineHeight => 'पंक्ति ऊंचाई बढ़ाएं या घटाएं';

  @override
  String get increaseOrDecreaseTextSize => 'टेक्स्ट आकार बढ़ाएं या घटाएं';

  @override
  String get incrementWordSpacing => 'शब्द रिक्तता बढ़ाएं';

  @override
  String get incrementLetterSpacing => 'अक्षर रिक्तता बढ़ाएं';

  @override
  String get incrementLineHeight => 'पंक्ति ऊंचाई बढ़ाएं';

  @override
  String get incrementTextScaleFactor => 'टेक्स्ट स्केल फैक्टर बढ़ाएं';

  @override
  String get lessInfo => 'जानकारी छिपाएं';

  @override
  String get letterSpacing => 'अक्षर रिक्तता';

  @override
  String get lineHeight => 'पंक्ति ऊंचाई';

  @override
  String get moreInfo => 'जानकारी दिखाएं';

  @override
  String get readLess => 'कम पढ़ें';

  @override
  String get readMore => 'और पढ़ें';

  @override
  String get reduceEffects => 'स्क्रीन पर प्रभावों को कम करें';

  @override
  String get reduceText => 'टेक्स्ट कम करें';

  @override
  String get restoreSettings => 'सेटिंग्स बहाल करें';

  @override
  String get restoreMainColor => 'मुख्य रंग बहाल करें';

  @override
  String get returnToMainColors => 'मुख्य रंगों पर वापस जाएं';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get sizeAndTextDisplay => 'आकार और टेक्स्ट प्रदर्शन';

  @override
  String get sliderWordSpacing => 'शब्द रिक्तता स्लाइडर';

  @override
  String get sliderLetterSpacing => 'अक्षर रिक्तता स्लाइडर';

  @override
  String get sliderLineHeight => 'पंक्ति ऊंचाई स्लाइडर';

  @override
  String get themeMode => 'थीम';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'थीम प्रोफाइल पहचानी नहीं',
      'seizureSafe': 'दौरे से सुरक्षित',
      'visionImpaired': 'दृष्टि बाधित',
      'adhdFriendly': 'ADHD अनुकूल',
      'none': 'डिफ़ॉल्ट प्रोफ़ाइल',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'दौरे से सुरक्षित प्रोफाइल';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'प्रतिबिंब हटाएं और रंग कम करें';

  @override
  String get themeProfileSeizureSafeDescription =>
      'यह प्रोफाइल मिरगी वाले और दौरे के जोखिम वाले उपयोगकर्ताओं को नज़र आने वाली एनिमेशन और जोखिम भरे रंग संयोजनों से होने वाले दौरे के जोखिम को खत्म करके सुरक्षित रूप से ब्राउज़ करने की अनुमति देती है।';

  @override
  String get themeProfileVisionImpairedTitle => 'दृष्टि बाधित प्रोफाइल';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ऐप्लिकेशन की दृश्यता में सुधार करें';

  @override
  String get themeProfileVisionImpairedDescription =>
      'यह प्रोफाइल ऐप्लिकेशन को अधिकांश दृश्य हानियों जैसे दृष्टि हानि, टनल विजन, मोतियाबिंद, ग्लूकोमा और अधिक के लिए सुलभ बनाती है।';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-अनुकूल प्रोफाइल';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'अधिक एकाग्रता और कम विकर्षण';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'यह प्रोफाइल ADHD और न्यूरोडेवलपमेंटल डिसऑर्डर वाले लोगों को ऐप्लिकेशन के आवश्यक तत्वों पर नेविगेट, पढ़ने और ध्यान केंद्रित करने में मदद करने के लिए विकर्षणों को काफी कम करती है।';

  @override
  String get theSettingsHaveBeenReset => 'सेटिंग्स रीसेट कर दी गई हैं।';

  @override
  String get toggleDarkMode => 'डार्क मोड टॉगल करें';

  @override
  String get toggleEffectsMode => 'प्रभाव मोड टॉगल करें';

  @override
  String get toggleFontWeight => 'फॉन्ट वेट टॉगल करें';

  @override
  String get toggleThemeProfile => 'थीम प्रोफाइल टॉगल करें';

  @override
  String get wordSpacing => 'शब्द रिक्तता';

  @override
  String get accessibleFont => 'सुलभ फॉन्ट';

  @override
  String get accessibleFontSubtitle =>
      'बेहतर पठनीयता के लिए एक सुलभ फ़ॉन्ट का उपयोग करें';

  @override
  String get accessibleFontEnabled => 'सुलभ फॉन्ट सक्षम';

  @override
  String get accessibleFontDisabled => 'सुलभ फॉन्ट अक्षम';

  @override
  String get toggleAccessibleFont => 'सुलभ फॉन्ट टॉगल करें';

  @override
  String get settingsLoading => 'पहुंचक्षमता सेटिंग्स लोड हो रही हैं…';

  @override
  String get settingsLoadFailed => 'पहुंचक्षमता सेटिंग्स लोड नहीं की जा सकीं।';

  @override
  String get retry => 'पुनः प्रयास करें';
}
