// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AccessibilityLocalizationsDe extends AccessibilityLocalizations {
  AccessibilityLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get accessibility => 'Barrierefreiheit';

  @override
  String get accessibilitySettings => 'Barrierefreiheit-Einstellungen';

  @override
  String get adjustBackgroundColors => 'Hintergrundfarben anpassen';

  @override
  String get adjustTextColors => 'Textfarben anpassen';

  @override
  String get alignCenter => 'Zentriert ausrichten';

  @override
  String get alignLeft => 'Linksbündig ausrichten';

  @override
  String get alignRight => 'Rechtsbündig ausrichten';

  @override
  String get textAlignment => 'Textausrichtung';

  @override
  String get boldText => 'Fettschrift';

  @override
  String get changeBoldText => 'Fettschrift ändern';

  @override
  String get changePagesBackgroundColor =>
      'Hintergrundfarbe der Seiten ändern zu: ';

  @override
  String get changeTextColor => 'Farbe des Textes ändern zu: ';

  @override
  String get changeTextColorShade => 'Schattierung der Farbe ändern zu: ';

  @override
  String get colorAdjustment => 'Farbanpassung';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Geringe Sättigung',
      'normal': 'Normal',
      'highSaturation': 'Hohe Sättigung',
      'monochrome': 'Monochrom',
      'highContrast': 'Hoher Kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Das aktuelle Farbprofil ist: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Farbe nicht erkannt',
      'cF44336': 'Rot',
      'cE91E63': 'Pink',
      'c9C27B0': 'Lila',
      'c673AB7': 'Dunkellila',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blau',
      'c03A9F4': 'Hellblau',
      'c00BCD4': 'Cyan',
      'c009688': 'Türkis',
      'c4CAF50': 'Grün',
      'c8BC34A': 'Hellgrün',
      'cCDDC39': 'Limette',
      'cFFEB3B': 'Gelb',
      'cFFC107': 'Bernstein',
      'cFF9800': 'Orange',
      'cFF5722': 'Dunkelorange',
      'c795548': 'Braun',
      'c9E9E9E': 'Grau',
      'c607D8B': 'Blaugrau',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Wortabstand verringern';

  @override
  String get decrementLetterSpacing => 'Buchstabenabstand verringern';

  @override
  String get decrementLineHeight => 'Zeilenhöhe verringern';

  @override
  String get decrementTextScaleFactor => 'Textskalierungsfaktor verringern';

  @override
  String get effects => 'Effekte';

  @override
  String get expandText => 'Text erweitern';

  @override
  String get fontSize => 'Schriftgröße';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Wortabstand erhöhen oder verringern';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Buchstabenabstand erhöhen oder verringern';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Zeilenhöhe erhöhen oder verringern';

  @override
  String get increaseOrDecreaseTextSize => 'Textgröße erhöhen oder verringern';

  @override
  String get incrementWordSpacing => 'Wortabstand erhöhen';

  @override
  String get incrementLetterSpacing => 'Buchstabenabstand erhöhen';

  @override
  String get incrementLineHeight => 'Zeilenhöhe erhöhen';

  @override
  String get incrementTextScaleFactor => 'Textskalierungsfaktor erhöhen';

  @override
  String get lessInfo => 'Info ausblenden';

  @override
  String get letterSpacing => 'Buchstabenabstand';

  @override
  String get lineHeight => 'Zeilenhöhe';

  @override
  String get moreInfo => 'Info anzeigen';

  @override
  String get readLess => 'Weniger lesen';

  @override
  String get readMore => 'Mehr lesen';

  @override
  String get reduceEffects => 'Bildschirmeffekte reduzieren';

  @override
  String get reduceText => 'Text verkleinern';

  @override
  String get restoreSettings => 'Einstellungen zurücksetzen';

  @override
  String get restoreMainColor => 'Hauptfarbe wiederherstellen';

  @override
  String get returnToMainColors => 'Zurück zu Hauptfarben';

  @override
  String get settings => 'Einstellungen';

  @override
  String get sizeAndTextDisplay => 'Größe und Textanzeige';

  @override
  String get sliderWordSpacing => 'Schieberegler für Wortabstand';

  @override
  String get sliderLetterSpacing => 'Schieberegler für Buchstabenabstand';

  @override
  String get sliderLineHeight => 'Schieberegler für Zeilenhöhe';

  @override
  String get themeMode => 'Thema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Themaprofil nicht erkannt',
      'seizureSafe': 'Epilepsie-sicher',
      'visionImpaired': 'Für Sehbehinderung',
      'adhdFriendly': 'ADHS-freundlich',
      'none': 'Standardprofil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsie-sicheres Profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Reflexionen entfernen und Farbe reduzieren';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Dieses Profil ermöglicht Benutzern mit Epilepsie und erhöhtem Anfallsrisiko eine sichere Nutzung, indem es das Risiko von Anfällen durch blinkende Animationen und riskante Farbkombinationen verringert.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil für Sehbehinderung';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Verbessert die Sichtbarkeit der Anwendung';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Dieses Profil passt die Anwendung an, um für die meisten Sehbehinderungen zugänglich zu sein, wie z.B. Sehschwäche, Tunnelblick, Katarakte, Glaukom und mehr.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHS-freundliches Profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mehr Konzentration und weniger Ablenkung';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Dieses Profil reduziert Ablenkungen erheblich, um Menschen mit ADHS und neurologischen Entwicklungsstörungen zu helfen, leichter zu navigieren, zu lesen und sich auf die wesentlichen Elemente der Anwendung zu konzentrieren.';

  @override
  String get theSettingsHaveBeenReset =>
      'Die Einstellungen wurden zurückgesetzt.';

  @override
  String get toggleDarkMode => 'Dunkelmodus umschalten';

  @override
  String get toggleEffectsMode => 'Effektmodus umschalten';

  @override
  String get toggleFontWeight => 'Schriftstärke umschalten';

  @override
  String get toggleThemeProfile => 'Themaprofil umschalten';

  @override
  String get wordSpacing => 'Wortabstand';

  @override
  String get accessibleFont => 'Barrierefreie Schriftart';

  @override
  String get accessibleFontSubtitle =>
      'Verwenden Sie eine barrierefreie Schriftart für bessere Lesbarkeit';

  @override
  String get accessibleFontEnabled => 'Barrierefreie Schriftart aktiviert';

  @override
  String get accessibleFontDisabled => 'Barrierefreie Schriftart deaktiviert';

  @override
  String get toggleAccessibleFont => 'Barrierefreie Schriftart umschalten';

  @override
  String get settingsLoading =>
      'Die Barrierefreiheit-Einstellungen werden geladen…';

  @override
  String get settingsLoadFailed =>
      'Die Barrierefreiheit-Einstellungen konnten nicht geladen werden.';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Hell';

  @override
  String get themeModeDark => 'Dunkel';

  @override
  String get effectsModeSystem => 'System';

  @override
  String get effectsModeEnabled => 'Ein';

  @override
  String get effectsModeDisabled => 'Aus';
}
