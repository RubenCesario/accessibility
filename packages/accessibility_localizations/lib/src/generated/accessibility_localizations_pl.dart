// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AccessibilityLocalizationsPl extends AccessibilityLocalizations {
  AccessibilityLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get accessibility => 'Dostępność';

  @override
  String get accessibilitySettings => 'Ustawienia dostępności';

  @override
  String get adjustBackgroundColors => 'Dostosuj kolory tła';

  @override
  String get adjustTextColors => 'Dostosuj kolory tekstu';

  @override
  String get alignCenter => 'Wyrównaj do środka';

  @override
  String get alignLeft => 'Wyrównaj do lewej';

  @override
  String get alignRight => 'Wyrównaj do prawej';

  @override
  String get textAlignment => 'Wyrównanie tekstu';

  @override
  String get boldText => 'Pogrubiony tekst';

  @override
  String get changeBoldText => 'Zmień pogrubienie tekstu';

  @override
  String get changePagesBackgroundColor => 'Zmień kolor tła stron na: ';

  @override
  String get changeTextColor => 'Zmień kolor tekstu na: ';

  @override
  String get changeTextColorShade => 'Zmień odcień koloru na: ';

  @override
  String get colorAdjustment => 'Dostosowanie kolorów';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normalny',
      'lowSaturation': 'Niskie nasycenie',
      'normal': 'Normalny',
      'highSaturation': 'Wysokie nasycenie',
      'monochrome': 'Monochromatyczny',
      'highContrast': 'Wysoki kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Aktualny profil kolorów to: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Kolor nierozpoznany',
      'cF44336': 'Czerwony',
      'cE91E63': 'Różowy',
      'c9C27B0': 'Fioletowy',
      'c673AB7': 'Głęboki fiolet',
      'c3F51B5': 'Indygo',
      'c2196F3': 'Niebieski',
      'c03A9F4': 'Jasnoniebieski',
      'c00BCD4': 'Cyjan',
      'c009688': 'Morski',
      'c4CAF50': 'Zielony',
      'c8BC34A': 'Jasnozielony',
      'cCDDC39': 'Limonkowy',
      'cFFEB3B': 'Żółty',
      'cFFC107': 'Bursztynowy',
      'cFF9800': 'Pomarańczowy',
      'cFF5722': 'Głęboka pomarańcz',
      'c795548': 'Brązowy',
      'c9E9E9E': 'Szary',
      'c607D8B': 'Niebieskoszary',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Zmniejsz odstępy między słowami';

  @override
  String get decrementLetterSpacing => 'Zmniejsz odstępy między literami';

  @override
  String get decrementLineHeight => 'Zmniejsz wysokość linii';

  @override
  String get decrementTextScaleFactor => 'Zmniejsz współczynnik skali tekstu';

  @override
  String get effects => 'Efekty';

  @override
  String get expandText => 'Rozwiń tekst';

  @override
  String get fontSize => 'Rozmiar czcionki';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Zwiększ lub zmniejsz odstępy między słowami';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Zwiększ lub zmniejsz odstępy między literami';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Zwiększ lub zmniejsz wysokość linii';

  @override
  String get increaseOrDecreaseTextSize =>
      'Zwiększ lub zmniejsz rozmiar tekstu';

  @override
  String get incrementWordSpacing => 'Zwiększ odstępy między słowami';

  @override
  String get incrementLetterSpacing => 'Zwiększ odstępy między literami';

  @override
  String get incrementLineHeight => 'Zwiększ wysokość linii';

  @override
  String get incrementTextScaleFactor => 'Zwiększ współczynnik skali tekstu';

  @override
  String get lessInfo => 'Ukryj informacje';

  @override
  String get letterSpacing => 'Odstępy między literami';

  @override
  String get lineHeight => 'Wysokość linii';

  @override
  String get moreInfo => 'Pokaż informacje';

  @override
  String get readLess => 'Czytaj mniej';

  @override
  String get readMore => 'Czytaj więcej';

  @override
  String get reduceEffects => 'Zmniejsz efekty na ekranie';

  @override
  String get reduceText => 'Zmniejsz tekst';

  @override
  String get restoreSettings => 'Przywróć ustawienia';

  @override
  String get restoreMainColor => 'Przywróć główny kolor';

  @override
  String get returnToMainColors => 'Powrót do głównych kolorów';

  @override
  String get settings => 'Ustawienia';

  @override
  String get sizeAndTextDisplay => 'Rozmiar i wyświetlanie tekstu';

  @override
  String get sliderWordSpacing => 'Suwak odstępów między słowami';

  @override
  String get sliderLetterSpacing => 'Suwak odstępów między literami';

  @override
  String get sliderLineHeight => 'Suwak wysokości linii';

  @override
  String get themeMode => 'Motyw';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil motywu nierozpoznany',
      'seizureSafe': 'Bezpieczny dla epileptyków',
      'visionImpaired': 'Dla osób niedowidzących',
      'adhdFriendly': 'Przyjazny dla ADHD',
      'none': 'Profil domyślny',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'Profil bezpieczny dla epileptyków';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Usuń odbicia i zmniejsz nasycenie kolorów';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ten profil umożliwia użytkownikom z epilepsją i zagrożonym napadami bezpieczne przeglądanie, eliminując ryzyko napadów wywołanych przez migające animacje i ryzykowne kombinacje kolorów.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profil dla osób niedowidzących';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Popraw widoczność aplikacji';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ten profil dostosowuje aplikację tak, aby była dostępna dla większości wad wzroku, takich jak niedowidzenie, widzenie tunelowe, zaćma, jaskra i inne.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil przyjazny dla ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Większa koncentracja i mniej rozproszeń';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ten profil znacznie zmniejsza rozpraszacze, aby pomóc osobom z ADHD i zaburzeniami neurorozwojowymi w nawigacji, czytaniu i koncentracji na istotnych elementach aplikacji.';

  @override
  String get theSettingsHaveBeenReset => 'Ustawienia zostały zresetowane.';

  @override
  String get toggleDarkMode => 'Przełącz tryb ciemny';

  @override
  String get toggleEffectsMode => 'Przełącz tryb efektów';

  @override
  String get toggleFontWeight => 'Przełącz grubość czcionki';

  @override
  String get toggleThemeProfile => 'Przełącz profil motywu';

  @override
  String get wordSpacing => 'Odstępy między słowami';

  @override
  String get accessibleFont => 'Dostępna czcionka';

  @override
  String get accessibleFontSubtitle =>
      'Użyj dostępnej czcionki dla lepszej czytelności';

  @override
  String get accessibleFontEnabled => 'Dostępna czcionka włączona';

  @override
  String get accessibleFontDisabled => 'Dostępna czcionka wyłączona';

  @override
  String get toggleAccessibleFont => 'Przełącz dostępną czcionkę';

  @override
  String get settingsLoading => 'Wczytywanie ustawień dostępności…';

  @override
  String get settingsLoadFailed =>
      'Nie udało się wczytać ustawień dostępności.';

  @override
  String get retry => 'Spróbuj ponownie';
}
