// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tibetan (`bo`).
class AccessibilityLocalizationsBo extends AccessibilityLocalizations {
  AccessibilityLocalizationsBo([String locale = 'bo']) : super(locale);

  @override
  String get accessibility => 'འཇུག་སྤྱོད་ཚད་ལྡན་';

  @override
  String get accessibilitySettings => 'འཇུག་སྤྱོད་ཚད་ལྡན་སྒྲིག་སྟངས་';

  @override
  String get adjustBackgroundColors =>
      'རྒྱབ་སྤྱོད་ཀྱི་ཚོན་མདོག་སྒྲིག་འགོད་བྱོས་';

  @override
  String get adjustTextColors => 'ཡིག་དོན་ཀྱི་ཚོན་མདོག་སྒྲིག་འགོད་བྱོས་';

  @override
  String get alignCenter => 'དབུས་སུ་བཀོལ་སྒྲིག་བྱོས་';

  @override
  String get alignLeft => 'གཡས་སུ་བཀོལ་སྒྲིག་བྱོས་';

  @override
  String get alignRight => 'གཡོན་སུ་བཀོལ་སྒྲིག་བྱོས་';

  @override
  String get textAlignment => 'ཡི་གེ་སྒྲིག་འཇོག';

  @override
  String get boldText => 'རྒྱས་པའི་ཡིག་དོན་';

  @override
  String get changeBoldText => 'རྒྱས་པའི་ཡིག་དོན་སྒྲིག་སྟངས་བརྗེ་བ་';

  @override
  String get changePagesBackgroundColor =>
      'ཤོག་ངོས་ཀྱི་རྒྱབ་སྤྱོད་ཚོན་མདོག་སོར་བཅོས་:';

  @override
  String get changeTextColor => 'ཡིག་དོན་ཀྱི་ཚོན་མདོག་སོར་བཅོས་:';

  @override
  String get changeTextColorShade => 'ཚོན་མདོག་གི་གདན་སྒྲིག་སོར་བཅོས་:';

  @override
  String get colorAdjustment => 'ཚོན་མདོག་སྒྲིག་འགོད་';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'སྤྱི་ཚད',
      'lowSaturation': 'ཆུ་ཚད་ཉུང་བ',
      'normal': 'སྤྱི་ཚད',
      'highSaturation': 'ཆུ་ཚད་མང་བ',
      'monochrome': 'ཚོན་མདོག་གཅིག་པ',
      'highContrast': 'ཀོན་ཐྲ་ཆེ་བ',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ད་ལྟའི་ཚོན་མདོག་གི་སྤྱི་རྣམ་ནི: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'ཚོན་མདོག་ངོས་འཛིན་མ་བྱུང་',
      'cF44336': 'དམར་པོ',
      'cE91E63': 'སྤྲེར་སྔོན་པོ',
      'c9C27B0': 'སྨུག་པོ',
      'c673AB7': 'སྨུག་པོ་མདོག་ཆེན་པོ',
      'c3F51B5': 'མཐིང་ནག',
      'c2196F3': 'སྔོན་པོ',
      'c03A9F4': 'སྔོན་པོ་ཡལ་བ',
      'c00BCD4': 'མཐིང་སྔོན་པ',
      'c009688': 'ནུབ་ཆུ',
      'c4CAF50': 'ལྗང་ཁུ',
      'c8BC34A': 'ལྗང་ཁུ་ཡལ་བ',
      'cCDDC39': 'ཚོས་གཞོང་',
      'cFFEB3B': 'སེར་པོ',
      'cFFC107': 'གསེར་སེར',
      'cFF9800': 'ལི་ཅི',
      'cFF5722': 'ལི་ཅི་དམར་པོ',
      'c795548': 'སྨུག་པོ',
      'c9E9E9E': 'དཀར་པོ',
      'c607D8B': 'སྔོན་པོ་སྨུག་པ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'ཚིག་གི་བར་ཐག་ཉུང་བཏང་བ';

  @override
  String get decrementLetterSpacing => 'ཡིག་འབྲུའི་བར་ཐག་ཉུང་བཏང་བ';

  @override
  String get decrementLineHeight => 'ཐིག་ཚད་ཉུང་བཏང་བ';

  @override
  String get decrementTextScaleFactor => 'ཡིག་ཆའི་ཚད་ཀྱི་ཆ་ཕྲ་ཉུང་བཏང་བ';

  @override
  String get effects => 'འབྲེལ་ཤུགས';

  @override
  String get expandText => 'ཡིག་ཆ་རྒྱ་བསྐྱེད་བྱོས';

  @override
  String get fontSize => 'ཡིག་གཟུགས་ཀྱི་ཆེ་ཆུང་';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'ཚིག་གི་བར་ཐག་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'ཡིག་འབྲུའི་བར་ཐག་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ';

  @override
  String get increaseOrDecreaseLineHeight =>
      'ཐིག་ཚད་ཇེ་མཐོར་ཡང་ན་ཇེ་དམན་དུ་གཏོང་བ';

  @override
  String get increaseOrDecreaseTextSize =>
      'ཡིག་ཆའི་ཆེ་ཆུང་ཇེ་ཆེར་ཡང་ན་ཇེ་ཆུང་དུ་གཏོང་བ';

  @override
  String get incrementWordSpacing => 'ཚིག་གི་བར་ཐག་ཇེ་ཆེར་གཏོང་བ';

  @override
  String get incrementLetterSpacing => 'ཡིག་འབྲུའི་བར་ཐག་ཇེ་ཆེར་གཏོང་བ';

  @override
  String get incrementLineHeight => 'ཐིག་ཚད་ཇེ་མཐོར་གཏོང་བ';

  @override
  String get incrementTextScaleFactor => 'ཡིག་ཆའི་ཚད་ཀྱི་ཆ་ཕྲ་ཇེ་ཆེར་གཏོང་བ';

  @override
  String get lessInfo => 'ཆ་འཕྲིན་སྦ་བ';

  @override
  String get letterSpacing => 'ཡིག་འབྲུའི་བར་ཐག';

  @override
  String get lineHeight => 'ཐིག་ཚད';

  @override
  String get moreInfo => 'ཆ་འཕྲིན་སྟོན་པ';

  @override
  String get readLess => 'ཉུང་ཙམ་ཀློག';

  @override
  String get readMore => 'མང་པོ་ཀློག';

  @override
  String get reduceEffects => 'འཆར་ངོས་སུ་འབྲེལ་ཤུགས་ཉུང་དུ་གཏོང་བ';

  @override
  String get reduceText => 'ཡིག་ཆ་ཉུང་དུ་གཏོང་བ';

  @override
  String get restoreSettings => 'སྔོན་གྱི་སྒྲིག་སྟངས་སུ་སླར་གསོ';

  @override
  String get restoreMainColor => 'གཙོ་བོའི་ཚོན་མདོག་སླར་གསོ';

  @override
  String get returnToMainColors => 'གཙོ་བོའི་ཚོན་མདོག་ཏུ་ལོག';

  @override
  String get settings => 'སྒྲིག་སྟངས';

  @override
  String get sizeAndTextDisplay => 'ཚད་དང་ཡིག་ཆའི་འཆར་སྟངས';

  @override
  String get sliderWordSpacing => 'ཚིག་གི་བར་ཐག་སྒྲུང་འགྲིལ';

  @override
  String get sliderLetterSpacing => 'ཡིག་འབྲུའི་བར་ཐག་སྒྲུང་འགྲིལ';

  @override
  String get sliderLineHeight => 'ཐིག་ཚད་སྒྲུང་འགྲིལ';

  @override
  String get themeMode => 'དཔེ་སྒྲོམ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'དཔེ་སྒྲོམ་ངོས་འཛིན་མ་བྱུང་',
      'seizureSafe': 'ཉེན་མེད',
      'visionImpaired': 'མིག་གི་ནུས་པ་ཉམས་པ',
      'adhdFriendly': 'ADHD ལ་མཛའ་བ',
      'none': 'སྔོན་སྒྲིག་གི་རྣམ་གྲངས།',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'ཉེན་མེད་ཀྱི་དཔེ་སྒྲོམ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'འོད་འཕྲོ་སྤངས་ཏེ་ཚོན་མདོག་ཉུང་དུ་གཏོང་བ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'འདི་ནི་ཉེན་མེད་ཀྱི་དཔེ་སྒྲོམ་ཡིན་པས་ཚོར་ཤུགས་ཀྱི་ནད་ཅན་དང་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་བདེ་འཇགས་སུ་བལྟ་ཐུབ་པ་དང་། འོད་འཕྲོ་དང་ཚོན་མདོག་གི་སྦྱོར་ཚུལ་སོགས་ཀྱིས་བྱུང་བའི་ཉེན་ཁ་སྤོང་བར་བྱེད་པ་ཡིན';

  @override
  String get themeProfileVisionImpairedTitle =>
      'མིག་གི་ནུས་པ་ཉམས་པའི་དཔེ་སྒྲོམ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ཆ་འཕྲིན་གྱི་མཐོང་རུང་ཡོད་པར་བྱེད་པ';

  @override
  String get themeProfileVisionImpairedDescription =>
      'འདི་ནི་མིག་གི་ནུས་པ་ཉམས་པ་དང་། མིག་ཤུལ་ཆུང་བ། མིག་སྨུག་རིམས་དང་མིག་ཁྲག་ཁྲ་བ་སོགས་ཀྱི་ནད་ཀྱིས་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་བདེ་བླག་ཏུ་བེད་སྤྱོད་བྱེད་ཐུབ་པའི་དཔེ་སྒྲོམ་ཞིག་ཡིན';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD ལ་མཛའ་བའི་དཔེ་སྒྲོམ';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'ཇེ་ཙོ་དང་ཡིད་འཕྲོག་ཉུང་བ';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'འདི་ནི་ADHD དང་ཀླད་ཀྱི་འཕེལ་རིམ་ནད་ཀྱིས་ཉེན་ཁ་ཡོད་མཁན་རྣམས་ལ་ཆ་འཕྲིན་གྱི་གལ་ཆེའི་ཆ་ཤས་ལ་གཟིགས་ཐུབ་པ་དང་། ཀློག་པ་དང་ལག་ལེན་བྱེད་པར་བདེ་བླག་ཏུ་བྱེད་པའི་ཆེད་དུ་ཡིད་འཕྲོག་པ་ཉུང་དུ་གཏོང་བའི་དཔེ་སྒྲོམ་ཞིག་ཡིན';

  @override
  String get theSettingsHaveBeenReset =>
      'སྒྲིག་སྟངས་ཚང་མ་སྔོན་གྱི་གནས་སུ་ཕྱིར་བསྒྱུར་བྱུང་སོང་';

  @override
  String get toggleDarkMode => 'མུན་ནག་གི་དཔེ་སྒྲོམ་བརྗེ་བ';

  @override
  String get toggleEffectsMode => 'འབྲེལ་ཤུགས་ཀྱི་དཔེ་སྒྲོམ་བརྗེ་བ';

  @override
  String get toggleFontWeight => 'ཡིག་གཟུགས་ཀྱི་ལྗིད་ཚད་བརྗེ་བ';

  @override
  String get toggleThemeProfile => 'དཔེ་སྒྲོམ་གྱི་སྤྱི་རྣམ་བརྗེ་བ';

  @override
  String get wordSpacing => 'ཚིག་གི་བར་ཐག';

  @override
  String get accessibleFont => 'སྤྱོད་བདེའི་ཡིག་གཟུགས';

  @override
  String get accessibleFontSubtitle =>
      'ཀློག་བདེ་རུ་གཏོང་བའི་ཆེད་དུ་ལག་སྤྱོད་བདེ་བའི་ཡིག་གཟུགས་བེད་སྤྱོད་བྱོས།';

  @override
  String get accessibleFontEnabled => 'སྤྱོད་བདེའི་ཡིག་གཟུགས་སྤྱོད་བཞིན་ཡོད';

  @override
  String get accessibleFontDisabled => 'སྤྱོད་བདེའི་ཡིག་གཟུགས་བཀག་ཡོད';

  @override
  String get toggleAccessibleFont => 'སྤྱོད་བདེའི་ཡིག་གཟུགས་བརྗེ་བ';

  @override
  String get settingsLoading => 'འཇུག་སྤྱོད་ཚད་ལྡན་སྒྲིག་སྟངས་མངོན་འཆར་བཞིན་པ…';

  @override
  String get settingsLoadFailed =>
      'འཇུག་སྤྱོད་ཚད་ལྡན་སྒྲིག་སྟངས་མངོན་འཆར་མ་ཐུབ།';

  @override
  String get retry => 'སླར་ཚོད་ལྟ།';
}
