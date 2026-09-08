// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AccessibilityLocalizationsSk extends AccessibilityLocalizations {
  AccessibilityLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get accessibility => 'Prístupnosť';

  @override
  String get accessibilitySettings => 'Nastavenia prístupnosti';

  @override
  String get adjustBackgroundColors => 'Upraviť farby pozadia';

  @override
  String get adjustTextColors => 'Upraviť farby textu';

  @override
  String get alignCenter => 'Zarovnať na stred';

  @override
  String get alignLeft => 'Zarovnať doľava';

  @override
  String get alignRight => 'Zarovnať doprava';

  @override
  String get textAlignment => 'Zarovnanie textu';

  @override
  String get boldText => 'Tučný text';

  @override
  String get changeBoldText => 'Zmeniť tučný text';

  @override
  String get changePagesBackgroundColor => 'Zmeniť farbu pozadia stránok na: ';

  @override
  String get changeTextColor => 'Zmeniť farbu textu na: ';

  @override
  String get changeTextColorShade => 'Zmeniť odtieň farby na: ';

  @override
  String get colorAdjustment => 'Úprava farieb';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normálny',
      'lowSaturation': 'Nízka sýtosť',
      'normal': 'Normálny',
      'highSaturation': 'Vysoká sýtosť',
      'monochrome': 'Monochromáticky',
      'highContrast': 'Vysoký kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Aktuálny farebný profil je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Farba nerozpoznaná',
      'cF44336': 'Červená',
      'cE91E63': 'Ružová',
      'c9C27B0': 'Fialová',
      'c673AB7': 'Tmavofialová',
      'c3F51B5': 'Indigová',
      'c2196F3': 'Modrá',
      'c03A9F4': 'Svetlomodrá',
      'c00BCD4': 'Azurová',
      'c009688': 'Tyrkysová',
      'c4CAF50': 'Zelená',
      'c8BC34A': 'Svetlozelená',
      'cCDDC39': 'Limetková',
      'cFFEB3B': 'Žltá',
      'cFFC107': 'Jantárová',
      'cFF9800': 'Oranžová',
      'cFF5722': 'Tmavoranžová',
      'c795548': 'Hnedá',
      'c9E9E9E': 'Sivá',
      'c607D8B': 'Modrosivá',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Zmenšiť medzery medzi slovami';

  @override
  String get decrementLetterSpacing => 'Zmenšiť medzery medzi písmenami';

  @override
  String get decrementLineHeight => 'Zmenšiť výšku riadku';

  @override
  String get decrementTextScaleFactor => 'Zmenšiť faktor veľkosti textu';

  @override
  String get effects => 'Efekty';

  @override
  String get expandText => 'Rozšíriť text';

  @override
  String get fontSize => 'Veľkosť písma';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Zväčšiť alebo zmenšiť medzery medzi slovami';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Zväčšiť alebo zmenšiť medzery medzi písmenami';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Zväčšiť alebo zmenšiť výšku riadku';

  @override
  String get increaseOrDecreaseTextSize =>
      'Zväčšiť alebo zmenšiť veľkosť textu';

  @override
  String get incrementWordSpacing => 'Zväčšiť medzery medzi slovami';

  @override
  String get incrementLetterSpacing => 'Zväčšiť medzery medzi písmenami';

  @override
  String get incrementLineHeight => 'Zväčšiť výšku riadku';

  @override
  String get incrementTextScaleFactor => 'Zväčšiť faktor veľkosti textu';

  @override
  String get lessInfo => 'Skryť informácie';

  @override
  String get letterSpacing => 'Medzery medzi písmenami';

  @override
  String get lineHeight => 'Výška riadku';

  @override
  String get moreInfo => 'Zobraziť informácie';

  @override
  String get readLess => 'Čítať menej';

  @override
  String get readMore => 'Čítať viac';

  @override
  String get reduceEffects => 'Znížiť efekty na obrazovke';

  @override
  String get reduceText => 'Zmenšiť text';

  @override
  String get restoreSettings => 'Obnoviť nastavenia';

  @override
  String get restoreMainColor => 'Obnoviť hlavnú farbu';

  @override
  String get returnToMainColors => 'Návrat k hlavným farbám';

  @override
  String get settings => 'Nastavenia';

  @override
  String get sizeAndTextDisplay => 'Veľkosť a zobrazenie textu';

  @override
  String get sliderWordSpacing => 'Posuvník medzier medzi slovami';

  @override
  String get sliderLetterSpacing => 'Posuvník medzier medzi písmenami';

  @override
  String get sliderLineHeight => 'Posuvník výšky riadku';

  @override
  String get themeMode => 'Téma';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil témy nerozpoznaný',
      'seizureSafe': 'Bezpečný pre epileptikov',
      'visionImpaired': 'Pre zrakovo postihnutých',
      'adhdFriendly': 'Priateľský pre ADHD',
      'none': 'Predvolený profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil bezpečný pre epileptikov';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Odstrániť odrazy a znížiť farby';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Tento profil umožňuje používateľom, ktorí majú epilepsiu a sú ohrozéní záchvatmi, bezpečne prechádzať aplikáciou odstránením rizika záchvatov, ktoré vyplývajú z blikajúcich animácií a rizikových farebných kombinácií.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profil pre zrakovo postihnutých';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Zlepšiť viditeľnosť aplikácie';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Tento profil prispôsobuje aplikáciu tak, aby bola prístupná pre väčšinu zrakových postihnutí, ako sú zrakové postihnutie, tunelové videnie, šedý zákal, glaukom a ďalšie.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil priateľský pre ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Viac koncentrácie a menej rušivých vplyvov';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Tento profil výrazne znižuje rušivé vplyvy, aby pomohol ľuďom s ADHD a vývinovými poruchami jednoduchšie navigovať, čítať a sústrediť sa na základné prvky aplikácie.';

  @override
  String get theSettingsHaveBeenReset => 'Nastavenia boli obnovené.';

  @override
  String get toggleDarkMode => 'Prepnúť tmavý režim';

  @override
  String get toggleEffectsMode => 'Prepnúť režim efektov';

  @override
  String get toggleFontWeight => 'Prepnúť hrubosť písma';

  @override
  String get toggleThemeProfile => 'Prepnúť profil témy';

  @override
  String get wordSpacing => 'Medzery medzi slovami';

  @override
  String get accessibleFont => 'Prístupné písmo';

  @override
  String get accessibleFontSubtitle =>
      'Použite prístupné písmo pre lepšiu čitateľnosť';

  @override
  String get accessibleFontEnabled => 'Prístupné písmo zapnuté';

  @override
  String get accessibleFontDisabled => 'Prístupné písmo vypnuté';

  @override
  String get toggleAccessibleFont => 'Prepnúť prístupné písmo';

  @override
  String get settingsLoading => 'Načítavajú sa nastavenia prístupnosti…';

  @override
  String get settingsLoadFailed =>
      'Nastavenia prístupnosti sa nepodarilo načítať.';

  @override
  String get retry => 'Skúsiť znova';

  @override
  String get themeModeSystem => 'Systém';

  @override
  String get themeModeLight => 'Svetlá';

  @override
  String get themeModeDark => 'Tmavá';

  @override
  String get effectsModeSystem => 'Systém';

  @override
  String get effectsModeEnabled => 'Zapnuté';

  @override
  String get effectsModeDisabled => 'Vypnuté';
}
