// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AccessibilityLocalizationsSr extends AccessibilityLocalizations {
  AccessibilityLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get accessibility => 'Pristupačnost';

  @override
  String get accessibilitySettings => 'Podešavanja pristupačnosti';

  @override
  String get adjustBackgroundColors => 'Prilagodi pozadinske boje';

  @override
  String get adjustTextColors => 'Prilagodi boje teksta';

  @override
  String get alignCenter => 'Poravnaj po sredini';

  @override
  String get alignLeft => 'Poravnaj levo';

  @override
  String get alignRight => 'Poravnaj desno';

  @override
  String get textAlignment => 'Poravnanje teksta';

  @override
  String get boldText => 'Podebljan tekst';

  @override
  String get changeBoldText => 'Promeni podebljanje teksta';

  @override
  String get changePagesBackgroundColor =>
      'Promeni pozadinsku boju stranica na: ';

  @override
  String get changeTextColor => 'Promeni boju teksta na: ';

  @override
  String get changeTextColorShade => 'Promeni nijansu boje na: ';

  @override
  String get colorAdjustment => 'Podešavanje boja';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normalno',
      'lowSaturation': 'Niska zasićenost',
      'normal': 'Normalno',
      'highSaturation': 'Visoka zasićenost',
      'monochrome': 'Monohromatski',
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
      'cE91E63': 'Roze',
      'c9C27B0': 'Ljubičasta',
      'c673AB7': 'Tamno ljubičasta',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Plava',
      'c03A9F4': 'Svetlo plava',
      'c00BCD4': 'Cijan',
      'c009688': 'Tirkizna',
      'c4CAF50': 'Zelena',
      'c8BC34A': 'Svetlo zelena',
      'cCDDC39': 'Limeta',
      'cFFEB3B': 'Žuta',
      'cFFC107': 'Ćilibar',
      'cFF9800': 'Narandžasta',
      'cFF5722': 'Tamno narandžasta',
      'c795548': 'Braon',
      'c9E9E9E': 'Siva',
      'c607D8B': 'Plavo-siva',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Smanji razmak između reči';

  @override
  String get decrementLetterSpacing => 'Smanji razmak između slova';

  @override
  String get decrementLineHeight => 'Smanji visinu reda';

  @override
  String get decrementTextScaleFactor => 'Smanji faktor skaliranja teksta';

  @override
  String get effects => 'Efekti';

  @override
  String get expandText => 'Proširi tekst';

  @override
  String get fontSize => 'Veličina fonta';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Povećaj ili smanji razmak između reči';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Povećaj ili smanji razmak između slova';

  @override
  String get increaseOrDecreaseLineHeight => 'Povećaj ili smanji visinu reda';

  @override
  String get increaseOrDecreaseTextSize => 'Povećaj ili smanji veličinu teksta';

  @override
  String get incrementWordSpacing => 'Povećaj razmak između reči';

  @override
  String get incrementLetterSpacing => 'Povećaj razmak između slova';

  @override
  String get incrementLineHeight => 'Povećaj visinu reda';

  @override
  String get incrementTextScaleFactor => 'Povećaj faktor skaliranja teksta';

  @override
  String get lessInfo => 'Sakrij informacije';

  @override
  String get letterSpacing => 'Razmak između slova';

  @override
  String get lineHeight => 'Visina reda';

  @override
  String get moreInfo => 'Prikaži informacije';

  @override
  String get readLess => 'Pročitaj manje';

  @override
  String get readMore => 'Pročitaj više';

  @override
  String get reduceEffects => 'Smanji efekte na ekranu';

  @override
  String get reduceText => 'Smanji tekst';

  @override
  String get restoreSettings => 'Vrati podešavanja';

  @override
  String get restoreMainColor => 'Vrati glavnu boju';

  @override
  String get returnToMainColors => 'Vrati se na glavne boje';

  @override
  String get settings => 'Podešavanja';

  @override
  String get sizeAndTextDisplay => 'Veličina i prikaz teksta';

  @override
  String get sliderWordSpacing => 'Klizač za razmak između reči';

  @override
  String get sliderLetterSpacing => 'Klizač za razmak između slova';

  @override
  String get sliderLineHeight => 'Klizač za visinu reda';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil teme nije prepoznat',
      'seizureSafe': 'Bezbedno za epilepsiju',
      'visionImpaired': 'Oštećen vid',
      'adhdFriendly': 'Prilagođeno za ADHD',
      'none': 'Podrazumevani profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil bezbedan za epilepsiju';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Ukloni refleksije i smanji boje';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ovaj profil omogućava korisnicima koji imaju epilepsiju i rizik od napada da bezbedno pretražuju eliminisanjem rizika od napada koji nastaju zbog treptajućih animacija i rizičnih kombinacija boja.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil za oštećen vid';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Poboljšaj vidljivost aplikacije';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ovaj profil prilagođava aplikaciju da bude pristupačna za većinu oštećenja vida, kao što su oštećenje vida, tunelski vid, katarakta, glaukom i drugo.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil prilagođen za ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Više koncentracije i manje ometanja';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ovaj profil značajno smanjuje ometanja, kako bi pomogao osobama sa ADHD-om i neurorazvojnim poremećajima da lakše navigiraju, čitaju i fokusiraju se na suštinske elemente aplikacije.';

  @override
  String get theSettingsHaveBeenReset =>
      'Podešavanja su vraćena na početne vrednosti.';

  @override
  String get toggleDarkMode => 'Uključi/isključi tamni režim';

  @override
  String get toggleEffectsMode => 'Uključi/isključi režim efekata';

  @override
  String get toggleFontWeight => 'Promeni debljinu fonta';

  @override
  String get toggleThemeProfile => 'Promeni profil teme';

  @override
  String get wordSpacing => 'Razmak između reči';

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
  String get settingsLoading => 'Učitavanje podešavanja pristupačnosti…';

  @override
  String get settingsLoadFailed =>
      'Podešavanja pristupačnosti nije bilo moguće učitati.';

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get themeModeSystem => 'Sistem';

  @override
  String get themeModeLight => 'Svetla';

  @override
  String get themeModeDark => 'Tamna';

  @override
  String get effectsModeSystem => 'Sistem';

  @override
  String get effectsModeEnabled => 'Uključeno';

  @override
  String get effectsModeDisabled => 'Isključeno';
}
