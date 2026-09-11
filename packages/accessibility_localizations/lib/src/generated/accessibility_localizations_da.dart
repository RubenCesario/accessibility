// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AccessibilityLocalizationsDa extends AccessibilityLocalizations {
  AccessibilityLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get accessibility => 'Tilgængelighed';

  @override
  String get accessibilitySettings => 'Tilgængelighedsindstillinger';

  @override
  String get adjustBackgroundColors => 'Juster baggrundsfarver';

  @override
  String get adjustTextColors => 'Juster tekstfarver';

  @override
  String get alignCenter => 'Centrér tekst';

  @override
  String get alignLeft => 'Venstrejustér tekst';

  @override
  String get alignRight => 'Højrejustér tekst';

  @override
  String get textAlignment => 'Tekstjustering';

  @override
  String get boldText => 'Fed tekst';

  @override
  String get changeBoldText => 'Skift fed tekst';

  @override
  String get changePagesBackgroundColor =>
      'Skift baggrundsfarve på siderne til: ';

  @override
  String get changeTextColor => 'Skift tekstfarve til: ';

  @override
  String get changeTextColorShade => 'Skift farvens nuance til: ';

  @override
  String get colorAdjustment => 'Farvejustering';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Lav mætning',
      'normal': 'Normal',
      'highSaturation': 'Høj mætning',
      'monochrome': 'Monokrom',
      'highContrast': 'Høj kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Den aktuelle farveprofil er: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Farve ikke genkendt',
      'cF44336': 'Rød',
      'cE91E63': 'Pink',
      'c9C27B0': 'Lilla',
      'c673AB7': 'Dyb lilla',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blå',
      'c03A9F4': 'Lyseblå',
      'c00BCD4': 'Cyan',
      'c009688': 'Blågrøn',
      'c4CAF50': 'Grøn',
      'c8BC34A': 'Lysegrøn',
      'cCDDC39': 'Limegrøn',
      'cFFEB3B': 'Gul',
      'cFFC107': 'Rav',
      'cFF9800': 'Orange',
      'cFF5722': 'Dyb orange',
      'c795548': 'Brun',
      'c9E9E9E': 'Grå',
      'c607D8B': 'Blågrå',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Formindsk ordmellemrum';

  @override
  String get decrementLetterSpacing => 'Formindsk bogstavmellemrum';

  @override
  String get decrementLineHeight => 'Formindsk linjehøjde';

  @override
  String get decrementTextScaleFactor => 'Formindsk tekststorhedsfaktor';

  @override
  String get effects => 'Effekter';

  @override
  String get expandText => 'Udvid tekst';

  @override
  String get fontSize => 'Skriftstørrelse';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Forøg eller formindsk ordmellemrum';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Forøg eller formindsk bogstavmellemrum';

  @override
  String get increaseOrDecreaseLineHeight => 'Forøg eller formindsk linjehøjde';

  @override
  String get increaseOrDecreaseTextSize =>
      'Forøg eller formindsk tekststørrelse';

  @override
  String get incrementWordSpacing => 'Forøg ordmellemrum';

  @override
  String get incrementLetterSpacing => 'Forøg bogstavmellemrum';

  @override
  String get incrementLineHeight => 'Forøg linjehøjde';

  @override
  String get incrementTextScaleFactor => 'Forøg tekststorhedsfaktor';

  @override
  String get lessInfo => 'Skjul info';

  @override
  String get letterSpacing => 'Bogstavmellemrum';

  @override
  String get lineHeight => 'Linjehøjde';

  @override
  String get moreInfo => 'Vis info';

  @override
  String get readLess => 'Læs mindre';

  @override
  String get readMore => 'Læs mere';

  @override
  String get reduceEffects => 'Reducer effekter på skærmen';

  @override
  String get reduceText => 'Reducer tekst';

  @override
  String get restoreSettings => 'Gendan indstillinger';

  @override
  String get restoreMainColor => 'Gendan hovedfarve';

  @override
  String get returnToMainColors => 'Vend tilbage til hovedfarver';

  @override
  String get settings => 'Indstillinger';

  @override
  String get sizeAndTextDisplay => 'Størrelse og tekstvisning';

  @override
  String get sliderWordSpacing => 'Skydekontrol til ordmellemrum';

  @override
  String get sliderLetterSpacing => 'Skydekontrol til bogstavmellemrum';

  @override
  String get sliderLineHeight => 'Skydekontrol til linjehøjde';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Temaprofil ikke genkendt',
      'seizureSafe': 'Epilepsivenlig',
      'visionImpaired': 'Synshandicapvenlig',
      'adhdFriendly': 'ADHD-venlig',
      'none': 'Standardprofil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsivenlig profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Fjern refleksioner og reducer farve';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Denne profil gør det muligt for brugere, der har epilepsi og er i risiko for anfæld, at bruge applikationen sikkert ved at eliminere risikoen for anfæld, der skyldes blinkende animationer og risikable farvekombinationer.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil for synshandicappede';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Forbedrer synligheden af applikationen';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Denne profil tilpasser applikationen til at være tilgængelig for de fleste synshandicap, såsom synsnedsættelse, tunnelsyn, grå stær, gløjde og mere.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-venlig profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mere koncentration og færre distraktioner';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Denne profil reducerer væsentligt distraktioner for at hjælpe personer med ADHD og neuroudviklingsmæssige forstyrrelser med at navigere, læse og fokusere på de væsentlige elementer i applikationen mere enkelt.';

  @override
  String get theSettingsHaveBeenReset =>
      'Indstillingerne er blevet nulstillet.';

  @override
  String get toggleDarkMode => 'Skift mørk tilstand';

  @override
  String get toggleEffectsMode => 'Skift effekttilstand';

  @override
  String get toggleFontWeight => 'Skift skrifttyngde';

  @override
  String get toggleThemeProfile => 'Skift temaprofil';

  @override
  String get wordSpacing => 'Ordmellemrum';

  @override
  String get accessibleFont => 'Tilgængelig skrifttype';

  @override
  String get accessibleFontSubtitle =>
      'Brug en tilgængelig skrifttype for bedre læsbarhed';

  @override
  String get accessibleFontEnabled => 'Tilgængelig skrifttype aktiveret';

  @override
  String get accessibleFontDisabled => 'Tilgængelig skrifttype deaktiveret';

  @override
  String get toggleAccessibleFont => 'Skift tilgængelig skrifttype';

  @override
  String get settingsLoading => 'Indlæser tilgængelighedsindstillingerne…';

  @override
  String get settingsLoadFailed =>
      'Tilgængelighedsindstillingerne kunne ikke indlæses.';

  @override
  String get retry => 'Prøv igen';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Lyst';

  @override
  String get themeModeDark => 'Mørkt';

  @override
  String get effectsModeSystem => 'System';

  @override
  String get effectsModeEnabled => 'Til';

  @override
  String get effectsModeDisabled => 'Fra';
}
