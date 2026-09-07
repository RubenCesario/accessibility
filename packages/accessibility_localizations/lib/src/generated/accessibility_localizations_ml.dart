// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AccessibilityLocalizationsMl extends AccessibilityLocalizations {
  AccessibilityLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get accessibility => 'ആക്സസിബിലിറ്റി';

  @override
  String get accessibilitySettings => 'ആക്സസിബിലിറ്റി ക്രമീകരണങ്ങൾ';

  @override
  String get adjustBackgroundColors => 'പിൻനില നിറങ്ങൾ ക്രമീകരിക്കുക';

  @override
  String get adjustTextColors => 'ടെക്സ്റ്റ് നിറങ്ങൾ ക്രമീകരിക്കുക';

  @override
  String get alignCenter => 'നടുവിൽ വിന്യസിക്കുക';

  @override
  String get alignLeft => 'ഇടത്ത് വിന്യസിക്കുക';

  @override
  String get alignRight => 'വലത്ത് വിന്യസിക്കുക';

  @override
  String get textAlignment => 'ടെക്സ്റ്റ് വിന്യാസം';

  @override
  String get boldText => 'ബോൾഡ് ടെക്സ്റ്റ്';

  @override
  String get changeBoldText => 'ബോൾഡ് ടെക്സ്റ്റ് മാറ്റുക';

  @override
  String get changePagesBackgroundColor => 'പേജുകളുടെ പിൻനിറം മാറ്റുക: ';

  @override
  String get changeTextColor => 'ടെക്സ്റ്റിന്റെ നിറം മാറ്റുക: ';

  @override
  String get changeTextColorShade => 'നിറത്തിന്റെ ഷേഡ് മാറ്റുക: ';

  @override
  String get colorAdjustment => 'നിറം ക്രമീകരണം';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'സാധാരണം',
      'lowSaturation': 'കുറഞ്ഞ സാച്ചുറേഷൻ',
      'normal': 'സാധാരണം',
      'highSaturation': 'ഉയർന്ന സാച്ചുറേഷൻ',
      'monochrome': 'മോണോക്രോം',
      'highContrast': 'ഉയർന്ന കോൺട്രാസ്റ്റ്',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'നിലവിലെ നിറ പ്രൊഫൈൽ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'നിറം തിരിച്ചറിഞ്ഞിട്ടില്ല',
      'cF44336': 'ചുവപ്പ്',
      'cE91E63': 'പിങ്ക്',
      'c9C27B0': 'പർപ്പിൾ',
      'c673AB7': 'കടും പർപ്പിൾ',
      'c3F51B5': 'ഇന്‍ഡിഗോ',
      'c2196F3': 'നീല',
      'c03A9F4': 'ലൈറ്റ് ബ്ലൂ',
      'c00BCD4': 'സയൻ',
      'c009688': 'ടീൽ',
      'c4CAF50': 'പച്ച',
      'c8BC34A': 'ലൈറ്റ് ഗ്രീൻ',
      'cCDDC39': 'ലൈം',
      'cFFEB3B': 'മഞ്ഞ',
      'cFFC107': 'ആംബർ',
      'cFF9800': 'ഓറഞ്ച്',
      'cFF5722': 'കടും ഓറഞ്ച്',
      'c795548': 'തവിട്ട്',
      'c9E9E9E': 'ചാരനിറം',
      'c607D8B': 'നീല ചാരനിറം',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'വാക്കുകൾ തമ്മിലുള്ള അകലം കുറയ്ക്കുക';

  @override
  String get decrementLetterSpacing => 'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം കുറയ്ക്കുക';

  @override
  String get decrementLineHeight => 'വരി ഉയരം കുറയ്ക്കുക';

  @override
  String get decrementTextScaleFactor => 'ടെക്സ്റ്റ് സ്കെയിൽ ഫാക്ടർ കുറയ്ക്കുക';

  @override
  String get effects => 'ഇഫക്റ്റുകൾ';

  @override
  String get expandText => 'ടെക്സ്റ്റ് വിസ്തരിക്കുക';

  @override
  String get fontSize => 'ഫോണ്ട് വലിപ്പം';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'വാക്കുകൾ തമ്മിലുള്ള അകലം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increaseOrDecreaseLineHeight =>
      'വരി ഉയരം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increaseOrDecreaseTextSize =>
      'ടെക്സ്റ്റ് വലിപ്പം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get incrementWordSpacing => 'വാക്കുകൾ തമ്മിലുള്ള അകലം കൂട്ടുക';

  @override
  String get incrementLetterSpacing => 'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം കൂട്ടുക';

  @override
  String get incrementLineHeight => 'വരി ഉയരം കൂട്ടുക';

  @override
  String get incrementTextScaleFactor => 'ടെക്സ്റ്റ് സ്കെയിൽ ഫാക്ടർ കൂട്ടുക';

  @override
  String get lessInfo => 'വിവരങ്ങൾ മറയ്ക്കുക';

  @override
  String get letterSpacing => 'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം';

  @override
  String get lineHeight => 'വരി ഉയരം';

  @override
  String get moreInfo => 'വിവരങ്ങൾ കാണിക്കുക';

  @override
  String get readLess => 'കുറച്ച് വായിക്കുക';

  @override
  String get readMore => 'കൂടുതൽ വായിക്കുക';

  @override
  String get reduceEffects => 'സ്ക്രീനിലെ ഇഫക്റ്റുകൾ കുറയ്ക്കുക';

  @override
  String get reduceText => 'ടെക്സ്റ്റ് കുറയ്ക്കുക';

  @override
  String get restoreSettings => 'ക്രമീകരണങ്ങൾ പുനഃസ്ഥാപിക്കുക';

  @override
  String get restoreMainColor => 'പ്രധാന നിറം പുനഃസ്ഥാപിക്കുക';

  @override
  String get returnToMainColors => 'പ്രധാന നിറങ്ങളിലേക്ക് മടങ്ങുക';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get sizeAndTextDisplay => 'വലിപ്പവും ടെക്സ്റ്റ് പ്രദർശനവും';

  @override
  String get sliderWordSpacing => 'സ്ലൈഡർ വാക്കുകൾ തമ്മിലുള്ള അകലം';

  @override
  String get sliderLetterSpacing => 'സ്ലൈഡർ അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം';

  @override
  String get sliderLineHeight => 'സ്ലൈഡർ വരി ഉയരം';

  @override
  String get themeMode => 'തീം';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'തീം പ്രൊഫൈൽ തിരിച്ചറിഞ്ഞിട്ടില്ല',
      'seizureSafe': 'അപസ്മാരം സുരക്ഷിതം',
      'visionImpaired': 'കാഴ്ച വെകല്യമുള്ളവർക്ക്',
      'adhdFriendly': 'ADHD സൌഹൃദം',
      'none': 'സ്ഥിര പ്രൊഫൈൽ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'അപസ്മാരം സുരക്ഷിത പ്രൊഫൈൽ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'പ്രതിഫലനങ്ങൾ നീക്കം ചെയ്യുകയും നിറം കുറയ്ക്കുകയും ചെയ്യുക';

  @override
  String get themeProfileSeizureSafeDescription =>
      'മിന്നുന്ന ആനിമേഷനുകളിൽ നിന്നും അപകടകരമായ വർണ്ണ സംയോജനങ്ങളിൽ നിന്നും ഉണ്ടാകുന്ന അപസ്മാരങ്ങളുടെ അപകടസാധ്യത ഇല്ലാതാക്കി അപസ്മാരമുള്ളവർക്കും അപസ്മാരത്തിന്റെ അപകടസാധ്യതയുള്ളവർക്കും സുരക്ഷിതമായി ബ്രൗസ് ചെയ്യാൻ ഈ പ്രൊഫൈൽ ഉപയോക്താക്കളെ സഹായിക്കുന്നു.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'കാഴ്ച വെകല്യം ഉള്ളവർക്കുള്ള പ്രൊഫൈൽ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ആപ്ലിക്കേഷന്റെ ദൃശ്യത മെച്ചപ്പെടുത്തുക';

  @override
  String get themeProfileVisionImpairedDescription =>
      'കാഴ്ചവെകല്യം, ടണൽ കാഴ്ച, തിമിരം, ഗ്ലോക്കോമ തുടങ്ങിയ മിക്ക കാഴ്ച വെകല്യങ്ങളുള്ളവർക്കും ആക്സസ് ചെയ്യാൻ കഴിയുന്ന രീതിയിൽ ഈ പ്രൊഫൈൽ ആപ്ലിക്കേഷൻ അനുയോജ്യമാക്കുന്നു.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD സൌഹൃദ പ്രൊഫൈൽ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'കൂടുതൽ ഏകാഗ്രതയും കുറഞ്ഞ ശ്രദ്ധ വിട്ടുമാറ്റലുകളും';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ഈ പ്രൊഫൈൽ ADHD യും ന്യൂറോഡെവലപ്‌മെന്റൽ അപാകതകളുമുള്ള ആളുകൾക്ക് ആപ്ലിക്കേഷന്റെ അവശ്യഘടകങ്ങളിൽ എളുപ്പം നാവിഗേറ്റ് ചെയ്യാനും, വായിക്കാനും, ശ്രദ്ധ കേന്ദ്രീകരിക്കാനും സഹായിക്കുന്നതിന് ശ്രദ്ധ വിട്ടുമാറ്റലുകൾ ഗണ്യമായി കുറയ്ക്കുന്നു.';

  @override
  String get theSettingsHaveBeenReset =>
      'ക്രമീകരണങ്ങൾ പുനഃക്രമീകരിച്ചിരിക്കുന്നു.';

  @override
  String get toggleDarkMode => 'ഡാർക്ക് മോഡ് ടോഗിൾ ചെയ്യുക';

  @override
  String get toggleEffectsMode => 'ഇഫക്റ്റ്സ് മോഡ് ടോഗിൾ ചെയ്യുക';

  @override
  String get toggleFontWeight => 'ഫോണ്ട് തടി ടോഗിൾ ചെയ്യുക';

  @override
  String get toggleThemeProfile => 'തീം പ്രൊഫൈൽ ടോഗിൾ ചെയ്യുക';

  @override
  String get wordSpacing => 'വാക്കുകൾ തമ്മിലുള്ള അകലം';

  @override
  String get accessibleFont => 'ആക്സസിബിൾ ഫോണ്ട്';

  @override
  String get accessibleFontSubtitle =>
      'മികച്ച വായനാക്ഷമതയ്ക്കായി ആക്സസ് ചെയ്യാവുന്ന ഫോണ്ട് ഉപയോഗിക്കുക';

  @override
  String get accessibleFontEnabled => 'ആക്സസിബിൾ ഫോണ്ട് പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get accessibleFontDisabled => 'ആക്സസിബിൾ ഫോണ്ട് പ്രവർത്തനരഹിതമാക്കി';

  @override
  String get toggleAccessibleFont => 'ആക്സസിബിൾ ഫോണ്ട് ടോഗിൾ ചെയ്യുക';

  @override
  String get settingsLoading => 'ആക്സസിബിലിറ്റി ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നു…';

  @override
  String get settingsLoadFailed =>
      'ആക്സസിബിലിറ്റി ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല.';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';
}
