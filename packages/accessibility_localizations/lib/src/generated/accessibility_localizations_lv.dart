// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AccessibilityLocalizationsLv extends AccessibilityLocalizations {
  AccessibilityLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get accessibility => 'Pieejamība';

  @override
  String get accessibilitySettings => 'Pieejamības iestatījumi';

  @override
  String get adjustBackgroundColors => 'Pielāgot fona krāsas';

  @override
  String get adjustTextColors => 'Pielāgot teksta krāsas';

  @override
  String get alignCenter => 'Līdzināt centrā';

  @override
  String get alignLeft => 'Līdzināt pa kreisi';

  @override
  String get alignRight => 'Līdzināt pa labi';

  @override
  String get textAlignment => 'Teksta līdzināšana';

  @override
  String get boldText => 'Treknraksts';

  @override
  String get changeBoldText => 'Mainīt teksta treknumu';

  @override
  String get changePagesBackgroundColor => 'Mainīt lapu fona krāsu uz: ';

  @override
  String get changeTextColor => 'Mainīt teksta krāsu uz: ';

  @override
  String get changeTextColorShade => 'Mainīt krāsas toni uz: ';

  @override
  String get colorAdjustment => 'Krāsu pielāgošana';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normāls',
      'lowSaturation': 'Zems piesātinājums',
      'normal': 'Normāls',
      'highSaturation': 'Augsts piesātinājums',
      'monochrome': 'Melnbalts',
      'highContrast': 'Augsts kontrasts',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Pašreizējais krāsu profils ir: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Krāsa nav atpazīta',
      'cF44336': 'Sarkana',
      'cE91E63': 'Rozā',
      'c9C27B0': 'Violeta',
      'c673AB7': 'Tumši violeta',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Zila',
      'c03A9F4': 'Gaiši zila',
      'c00BCD4': 'Ciāna',
      'c009688': 'Zilganzaļa',
      'c4CAF50': 'Zaļa',
      'c8BC34A': 'Gaiši zaļa',
      'cCDDC39': 'Laima',
      'cFFEB3B': 'Dzeltena',
      'cFFC107': 'Dzintara',
      'cFF9800': 'Oranža',
      'cFF5722': 'Tumši oranža',
      'c795548': 'Brūna',
      'c9E9E9E': 'Pelēka',
      'c607D8B': 'Zilpelēka',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Samazināt vārdu atstarpi';

  @override
  String get decrementLetterSpacing => 'Samazināt burtu atstarpi';

  @override
  String get decrementLineHeight => 'Samazināt rindu augstumu';

  @override
  String get decrementTextScaleFactor => 'Samazināt teksta mēroga koeficientu';

  @override
  String get effects => 'Efekti';

  @override
  String get expandText => 'Izvērst tekstu';

  @override
  String get fontSize => 'Fonta izmērs';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Palielināt vai samazināt vārdu atstarpi';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Palielināt vai samazināt burtu atstarpi';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Palielināt vai samazināt rindu augstumu';

  @override
  String get increaseOrDecreaseTextSize =>
      'Palielināt vai samazināt teksta izmēru';

  @override
  String get incrementWordSpacing => 'Palielināt vārdu atstarpi';

  @override
  String get incrementLetterSpacing => 'Palielināt burtu atstarpi';

  @override
  String get incrementLineHeight => 'Palielināt rindu augstumu';

  @override
  String get incrementTextScaleFactor => 'Palielināt teksta mēroga koeficientu';

  @override
  String get lessInfo => 'Slēpt informāciju';

  @override
  String get letterSpacing => 'Burtu atstarpe';

  @override
  String get lineHeight => 'Rindu augstums';

  @override
  String get moreInfo => 'Rādīt informāciju';

  @override
  String get readLess => 'Lasīt mazāk';

  @override
  String get readMore => 'Lasīt vairāk';

  @override
  String get reduceEffects => 'Samazināt ekrāna efektus';

  @override
  String get reduceText => 'Samazināt tekstu';

  @override
  String get restoreSettings => 'Atjaunot iestatījumus';

  @override
  String get restoreMainColor => 'Atjaunot galveno krāsu';

  @override
  String get returnToMainColors => 'Atgriezties pie galvenajām krāsām';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get sizeAndTextDisplay => 'Izmērs un teksta attēlojums';

  @override
  String get sliderWordSpacing => 'Vārdu atstarpes slīdnis';

  @override
  String get sliderLetterSpacing => 'Burtu atstarpes slīdnis';

  @override
  String get sliderLineHeight => 'Rindu augstuma slīdnis';

  @override
  String get themeMode => 'Tēma';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Tēmas profils nav atpazīts',
      'seizureSafe': 'Drošs pret lēkmēm',
      'visionImpaired': 'Redzes traucējumi',
      'adhdFriendly': 'ADHD draudzīgs',
      'none': 'Noklusējuma profils',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Drošs pret lēkmēm profils';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Novērst atspīdēšanos un samazināt krāsas';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Šis profils ļauj lietotājiem, kuriem ir epilepsija un lēkmju risks, pārlūkot droši, novēršot lēkmju risku, ko izraisa mirgošana, animācijas un riskantās krāsu kombinācijas.';

  @override
  String get themeProfileVisionImpairedTitle => 'Vājredzīgo profils';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Uzlabot lietotnes redzamību';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Šis profils pielāgo lietotni, lai tā būtu pieejama vairākumam redzes traucējumu, piemēram, vājredzībai, tuneļa redzes, kataraktas, glaukomas un citu redzes problēmu gadījumos.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD draudzīgs profils';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Lielāka koncentrācija un mazāk novēršanās iespēju';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Šis profils ievērojami samazina uzmanības novēršanas faktorus, palīdzot cilvēkiem ar ADHD un neiroattīstības traucējumiem vieglāk pārlūkot, lasīt un koncentrēties uz būtiskajiem lietotnes elementiem.';

  @override
  String get theSettingsHaveBeenReset => 'Iestatījumi ir atiestatīti.';

  @override
  String get toggleDarkMode => 'Pārslēgt tumšo režīmu';

  @override
  String get toggleEffectsMode => 'Pārslēgt efektu režīmu';

  @override
  String get toggleFontWeight => 'Pārslēgt fonta biezumu';

  @override
  String get toggleThemeProfile => 'Pārslēgt tēmas profilu';

  @override
  String get wordSpacing => 'Vārdu atstarpe';

  @override
  String get accessibleFont => 'Pieejams fonts';

  @override
  String get accessibleFontSubtitle =>
      'Izmantojiet pieejamu fontu labākai lasāmībai';

  @override
  String get accessibleFontEnabled => 'Pieejams fonts ieslēgts';

  @override
  String get accessibleFontDisabled => 'Pieejams fonts izslēgts';

  @override
  String get toggleAccessibleFont => 'Pārslēgt pieejamo fontu';

  @override
  String get settingsLoading => 'Notiek pieejamības iestatījumu ielāde…';

  @override
  String get settingsLoadFailed =>
      'Neizdevās ielādēt pieejamības iestatījumus.';

  @override
  String get retry => 'Mēģināt vēlreiz';

  @override
  String get themeModeSystem => 'Sistēma';

  @override
  String get themeModeLight => 'Gaiša';

  @override
  String get themeModeDark => 'Tumša';

  @override
  String get effectsModeSystem => 'Sistēma';

  @override
  String get effectsModeEnabled => 'Ieslēgts';

  @override
  String get effectsModeDisabled => 'Izslēgts';
}
