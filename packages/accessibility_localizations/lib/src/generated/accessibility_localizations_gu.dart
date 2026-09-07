// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AccessibilityLocalizationsGu extends AccessibilityLocalizations {
  AccessibilityLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get accessibility => 'સુલભતા';

  @override
  String get accessibilitySettings => 'સુલભતા સેટિંગ્સ';

  @override
  String get adjustBackgroundColors => 'પૃષ્ઠભૂમિના રંગો સમાયોજિત કરો';

  @override
  String get adjustTextColors => 'ટેક્સ્ટ રંગો સમાયોજિત કરો';

  @override
  String get alignCenter => 'મધ્યમાં ગોઠવો';

  @override
  String get alignLeft => 'ડાબે ગોઠવો';

  @override
  String get alignRight => 'જમણે ગોઠવો';

  @override
  String get textAlignment => 'ટેક્સ્ટ ગોઠવણી';

  @override
  String get boldText => 'બોલ્ડ ટેક્સ્ટ';

  @override
  String get changeBoldText => 'બોલ્ડ ટેક્સ્ટ બદલો';

  @override
  String get changePagesBackgroundColor =>
      'પેજોની પૃષ્ઠભૂમિનો રંગ આ પ્રમાણે બદલો: ';

  @override
  String get changeTextColor => 'ટેક્સ્ટનો રંગ આ પ્રમાણે બદલો: ';

  @override
  String get changeTextColorShade => 'રંગની છાયા આ પ્રમાણે બદલો: ';

  @override
  String get colorAdjustment => 'રંગ સમાયોજન';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'સામાન્ય',
      'lowSaturation': 'ઓછી સંતૃપ્તિ',
      'normal': 'સામાન્ય',
      'highSaturation': 'ઉચ્ચ સંતૃપ્તિ',
      'monochrome': 'મોનોક્રોમ',
      'highContrast': 'ઉચ્ચ કોન્ટ્રાસ્ટ',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'હાલની રંગ પ્રોફાઇલ આ છે: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'રંગ ઓળખાતો નથી',
      'cF44336': 'લાલ',
      'cE91E63': 'ગુલાબી',
      'c9C27B0': 'જાંબલી',
      'c673AB7': 'ઘેરો જાંબલી',
      'c3F51B5': 'ઇન્ડિગો',
      'c2196F3': 'નીલો',
      'c03A9F4': 'હલકો નીલો',
      'c00BCD4': 'સાયન',
      'c009688': 'ટીલ',
      'c4CAF50': 'લીલો',
      'c8BC34A': 'હલકો લીલો',
      'cCDDC39': 'લિંબુ રંગ',
      'cFFEB3B': 'પીળો',
      'cFFC107': 'અંબર',
      'cFF9800': 'નારંગી',
      'cFF5722': 'ઘેરો નારંગી',
      'c795548': 'બ્રાઉન',
      'c9E9E9E': 'ગ્રે',
      'c607D8B': 'નીલો ગ્રે',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'શબ્દ અંતર ઘટાડો';

  @override
  String get decrementLetterSpacing => 'અક્ષર અંતર ઘટાડો';

  @override
  String get decrementLineHeight => 'લાઇનની ઊંચાઈ ઘટાડો';

  @override
  String get decrementTextScaleFactor => 'ટેક્સ્ટ સ્કેલ પરિબળ ઘટાડો';

  @override
  String get effects => 'ઇફેક્ટ્સ';

  @override
  String get expandText => 'ટેક્સ્ટ વિસ્તૃત કરો';

  @override
  String get fontSize => 'ફોન્ટનું કદ';

  @override
  String get increaseOrDecreaseWordSpacing => 'શબ્દ અંતર વધારો અથવા ઘટાડો';

  @override
  String get increaseOrDecreaseLetterSpacing => 'અક્ષર અંતર વધારો અથવા ઘટાડો';

  @override
  String get increaseOrDecreaseLineHeight => 'લાઇનની ઊંચાઈ વધારો અથવા ઘટાડો';

  @override
  String get increaseOrDecreaseTextSize => 'ટેક્સ્ટનું કદ વધારો અથવા ઘટાડો';

  @override
  String get incrementWordSpacing => 'શબ્દ અંતર વધારો';

  @override
  String get incrementLetterSpacing => 'અક્ષર અંતર વધારો';

  @override
  String get incrementLineHeight => 'લાઇનની ઊંચાઈ વધારો';

  @override
  String get incrementTextScaleFactor => 'ટેક્સ્ટ સ્કેલ પરિબળ વધારો';

  @override
  String get lessInfo => 'માહિતી છુપાવો';

  @override
  String get letterSpacing => 'અક્ષર અંતર';

  @override
  String get lineHeight => 'લાઇનની ઊંચાઈ';

  @override
  String get moreInfo => 'માહિતી દર્શાવો';

  @override
  String get readLess => 'ઓછું વાંચો';

  @override
  String get readMore => 'વધુ વાંચો';

  @override
  String get reduceEffects => 'સ્ક્રીન પરની ઇફેક્ટ્સ ઘટાડો';

  @override
  String get reduceText => 'ટેક્સ્ટ ઘટાડો';

  @override
  String get restoreSettings => 'સેટિંગ્સ પુનઃસ્થાપિત કરો';

  @override
  String get restoreMainColor => 'મુખ્ય રંગ પુનઃસ્થાપિત કરો';

  @override
  String get returnToMainColors => 'મુખ્ય રંગો પર પાછા આવો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get sizeAndTextDisplay => 'કદ અને ટેક્સ્ટ ડિસ્પ્લે';

  @override
  String get sliderWordSpacing => 'શબ્દ અંતર સ્લાઇડર';

  @override
  String get sliderLetterSpacing => 'અક્ષર અંતર સ્લાઇડર';

  @override
  String get sliderLineHeight => 'લાઇનની ઊંચાઈ સ્લાઇડર';

  @override
  String get themeMode => 'થીમ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'થીમ પ્રોફાઇલ ઓળખાતી નથી',
      'seizureSafe': 'આંચકી સલામત',
      'visionImpaired': 'દ્રષ્ટિ ખામીવાળું',
      'adhdFriendly': 'ADHD-મૈત્રીપૂર્ણ',
      'none': 'મૂળભૂત પ્રોફાઇલ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'આંચકી સલામત પ્રોફાઇલ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'પ્રતિબિંબો દૂર કરો અને રંગ ઘટાડો';

  @override
  String get themeProfileSeizureSafeDescription =>
      'આ પ્રોફાઇલ વપરાશકર્તાઓને જેમને વારંવાર આંચકી આવે છે અને જેમને આંચકીનું જોખમ છે તેમને ફ્લેશિંગ એનિમેશન અને જોખમી રંગ સંયોજનોના કારણે થતી આંચકીના જોખમને દૂર કરીને સુરક્ષિત રીતે બ્રાઉઝ કરવા માટે સક્ષમ કરે છે.';

  @override
  String get themeProfileVisionImpairedTitle => 'દ્રષ્ટિ ખામીવાળું પ્રોફાઇલ';

  @override
  String get themeProfileVisionImpairedSubtitle => 'એપ્લિકેશનની દૃશ્યતા સુધારો';

  @override
  String get themeProfileVisionImpairedDescription =>
      'આ પ્રોફાઇલ મોટાભાગની દ્રશ્ટિ ક્ષતિઓ જેવી કે દ્રષ્ટિની ખામી, ટનલ દ્રષ્ટિ, મોતિયો, ગ્લુકોમા અને વધુ માટે એપ્લિકેશનને સુલભ બનાવવા માટે અનુકૂલિત કરે છે.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-મૈત્રીપૂર્ણ પ્રોફાઇલ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'વધુ એકાગ્રતા અને ઓછા વિક્ષેપો';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'આ પ્રોફાઇલ ADHD અને ન્યુરોડેવલપમેન્ટલ વિકારોવાળા લોકોને એપ્લિકેશનના મુખ્ય તત્વો પર નેવિગેટ કરવા, વાંચવા અને ધ્યાન કેંદ્રિત કરવામાં મદદ કરવા માટે વિક્ષેપોને નોંધપાત્ર રીતે ઘટાડે છે.';

  @override
  String get theSettingsHaveBeenReset => 'સેટિંગ્સ રીસેટ કરવામાં આવી છે.';

  @override
  String get toggleDarkMode => 'ડાર્ક મોડ ટોગલ કરો';

  @override
  String get toggleEffectsMode => 'ઇફેક્ટ્સ મોડ ટોગલ કરો';

  @override
  String get toggleFontWeight => 'ફોન્ટ વજન ટોગલ કરો';

  @override
  String get toggleThemeProfile => 'થીમ પ્રોફાઇલ ટોગલ કરો';

  @override
  String get wordSpacing => 'શબ્દ અંતર';

  @override
  String get accessibleFont => 'સુલભ ફોન્ટ';

  @override
  String get accessibleFontSubtitle =>
      'વધુ સારી વાંચનક્ષમતા માટે સુલભ ફોન્ટનો ઉપયોગ કરો';

  @override
  String get accessibleFontEnabled => 'સુલભ ફોન્ટ સક્ષમ';

  @override
  String get accessibleFontDisabled => 'સુલભ ફોન્ટ અક્ષમ';

  @override
  String get toggleAccessibleFont => 'સુલભ ફોન્ટ ટોગલ કરો';

  @override
  String get settingsLoading => 'સુલભતા સેટિંગ્સ લોડ થઈ રહી છે…';

  @override
  String get settingsLoadFailed => 'સુલભતા સેટિંગ્સ લોડ કરી શકાઈ નથી.';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';
}
