// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AccessibilityLocalizationsTa extends AccessibilityLocalizations {
  AccessibilityLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get accessibility => 'அணுகல்தன்மை';

  @override
  String get accessibilitySettings => 'அணுகல்தன்மை அமைப்புகள்';

  @override
  String get adjustBackgroundColors => 'பின்னணி வண்ணங்களை சரிசெய்க';

  @override
  String get adjustTextColors => 'உரை வண்ணங்களை சரிசெய்க';

  @override
  String get alignCenter => 'மையத்தில் சீரமைக்க';

  @override
  String get alignLeft => 'இடதுபுறம் சீரமைக்க';

  @override
  String get alignRight => 'வலதுபுறம் சீரமைக்க';

  @override
  String get textAlignment => 'உரை சீரமைப்பு';

  @override
  String get boldText => 'தடிமனான உரை';

  @override
  String get changeBoldText => 'தடிமனான உரையை மாற்று';

  @override
  String get changePagesBackgroundColor =>
      'பக்கங்களின் பின்னணி வண்ணத்தை இதற்கு மாற்று: ';

  @override
  String get changeTextColor => 'உரையின் வண்ணத்தை இதற்கு மாற்று: ';

  @override
  String get changeTextColorShade => 'வண்ணத்தின் நிழலை இதற்கு மாற்று: ';

  @override
  String get colorAdjustment => 'வண்ண சரிசெய்தல்';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'சாதாரணம்',
      'lowSaturation': 'குறைந்த தெவிட்டு',
      'normal': 'சாதாரணம்',
      'highSaturation': 'அதிக தெவிட்டு',
      'monochrome': 'ஒரு வண்ணம்',
      'highContrast': 'அதிக மாறுபாடு',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'தற்போதைய வண்ண விவரக்குறிப்பு: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'வண்ணம் அங்கீகரிக்கப்படவில்லை',
      'cF44336': 'சிவப்பு',
      'cE91E63': 'இளஞ்சிவப்பு',
      'c9C27B0': 'ஊதா',
      'c673AB7': 'அடர் ஊதா',
      'c3F51B5': 'கருநீலம்',
      'c2196F3': 'நீலம்',
      'c03A9F4': 'இளநீலம்',
      'c00BCD4': 'சயன்',
      'c009688': 'நீலப்பச்சை',
      'c4CAF50': 'பச்சை',
      'c8BC34A': 'இளம் பச்சை',
      'cCDDC39': 'எலுமிச்சை',
      'cFFEB3B': 'மஞ்சள்',
      'cFFC107': 'ஆம்பர்',
      'cFF9800': 'ஆரஞ்சு',
      'cFF5722': 'அடர் ஆரஞ்சு',
      'c795548': 'பழுப்பு',
      'c9E9E9E': 'சாம்பல்',
      'c607D8B': 'நீல சாம்பல்',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'சொல் இடைவெளியை குறைக்க';

  @override
  String get decrementLetterSpacing => 'எழுத்து இடைவெளியை குறைக்க';

  @override
  String get decrementLineHeight => 'வரி உயரத்தை குறைக்க';

  @override
  String get decrementTextScaleFactor => 'உரை அளவு காரணியை குறைக்க';

  @override
  String get effects => 'விளைவுகள்';

  @override
  String get expandText => 'உரையை விரிவுபடுத்து';

  @override
  String get fontSize => 'எழுத்துரு அளவு';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'சொல் இடைவெளியை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'எழுத்து இடைவெளியை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increaseOrDecreaseLineHeight =>
      'வரி உயரத்தை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get increaseOrDecreaseTextSize => 'உரை அளவை அதிகரிக்க அல்லது குறைக்க';

  @override
  String get incrementWordSpacing => 'சொல் இடைவெளியை அதிகரிக்க';

  @override
  String get incrementLetterSpacing => 'எழுத்து இடைவெளியை அதிகரிக்க';

  @override
  String get incrementLineHeight => 'வரி உயரத்தை அதிகரிக்க';

  @override
  String get incrementTextScaleFactor => 'உரை அளவு காரணியை அதிகரிக்க';

  @override
  String get lessInfo => 'தகவலை மறைக்க';

  @override
  String get letterSpacing => 'எழுத்து இடைவெளி';

  @override
  String get lineHeight => 'வரி உயரம்';

  @override
  String get moreInfo => 'தகவலை காட்ட';

  @override
  String get readLess => 'குறைவாக படிக்க';

  @override
  String get readMore => 'மேலும் படிக்க';

  @override
  String get reduceEffects => 'திரைக்கான விளைவுகளை குறைக்க';

  @override
  String get reduceText => 'உரையை குறைக்க';

  @override
  String get restoreSettings => 'அமைப்புகளை மீட்டமைக்க';

  @override
  String get restoreMainColor => 'முதன்மை வண்ணத்தை மீட்டமைக்க';

  @override
  String get returnToMainColors => 'முதன்மை வண்ணங்களுக்கு திரும்ப';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get sizeAndTextDisplay => 'அளவு மற்றும் உரை காட்சி';

  @override
  String get sliderWordSpacing => 'சொல் இடைவெளி சருக்கி';

  @override
  String get sliderLetterSpacing => 'எழுத்து இடைவெளி சருக்கி';

  @override
  String get sliderLineHeight => 'வரி உயரம் சருக்கி';

  @override
  String get themeMode => 'தீம்';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'தீம் விவரக்குறிப்பு அங்கீகரிக்கப்படவில்லை',
      'seizureSafe': 'வலிப்பு பாதுகாப்பு',
      'visionImpaired': 'பார்வை குறைபாடு',
      'adhdFriendly': 'ADHD நட்பு',
      'none': 'இயல்புநிலை சுயவிவரம்',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'வலிப்பு பாதுகாப்பு விவரக்குறிப்பு';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'பிரதிபலிப்புகளை நீக்கி வண்ணத்தை குறைக்க';

  @override
  String get themeProfileSeizureSafeDescription =>
      'இந்த விவரக்குறிப்பு காக்கைவலிப்பு உள்ள மற்றும் வலிப்பு அபாயத்தில் உள்ள பயனர்கள் மின்னும் அனிமேஷன்கள் மற்றும் ஆபத்தான வண்ண கலவைகளால் ஏற்படும் வலிப்பு அபாயத்தை நீக்குவதன் மூலம் பாதுகாப்பாக உலாவ அனுமதிக்கிறது.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'பார்வை குறைபாடு விவரக்குறிப்பு';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'பயன்பாட்டின் தெரிவுத்தன்மையை மேம்படுத்துக';

  @override
  String get themeProfileVisionImpairedDescription =>
      'இந்த விவரக்குறிப்பு பார்வைக் குறைபாடு, டனல் பார்வை, கண்புரை, களாகோமா மற்றும் பல போன்ற பெரும்பாலான பார்வைக் குறைபாடுகளுக்கு அணுகக்கூடியதாக பயன்பாட்டை தகவமைக்கிறது.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD நட்பு விவரக்குறிப்பு';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'அதிக கவனம் மற்றும் குறைவான கவனச்சிதறல்கள்';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'இந்த விவரக்குறிப்பு கவனச்சிதறல்களை கணிசமாக குறைக்கிறது, ADHD மற்றும் நரம்பியல் வளர்ச்சி குறைபாடுகள் உள்ள மக்களுக்கு வழிநடத்த, படிக்க மற்றும் பயன்பாட்டின் அத்தியாவசிய கூறுகளில் கவனம் செலுத்த உதவுகிறது.';

  @override
  String get theSettingsHaveBeenReset => 'அமைப்புகள் மீட்டமைக்கப்பட்டுள்ளன.';

  @override
  String get toggleDarkMode => 'இருண்ட பயன்முறையை மாற்று';

  @override
  String get toggleEffectsMode => 'விளைவுகள் பயன்முறையை மாற்று';

  @override
  String get toggleFontWeight => 'எழுத்துரு எடையை மாற்று';

  @override
  String get toggleThemeProfile => 'தீம் விவரக்குறிப்பை மாற்று';

  @override
  String get wordSpacing => 'சொல் இடைவெளி';

  @override
  String get accessibleFont => 'அணுகக்கூடிய எழுத்துரு';

  @override
  String get accessibleFontSubtitle =>
      'சிறந்த வாசிப்புத்திறனுக்கு அணுகக்கூடிய எழுத்துருவைப் பயன்படுத்துங்கள்';

  @override
  String get accessibleFontEnabled => 'அணுகக்கூடிய எழுத்துரு இயக்கப்பட்டது';

  @override
  String get accessibleFontDisabled => 'அணுகக்கூடிய எழுத்துரு முடக்கப்பட்டது';

  @override
  String get toggleAccessibleFont => 'அணுகக்கூடிய எழுத்துருவை மாற்று';

  @override
  String get settingsLoading => 'அணுகல்தன்மை அமைப்புகள் ஏற்றப்படுகிறது…';

  @override
  String get settingsLoadFailed => 'அணுகல்தன்மை அமைப்புகளை ஏற்ற முடியவில்லை.';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get themeModeSystem => 'அமைப்பு';

  @override
  String get themeModeLight => 'வெளிர்';

  @override
  String get themeModeDark => 'இருண்ட';

  @override
  String get effectsModeSystem => 'அமைப்பு';

  @override
  String get effectsModeEnabled => 'ஆன்';

  @override
  String get effectsModeDisabled => 'ஆஃப்';
}
