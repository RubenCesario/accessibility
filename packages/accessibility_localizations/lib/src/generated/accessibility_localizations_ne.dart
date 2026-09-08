// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AccessibilityLocalizationsNe extends AccessibilityLocalizations {
  AccessibilityLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get accessibility => 'पहुँचयोग्यता';

  @override
  String get accessibilitySettings => 'पहुँचयोग्यता सेटिङहरू';

  @override
  String get adjustBackgroundColors => 'पृष्ठभूमि रङहरू समायोजन गर्नुहोस्';

  @override
  String get adjustTextColors => 'पाठ रङहरू समायोजन गर्नुहोस्';

  @override
  String get alignCenter => 'केन्द्रमा पङ्क्तिबद्ध गर्नुहोस्';

  @override
  String get alignLeft => 'बायाँ पङ्क्तिबद्ध गर्नुहोस्';

  @override
  String get alignRight => 'दायाँ पङ्क्तिबद्ध गर्नुहोस्';

  @override
  String get textAlignment => 'पाठ पङ्क्तिबद्धता';

  @override
  String get boldText => 'बोल्ड पाठ';

  @override
  String get changeBoldText => 'बोल्ड पाठ परिवर्तन गर्नुहोस्';

  @override
  String get changePagesBackgroundColor =>
      'पृष्ठहरूको पृष्ठभूमि रङ यसमा परिवर्तन गर्नहोस्: ';

  @override
  String get changeTextColor => 'पाठको रङ यसमा परिवर्तन गर्नुहोस्: ';

  @override
  String get changeTextColorShade => 'रङको छाया यसमा परिवर्तन गर्नुहोस्: ';

  @override
  String get colorAdjustment => 'रङ समायोजन';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'हालको रङ प्रोफाइल हो: ';

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
  String get decrementWordSpacing => 'शब्द रिक्तता घटाउनुहोस्';

  @override
  String get decrementLetterSpacing => 'अक्षर रिक्तता घटाउनुहोस्';

  @override
  String get decrementLineHeight => 'लाइन उचाई घटाउनुहोस्';

  @override
  String get decrementTextScaleFactor => 'पाठ स्केल फ्याक्टर घटाउनुहोस्';

  @override
  String get effects => 'प्रभावहरू';

  @override
  String get expandText => 'पाठ विस्तार गर्नुहोस्';

  @override
  String get fontSize => 'फन्ट आकार';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'शब्द रिक्तता बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'अक्षर रिक्तता बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increaseOrDecreaseLineHeight =>
      'लाइन उचाई बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get increaseOrDecreaseTextSize => 'पाठ आकार बढाउनुहोस् वा घटाउनुहोस्';

  @override
  String get incrementWordSpacing => 'शब्द रिक्तता बढाउनुहोस्';

  @override
  String get incrementLetterSpacing => 'अक्षर रिक्तता बढाउनुहोस्';

  @override
  String get incrementLineHeight => 'लाइन उचाई बढाउनुहोस्';

  @override
  String get incrementTextScaleFactor => 'पाठ स्केल फ्याक्टर बढाउनुहोस्';

  @override
  String get lessInfo => 'जानकारी लुकाउनुहोस्';

  @override
  String get letterSpacing => 'अक्षर रिक्तता';

  @override
  String get lineHeight => 'लाइन उचाई';

  @override
  String get moreInfo => 'जानकारी देखाउनुहोस्';

  @override
  String get readLess => 'कम पढ्नुहोस्';

  @override
  String get readMore => 'थप पढ्नुहोस्';

  @override
  String get reduceEffects => 'स्क्रिनमा प्रभावहरू कम गर्नुहोस्';

  @override
  String get reduceText => 'पाठ घटाउनुहोस्';

  @override
  String get restoreSettings => 'सेटिङहरू पुनर्स्थापना गर्नुहोस्';

  @override
  String get restoreMainColor => 'मुख्य रङ पुनर्स्थापना गर्नुहोस्';

  @override
  String get returnToMainColors => 'मुख्य रङहरूमा फर्कनुहोस्';

  @override
  String get settings => 'सेटिङहरू';

  @override
  String get sizeAndTextDisplay => 'आकार र पाठ प्रदर्शन';

  @override
  String get sliderWordSpacing => 'शब्द रिक्तता स्लाइडर';

  @override
  String get sliderLetterSpacing => 'अक्षर रिक्तता स्लाइडर';

  @override
  String get sliderLineHeight => 'लाइन उचाई स्लाइडर';

  @override
  String get themeMode => 'थिम';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'थिम प्रोफाइल पहिचान गरिएको छैन',
      'seizureSafe': 'दौडा सुरक्षित',
      'visionImpaired': 'दृष्टि कमजोर',
      'adhdFriendly': 'ADHD मैत्रीपूर्ण',
      'none': 'पूर्वनिर्धारित प्रोफाइल',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'दौडा सुरक्षित प्रोफाइल';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'प्रतिबिम्बहरू हटाउनुहोस् र रङ कम गर्नुहोस्';

  @override
  String get themeProfileSeizureSafeDescription =>
      'यो प्रोफाइलले छारेरोग भएका र दौडाको जोखिममा रहेका प्रयोगकर्ताहरूलाई चम्किलो एनिमेसन र जोखिमपूर्ण रङ संयोजनहरूबाट उत्पन्न हुने दौडाको जोखिम हटाएर सुरक्षित रूपमा ब्राउज गर्न सक्षम बनाउँछ।';

  @override
  String get themeProfileVisionImpairedTitle => 'दृष्टि कमजोर प्रोफाइल';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'एप्लिकेशनको दृश्यता सुधार गर्नुहोस्';

  @override
  String get themeProfileVisionImpairedDescription =>
      'यो प्रोफाइलले एप्लिकेशनलाई धेरैजसो दृश्य कमजोरीहरू, जस्तै दृष्टि कमजोरी, टनेल दृष्टि, मोतियाबिन्दु, ग्लुकोमा र अन्यको लागि पहुँचयोग्य बनाउन अनुकूलन गर्दछ।';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-मैत्रीपूर्ण प्रोफाइल';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'थप एकाग्रता र कम विकर्षणहरू';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'यो प्रोफाइलले ADHD र न्यूरोडेभलपमेन्टल विकारहरू भएका व्यक्तिहरूलाई एप्लिकेशनका आवश्यक तत्वहरूमा नेभिगेट गर्न, पढ्न र ध्यान केन्द्रित गर्न सहयोग गर्न विकर्षणहरू उल्लेखनीय रूपमा कम गर्दछ।';

  @override
  String get theSettingsHaveBeenReset => 'सेटिङहरू पुनःसेट गरिएका छन्।';

  @override
  String get toggleDarkMode => 'डार्क मोड टगल गर्नुहोस्';

  @override
  String get toggleEffectsMode => 'प्रभाव मोड टगल गर्नुहोस्';

  @override
  String get toggleFontWeight => 'फन्ट वजन टगल गर्नुहोस्';

  @override
  String get toggleThemeProfile => 'थिम प्रोफाइल टगल गर्नुहोस्';

  @override
  String get wordSpacing => 'शब्द रिक्तता';

  @override
  String get accessibleFont => 'पहुँचयोग्य फन्ट';

  @override
  String get accessibleFontSubtitle =>
      'राम्रो पठनीयताका लागि पहुँचयोग्य फन्ट प्रयोग गर्नुहोस्';

  @override
  String get accessibleFontEnabled => 'पहुँचयोग्य फन्ट सक्षम';

  @override
  String get accessibleFontDisabled => 'पहुँचयोग्य फन्ट असक्षम';

  @override
  String get toggleAccessibleFont => 'पहुँचयोग्य फन्ट टगल गर्नुहोस्';

  @override
  String get settingsLoading => 'पहुँचयोग्यता सेटिङहरू लोड हुँदैछ…';

  @override
  String get settingsLoadFailed => 'पहुँचयोग्यता सेटिङहरू लोड गर्न सकिएन।';

  @override
  String get retry => 'फेरि प्रयास गर्नुहोस्';
}
