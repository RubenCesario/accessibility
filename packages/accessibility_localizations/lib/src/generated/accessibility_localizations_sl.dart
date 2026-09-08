// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AccessibilityLocalizationsSl extends AccessibilityLocalizations {
  AccessibilityLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get accessibility => 'Dostopnost';

  @override
  String get accessibilitySettings => 'Nastavitve dostopnosti';

  @override
  String get adjustBackgroundColors => 'Prilagodi barve ozadja';

  @override
  String get adjustTextColors => 'Prilagodi barve besedila';

  @override
  String get alignCenter => 'Poravnaj na sredino';

  @override
  String get alignLeft => 'Poravnaj levo';

  @override
  String get alignRight => 'Poravnaj desno';

  @override
  String get textAlignment => 'Poravnava besedila';

  @override
  String get boldText => 'Krepko besedilo';

  @override
  String get changeBoldText => 'Spremeni krepko besedilo';

  @override
  String get changePagesBackgroundColor => 'Spremeni barvo ozadja strani na: ';

  @override
  String get changeTextColor => 'Spremeni barvo besedila na: ';

  @override
  String get changeTextColorShade => 'Spremeni odtenek barve na: ';

  @override
  String get colorAdjustment => 'Prilagoditev barv';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normalno',
      'lowSaturation': 'Nizka nasičenost',
      'normal': 'Normalno',
      'highSaturation': 'Visoka nasičenost',
      'monochrome': 'Enobarvno',
      'highContrast': 'Visok kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Trenutni barvni profil je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Barva ni prepoznana',
      'cF44336': 'Rdeča',
      'cE91E63': 'Roza',
      'c9C27B0': 'Vijolična',
      'c673AB7': 'Temno vijolična',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Modra',
      'c03A9F4': 'Svetlo modra',
      'c00BCD4': 'Cijan',
      'c009688': 'Turkizna',
      'c4CAF50': 'Zelena',
      'c8BC34A': 'Svetlo zelena',
      'cCDDC39': 'Limeta',
      'cFFEB3B': 'Rumena',
      'cFFC107': 'Jantarna',
      'cFF9800': 'Oranžna',
      'cFF5722': 'Temno oranžna',
      'c795548': 'Rjava',
      'c9E9E9E': 'Siva',
      'c607D8B': 'Modro siva',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Zmanjšaj razmik med besedami';

  @override
  String get decrementLetterSpacing => 'Zmanjšaj razmik med črkami';

  @override
  String get decrementLineHeight => 'Zmanjšaj višino vrstice';

  @override
  String get decrementTextScaleFactor => 'Zmanjšaj faktor velikosti besedila';

  @override
  String get effects => 'Učinki';

  @override
  String get expandText => 'Razširi besedilo';

  @override
  String get fontSize => 'Velikost pisave';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Povečaj ali zmanjšaj razmik med besedami';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Povečaj ali zmanjšaj razmik med črkami';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Povečaj ali zmanjšaj višino vrstice';

  @override
  String get increaseOrDecreaseTextSize =>
      'Povečaj ali zmanjšaj velikost besedila';

  @override
  String get incrementWordSpacing => 'Povečaj razmik med besedami';

  @override
  String get incrementLetterSpacing => 'Povečaj razmik med črkami';

  @override
  String get incrementLineHeight => 'Povečaj višino vrstice';

  @override
  String get incrementTextScaleFactor => 'Povečaj faktor velikosti besedila';

  @override
  String get lessInfo => 'Skrij informacije';

  @override
  String get letterSpacing => 'Razmik med črkami';

  @override
  String get lineHeight => 'Višina vrstice';

  @override
  String get moreInfo => 'Prikaži informacije';

  @override
  String get readLess => 'Preberi manj';

  @override
  String get readMore => 'Preberi več';

  @override
  String get reduceEffects => 'Zmanjšaj učinke na zaslonu';

  @override
  String get reduceText => 'Zmanjšaj besedilo';

  @override
  String get restoreSettings => 'Obnovi nastavitve';

  @override
  String get restoreMainColor => 'Obnovi glavno barvo';

  @override
  String get returnToMainColors => 'Vrni se na glavne barve';

  @override
  String get settings => 'Nastavitve';

  @override
  String get sizeAndTextDisplay => 'Velikost in prikaz besedila';

  @override
  String get sliderWordSpacing => 'Drsnik za razmik med besedami';

  @override
  String get sliderLetterSpacing => 'Drsnik za razmik med črkami';

  @override
  String get sliderLineHeight => 'Drsnik za višino vrstice';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil teme ni prepoznan',
      'seizureSafe': 'Varno za epileptike',
      'visionImpaired': 'Za slabovidne',
      'adhdFriendly': 'Prijazno za ADHD',
      'none': 'Privzeti profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil varen za epileptike';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Odstrani odseve in zmanjšaj barve';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ta profil omogoča uporabnikom z epilepsijo in tveganjem za napade varno brskanje z odpravo tveganja napadov, ki so posledica utripajočih animacij in tveganih barvnih kombinacij.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil za slabovidne';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Izboljšaj vidljivost aplikacije';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ta profil prilagodi aplikacijo tako, da je dostopna večini vidnih okvar, kot so slabovidnost, tunelski vid, siva mrena, glavkom in drugo.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil prijazen za ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Več koncentracije in manj motenj';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ta profil občutno zmanjša motnje, da pomaga ljudem z ADHD in razvojnimi motnjami lažje krmariti, brati in se osredotočiti na bistvene elemente aplikacije.';

  @override
  String get theSettingsHaveBeenReset => 'Nastavitve so bile ponastavljene.';

  @override
  String get toggleDarkMode => 'Preklopi temni način';

  @override
  String get toggleEffectsMode => 'Preklopi način učinkov';

  @override
  String get toggleFontWeight => 'Preklopi debelino pisave';

  @override
  String get toggleThemeProfile => 'Preklopi profil teme';

  @override
  String get wordSpacing => 'Razmik med besedami';

  @override
  String get accessibleFont => 'Dostopna pisava';

  @override
  String get accessibleFontSubtitle =>
      'Uporabite dostopno pisavo za boljšo berljivost';

  @override
  String get accessibleFontEnabled => 'Dostopna pisava omogočena';

  @override
  String get accessibleFontDisabled => 'Dostopna pisava onemogočena';

  @override
  String get toggleAccessibleFont => 'Preklopi dostopno pisavo';

  @override
  String get settingsLoading => 'Nalaganje nastavitev dostopnosti…';

  @override
  String get settingsLoadFailed =>
      'Nastavitev dostopnosti ni bilo mogoče naložiti.';

  @override
  String get retry => 'Poskusi znova';

  @override
  String get themeModeSystem => 'Sistem';

  @override
  String get themeModeLight => 'Svetla';

  @override
  String get themeModeDark => 'Temna';

  @override
  String get effectsModeSystem => 'Sistem';

  @override
  String get effectsModeEnabled => 'Vklopljeno';

  @override
  String get effectsModeDisabled => 'Izklopljeno';
}
