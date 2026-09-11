// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AccessibilityLocalizationsCs extends AccessibilityLocalizations {
  AccessibilityLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get accessibility => 'Přístupnost';

  @override
  String get accessibilitySettings => 'Nastavení přístupnosti';

  @override
  String get adjustBackgroundColors => 'Upravit barvy pozadí';

  @override
  String get adjustTextColors => 'Upravit barvy textu';

  @override
  String get alignCenter => 'Zarovnat na střed';

  @override
  String get alignLeft => 'Zarovnat doleva';

  @override
  String get alignRight => 'Zarovnat doprava';

  @override
  String get textAlignment => 'Zarovnání textu';

  @override
  String get boldText => 'Tučný text';

  @override
  String get changeBoldText => 'Změnit tučný text';

  @override
  String get changePagesBackgroundColor => 'Změnit barvu pozadí stránek na: ';

  @override
  String get changeTextColor => 'Změnit barvu textu na: ';

  @override
  String get changeTextColorShade => 'Změnit odstín barvy na: ';

  @override
  String get colorAdjustment => 'Nastavení barev';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normální',
      'lowSaturation': 'Nízká saturace',
      'normal': 'Normální',
      'highSaturation': 'Vysoká saturace',
      'monochrome': 'Monochromatické',
      'highContrast': 'Vysoký kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Aktuální profil barev je: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Barva nerozpoznána',
      'cF44336': 'Červená',
      'cE91E63': 'Růžová',
      'c9C27B0': 'Fialová',
      'c673AB7': 'Tmavě fialová',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Modrá',
      'c03A9F4': 'Světle modrá',
      'c00BCD4': 'Azurová',
      'c009688': 'Modrozeloná',
      'c4CAF50': 'Zelená',
      'c8BC34A': 'Světle zelená',
      'cCDDC39': 'Limetková',
      'cFFEB3B': 'Žlutá',
      'cFFC107': 'Jantarová',
      'cFF9800': 'Oranžová',
      'cFF5722': 'Tmavě oranžová',
      'c795548': 'Hnědá',
      'c9E9E9E': 'Šedá',
      'c607D8B': 'Modrošedá',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Snížit mezery mezi slovy';

  @override
  String get decrementLetterSpacing => 'Snížit mezery mezi písmeny';

  @override
  String get decrementLineHeight => 'Snížit výšku řádku';

  @override
  String get decrementTextScaleFactor => 'Snížit faktor velikosti textu';

  @override
  String get effects => 'Efekty';

  @override
  String get expandText => 'Rozšířit text';

  @override
  String get fontSize => 'Velikost písma';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Zvětšit nebo zmenšit mezery mezi slovy';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Zvětšit nebo zmenšit mezery mezi písmeny';

  @override
  String get increaseOrDecreaseLineHeight => 'Zvětšit nebo zmenšit výšku řádku';

  @override
  String get increaseOrDecreaseTextSize =>
      'Zvětšit nebo zmenšit velikost textu';

  @override
  String get incrementWordSpacing => 'Zvětšit mezery mezi slovy';

  @override
  String get incrementLetterSpacing => 'Zvětšit mezery mezi písmeny';

  @override
  String get incrementLineHeight => 'Zvětšit výšku řádku';

  @override
  String get incrementTextScaleFactor => 'Zvětšit faktor velikosti textu';

  @override
  String get lessInfo => 'Skrýt informace';

  @override
  String get letterSpacing => 'Mezery mezi písmeny';

  @override
  String get lineHeight => 'Výška řádku';

  @override
  String get moreInfo => 'Zobrazit informace';

  @override
  String get readLess => 'Číst méně';

  @override
  String get readMore => 'Číst více';

  @override
  String get reduceEffects => 'Snížit efekty na obrazovce';

  @override
  String get reduceText => 'Zmenšit text';

  @override
  String get restoreSettings => 'Obnovit nastavení';

  @override
  String get restoreMainColor => 'Obnovit hlavní barvu';

  @override
  String get returnToMainColors => 'Návrat k hlavním barvám';

  @override
  String get settings => 'Nastavení';

  @override
  String get sizeAndTextDisplay => 'Velikost a zobrazení textu';

  @override
  String get sliderWordSpacing => 'Posuvník mezer mezi slovy';

  @override
  String get sliderLetterSpacing => 'Posuvník mezer mezi písmeny';

  @override
  String get sliderLineHeight => 'Posuvník výšky řádku';

  @override
  String get themeMode => 'Motiv';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil motivu nerozpoznán',
      'seizureSafe': 'Bezpečný pro epileptiky',
      'visionImpaired': 'Pro zrakově postižené',
      'adhdFriendly': 'Přívětivý pro ADHD',
      'none': 'Výchozí profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil bezpečný pro epileptiky';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Odstranit odrazy a snížit barvy';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Tento profil umožňuje uživatelům, kteří mají epilepsii a jsou ohroženi záchvaty, bezpečně procházet stránky odstraněním rizika záchvatů, které mohou být vyvolany blikajícími animacemi a rizikovými kombinacemi barev.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil pro zrakově postižené';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Zlepšit viditelnost aplikace';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Tento profil přizpůsobuje aplikaci tak, aby byla přístupná pro většinu zrakových postižení, jako je zraková vada, tunelové vidění, šedý zákal, glaukom a další.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil přívětivý pro ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Lepší soustředění a méně rušivých vlivů';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Tento profil významně snižuje rušivé vlivy, aby pomohl lidem s ADHD a vývojovými neurologickými poruchami snadněji navigovat, číst a soustředit se na základní prvky aplikace.';

  @override
  String get theSettingsHaveBeenReset => 'Nastavení bylo obnoveno.';

  @override
  String get toggleDarkMode => 'Přepnout tmavý režim';

  @override
  String get toggleEffectsMode => 'Přepnout režim efektů';

  @override
  String get toggleFontWeight => 'Přepnout tučnost písma';

  @override
  String get toggleThemeProfile => 'Přepnout profil motivu';

  @override
  String get wordSpacing => 'Mezery mezi slovy';

  @override
  String get accessibleFont => 'Přístupné písmo';

  @override
  String get accessibleFontSubtitle =>
      'Použijte přístupné písmo pro lepší čitelnost';

  @override
  String get accessibleFontEnabled => 'Přístupné písmo zapnuto';

  @override
  String get accessibleFontDisabled => 'Přístupné písmo vypnuto';

  @override
  String get toggleAccessibleFont => 'Přepnout přístupné písmo';

  @override
  String get settingsLoading => 'Načítání nastavení přístupnosti…';

  @override
  String get settingsLoadFailed =>
      'Nastavení přístupnosti se nepodařilo načíst.';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get themeModeSystem => 'Systém';

  @override
  String get themeModeLight => 'Světlý';

  @override
  String get themeModeDark => 'Tmavý';

  @override
  String get effectsModeSystem => 'Systém';

  @override
  String get effectsModeEnabled => 'Zapnuto';

  @override
  String get effectsModeDisabled => 'Vypnuto';
}
