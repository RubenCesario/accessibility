// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AccessibilityLocalizationsNo extends AccessibilityLocalizations {
  AccessibilityLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get accessibility => 'Tilgjengelighet';

  @override
  String get accessibilitySettings => 'Tilgjengelighetsinnstillinger';

  @override
  String get adjustBackgroundColors => 'Juster bakgrunnsfarger';

  @override
  String get adjustTextColors => 'Juster tekstfarger';

  @override
  String get alignCenter => 'Sentrer';

  @override
  String get alignLeft => 'Venstrejuster';

  @override
  String get alignRight => 'Høyrejuster';

  @override
  String get textAlignment => 'Tekstjustering';

  @override
  String get boldText => 'Fet tekst';

  @override
  String get changeBoldText => 'Endre fet tekst';

  @override
  String get changePagesBackgroundColor =>
      'Endre bakgrunnsfargen på sidene til: ';

  @override
  String get changeTextColor => 'Endre fargen på teksten til: ';

  @override
  String get changeTextColorShade => 'Endre nyansen av fargen til: ';

  @override
  String get colorAdjustment => 'Fargejustering';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Lav metning',
      'normal': 'Normal',
      'highSaturation': 'Høy metning',
      'monochrome': 'Monokrom',
      'highContrast': 'Høy kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Gjeldende fargeprofil er: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Farge ikke gjenkjent',
      'cF44336': 'Rød',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Lilla',
      'c673AB7': 'Dyp lilla',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blå',
      'c03A9F4': 'Lyseblå',
      'c00BCD4': 'Cyan',
      'c009688': 'Turkis',
      'c4CAF50': 'Grønn',
      'c8BC34A': 'Lysegrønn',
      'cCDDC39': 'Lime',
      'cFFEB3B': 'Gul',
      'cFFC107': 'Ravgul',
      'cFF9800': 'Oransje',
      'cFF5722': 'Dyp oransje',
      'c795548': 'Brun',
      'c9E9E9E': 'Grå',
      'c607D8B': 'Blågrå',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Reduser ordmellomrom';

  @override
  String get decrementLetterSpacing => 'Reduser bokstavmellomrom';

  @override
  String get decrementLineHeight => 'Reduser linjehøyde';

  @override
  String get decrementTextScaleFactor => 'Reduser tekstskaleringsfaktor';

  @override
  String get effects => 'Effekter';

  @override
  String get expandText => 'Utvid tekst';

  @override
  String get fontSize => 'Skriftstørrelse';

  @override
  String get increaseOrDecreaseWordSpacing => 'Øk eller reduser ordmellomrom';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Øk eller reduser bokstavmellomrom';

  @override
  String get increaseOrDecreaseLineHeight => 'Øk eller reduser linjehøyde';

  @override
  String get increaseOrDecreaseTextSize => 'Øk eller reduser tekststørrelse';

  @override
  String get incrementWordSpacing => 'Øk ordmellomrom';

  @override
  String get incrementLetterSpacing => 'Øk bokstavmellomrom';

  @override
  String get incrementLineHeight => 'Øk linjehøyde';

  @override
  String get incrementTextScaleFactor => 'Øk tekstskaleringsfaktor';

  @override
  String get lessInfo => 'Skjul info';

  @override
  String get letterSpacing => 'Bokstavmellomrom';

  @override
  String get lineHeight => 'Linjehøyde';

  @override
  String get moreInfo => 'Vis info';

  @override
  String get readLess => 'Les mindre';

  @override
  String get readMore => 'Les mer';

  @override
  String get reduceEffects => 'Reduser effekter på skjermen';

  @override
  String get reduceText => 'Reduser tekst';

  @override
  String get restoreSettings => 'Gjenopprett innstillinger';

  @override
  String get restoreMainColor => 'Gjenopprett hovedfarge';

  @override
  String get returnToMainColors => 'Gå tilbake til hovedfarger';

  @override
  String get settings => 'Innstillinger';

  @override
  String get sizeAndTextDisplay => 'Størrelse og tekstvisning';

  @override
  String get sliderWordSpacing => 'Glidebryter for ordmellomrom';

  @override
  String get sliderLetterSpacing => 'Glidebryter for bokstavmellomrom';

  @override
  String get sliderLineHeight => 'Glidebryter for linjehøyde';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Temaprofil ikke gjenkjent',
      'seizureSafe': 'Epilepsisikker',
      'visionImpaired': 'Synshemmet',
      'adhdFriendly': 'ADHD-vennlig',
      'none': 'Standardprofil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsisikker profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Fjern refleksjoner og reduser farge';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Denne profilen gjør det mulig for brukere som har epilepsi og er i fare for anfall å surfe trygt ved å eliminere risikoen for anfall som skyldes blinkende animasjoner og risikable fargekombinasjoner.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil for synshemmede';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Forbedre synligheten av applikasjonen';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Denne profilen tilpasser applikasjonen til å være tilgjengelig for de fleste synshemninger, som synshemming, tunnelsyn, grå stær, grønn stær og mer.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-vennlig profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mer konsentrasjon og mindre distraksjoner';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Denne profilen reduserer distraksjoner betydelig, for å hjelpe personer med ADHD og nevrologiske utviklingsforstyrrelser med å navigere, lese og fokusere på de essensielle elementene i applikasjonen enklere.';

  @override
  String get theSettingsHaveBeenReset => 'Innstillingene er tilbakestilt.';

  @override
  String get toggleDarkMode => 'Slå på/av mørk modus';

  @override
  String get toggleEffectsMode => 'Slå på/av effektmodus';

  @override
  String get toggleFontWeight => 'Slå på/av skriftvekt';

  @override
  String get toggleThemeProfile => 'Slå på/av temaprofil';

  @override
  String get wordSpacing => 'Ordmellomrom';

  @override
  String get accessibleFont => 'Tilgjengelig skrift';

  @override
  String get accessibleFontSubtitle =>
      'Bruk en tilgjengelig skrift for bedre lesbarhet';

  @override
  String get accessibleFontEnabled => 'Tilgjengelig skrift aktivert';

  @override
  String get accessibleFontDisabled => 'Tilgjengelig skrift deaktivert';

  @override
  String get toggleAccessibleFont => 'Slå på/av tilgjengelig skrift';

  @override
  String get settingsLoading => 'Laster inn tilgjengelighetsinnstillingene…';

  @override
  String get settingsLoadFailed =>
      'Tilgjengelighetsinnstillingene kunne ikke lastes inn.';

  @override
  String get retry => 'Prøv igjen';
}
