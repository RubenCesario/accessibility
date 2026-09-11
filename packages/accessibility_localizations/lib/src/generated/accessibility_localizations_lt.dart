// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AccessibilityLocalizationsLt extends AccessibilityLocalizations {
  AccessibilityLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get accessibility => 'Prieinamumas';

  @override
  String get accessibilitySettings => 'Prieinamumo nustatymai';

  @override
  String get adjustBackgroundColors => 'Koreguoti fono spalvas';

  @override
  String get adjustTextColors => 'Koreguoti teksto spalvas';

  @override
  String get alignCenter => 'Lygiuoti centre';

  @override
  String get alignLeft => 'Lygiuoti kairėje';

  @override
  String get alignRight => 'Lygiuoti dešinėje';

  @override
  String get textAlignment => 'Teksto lygiavimas';

  @override
  String get boldText => 'Paryškintas tekstas';

  @override
  String get changeBoldText => 'Keisti teksto paryškinimą';

  @override
  String get changePagesBackgroundColor => 'Keisti puslapių fono spalvą į: ';

  @override
  String get changeTextColor => 'Keisti teksto spalvą į: ';

  @override
  String get changeTextColorShade => 'Keisti spalvos atspalvį į: ';

  @override
  String get colorAdjustment => 'Spalvų koregavimas';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Įprastas',
      'lowSaturation': 'Žemas sotīs',
      'normal': 'Įprastas',
      'highSaturation': 'Aukštas sotīs',
      'monochrome': 'Vienspalvis',
      'highContrast': 'Didelis kontrastas',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Dabartinis spalvų profilis yra: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Spalva neatpažinta',
      'cF44336': 'Raudona',
      'cE91E63': 'Rožinė',
      'c9C27B0': 'Violetinė',
      'c673AB7': 'Tamsiai violetine',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Mėlyna',
      'c03A9F4': 'Šviesi mėlyna',
      'c00BCD4': 'Žydra',
      'c009688': 'Smaragdinė',
      'c4CAF50': 'Žalia',
      'c8BC34A': 'Šviesi žalia',
      'cCDDC39': 'Žalsvai geltona',
      'cFFEB3B': 'Geltona',
      'cFFC107': 'Gintarinė',
      'cFF9800': 'Oranžinė',
      'cFF5722': 'Tamsiai oranžinė',
      'c795548': 'Ruda',
      'c9E9E9E': 'Pilka',
      'c607D8B': 'Melsvai pilka',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Mažinti žodžių tarpą';

  @override
  String get decrementLetterSpacing => 'Mažinti raidžių tarpą';

  @override
  String get decrementLineHeight => 'Mažinti eilutės aukštį';

  @override
  String get decrementTextScaleFactor => 'Mažinti teksto mastelio koeficientą';

  @override
  String get effects => 'Efektai';

  @override
  String get expandText => 'Išplėsti tekstą';

  @override
  String get fontSize => 'Šrifto dydis';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Padidinti arba sumažinti žodžių tarpą';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Padidinti arba sumažinti raidžių tarpą';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Padidinti arba sumažinti eilutės aukštį';

  @override
  String get increaseOrDecreaseTextSize =>
      'Padidinti arba sumažinti teksto dydį';

  @override
  String get incrementWordSpacing => 'Padidinti žodžių tarpą';

  @override
  String get incrementLetterSpacing => 'Padidinti raidžių tarpą';

  @override
  String get incrementLineHeight => 'Padidinti eilutės aukštį';

  @override
  String get incrementTextScaleFactor =>
      'Padidinti teksto mastelio koeficientą';

  @override
  String get lessInfo => 'Slėpti informaciją';

  @override
  String get letterSpacing => 'Raidžių tarpas';

  @override
  String get lineHeight => 'Eilutės aukštis';

  @override
  String get moreInfo => 'Rodyti informaciją';

  @override
  String get readLess => 'Skaityti mažiau';

  @override
  String get readMore => 'Skaityti daugiau';

  @override
  String get reduceEffects => 'Sumažinti efektus ekrane';

  @override
  String get reduceText => 'Sumažinti tekstą';

  @override
  String get restoreSettings => 'Atstatyti nustatymus';

  @override
  String get restoreMainColor => 'Atstatyti pagrindinę spalvą';

  @override
  String get returnToMainColors => 'Grįžti į pagrindines spalvas';

  @override
  String get settings => 'Nustatymai';

  @override
  String get sizeAndTextDisplay => 'Dydis ir teksto rodymas';

  @override
  String get sliderWordSpacing => 'Žodžių tarpo slankiklis';

  @override
  String get sliderLetterSpacing => 'Raidžių tarpo slankiklis';

  @override
  String get sliderLineHeight => 'Eilutės aukščio slankiklis';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Temos profilis neatpažintas',
      'seizureSafe': 'Saugus nuo priepuolių',
      'visionImpaired': 'Silpnaregiams',
      'adhdFriendly': 'ADHD draugiškas',
      'none': 'Numatytasis profilis',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Saugus nuo priepuolių profilis';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Pašalinti atspindžius ir sumažinti spalvas';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Šis profilis leidžia vartotojams, sergantiems epilepsija ir turintiems priepuolių riziką, naršyti saugiai pašalinant priepuolių, kuriuos sukelia mirksintys animaciniai elementai ir rizikingos spalvų kombinacijos, riziką.';

  @override
  String get themeProfileVisionImpairedTitle => 'Silpnaregių profilis';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Pagerinti programos matomumą';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Šis profilis pritaiko programą, kad ji būtų prieinama daugumai regėjimo sutrikimų, tokiems kaip silpnaregystė, tunelio regėjimas, katarakta, glaukoma ir kitiems.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD draugiškas profilis';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Didesnis susikaupimas ir mažiau blaškomų veiksnių';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Šis profilis žymiai sumažina blaškančius veiksnius, padėdamas žmonėms su ADHD ir neuroraidos sutrikimais lengviau naršyti, skaityti ir sutelkti dėmesį į esminius programos elementus.';

  @override
  String get theSettingsHaveBeenReset => 'Nustatymai buvo atstatyti.';

  @override
  String get toggleDarkMode => 'Perjungti tamsų režimą';

  @override
  String get toggleEffectsMode => 'Perjungti efektų režimą';

  @override
  String get toggleFontWeight => 'Perjungti šrifto storį';

  @override
  String get toggleThemeProfile => 'Perjungti temos profilį';

  @override
  String get wordSpacing => 'Žodžių tarpas';

  @override
  String get accessibleFont => 'Prieinamas šriftas';

  @override
  String get accessibleFontSubtitle =>
      'Naudokite pritaikytą šriftą geresniam skaitomumui';

  @override
  String get accessibleFontEnabled => 'Prieinamas šriftas įjungtas';

  @override
  String get accessibleFontDisabled => 'Prieinamas šriftas išjungtas';

  @override
  String get toggleAccessibleFont => 'Perjungti prieinamą šriftą';

  @override
  String get settingsLoading => 'Įkeliami prieinamumo nustatymai…';

  @override
  String get settingsLoadFailed => 'Nepavyko įkelti prieinamumo nustatymų.';

  @override
  String get retry => 'Bandyti dar kartą';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Šviesi';

  @override
  String get themeModeDark => 'Tamsi';

  @override
  String get effectsModeSystem => 'Sistema';

  @override
  String get effectsModeEnabled => 'Įjungta';

  @override
  String get effectsModeDisabled => 'Išjungta';
}
