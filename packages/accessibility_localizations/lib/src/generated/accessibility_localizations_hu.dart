// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AccessibilityLocalizationsHu extends AccessibilityLocalizations {
  AccessibilityLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get accessibility => 'Akadálymentesítés';

  @override
  String get accessibilitySettings => 'Akadálymentesítési beállítások';

  @override
  String get adjustBackgroundColors => 'Háttérszínek beállítása';

  @override
  String get adjustTextColors => 'Szövegszínek beállítása';

  @override
  String get alignCenter => 'Középre igazítás';

  @override
  String get alignLeft => 'Balra igazítás';

  @override
  String get alignRight => 'Jobbra igazítás';

  @override
  String get textAlignment => 'Szövegigazítás';

  @override
  String get boldText => 'Félkövér szöveg';

  @override
  String get changeBoldText => 'Félkövér szöveg módosítása';

  @override
  String get changePagesBackgroundColor =>
      'Az oldalak háttérszínének módosítása: ';

  @override
  String get changeTextColor => 'A szöveg színének módosítása: ';

  @override
  String get changeTextColorShade => 'A szín árnyalatának módosítása: ';

  @override
  String get colorAdjustment => 'Színbeállítás';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normál',
      'lowSaturation': 'Alacsony telítettség',
      'normal': 'Normál',
      'highSaturation': 'Magas telítettség',
      'monochrome': 'Egyszínű',
      'highContrast': 'Magas kontraszt',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'A jelenlegi színprofil: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Szín nem felismerhető',
      'cF44336': 'Piros',
      'cE91E63': 'Rózsaszín',
      'c9C27B0': 'Lila',
      'c673AB7': 'Sötétlila',
      'c3F51B5': 'Indigó',
      'c2196F3': 'Kék',
      'c03A9F4': 'Világoskék',
      'c00BCD4': 'Cián',
      'c009688': 'Türkiz',
      'c4CAF50': 'Zöld',
      'c8BC34A': 'Világoszöld',
      'cCDDC39': 'Lime',
      'cFFEB3B': 'Sárga',
      'cFFC107': 'Borostyán',
      'cFF9800': 'Narancssárga',
      'cFF5722': 'Sötétnarancssárga',
      'c795548': 'Barna',
      'c9E9E9E': 'Szürke',
      'c607D8B': 'Kékeszürke',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Szóköz csökkentése';

  @override
  String get decrementLetterSpacing => 'Betűköz csökkentése';

  @override
  String get decrementLineHeight => 'Soroköz csökkentése';

  @override
  String get decrementTextScaleFactor => 'Szövegméret csökkentése';

  @override
  String get effects => 'Effektek';

  @override
  String get expandText => 'Szöveg kiterjesztése';

  @override
  String get fontSize => 'Betűméret';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Szóköz növelése vagy csökkentése';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Betűköz növelése vagy csökkentése';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Soroköz növelése vagy csökkentése';

  @override
  String get increaseOrDecreaseTextSize =>
      'Szövegméret növelése vagy csökkentése';

  @override
  String get incrementWordSpacing => 'Szóköz növelése';

  @override
  String get incrementLetterSpacing => 'Betűköz növelése';

  @override
  String get incrementLineHeight => 'Soroköz növelése';

  @override
  String get incrementTextScaleFactor => 'Szövegméret növelése';

  @override
  String get lessInfo => 'Információk elrejtése';

  @override
  String get letterSpacing => 'Betűköz';

  @override
  String get lineHeight => 'Soroköz';

  @override
  String get moreInfo => 'Információk megjelenítése';

  @override
  String get readLess => 'Kevesebb olvasása';

  @override
  String get readMore => 'Tovább olvasása';

  @override
  String get reduceEffects => 'Képernyőeffektek csökkentése';

  @override
  String get reduceText => 'Szöveg csökkentése';

  @override
  String get restoreSettings => 'Beállítások visszaállítása';

  @override
  String get restoreMainColor => 'Fő szín visszaállítása';

  @override
  String get returnToMainColors => 'Vissza a fő színekhez';

  @override
  String get settings => 'Beállítások';

  @override
  String get sizeAndTextDisplay => 'Méret és szövegmegjelenítés';

  @override
  String get sliderWordSpacing => 'Szóköz csúszka';

  @override
  String get sliderLetterSpacing => 'Betűköz csúszka';

  @override
  String get sliderLineHeight => 'Soroköz csúszka';

  @override
  String get themeMode => 'Téma';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil nem felismerhető',
      'seizureSafe': 'Epilepszia-biztos',
      'visionImpaired': 'Gyengénlátóknak',
      'adhdFriendly': 'ADHD-barát',
      'none': 'Alapértelmezett profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Epilepszia-biztos profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Tükrözések eltávolítása és színek csökkentése';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ez a profil lehetővé teszi az epilepsziával élő és rohamokra hajlamos felhasználóknak a biztonságos böngészést, megszüntetve a villogó animációkból és kockázatos szín kombinációkból eredő rohamok veszélyét.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Gyengénlátóknak készült profil';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Az alkalmazás láthatóságának javítása';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ez a profil úgy alakítja az alkalmazást, hogy hozzáférhető legyen a legtöbb látással kapcsolatos problémával küzdő személynek, például gyengénlátás, alagut-látás, szürkehalály, zöld hályog és más esetekhez.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-barát profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Jobb koncentráció és kevesebb figyelemelterelés';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ez a profil jelentősen csökkenti a figyelemelterelő tényezőket, segítve az ADHD-val és idegfejlődési zavarokkal élő embereket a könnyebb navigációban, olvasásban és az alkalmazás lényeges elemeire való koncentrálásban.';

  @override
  String get theSettingsHaveBeenReset => 'A beállítások visszaállítva.';

  @override
  String get toggleDarkMode => 'Sötét mód váltása';

  @override
  String get toggleEffectsMode => 'Effekt mód váltása';

  @override
  String get toggleFontWeight => 'Betűvasédság váltása';

  @override
  String get toggleThemeProfile => 'Témaprofil váltása';

  @override
  String get wordSpacing => 'Szóköz';

  @override
  String get accessibleFont => 'Akadálymentes betűtípus';

  @override
  String get accessibleFontSubtitle =>
      'Használjon akadálymentes betűtípust a jobb olvashatóságért';

  @override
  String get accessibleFontEnabled => 'Akadálymentes betűtípus bekapcsolva';

  @override
  String get accessibleFontDisabled => 'Akadálymentes betűtípus kikapcsolva';

  @override
  String get toggleAccessibleFont => 'Akadálymentes betűtípus váltása';

  @override
  String get settingsLoading => 'Az akadálymentesítési beállítások betöltése…';

  @override
  String get settingsLoadFailed =>
      'Az akadálymentesítési beállításokat nem sikerült betölteni.';

  @override
  String get retry => 'Újrapróbálkozás';

  @override
  String get themeModeSystem => 'Rendszer';

  @override
  String get themeModeLight => 'Világos';

  @override
  String get themeModeDark => 'Sötét';

  @override
  String get effectsModeSystem => 'Rendszer';

  @override
  String get effectsModeEnabled => 'Be';

  @override
  String get effectsModeDisabled => 'Ki';
}
