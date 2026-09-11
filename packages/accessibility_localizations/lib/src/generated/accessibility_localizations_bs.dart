// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AccessibilityLocalizationsBs extends AccessibilityLocalizations {
  AccessibilityLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get accessibility => 'Pristupačnost';

  @override
  String get accessibilitySettings => 'Postavke pristupačnosti';

  @override
  String get adjustBackgroundColors => 'Prilagodi pozadinske boje';

  @override
  String get adjustTextColors => 'Prilagodi boje teksta';

  @override
  String get alignCenter => 'Poravnaj u sredinu';

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
      'Promijeni pozadinsku boju stranica u: ';

  @override
  String get changeTextColor => 'Promijeni boju teksta u: ';

  @override
  String get changeTextColorShade => 'Promijeni nijansu boje u: ';

  @override
  String get colorAdjustment => 'Prilagodba boja';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normalno',
      'lowSaturation': 'Niska saturacija',
      'normal': 'Normalno',
      'highSaturation': 'Visoka saturacija',
      'monochrome': 'Monohrom',
      'highContrast': 'Visok kontrast',
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
      'c03A9F4': 'Svijetlo plava',
      'c00BCD4': 'Cijan',
      'c009688': 'Tirkizna',
      'c4CAF50': 'Zelena',
      'c8BC34A': 'Svijetlo zelena',
      'cCDDC39': 'Limeta',
      'cFFEB3B': 'Žuta',
      'cFFC107': 'Jantarna',
      'cFF9800': 'Narandžasta',
      'cFF5722': 'Tamno narandžasta',
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
  String get decrementLineHeight => 'Smanji visinu linije';

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
      'Povećaj ili smanji razmak između riječi';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Povećaj ili smanji razmak između slova';

  @override
  String get increaseOrDecreaseLineHeight => 'Povećaj ili smanji visinu linije';

  @override
  String get increaseOrDecreaseTextSize => 'Povećaj ili smanji veličinu teksta';

  @override
  String get incrementWordSpacing => 'Povećaj razmak između riječi';

  @override
  String get incrementLetterSpacing => 'Povećaj razmak između slova';

  @override
  String get incrementLineHeight => 'Povećaj visinu linije';

  @override
  String get incrementTextScaleFactor => 'Povećaj faktor skaliranja teksta';

  @override
  String get lessInfo => 'Sakrij informacije';

  @override
  String get letterSpacing => 'Razmak između slova';

  @override
  String get lineHeight => 'Visina linije';

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
  String get returnToMainColors => 'Vrati se na glavne boje';

  @override
  String get settings => 'Postavke';

  @override
  String get sizeAndTextDisplay => 'Veličina i prikaz teksta';

  @override
  String get sliderWordSpacing => 'Klizač razmaka između riječi';

  @override
  String get sliderLetterSpacing => 'Klizač razmaka između slova';

  @override
  String get sliderLineHeight => 'Klizač visine linije';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil teme nije prepoznat',
      'seizureSafe': 'Zaštita od napada',
      'visionImpaired': 'Za osobe oštećenog vida',
      'adhdFriendly': 'ADHD-prilagodljiv',
      'none': 'Zadani profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil siguran za epileptičare';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Uklanjanje refleksija i smanjenje boja';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ovaj profil omogućava korisnicima koji imaju epilepsiju i rizik od napada sigurno pregledavanje eliminisanjem rizika od napada koji mogu biti uzrokovani treptajućim animacijama i rizičnim kombinacijama boja.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profil za osobe oštećenog vida';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Poboljšana vidljivost aplikacije';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ovaj profil prilagođava aplikaciju da bude pristupačna većini vizualnih oštećenja, kao što su slabovidnost, tunelski vid, katarakta, glaukom i drugo.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-prilagodljiv profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Veća koncentracija i manje ometanja';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ovaj profil značajno smanjuje ometanja, kako bi pomogao ljudima s ADHD-om i neurorazvojnim poremećajima da lakše navigiraju, čitaju i fokusiraju se na bitne elemente aplikacije.';

  @override
  String get theSettingsHaveBeenReset =>
      'Postavke su vraćene na početno stanje.';

  @override
  String get toggleDarkMode => 'Uključi/isključi tamni mod';

  @override
  String get toggleEffectsMode => 'Uključi/isključi mod efekata';

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

  @override
  String get themeModeSystem => 'Sistem';

  @override
  String get themeModeLight => 'Svijetla';

  @override
  String get themeModeDark => 'Tamna';

  @override
  String get effectsModeSystem => 'Sistem';

  @override
  String get effectsModeEnabled => 'Uključeno';

  @override
  String get effectsModeDisabled => 'Isključeno';
}
