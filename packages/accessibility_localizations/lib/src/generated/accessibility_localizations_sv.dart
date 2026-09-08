// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AccessibilityLocalizationsSv extends AccessibilityLocalizations {
  AccessibilityLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get accessibility => 'Tillgänglighet';

  @override
  String get accessibilitySettings => 'Tillgänglighetsinställningar';

  @override
  String get adjustBackgroundColors => 'Justera bakgrundsfärger';

  @override
  String get adjustTextColors => 'Justera textfärger';

  @override
  String get alignCenter => 'Centrera';

  @override
  String get alignLeft => 'Vänsterjustera';

  @override
  String get alignRight => 'Högerjustera';

  @override
  String get textAlignment => 'Textjustering';

  @override
  String get boldText => 'Fet text';

  @override
  String get changeBoldText => 'Ändra fet text';

  @override
  String get changePagesBackgroundColor =>
      'Ändra sidornas bakgrundsfärg till: ';

  @override
  String get changeTextColor => 'Ändra textens färg till: ';

  @override
  String get changeTextColorShade => 'Ändra färgnyansen till: ';

  @override
  String get colorAdjustment => 'Färgjustering';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Låg mättnad',
      'normal': 'Normal',
      'highSaturation': 'Hög mättnad',
      'monochrome': 'Monokrom',
      'highContrast': 'Hög kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Aktuell färgprofil är: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Färg känns inte igen',
      'cF44336': 'Röd',
      'cE91E63': 'Rosa',
      'c9C27B0': 'Lila',
      'c673AB7': 'Mörklila',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blå',
      'c03A9F4': 'Ljusblå',
      'c00BCD4': 'Cyan',
      'c009688': 'Blågrön',
      'c4CAF50': 'Grön',
      'c8BC34A': 'Ljusgrön',
      'cCDDC39': 'Lime',
      'cFFEB3B': 'Gul',
      'cFFC107': 'Bärnsten',
      'cFF9800': 'Orange',
      'cFF5722': 'Mörkorange',
      'c795548': 'Brun',
      'c9E9E9E': 'Grå',
      'c607D8B': 'Blågrå',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Minska ordavstånd';

  @override
  String get decrementLetterSpacing => 'Minska bokstavsavstånd';

  @override
  String get decrementLineHeight => 'Minska radhöjd';

  @override
  String get decrementTextScaleFactor => 'Minska textskalfaktor';

  @override
  String get effects => 'Effekter';

  @override
  String get expandText => 'Expandera text';

  @override
  String get fontSize => 'Textstorlek';

  @override
  String get increaseOrDecreaseWordSpacing => 'Öka eller minska ordavstånd';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Öka eller minska bokstavsavstånd';

  @override
  String get increaseOrDecreaseLineHeight => 'Öka eller minska radhöjd';

  @override
  String get increaseOrDecreaseTextSize => 'Öka eller minska textstorlek';

  @override
  String get incrementWordSpacing => 'Öka ordavstånd';

  @override
  String get incrementLetterSpacing => 'Öka bokstavsavstånd';

  @override
  String get incrementLineHeight => 'Öka radhöjd';

  @override
  String get incrementTextScaleFactor => 'Öka textskalfaktor';

  @override
  String get lessInfo => 'Dölj information';

  @override
  String get letterSpacing => 'Bokstavsavstånd';

  @override
  String get lineHeight => 'Radhöjd';

  @override
  String get moreInfo => 'Visa information';

  @override
  String get readLess => 'Läs mindre';

  @override
  String get readMore => 'Läs mer';

  @override
  String get reduceEffects => 'Minska effekter på skärmen';

  @override
  String get reduceText => 'Minska text';

  @override
  String get restoreSettings => 'Återställ inställningar';

  @override
  String get restoreMainColor => 'Återställ huvudfärg';

  @override
  String get returnToMainColors => 'Återgå till huvudfärger';

  @override
  String get settings => 'Inställningar';

  @override
  String get sizeAndTextDisplay => 'Storlek och textvisning';

  @override
  String get sliderWordSpacing => 'Reglage för ordavstånd';

  @override
  String get sliderLetterSpacing => 'Reglage för bokstavsavstånd';

  @override
  String get sliderLineHeight => 'Reglage för radhöjd';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Temaprofil känns inte igen',
      'seizureSafe': 'Epilepsivänlig',
      'visionImpaired': 'Synnedsatt',
      'adhdFriendly': 'ADHD-vänlig',
      'none': 'Standardprofil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepsivänlig profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Ta bort reflektioner och minska färg';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Denna profil gör det möjligt för användare som har epilepsi och löper risk för anfall att surfa säkert genom att eliminera risken för anfall som orsakas av blinkande animationer och riskfyllda färgkombinationer.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil för synnedsatta';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Förbättra synligheten i applikationen';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Denna profil anpassar applikationen för att vara tillgänglig för de flesta synnedsattningar, såsom synnedsattning, tunnelseende, grå starr, glöm och mer.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-vänlig profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mer koncentration och mindre distraktioner';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Denna profil minskar distraktioner avseende, för att hjälpa personer med ADHD och neuroutvecklingsstörningar att navigera, läsa och fokusera på de väsentliga elementen i applikationen enklare.';

  @override
  String get theSettingsHaveBeenReset => 'Inställningarna har återställts.';

  @override
  String get toggleDarkMode => 'Växla mörkt läge';

  @override
  String get toggleEffectsMode => 'Växla effektläge';

  @override
  String get toggleFontWeight => 'Växla texttjocklek';

  @override
  String get toggleThemeProfile => 'Växla temaprofil';

  @override
  String get wordSpacing => 'Ordavstånd';

  @override
  String get accessibleFont => 'Tillgängligt typsnitt';

  @override
  String get accessibleFontSubtitle =>
      'Använd ett tillgängligt typsnitt för bättre läsbarhet';

  @override
  String get accessibleFontEnabled => 'Tillgängligt typsnitt aktiverat';

  @override
  String get accessibleFontDisabled => 'Tillgängligt typsnitt inaktiverat';

  @override
  String get toggleAccessibleFont => 'Växla tillgängligt typsnitt';

  @override
  String get settingsLoading => 'Läser in tillgänglighetsinställningarna…';

  @override
  String get settingsLoadFailed =>
      'Det gick inte att läsa in tillgänglighetsinställningarna.';

  @override
  String get retry => 'Försök igen';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Ljust';

  @override
  String get themeModeDark => 'Mörkt';

  @override
  String get effectsModeSystem => 'System';

  @override
  String get effectsModeEnabled => 'På';

  @override
  String get effectsModeDisabled => 'Av';
}
