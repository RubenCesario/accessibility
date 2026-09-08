// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AccessibilityLocalizationsIs extends AccessibilityLocalizations {
  AccessibilityLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get accessibility => 'Aðgengi';

  @override
  String get accessibilitySettings => 'Aðgengistillingar';

  @override
  String get adjustBackgroundColors => 'Stilltu bakgrunnslit';

  @override
  String get adjustTextColors => 'Stilltu textafeitt';

  @override
  String get alignCenter => 'Jafna miðju';

  @override
  String get alignLeft => 'Vinstri jöfnun';

  @override
  String get alignRight => 'Hægri jöfnun';

  @override
  String get textAlignment => 'Textajöfnun';

  @override
  String get boldText => 'Feitt letur';

  @override
  String get changeBoldText => 'Breyta feitri stafa';

  @override
  String get changePagesBackgroundColor => 'Breyta bakgrunnslit síðunnar í: ';

  @override
  String get changeTextColor => 'Breyta lit textans í: ';

  @override
  String get changeTextColorShade => 'Breyta litbrigðum í: ';

  @override
  String get colorAdjustment => 'Litastilling';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Venjulegt',
      'lowSaturation': 'Lág mettun',
      'normal': 'Venjulegt',
      'highSaturation': 'Há mettun',
      'monochrome': 'Einlitur',
      'highContrast': 'Hár kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Núverandi litaprófíll er: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Litur ekki þekktur',
      'cF44336': 'Rauður',
      'cE91E63': 'Bleikur',
      'c9C27B0': 'Fjólublár',
      'c673AB7': 'Dökkfjólublár',
      'c3F51B5': 'Indigóblár',
      'c2196F3': 'Blár',
      'c03A9F4': 'Ljósblár',
      'c00BCD4': 'Blágrænn',
      'c009688': 'Djúpblágrænn',
      'c4CAF50': 'Grænn',
      'c8BC34A': 'Ljósgrænn',
      'cCDDC39': 'Límgrænn',
      'cFFEB3B': 'Gulur',
      'cFFC107': 'Rafgulur',
      'cFF9800': 'Appelsínugulur',
      'cFF5722': 'Djúp appelsínugulur',
      'c795548': 'Brúnn',
      'c9E9E9E': 'Grár',
      'c607D8B': 'Blágrátt',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Minnka orðabil';

  @override
  String get decrementLetterSpacing => 'Minnka stafafjægð';

  @override
  String get decrementLineHeight => 'Minnka línuhæð';

  @override
  String get decrementTextScaleFactor => 'Minnka stærðarstuðul texta';

  @override
  String get effects => 'Áhrif';

  @override
  String get expandText => 'Stækka texta';

  @override
  String get fontSize => 'Leturstærð';

  @override
  String get increaseOrDecreaseWordSpacing => 'Auka eða minnka orðabil';

  @override
  String get increaseOrDecreaseLetterSpacing => 'Auka eða minnka stafafjægð';

  @override
  String get increaseOrDecreaseLineHeight => 'Auka eða minnka línuhæð';

  @override
  String get increaseOrDecreaseTextSize => 'Auka eða minnka textastærð';

  @override
  String get incrementWordSpacing => 'Auka orðabil';

  @override
  String get incrementLetterSpacing => 'Auka stafafjægð';

  @override
  String get incrementLineHeight => 'Auka línuhæð';

  @override
  String get incrementTextScaleFactor => 'Auka stærðarstuðul texta';

  @override
  String get lessInfo => 'Fela upplýsingar';

  @override
  String get letterSpacing => 'Stafafjægð';

  @override
  String get lineHeight => 'Línuhæð';

  @override
  String get moreInfo => 'Sýna upplýsingar';

  @override
  String get readLess => 'Lesa minna';

  @override
  String get readMore => 'Lesa meira';

  @override
  String get reduceEffects => 'Minnka áhrif á skjá';

  @override
  String get reduceText => 'Minnka texta';

  @override
  String get restoreSettings => 'Endurstilla stillingar';

  @override
  String get restoreMainColor => 'Endurstilla aðallit';

  @override
  String get returnToMainColors => 'Aftur í aðalliti';

  @override
  String get settings => 'Stillingar';

  @override
  String get sizeAndTextDisplay => 'Stærð og birtingarmáti texta';

  @override
  String get sliderWordSpacing => 'Slæða fyrir orðabil';

  @override
  String get sliderLetterSpacing => 'Slæða fyrir stafafjægð';

  @override
  String get sliderLineHeight => 'Slæða fyrir línuhæð';

  @override
  String get themeMode => 'Þéma';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Þémaprófíll ekki þekktur',
      'seizureSafe': 'Flöguöruggt',
      'visionImpaired': 'Sjónskertur',
      'adhdFriendly': 'ADHD vænt',
      'none': 'Sjálfgefið snið',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Flöguöruggt snið';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Fjarlægja endurkast og draga úr lit';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Þetta snið gerir notendum með flögur og áhættu á flögum kleift að vafra örugglega með því að útrýma hættu á flögum sem stafa af blikkandi hreyfingum og áhættusomum litasamsetningum.';

  @override
  String get themeProfileVisionImpairedTitle => 'Snið fyrir sjónskerta';

  @override
  String get themeProfileVisionImpairedSubtitle => 'Bæta sýnileika forritsins';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Þetta snið aðlagar forritið til að vera aðgengilegt fyrir flest sjóntröflun, svo sem sjónskerðing, göngusjón, drérsjón, gláka og fleira.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD vænt snið';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Meiri einbeiting og minni truflun';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Þetta snið minnkar verulega truflanir, til að hjálpa fólki með ADHD og taugaþróunarraskanir að sigla, lesa og einbeita sér að mikilægum hlutum forritsins á auðveldari hátt.';

  @override
  String get theSettingsHaveBeenReset =>
      'Stillingarnar hafa verið endurstilltar.';

  @override
  String get toggleDarkMode => 'Víxla dökku þmu';

  @override
  String get toggleEffectsMode => 'Víxla áhrifa ham';

  @override
  String get toggleFontWeight => 'Víxla leturfeiti';

  @override
  String get toggleThemeProfile => 'Víxla þémaprófíl';

  @override
  String get wordSpacing => 'Orðabil';

  @override
  String get accessibleFont => 'Aðgengilegt letur';

  @override
  String get accessibleFontSubtitle =>
      'Notaðu aðgengilegt letur fyrir betri læsileika';

  @override
  String get accessibleFontEnabled => 'Aðgengilegt letur virkt';

  @override
  String get accessibleFontDisabled => 'Aðgengilegt letur óvirkt';

  @override
  String get toggleAccessibleFont => 'Víxla aðgengilegu letri';

  @override
  String get settingsLoading => 'Hleð inn aðgengisstillingum…';

  @override
  String get settingsLoadFailed =>
      'Ekki tókst að hlaða inn aðgengisstillingum.';

  @override
  String get retry => 'Reyna aftur';

  @override
  String get themeModeSystem => 'Kerfi';

  @override
  String get themeModeLight => 'Ljóst';

  @override
  String get themeModeDark => 'Dökkt';

  @override
  String get effectsModeSystem => 'Kerfi';

  @override
  String get effectsModeEnabled => 'Kveikt';

  @override
  String get effectsModeDisabled => 'Slökkt';
}
