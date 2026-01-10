// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AccessibilityLocalizationsPl extends AccessibilityLocalizations {
  AccessibilityLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get accessibility => 'Dostępność';

  @override
  String get accessibility_settings => 'Ustawienia dostępności';

  @override
  String get adjust_background_colors => 'Dostosuj kolory tła';

  @override
  String get adjust_text_colors => 'Dostosuj kolory tekstu';

  @override
  String get align_center => 'Wyrównaj do środka';

  @override
  String get align_left => 'Wyrównaj do lewej';

  @override
  String get align_right => 'Wyrównaj do prawej';

  @override
  String get bold_text => 'Pogrubiony tekst';

  @override
  String get change_bold_text => 'Zmień pogrubienie tekstu';

  @override
  String get change_pages_background_color => 'Zmień kolor tła stron na: ';

  @override
  String get change_text_color => 'Zmień kolor tekstu na: ';

  @override
  String get change_text_color_shade => 'Zmień odcień koloru na: ';

  @override
  String get color_adjustment => 'Dostosowanie kolorów';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normalny',
        'lowSaturation': 'Niskie nasycenie',
        'normal': 'Normalny',
        'highSaturation': 'Wysokie nasycenie',
        'monochrome': 'Monochromatyczny',
        'highContrast': 'Wysoki kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Aktualny profil kolorów to: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Zmniejsz odstępy między słowami';

  @override
  String get decrement_letter_spacing => 'Zmniejsz odstępy między literami';

  @override
  String get decrement_line_height => 'Zmniejsz wysokość linii';

  @override
  String get decrement_text_scale_factor =>
      'Zmniejsz współczynnik skali tekstu';

  @override
  String get effects => 'Efekty';

  @override
  String get expand_text => 'Rozwiń tekst';

  @override
  String get font_size => 'Rozmiar czcionki';

  @override
  String get increase_or_decrease_word_spacing =>
      'Zwiększ lub zmniejsz odstępy między słowami';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Zwiększ lub zmniejsz odstępy między literami';

  @override
  String get increase_or_decrease_line_height =>
      'Zwiększ lub zmniejsz wysokość linii';

  @override
  String get increase_or_decrease_text_size =>
      'Zwiększ lub zmniejsz rozmiar tekstu';

  @override
  String get increment_word_spacing => 'Zwiększ odstępy między słowami';

  @override
  String get increment_letter_spacing => 'Zwiększ odstępy między literami';

  @override
  String get increment_line_height => 'Zwiększ wysokość linii';

  @override
  String get increment_text_scale_factor => 'Zwiększ współczynnik skali tekstu';

  @override
  String get less_info => 'Ukryj informacje';

  @override
  String get letter_spacing => 'Odstępy między literami';

  @override
  String get line_height => 'Wysokość linii';

  @override
  String get more_info => 'Pokaż informacje';

  @override
  String get read_less => 'Czytaj mniej';

  @override
  String get read_more => 'Czytaj więcej';

  @override
  String get reduce_effects => 'Zmniejsz efekty na ekranie';

  @override
  String get reduce_text => 'Zmniejsz tekst';

  @override
  String get restore_settings => 'Przywróć ustawienia';

  @override
  String get restore_main_color => 'Przywróć główny kolor';

  @override
  String get return_to_main_colors => 'Powrót do głównych kolorów';

  @override
  String get settings => 'Ustawienia';

  @override
  String get size_and_text_display => 'Rozmiar i wyświetlanie tekstu';

  @override
  String get slider_word_spacing => 'Suwak odstępów między słowami';

  @override
  String get slider_letter_spacing => 'Suwak odstępów między literami';

  @override
  String get slider_line_height => 'Suwak wysokości linii';

  @override
  String get theme_mode => 'Motyw';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil motywu nierozpoznany',
        'seizureSafe': 'Bezpieczny dla epileptyków',
        'visionImpaired': 'Dla osób niedowidzących',
        'adhdFriendly': 'Przyjazny dla ADHD',
        'none': 'Domyślny',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Profil bezpieczny dla epileptyków';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Usuń odbicia i zmniejsz nasycenie kolorów';

  @override
  String get theme_profile_seizure_safe_description =>
      'Ten profil umożliwia użytkownikom z epilepsją i zagrożonym napadami bezpieczne przeglądanie, eliminując ryzyko napadów wywołanych przez migające animacje i ryzykowne kombinacje kolorów.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil dla osób niedowidzących';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Popraw widoczność aplikacji';

  @override
  String get theme_profile_vision_impaired_description =>
      'Ten profil dostosowuje aplikację tak, aby była dostępna dla większości wad wzroku, takich jak niedowidzenie, widzenie tunelowe, zaćma, jaskra i inne.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil przyjazny dla ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Większa koncentracja i mniej rozproszeń';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Ten profil znacznie zmniejsza rozpraszacze, aby pomóc osobom z ADHD i zaburzeniami neurorozwojowymi w nawigacji, czytaniu i koncentracji na istotnych elementach aplikacji.';

  @override
  String get the_settings_have_been_reset => 'Ustawienia zostały zresetowane.';

  @override
  String get toggle_dark_mode => 'Przełącz tryb ciemny';

  @override
  String get toggle_effects_mode => 'Przełącz tryb efektów';

  @override
  String get toggle_font_weight => 'Przełącz grubość czcionki';

  @override
  String get toggle_theme_profile => 'Przełącz profil motywu';

  @override
  String get word_spacing => 'Odstępy między słowami';

  @override
  String get accessible_font => 'Dostępna czcionka';

  @override
  String get accessible_font_subtitle =>
      'Użyj czcionki Verdana dla lepszej czytelności';

  @override
  String get accessible_font_enabled => 'Dostępna czcionka włączona';

  @override
  String get accessible_font_disabled => 'Dostępna czcionka wyłączona';

  @override
  String get toggle_accessible_font => 'Przełącz dostępną czcionkę';
}
