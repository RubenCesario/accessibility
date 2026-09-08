// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AccessibilityLocalizationsNl extends AccessibilityLocalizations {
  AccessibilityLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get accessibility => 'Toegankelijkheid';

  @override
  String get accessibilitySettings => 'Toegankelijkheidsinstellingen';

  @override
  String get adjustBackgroundColors => 'Achtergrondkleuren aanpassen';

  @override
  String get adjustTextColors => 'Tekstkleuren aanpassen';

  @override
  String get alignCenter => 'Centreren';

  @override
  String get alignLeft => 'Links uitlijnen';

  @override
  String get alignRight => 'Rechts uitlijnen';

  @override
  String get textAlignment => 'Tekstuitlijning';

  @override
  String get boldText => 'Vetgedrukte tekst';

  @override
  String get changeBoldText => 'Vetgedrukte tekst wijzigen';

  @override
  String get changePagesBackgroundColor =>
      'Verander de achtergrondkleur van de pagina\'s naar: ';

  @override
  String get changeTextColor => 'Verander de kleur van de tekst naar: ';

  @override
  String get changeTextColorShade => 'Verander de tint van de kleur naar: ';

  @override
  String get colorAdjustment => 'Kleuraanpassing';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normaal',
      'lowSaturation': 'Lage verzadiging',
      'normal': 'Normaal',
      'highSaturation': 'Hoge verzadiging',
      'monochrome': 'Monochroom',
      'highContrast': 'Hoge contrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Het huidige kleurprofiel is: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Kleur niet herkend',
      'cF44336': 'Rood',
      'cE91E63': 'Roze',
      'c9C27B0': 'Paars',
      'c673AB7': 'Diep paars',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blauw',
      'c03A9F4': 'Lichtblauw',
      'c00BCD4': 'Cyaan',
      'c009688': 'Groenblauw',
      'c4CAF50': 'Groen',
      'c8BC34A': 'Lichtgroen',
      'cCDDC39': 'Limoen',
      'cFFEB3B': 'Geel',
      'cFFC107': 'Amber',
      'cFF9800': 'Oranje',
      'cFF5722': 'Diep oranje',
      'c795548': 'Bruin',
      'c9E9E9E': 'Grijs',
      'c607D8B': 'Blauwgrijs',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Woordafstand verkleinen';

  @override
  String get decrementLetterSpacing => 'Letterafstand verkleinen';

  @override
  String get decrementLineHeight => 'Regelhoogte verkleinen';

  @override
  String get decrementTextScaleFactor => 'Tekstschaalfactor verkleinen';

  @override
  String get effects => 'Effecten';

  @override
  String get expandText => 'Tekst uitbreiden';

  @override
  String get fontSize => 'Lettergrootte';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Woordafstand vergroten of verkleinen';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Letterafstand vergroten of verkleinen';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Regelhoogte vergroten of verkleinen';

  @override
  String get increaseOrDecreaseTextSize =>
      'Tekstgrootte vergroten of verkleinen';

  @override
  String get incrementWordSpacing => 'Woordafstand vergroten';

  @override
  String get incrementLetterSpacing => 'Letterafstand vergroten';

  @override
  String get incrementLineHeight => 'Regelhoogte vergroten';

  @override
  String get incrementTextScaleFactor => 'Tekstschaalfactor vergroten';

  @override
  String get lessInfo => 'Info verbergen';

  @override
  String get letterSpacing => 'Letterafstand';

  @override
  String get lineHeight => 'Regelhoogte';

  @override
  String get moreInfo => 'Info tonen';

  @override
  String get readLess => 'Minder lezen';

  @override
  String get readMore => 'Meer lezen';

  @override
  String get reduceEffects => 'Effecten op scherm verminderen';

  @override
  String get reduceText => 'Tekst verkleinen';

  @override
  String get restoreSettings => 'Instellingen herstellen';

  @override
  String get restoreMainColor => 'Hoofdkleur herstellen';

  @override
  String get returnToMainColors => 'Terug naar hoofdkleuren';

  @override
  String get settings => 'Instellingen';

  @override
  String get sizeAndTextDisplay => 'Grootte en tekstweergave';

  @override
  String get sliderWordSpacing => 'Schuifregelaar woordafstand';

  @override
  String get sliderLetterSpacing => 'Schuifregelaar letterafstand';

  @override
  String get sliderLineHeight => 'Schuifregelaar regelhoogte';

  @override
  String get themeMode => 'Thema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Themaprofiel niet herkend',
      'seizureSafe': 'Epilepsieveilig',
      'visionImpaired': 'Visueel beperkt',
      'adhdFriendly': 'ADHD-vriendelijk',
      'none': 'Standaardprofiel',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsieveilig profiel';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Reflecties verwijderen en kleur verminderen';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Dit profiel stelt gebruikers met epilepsie en risico op aanvallen in staat om veilig te browsen door het risico op aanvallen te elimineren die het gevolg zijn van flitsende animaties en risicovolle kleurencombinaties.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profiel voor visueel beperkten';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Verbeter zichtbaarheid van de applicatie';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Dit profiel past de applicatie aan zodat deze toegankelijk is voor de meeste visuele beperkingen, zoals slechtziendheid, tunnelvisie, staar, glaucoom en meer.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-vriendelijk profiel';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Meer concentratie en minder afleiding';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Dit profiel vermindert afleidingen aanzienlijk, om mensen met ADHD en neurologische ontwikkelingsstoornissen te helpen bij het navigeren, lezen en zich te concentreren op de essentiële elementen van de applicatie.';

  @override
  String get theSettingsHaveBeenReset => 'De instellingen zijn hersteld.';

  @override
  String get toggleDarkMode => 'Donkere modus aan/uit';

  @override
  String get toggleEffectsMode => 'Effectenmodus aan/uit';

  @override
  String get toggleFontWeight => 'Letterdikte aan/uit';

  @override
  String get toggleThemeProfile => 'Themaprofiel aan/uit';

  @override
  String get wordSpacing => 'Woordafstand';

  @override
  String get accessibleFont => 'Toegankelijk lettertype';

  @override
  String get accessibleFontSubtitle =>
      'Gebruik een toegankelijk lettertype voor betere leesbaarheid';

  @override
  String get accessibleFontEnabled => 'Toegankelijk lettertype ingeschakeld';

  @override
  String get accessibleFontDisabled => 'Toegankelijk lettertype uitgeschakeld';

  @override
  String get toggleAccessibleFont => 'Toegankelijk lettertype aan/uit';

  @override
  String get settingsLoading => 'Toegankelijkheidsinstellingen worden geladen…';

  @override
  String get settingsLoadFailed =>
      'De toegankelijkheidsinstellingen konden niet worden geladen.';

  @override
  String get retry => 'Opnieuw proberen';
}
