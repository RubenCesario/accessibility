// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AccessibilityLocalizationsHr extends AccessibilityLocalizations {
  AccessibilityLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get accessibility => 'Pristupačnost';

  @override
  String get accessibilitySettings => 'Postavke pristupačnosti';

  @override
  String get adjustBackgroundColors => 'Prilagodi boje pozadine';

  @override
  String get adjustTextColors => 'Prilagodi boje teksta';

  @override
  String get alignCenter => 'Centriraj';

  @override
  String get alignLeft => 'Poravnaj lijevo';

  @override
  String get alignRight => 'Poravnaj desno';

  @override
  String get textAlignment => 'Poravnanje teksta';

  @override
  String get boldText => 'Podebljani tekst';

  @override
  String get changeBoldText => 'Promijeni podebljani tekst';

  @override
  String get changePagesBackgroundColor =>
      'Promijeni boju pozadine stranica na: ';

  @override
  String get changeTextColor => 'Promijeni boju teksta na: ';

  @override
  String get changeTextColorShade => 'Promijeni nijansu boje na: ';

  @override
  String get colorAdjustment => 'Prilagodba boja';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normalno',
      'lowSaturation': 'Niska zasićenost',
      'normal': 'Normalno',
      'highSaturation': 'Visoka zasićenost',
      'monochrome': 'Jednobojno',
      'highContrast': 'Visoki kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Trenutni profil boja je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Boja nije prepoznata',
      'cF44336': 'Crvena',
      'cE91E63': 'Roza',
      'c9C27B0': 'Ljubičasta',
      'c673AB7': 'Tamno ljubičasta',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Plava',
      'c03A9F4': 'Svijetlo plava',
      'c00BCD4': 'Cijan',
      'c009688': 'Tirkizna',
      'c4CAF50': 'Zelena',
      'c8BC34A': 'Svijetlo zelena',
      'cCDDC39': 'Limeta',
      'cFFEB3B': 'Žuta',
      'cFFC107': 'Jantarna',
      'cFF9800': 'Narančasta',
      'cFF5722': 'Tamno narančasta',
      'c795548': 'Smeđa',
      'c9E9E9E': 'Siva',
      'c607D8B': 'Plavo-siva',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Smanji razmak između riječi';

  @override
  String get decrementLetterSpacing => 'Smanji razmak između slova';

  @override
  String get decrementLineHeight => 'Smanji visinu redka';

  @override
  String get decrementTextScaleFactor => 'Smanji faktor veličine teksta';

  @override
  String get effects => 'Efekti';

  @override
  String get expandText => 'Proširi tekst';

  @override
  String get fontSize => 'Veličina fonta';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Povećaj ili smanji razmak između riječi';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Povećaj ili smanji razmak između slova';

  @override
  String get increaseOrDecreaseLineHeight => 'Povećaj ili smanji visinu redka';

  @override
  String get increaseOrDecreaseTextSize => 'Povećaj ili smanji veličinu teksta';

  @override
  String get incrementWordSpacing => 'Povećaj razmak između riječi';

  @override
  String get incrementLetterSpacing => 'Povećaj razmak između slova';

  @override
  String get incrementLineHeight => 'Povećaj visinu redka';

  @override
  String get incrementTextScaleFactor => 'Povećaj faktor veličine teksta';

  @override
  String get lessInfo => 'Sakrij informacije';

  @override
  String get letterSpacing => 'Razmak između slova';

  @override
  String get lineHeight => 'Visina redka';

  @override
  String get moreInfo => 'Prikaži informacije';

  @override
  String get readLess => 'Čitaj manje';

  @override
  String get readMore => 'Čitaj više';

  @override
  String get reduceEffects => 'Smanji efekte na ekranu';

  @override
  String get reduceText => 'Smanji tekst';

  @override
  String get restoreSettings => 'Vrati postavke';

  @override
  String get restoreMainColor => 'Vrati glavnu boju';

  @override
  String get returnToMainColors => 'Povratak na glavne boje';

  @override
  String get settings => 'Postavke';

  @override
  String get sizeAndTextDisplay => 'Veličina i prikaz teksta';

  @override
  String get sliderWordSpacing => 'Klizač razmaka između riječi';

  @override
  String get sliderLetterSpacing => 'Klizač razmaka između slova';

  @override
  String get sliderLineHeight => 'Klizač visine redka';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil teme nije prepoznat',
      'seizureSafe': 'Sigurno za epilepsiju',
      'visionImpaired': 'Za oštećen vid',
      'adhdFriendly': 'Prilagođeno za ADHD',
      'none': 'Zadani profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil siguran za epilepsiju';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Ukloni refleksije i smanji boje';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ovaj profil omogućuje korisnicima koji boluju od epilepsije i rizikom od napada sigurno pregledavanje eliminirajući rizik od napada uzrokovanih bljeskajućim animacijama i rizičnim kombinacijama boja.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil za oštećen vid';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Poboljšaj vidljivost aplikacije';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ovaj profil prilagođava aplikaciju da bude pristupačna većini oštećenja vida, kao što su slabovidnost, tunelski vid, katarakta, glaukom i više.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-prilagođeni profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Više koncentracije i manje ometanja';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ovaj profil značajno smanjuje ometanja, kako bi pomogao ljudima s ADHD-om i neurološkim poremećajima da lakše navigiraju, čitaju i fokusiraju se na bitne elemente aplikacije.';

  @override
  String get theSettingsHaveBeenReset =>
      'Postavke su vraćene na početne vrijednosti.';

  @override
  String get toggleDarkMode => 'Uključi/isključi tamni način';

  @override
  String get toggleEffectsMode => 'Uključi/isključi način efekata';

  @override
  String get toggleFontWeight => 'Uključi/isključi debljinu fonta';

  @override
  String get toggleThemeProfile => 'Uključi/isključi profil teme';

  @override
  String get wordSpacing => 'Razmak između riječi';

  @override
  String get accessibleFont => 'Pristupačan font';

  @override
  String get accessibleFontSubtitle =>
      'Koristite pristupačan font za bolju čitljivost';

  @override
  String get accessibleFontEnabled => 'Pristupačan font uključen';

  @override
  String get accessibleFontDisabled => 'Pristupačan font isključen';

  @override
  String get toggleAccessibleFont => 'Uključi/isključi pristupačan font';

  @override
  String get settingsLoading => 'Učitavanje postavki pristupačnosti…';

  @override
  String get settingsLoadFailed =>
      'Postavke pristupačnosti nije bilo moguće učitati.';

  @override
  String get retry => 'Pokušaj ponovo';
}
