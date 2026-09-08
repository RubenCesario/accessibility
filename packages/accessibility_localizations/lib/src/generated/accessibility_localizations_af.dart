// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AccessibilityLocalizationsAf extends AccessibilityLocalizations {
  AccessibilityLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get accessibility => 'Toeganklikheid';

  @override
  String get accessibilitySettings => 'Toeganklikheidsinstellinge';

  @override
  String get adjustBackgroundColors => 'Aanpasbare agtergrondkleur';

  @override
  String get adjustTextColors => 'Aanpasbare tekstkleur';

  @override
  String get alignCenter => 'Gelyk';

  @override
  String get alignLeft => 'Links';

  @override
  String get alignRight => 'Regs';

  @override
  String get textAlignment => 'Teksbelyning';

  @override
  String get boldText => 'Vetgedrukte teks';

  @override
  String get changeBoldText => 'Verander vetgedrukte teks';

  @override
  String get changePagesBackgroundColor => 'Agtergrondkleur verander';

  @override
  String get changeTextColor => 'Tekstkleur verander';

  @override
  String get changeTextColorShade => 'Tekstkleur skakering verander';

  @override
  String get colorAdjustment => 'Kleur aanpassing';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normaal',
      'lowSaturation': 'Laag satuur',
      'normal': 'Normaal',
      'highSaturation': 'Hoog satuur',
      'monochrome': 'Monochroom',
      'highContrast': 'Hoog contrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Die huidige kleurprofiel is: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Kleur ongekend',
      'cF44336': 'Rooi',
      'cE91E63': 'Pienk',
      'c9C27B0': 'Pers',
      'c673AB7': 'Diep Pers',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blou',
      'c03A9F4': 'Lig Blou',
      'c00BCD4': 'Siaan',
      'c009688': 'Blougroen',
      'c4CAF50': 'Groen',
      'c8BC34A': 'Lig Groen',
      'cCDDC39': 'Lemmetjie',
      'cFFEB3B': 'Geel',
      'cFFC107': 'Amber',
      'cFF9800': 'Oranje',
      'cFF5722': 'Diep Oranje',
      'c795548': 'Bruin',
      'c9E9E9E': 'Grys',
      'c607D8B': 'Blougrys',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Vermindering van die woordafstand';

  @override
  String get decrementLetterSpacing => 'Vermindering van die letterafstand';

  @override
  String get decrementLineHeight => 'Vermindering van die reëlhoogte';

  @override
  String get decrementTextScaleFactor => 'Vermindering van die teksskaalfaktor';

  @override
  String get effects => 'Effekte';

  @override
  String get expandText => 'Teks uitbreiding';

  @override
  String get fontSize => 'Lettergrootte';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Verhoog of verlaag die woordafstand';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Verhoog of verlaag die letterafstand';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Verhoog of verlaag die reëlhoogte';

  @override
  String get increaseOrDecreaseTextSize =>
      'Verhoog of verlaag die tekstgrootte';

  @override
  String get incrementWordSpacing => 'Verhoog die woordafstand';

  @override
  String get incrementLetterSpacing => 'Verhoog die letterafstand';

  @override
  String get incrementLineHeight => 'Verhoog die reëlhoogte';

  @override
  String get incrementTextScaleFactor => 'Verhoog die teksskaalfaktor';

  @override
  String get lessInfo => 'Verberg info';

  @override
  String get letterSpacing => 'Letterspasiëring';

  @override
  String get lineHeight => 'Reëlhoogte';

  @override
  String get moreInfo => 'Toon info';

  @override
  String get readLess => 'Lees minder';

  @override
  String get readMore => 'Lees meer';

  @override
  String get reduceEffects => 'Vermindering van die effekte';

  @override
  String get reduceText => 'Vermindering van die tekst';

  @override
  String get restoreSettings => 'Herstel instellinge';

  @override
  String get restoreMainColor => 'Herstel hoofkleur';

  @override
  String get returnToMainColors => 'Terug na hoofkleur';

  @override
  String get settings => 'Instellinge';

  @override
  String get sizeAndTextDisplay => 'Grootte en tekstuitstelling';

  @override
  String get sliderWordSpacing => 'Skuifbalk vir woordafstand';

  @override
  String get sliderLetterSpacing => 'Skuifbalk vir letterspasiëring';

  @override
  String get sliderLineHeight => 'Skuifbalk vir reëlhoogte';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Temaprofiel nie herken nie',
      'seizureSafe': 'Epilepsie-veilig',
      'visionImpaired': 'Gesiggestrem',
      'adhdFriendly': 'ADHD-vriendelik',
      'none': 'Verstekprofiel',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsie-veilige profiel';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Verwyder weerkaatsings en verminder kleur';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Hierdie profiel stel gebruikers met epilepsie en diegene met risiko vir toevalle in staat om veilig te blaai deur die risiko van toevalle wat veroorsaak word deur flikkerende animasies en riskante kleurkombinasies te verminder.';

  @override
  String get themeProfileVisionImpairedTitle => 'Gesiggestremde profiel';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Verbeter die sigbaarheid van die toepassing';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Hierdie profiel pas die toepassing aan om toeganklik te wees vir die meeste visuele gestremdhede, soos gesiggestremdheid, tonnelsig, katarakte, gloukoom en meer.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-vriendelike profiel';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Meer konsentrasie en minder afleidings';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Hierdie profiel verminder afleidings beduidend om mense met ADHD en neuro-ontwikkelingsversteurings te help om makliker deur die toepassing te navigeer, te lees en op die noodsaaklike elemente te fokus.';

  @override
  String get theSettingsHaveBeenReset => 'Die instellinge is herstel.';

  @override
  String get toggleDarkMode => 'Wissel donker modus';

  @override
  String get toggleEffectsMode => 'Wissel effekte modus';

  @override
  String get toggleFontWeight => 'Wissel font gewicht';

  @override
  String get toggleThemeProfile => 'Wissel temaprofiel';

  @override
  String get wordSpacing => 'Woordafstand';

  @override
  String get accessibleFont => 'Toeganklike lettertipe';

  @override
  String get accessibleFontSubtitle =>
      'Gebruik \'n toeganklike lettertipe vir beter leesbaarheid';

  @override
  String get accessibleFontEnabled => 'Toeganklike lettertipe geaktiveer';

  @override
  String get accessibleFontDisabled => 'Toeganklike lettertipe gedeaktiveer';

  @override
  String get toggleAccessibleFont => 'Wissel toeganklike lettertipe';

  @override
  String get settingsLoading => 'Die toeganklikheidsinstellings word gelaai…';

  @override
  String get settingsLoadFailed =>
      'Die toeganklikheidsinstellings kon nie gelaai word nie.';

  @override
  String get retry => 'Probeer weer';

  @override
  String get themeModeSystem => 'Stelsel';

  @override
  String get themeModeLight => 'Lig';

  @override
  String get themeModeDark => 'Donker';

  @override
  String get effectsModeSystem => 'Stelsel';

  @override
  String get effectsModeEnabled => 'Aan';

  @override
  String get effectsModeDisabled => 'Af';
}
