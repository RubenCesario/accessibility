// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swiss German Alemannic Alsatian (`gsw`).
class AccessibilityLocalizationsGsw extends AccessibilityLocalizations {
  AccessibilityLocalizationsGsw([String locale = 'gsw']) : super(locale);

  @override
  String get accessibility => 'Barrierefreiheit';

  @override
  String get accessibilitySettings => 'Istellige für Barrierefreiheit';

  @override
  String get adjustBackgroundColors => 'Hindergrundfarbe apasse';

  @override
  String get adjustTextColors => 'Textfarbe apasse';

  @override
  String get alignCenter => 'Zäntriere';

  @override
  String get alignLeft => 'Links usrichte';

  @override
  String get alignRight => 'Rächts usrichte';

  @override
  String get textAlignment => 'Textuusrichtig';

  @override
  String get boldText => 'Fätte Text';

  @override
  String get changeBoldText => 'Fätte Text ändere';

  @override
  String get changePagesBackgroundColor =>
      'Hindergrundfarbe vo de Site ändere uf: ';

  @override
  String get changeTextColor => 'Textfarbe ändere uf: ';

  @override
  String get changeTextColorShade => 'Farbtoon ändere uf: ';

  @override
  String get colorAdjustment => 'Farbappassig';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Niedrigi Sättigung',
      'normal': 'Normal',
      'highSaturation': 'Hochi Sättigung',
      'monochrome': 'Eifarbig',
      'highContrast': 'Hoche Kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'S aktuelle Farbprofil isch: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Farb nid erkannt',
      'cF44336': 'Rot',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Violett',
      'c673AB7': 'Tiefsviolett',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blau',
      'c03A9F4': 'Hellblau',
      'c00BCD4': 'Türkis',
      'c009688': 'Teal',
      'c4CAF50': 'Grüeñ',
      'c8BC34A': 'Hellgrüeñ',
      'cCDDC39': 'Limette',
      'cFFEB3B': 'Gääl',
      'cFFC107': 'Amberfarbig',
      'cFF9800': 'Orange',
      'cFF5722': 'Tiefsorange',
      'c795548': 'Brun',
      'c9E9E9E': 'Grau',
      'c607D8B': 'Blaugrau',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Wortzwischeruum verchlinere';

  @override
  String get decrementLetterSpacing => 'Buechschtabezwischeruum verchlinere';

  @override
  String get decrementLineHeight => 'Zilehöchi verchlinere';

  @override
  String get decrementTextScaleFactor => 'Textskalierigsfaktor verchlinere';

  @override
  String get effects => 'Effekt';

  @override
  String get expandText => 'Text erwiiitere';

  @override
  String get fontSize => 'Schriftgrössi';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Wortzwischeruum vergrössere oder verchlinere';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Buechschtabezwischeruum vergrössere oder verchlinere';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Zilehöchi vergrössere oder verchlinere';

  @override
  String get increaseOrDecreaseTextSize =>
      'Textgrössi vergrössere oder verchlinere';

  @override
  String get incrementWordSpacing => 'Wortzwischeruum vergrössere';

  @override
  String get incrementLetterSpacing => 'Buechschtabezwischeruum vergrössere';

  @override
  String get incrementLineHeight => 'Zilehöchi vergrössere';

  @override
  String get incrementTextScaleFactor => 'Textskalierigsfaktor vergrössere';

  @override
  String get lessInfo => 'Info verstecke';

  @override
  String get letterSpacing => 'Buechschtabezwischeruum';

  @override
  String get lineHeight => 'Zilehöchi';

  @override
  String get moreInfo => 'Info azeige';

  @override
  String get readLess => 'Weniger läse';

  @override
  String get readMore => 'Meh läse';

  @override
  String get reduceEffects => 'Effekt uf em Bildschirm verringere';

  @override
  String get reduceText => 'Text verchlinere';

  @override
  String get restoreSettings => 'Istellige zruggsetze';

  @override
  String get restoreMainColor => 'Hauptfarb zruggsetze';

  @override
  String get returnToMainColors => 'Zrugg zu de Hauptfarbe';

  @override
  String get settings => 'Istellige';

  @override
  String get sizeAndTextDisplay => 'Grössi und Textazeig';

  @override
  String get sliderWordSpacing => 'Schieberegler Wortzwischeruum';

  @override
  String get sliderLetterSpacing => 'Schieberegler Buechschtabezwischeruum';

  @override
  String get sliderLineHeight => 'Schieberegler Zilehöchi';

  @override
  String get themeMode => 'Thema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Themaprofil nid erkannt',
      'seizureSafe': 'Epilepsiesicher',
      'visionImpaired': 'Sehbehinderet',
      'adhdFriendly': 'ADHS-fründlich',
      'none': 'Standardprofil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsiesicheres Profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Reflektione entferne und Farb reduziere';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Das Profil ermöglicht Benutzer mit Epilepsie und Afalsgfahre sicher z\'surfe, indem s\'Risiko vo Afäll, die dürch flimmerndi Animatione und riskanti Farbkombinations entstoh, usgsschloss wird.';

  @override
  String get themeProfileVisionImpairedTitle => 'Sehbehinderede-Profil';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Sichtbarkeit vo de App verbessere';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Das Profil passt d App a, dass si für die meischte Seebhinderige zugänglich isch, wie Sehbhinderig, Tunnelblick, grauer Star, Gloukom und meh.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHS-fründlichs Profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Meh Konzentration und weniger Ablenkige';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Das Profil reduziert Ablenkige deutlich, um Persone mit ADHS und neurologische Entwicklungsstörige z\'helfe, eifacher z\'navigiere, z\'läse und sich uf die wichtige Element vo dr App z\'konzentriere.';

  @override
  String get theSettingsHaveBeenReset => 'D\'Istellige sin zrugggsetzt worde.';

  @override
  String get toggleDarkMode => 'Dunkelmodus umschalte';

  @override
  String get toggleEffectsMode => 'Effektmodus umschalte';

  @override
  String get toggleFontWeight => 'Schriftstärki umschalte';

  @override
  String get toggleThemeProfile => 'Themaprofil umschalte';

  @override
  String get wordSpacing => 'Wortzwischeruum';

  @override
  String get accessibleFont => 'Barrierefreii Schrift';

  @override
  String get accessibleFontSubtitle =>
      'Bruuch e barrierefreii Schrift für besseri Läsbarkeit';

  @override
  String get accessibleFontEnabled => 'Barrierefreii Schrift aktiviert';

  @override
  String get accessibleFontDisabled => 'Barrierefreii Schrift deaktiviert';

  @override
  String get toggleAccessibleFont => 'Barrierefreii Schrift umschalte';

  @override
  String get settingsLoading =>
      'D\'Istellige für Barrierefreiheit werded gladen…';

  @override
  String get settingsLoadFailed =>
      'D\'Istellige für Barrierefreiheit hend nöd chönne gladen werde.';

  @override
  String get retry => 'Nomol probiere';
}
