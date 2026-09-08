// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AccessibilityLocalizationsKn extends AccessibilityLocalizations {
  AccessibilityLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get accessibility => 'ಪ್ರವೇಶದ ಸಾಧ್ಯತೆ';

  @override
  String get accessibilitySettings => 'ಪ್ರವೇಶದ ಸಾಧ್ಯತೆ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳು';

  @override
  String get adjustBackgroundColors => 'ಹಿನ್ನೆಲೆ ಬಣ್ಣಗಳನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get adjustTextColors => 'ಪಠ್ಯ ಬಣ್ಣಗಳನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get alignCenter => 'ಕೇಂದ್ರಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get alignLeft => 'ಎಡಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get alignRight => 'ಬಲಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get textAlignment => 'ಪಠ್ಯ ಜೋಡಣೆ';

  @override
  String get boldText => 'ದಪ್ಪ ಪಠ್ಯ';

  @override
  String get changeBoldText => 'ದಪ್ಪ ಪಠ್ಯವನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get changePagesBackgroundColor =>
      'ಪುಟಗಳ ಹಿನ್ನೆಲೆ ಬಣ್ಣವನ್ನು ಈ ರೀತಿಗೆ ಬದಲಾಯಿಸಿ: ';

  @override
  String get changeTextColor => 'ಪಠ್ಯದ ಬಣ್ಣವನ್ನು ಈ ರೀತಿಗೆ ಬದಲಾಯಿಸಿ: ';

  @override
  String get changeTextColorShade => 'ಬಣ್ಣದ ಶೇಡ್‌ ಅನ್ನು ಈ ರೀತಿಗೆ ಬದಲಾಯಿಸಿ: ';

  @override
  String get colorAdjustment => 'ಬಣ್ಣ ಹೊಂದಾಣಿಕೆ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ಸಾಮಾನ್ಯ',
      'lowSaturation': 'ಕಡಿಮೆ ಸ್ಯಾಚುರೇಷನ್',
      'normal': 'ಸಾಮಾನ್ಯ',
      'highSaturation': 'ಹೆಚ್ಚಿನ ಸ್ಯಾಚುರೇಷನ್',
      'monochrome': 'ಮೋನೋಕ್ರೋಮ್',
      'highContrast': 'ಹೆಚ್ಚಿನ ಕಾಂಟ್ರಾಸ್ಟ್',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ಪ್ರಸ್ತುತ ಬಣ್ಣ ಪ್ರೊಫೈಲ್: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'ಬಣ್ಣ ಗುರುತಿಸಲಾಗಿಲ್ಲ',
      'cF44336': 'ಕೆಂಪು',
      'cE91E63': 'ಗುಲಾಬಿ',
      'c9C27B0': 'ನೇರಳೆ',
      'c673AB7': 'ಗಾಢ ನೇರಳೆ',
      'c3F51B5': 'ಇಂಡಿಗೋ',
      'c2196F3': 'ನೀಲಿ',
      'c03A9F4': 'ತಿಳಿ ನೀಲಿ',
      'c00BCD4': 'ಸಿಯಾನ್',
      'c009688': 'ಟೀಲ್',
      'c4CAF50': 'ಹಸಿರು',
      'c8BC34A': 'ತಿಳಿ ಹಸಿರು',
      'cCDDC39': 'ಲೈಮ್',
      'cFFEB3B': 'ಹಳದಿ',
      'cFFC107': 'ಆಂಬರ್',
      'cFF9800': 'ಕಿತ್ತಳೆ',
      'cFF5722': 'ಗಾಢ ಕಿತ್ತಳೆ',
      'c795548': 'ಕಂದು',
      'c9E9E9E': 'ಬೂದು',
      'c607D8B': 'ನೀಲಿ ಬೂದು',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'ಪದ ಅಂತರ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get decrementLetterSpacing => 'ಅಕ್ಷರ ಅಂತರ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get decrementLineHeight => 'ಸಾಲಿನ ಎತ್ತರ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get decrementTextScaleFactor => 'ಪಠ್ಯ ಪ್ರಮಾಣ ಅಂಶ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get effects => 'ಪರಿಣಾಮಗಳು';

  @override
  String get expandText => 'ಪಠ್ಯ ವಿಸ್ತರಿಸಿ';

  @override
  String get fontSize => 'ಅಕ್ಷರ ಗಾತ್ರ';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'ಪದ ಅಂತರ ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'ಅಕ್ಷರ ಅಂತರ ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get increaseOrDecreaseLineHeight =>
      'ಸಾಲಿನ ಎತ್ತರ ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get increaseOrDecreaseTextSize =>
      'ಪಠ್ಯ ಗಾತ್ರವನ್ನು ಹೆಚ್ಚಿಸಿ ಅಥವಾ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get incrementWordSpacing => 'ಪದ ಅಂತರ ಹೆಚ್ಚಿಸಿ';

  @override
  String get incrementLetterSpacing => 'ಅಕ್ಷರ ಅಂತರ ಹೆಚ್ಚಿಸಿ';

  @override
  String get incrementLineHeight => 'ಸಾಲಿನ ಎತ್ತರ ಹೆಚ್ಚಿಸಿ';

  @override
  String get incrementTextScaleFactor => 'ಪಠ್ಯ ಪ್ರಮಾಣ ಅಂಶ ಹೆಚ್ಚಿಸಿ';

  @override
  String get lessInfo => 'ಮಾಹಿತಿ ಮರೆಮಾಡಿ';

  @override
  String get letterSpacing => 'ಅಕ್ಷರ ಅಂತರ';

  @override
  String get lineHeight => 'ಸಾಲಿನ ಎತ್ತರ';

  @override
  String get moreInfo => 'ಮಾಹಿತಿ ತೋರಿಸಿ';

  @override
  String get readLess => 'ಕಡಿಮೆ ಓದಿ';

  @override
  String get readMore => 'ಹೆಚ್ಚು ಓದಿ';

  @override
  String get reduceEffects => 'ಪರದೆಗೆ ಪರಿಣಾಮಗಳನ್ನು ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get reduceText => 'ಪಠ್ಯ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get restoreSettings => 'ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಮರುಸ್ಥಾಪಿಸಿ';

  @override
  String get restoreMainColor => 'ಮುಖ್ಯ ಬಣ್ಣ ಮರುಸ್ಥಾಪಿಸಿ';

  @override
  String get returnToMainColors => 'ಮುಖ್ಯ ಬಣ್ಣಗಳಿಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್ಸ್';

  @override
  String get sizeAndTextDisplay => 'ಗಾತ್ರ ಮತ್ತು ಪಠ್ಯ ಪ್ರದರ್ಶನ';

  @override
  String get sliderWordSpacing => 'ಸ್ಲೈಡರ್ ಪದ ಅಂತರ';

  @override
  String get sliderLetterSpacing => 'ಸ್ಲೈಡರ್ ಅಕ್ಷರ ಅಂತರ';

  @override
  String get sliderLineHeight => 'ಸ್ಲೈಡರ್ ಸಾಲಿನ ಎತ್ತರ';

  @override
  String get themeMode => 'ಥೀಮ್';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ಥೀಮ್ ಪ್ರೊಫೈಲ್ ಗುರುತಿಸಲಾಗಿಲ್ಲ',
      'seizureSafe': 'ಮೂರ್ಛೆರೋಗಿಗಳಿಗೆ ಸುರಕ್ಷಿತ',
      'visionImpaired': 'ದೃಷ್ಟಿ ದೋಷ',
      'adhdFriendly': 'ADHD ಸ್ನೇಹಿ',
      'none': 'ಡೀಫಾಲ್ಟ್ ಪ್ರೊಫೈಲ್',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'ಮೂರ್ಛೆರೋಗಿಗಳಿಗೆ ಸುರಕ್ಷಿತ ಪ್ರೊಫೈಲ್';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'ಪ್ರತಿಬಿಂಬಗಳನ್ನು ತೆಗೆದುಹಾಕಿ ಮತ್ತು ಬಣ್ಣ ಕಡಿಮೆಗೊಳಿಸಿ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ಈ ಪ್ರೊಫೈಲ್ ಅಪಸ್ಮಾರ ರೋಗವಿರುವ ಮತ್ತು ಮೂರ್ಛೆ ಬರುವ ಅಪಾಯದಲ್ಲಿರುವ ಬಳಕೆದಾರರು ಮಿಂಚುವ ಅನಿಮೇಷನ್‌ಗಳು ಮತ್ತು ಅಪಾಯಕಾರಿ ಬಣ್ಣ ಸಂಯೋಜನೆಗಳಿಂದ ಉಂಟಾಗುವ ಮೂರ್ಛೆಗಳ ಅಪಾಯವನ್ನು ತೊಡೆದುಹಾಕುವ ಮೂಲಕ ಸುರಕ್ಷಿತವಾಗಿ ಬ್ರೌಸ್ ಮಾಡಲು ಅನುವು ಮಾಡಿಕೊಡುತ್ತದೆ.';

  @override
  String get themeProfileVisionImpairedTitle => 'ದೃಷ್ಟಿ ದೋಷ ಪ್ರೊಫೈಲ್';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನ ದೃಶ್ಯತೆಯನ್ನು ಸುಧಾರಿಸಿ';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ಈ ಪ್ರೊಫೈಲ್ ದೃಷ್ಟಿ ದೋಷ, ಸುರಂಗ ದೃಷ್ಟಿ, ಮೋತಿಬಿಂದು, ಗ್ಲೌಕೋಮಾ ಮತ್ತು ಇತರ ಹಲವಾರು ದೃಷ್ಟಿ ದೋಷಗಳಿರುವವರು ಬಳಸಲು ಸಾಧ್ಯವಾಗುವಂತೆ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಹೊಂದಿಸುತ್ತದೆ.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-ಸ್ನೇಹಿ ಪ್ರೊಫೈಲ್';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'ಹೆಚ್ಚಿನ ಏಕಾಗ್ರತೆ ಮತ್ತು ಕಡಿಮೆ ಗಮನ ಭಂಗ';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ಈ ಪ್ರೊಫೈಲ್ ADHD ಮತ್ತು ನರಬೆಳವಣಿಗೆ ದೋಷಗಳನ್ನು ಹೊಂದಿರುವ ವ್ಯಕ್ತಿಗಳು ನ್ಯಾವಿಗೇಟ್ ಮಾಡಲು, ಓದಲು ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್‌ನ ಅತ್ಯಗತ್ಯ ಅಂಶಗಳ ಮೇಲೆ ಗಮನ ಹರಿಸಲು ಸಹಾಯ ಮಾಡಲು ಗಮನ ಭಂಗವನ್ನು ಗಣನೀಯವಾಗಿ ಕಡಿಮೆಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get theSettingsHaveBeenReset => 'ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಮರುಹೊಂದಿಸಲಾಗಿದೆ.';

  @override
  String get toggleDarkMode => 'ಡಾರ್ಕ್ ಮೋಡ್ ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get toggleEffectsMode => 'ಪರಿಣಾಮಗಳ ಮೋಡ್ ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get toggleFontWeight => 'ಫಾಂಟ್ ತೂಕ ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get toggleThemeProfile => 'ಥೀಮ್ ಪ್ರೊಫೈಲ್ ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get wordSpacing => 'ಪದ ಅಂತರ';

  @override
  String get accessibleFont => 'ಪ್ರವೇಶಿಸಬಹುದಾದ ಫಾಂಟ್';

  @override
  String get accessibleFontSubtitle => 'ಉತ್ತಮ ಓದುವಿಕೆಗಾಗಿ ಸುಲಭ ಫಾಂಟ್ ಬಳಸಿ';

  @override
  String get accessibleFontEnabled => 'ಪ್ರವೇಶಿಸಬಹುದಾದ ಫಾಂಟ್ ಸಕ್ರಿಯವಾಗಿದೆ';

  @override
  String get accessibleFontDisabled => 'ಪ್ರವೇಶಿಸಬಹುದಾದ ಫಾಂಟ್ ನಿಷ್ಕ್ರಿಯವಾಗಿದೆ';

  @override
  String get toggleAccessibleFont => 'ಪ್ರವೇಶಿಸಬಹುದಾದ ಫಾಂಟ್ ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get settingsLoading =>
      'ಪ್ರವೇಶದ ಸಾಧ್ಯತೆ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ…';

  @override
  String get settingsLoadFailed =>
      'ಪ್ರವೇಶದ ಸಾಧ್ಯತೆ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get themeModeSystem => 'ಸಿಸ್ಟಂ';

  @override
  String get themeModeLight => 'ಲೈಟ್';

  @override
  String get themeModeDark => 'ಡಾರ್ಕ್';

  @override
  String get effectsModeSystem => 'ಸಿಸ್ಟಂ';

  @override
  String get effectsModeEnabled => 'ಆನ್';

  @override
  String get effectsModeDisabled => 'ಆಫ್';
}
