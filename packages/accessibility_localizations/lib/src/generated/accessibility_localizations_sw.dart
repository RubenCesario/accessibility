// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AccessibilityLocalizationsSw extends AccessibilityLocalizations {
  AccessibilityLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get accessibility => 'Ufikiaji';

  @override
  String get accessibilitySettings => 'Mipangilio ya ufikiaji';

  @override
  String get adjustBackgroundColors => 'Rekebisha rangi za mandharinyuma';

  @override
  String get adjustTextColors => 'Rekebisha rangi za maandishi';

  @override
  String get alignCenter => 'Panga katikati';

  @override
  String get alignLeft => 'Panga kushoto';

  @override
  String get alignRight => 'Panga kulia';

  @override
  String get textAlignment => 'Mpangilio wa maandishi';

  @override
  String get boldText => 'Maandishi ya kooze';

  @override
  String get changeBoldText => 'Badilisha maandishi ya kooze';

  @override
  String get changePagesBackgroundColor =>
      'Badilisha rangi ya mandharinyuma ya kurasa kuwa: ';

  @override
  String get changeTextColor => 'Badilisha rangi ya maandishi kuwa: ';

  @override
  String get changeTextColorShade => 'Badilisha kivuli cha rangi kuwa: ';

  @override
  String get colorAdjustment => 'Marekebisho ya rangi';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Kawaida',
      'lowSaturation': 'Usafi wa chini',
      'normal': 'Kawaida',
      'highSaturation': 'Usafi wa juu',
      'monochrome': 'Rangi moja',
      'highContrast': 'Tofauti kubwa',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Wasifu wa rangi wa sasa ni: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Rangi haijatambuliwa',
      'cF44336': 'Nyekundu',
      'cE91E63': 'Waridi',
      'c9C27B0': 'Zambarau',
      'c673AB7': 'Zambarau nzito',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Bluu',
      'c03A9F4': 'Bluu hafifu',
      'c00BCD4': 'Samawati',
      'c009688': 'Kijani-samawati',
      'c4CAF50': 'Kijani',
      'c8BC34A': 'Kijani hafifu',
      'cCDDC39': 'Ndimu',
      'cFFEB3B': 'Njano',
      'cFFC107': 'Jivujivu',
      'cFF9800': 'Machungwa',
      'cFF5722': 'Machungwa nzito',
      'c795548': 'Hudhurungi',
      'c9E9E9E': 'Kijivu',
      'c607D8B': 'Bluu-kijivu',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Punguza nafasi ya maneno';

  @override
  String get decrementLetterSpacing => 'Punguza nafasi ya herufi';

  @override
  String get decrementLineHeight => 'Punguza urefu wa mstari';

  @override
  String get decrementTextScaleFactor =>
      'Punguza kipimo cha ukubwa wa maandishi';

  @override
  String get effects => 'Athari';

  @override
  String get expandText => 'Panua maandishi';

  @override
  String get fontSize => 'Ukubwa wa fonti';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Ongeza au punguza nafasi ya maneno';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Ongeza au punguza nafasi ya herufi';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Ongeza au punguza urefu wa mstari';

  @override
  String get increaseOrDecreaseTextSize =>
      'Ongeza au punguza ukubwa wa maandishi';

  @override
  String get incrementWordSpacing => 'Ongeza nafasi ya maneno';

  @override
  String get incrementLetterSpacing => 'Ongeza nafasi ya herufi';

  @override
  String get incrementLineHeight => 'Ongeza urefu wa mstari';

  @override
  String get incrementTextScaleFactor =>
      'Ongeza kipimo cha ukubwa wa maandishi';

  @override
  String get lessInfo => 'Ficha maelezo';

  @override
  String get letterSpacing => 'Nafasi ya herufi';

  @override
  String get lineHeight => 'Urefu wa mstari';

  @override
  String get moreInfo => 'Onyesha maelezo';

  @override
  String get readLess => 'Soma kidogo';

  @override
  String get readMore => 'Soma zaidi';

  @override
  String get reduceEffects => 'Punguza athari kwenye skrini';

  @override
  String get reduceText => 'Punguza maandishi';

  @override
  String get restoreSettings => 'Rejesha mipangilio';

  @override
  String get restoreMainColor => 'Rejesha rangi kuu';

  @override
  String get returnToMainColors => 'Rudi kwenye rangi kuu';

  @override
  String get settings => 'Mipangilio';

  @override
  String get sizeAndTextDisplay => 'Ukubwa na onyesho la maandishi';

  @override
  String get sliderWordSpacing => 'Kitelezi cha nafasi ya maneno';

  @override
  String get sliderLetterSpacing => 'Kitelezi cha nafasi ya herufi';

  @override
  String get sliderLineHeight => 'Kitelezi cha urefu wa mstari';

  @override
  String get themeMode => 'Mandhari';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Wasifu wa mandhari haujatambuliwa',
      'seizureSafe': 'Salama kwa kifafa',
      'visionImpaired': 'Uoni hafifu',
      'adhdFriendly': 'Rafiki wa ADHD',
      'none': 'Wasifu chaguo-msingi',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Wasifu salama kwa kifafa';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Ondoa mionekano na punguza rangi';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Wasifu huu huwezesha watumiaji wenye kifafa na walio katika hatari ya kupata kifafa kuvinjari kwa usalama kwa kuondoa hatari ya kifafa inayotokana na animesheni zinazometameta na mchanganyiko wa rangi hatari.';

  @override
  String get themeProfileVisionImpairedTitle => 'Wasifu wa uoni hafifu';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Boresha mwonekano wa programu';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Wasifu huu hurekebisha programu ili iweze kufikiwa na watu wenye ulemavu wa kuona, kama vile uoni hafifu, uoni wa tundu, mtoto wa jicho, glaukoma na zaidi.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Wasifu rafiki wa ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Umakinifu zaidi na usumbufu kidogo';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Wasifu huu hupunguza usumbufu kwa kiasi kikubwa, kusaidia watu wenye ADHD na matatizo ya ukuaji wa neva kuvinjari, kusoma, na kuzingatia vipengele muhimu vya programu kwa urahisi zaidi.';

  @override
  String get theSettingsHaveBeenReset => 'Mipangilio imerejeshwa.';

  @override
  String get toggleDarkMode => 'Badilisha hali ya giza';

  @override
  String get toggleEffectsMode => 'Badilisha hali ya athari';

  @override
  String get toggleFontWeight => 'Badilisha unene wa fonti';

  @override
  String get toggleThemeProfile => 'Badilisha wasifu wa mandhari';

  @override
  String get wordSpacing => 'Nafasi ya maneno';

  @override
  String get accessibleFont => 'Fonti inayofikiwa';

  @override
  String get accessibleFontSubtitle =>
      'Tumia fonti inayofikika kwa usomaji bora';

  @override
  String get accessibleFontEnabled => 'Fonti inayofikiwa imewashwa';

  @override
  String get accessibleFontDisabled => 'Fonti inayofikiwa imezimwa';

  @override
  String get toggleAccessibleFont => 'Badilisha fonti inayofikiwa';

  @override
  String get settingsLoading => 'Inapakia mipangilio ya ufikiaji…';

  @override
  String get settingsLoadFailed => 'Imeshindwa kupakia mipangilio ya ufikiaji.';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get themeModeSystem => 'Mfumo';

  @override
  String get themeModeLight => 'Angavu';

  @override
  String get themeModeDark => 'Giza';

  @override
  String get effectsModeSystem => 'Mfumo';

  @override
  String get effectsModeEnabled => 'Washa';

  @override
  String get effectsModeDisabled => 'Zima';
}
