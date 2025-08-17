import 'package:accessibility/src/core/l10n/generated/app_localizations_pl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsPl', () {
    late AccessibilityLocalizationsPl loc;

    setUp(() {
      loc = AccessibilityLocalizationsPl();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('pl'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Dostępność'));
      expect(
        loc.accessibility_settings,
        equals('Ustawienia dostępności'),
      );
      expect(loc.adjust_background_colors, equals('Dostosuj kolory tła'));
      expect(loc.adjust_text_colors, equals('Dostosuj kolory tekstu'));
      expect(loc.align_center, equals('Wyrównaj do środka'));
      expect(loc.align_left, equals('Wyrównaj do lewej'));
      expect(loc.align_right, equals('Wyrównaj do prawej'));
      expect(loc.bold_text, equals('Pogrubiony tekst'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Zmień pogrubienie tekstu'));
      expect(
        loc.change_pages_background_color,
        equals('Zmień kolor tła stron na: '),
      );
      expect(loc.change_text_color, equals('Zmień kolor tekstu na: '));
      expect(loc.change_text_color_shade, equals('Zmień odcień koloru na: '));
      expect(loc.color_adjustment, equals('Dostosowanie kolorów'));
      expect(
        loc.color_profile_changed_to,
        equals('Aktualny profil kolorów to: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Zmniejsz odstępy między słowami'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Zmniejsz odstępy między literami'),
      );
      expect(loc.decrement_line_height, equals('Zmniejsz wysokość linii'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Zmniejsz współczynnik skali tekstu'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Zwiększ odstępy między słowami'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Zwiększ odstępy między literami'),
      );
      expect(loc.increment_line_height, equals('Zwiększ wysokość linii'));
      expect(
        loc.increment_text_scale_factor,
        equals('Zwiększ współczynnik skali tekstu'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Zwiększ lub zmniejsz odstępy między słowami'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Zwiększ lub zmniejsz odstępy między literami'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Zwiększ lub zmniejsz wysokość linii'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Zwiększ lub zmniejsz rozmiar tekstu'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efekty'));
      expect(loc.expand_text, equals('Rozwiń tekst'));
      expect(loc.font_size, equals('Rozmiar czcionki'));
      expect(loc.less_info, equals('Ukryj informacje'));
      expect(loc.letter_spacing, equals('Odstępy między literami'));
      expect(loc.line_height, equals('Wysokość linii'));
      expect(loc.more_info, equals('Pokaż informacje'));
      expect(loc.word_spacing, equals('Odstępy między słowami'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Czytaj mniej'));
      expect(loc.read_more, equals('Czytaj więcej'));
      expect(loc.reduce_effects, equals('Zmniejsz efekty na ekranie'));
      expect(loc.reduce_text, equals('Zmniejsz tekst'));
      expect(loc.restore_settings, equals('Przywróć ustawienia'));
      expect(loc.restore_main_color, equals('Przywróć główny kolor'));
      expect(loc.return_to_main_colors, equals('Powrót do głównych kolorów'));
      expect(loc.settings, equals('Ustawienia'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Rozmiar i wyświetlanie tekstu'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Suwak odstępów między słowami'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Suwak odstępów między literami'),
      );
      expect(loc.slider_line_height, equals('Suwak wysokości linii'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Motyw'));
      expect(
        loc.theme_profile('other'),
        equals('Profil motywu nierozpoznany'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Bezpieczny dla epileptyków'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Dla osób niedowidzących'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Przyjazny dla ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Domyślny'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil bezpieczny dla epileptyków'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Usuń odbicia i zmniejsz nasycenie kolorów'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ten profil umożliwia użytkownikom z epilepsją i '
          'zagrożonym napadami bezpieczne przeglądanie, '
          'eliminując ryzyko napadów wywołanych przez '
          'migające animacje i ryzykowne kombinacje kolorów.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil dla osób niedowidzących'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Popraw widoczność aplikacji'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ten profil dostosowuje aplikację tak, aby była '
          'dostępna dla większości wad wzroku, takich jak '
          'niedowidzenie, widzenie tunelowe, zaćma, jaskra i '
          'inne.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil przyjazny dla ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Większa koncentracja i mniej rozproszeń'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ten profil znacznie zmniejsza rozpraszacze, aby '
          'pomóc osobom z ADHD i zaburzeniami '
          'neurorozwojowymi w nawigacji, czytaniu i '
          'koncentracji na istotnych elementach aplikacji.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Ustawienia zostały zresetowane.'),
      );
      expect(loc.toggle_dark_mode, equals('Przełącz tryb ciemny'));
      expect(loc.toggle_effects_mode, equals('Przełącz tryb efektów'));
      expect(loc.toggle_font_weight, equals('Przełącz grubość czcionki'));
      expect(loc.toggle_theme_profile, equals('Przełącz profil motywu'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normalny'));
      expect(loc.color_profile('lowSaturation'), equals('Niskie nasycenie'));
      expect(loc.color_profile('normal'), equals('Normalny'));
      expect(loc.color_profile('highSaturation'), equals('Wysokie nasycenie'));
      expect(loc.color_profile('monochrome'), equals('Monochromatyczny'));
      expect(loc.color_profile('highContrast'), equals('Wysoki kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Kolor nierozpoznany'));
      expect(loc.color('cF44336'), equals('Czerwony'));
      expect(loc.color('cE91E63'), equals('Różowy'));
      expect(loc.color('c9C27B0'), equals('Fioletowy'));
      expect(loc.color('c673AB7'), equals('Głęboki fiolet'));
      expect(loc.color('c3F51B5'), equals('Indygo'));
      expect(loc.color('c2196F3'), equals('Niebieski'));
      expect(loc.color('c03A9F4'), equals('Jasnoniebieski'));
      expect(loc.color('c00BCD4'), equals('Cyjan'));
      expect(loc.color('c009688'), equals('Morski'));
      expect(loc.color('c4CAF50'), equals('Zielony'));
      expect(loc.color('c8BC34A'), equals('Jasnozielony'));
      expect(loc.color('cCDDC39'), equals('Limonkowy'));
      expect(loc.color('cFFEB3B'), equals('Żółty'));
      expect(loc.color('cFFC107'), equals('Bursztynowy'));
      expect(loc.color('cFF9800'), equals('Pomarańczowy'));
      expect(loc.color('cFF5722'), equals('Głęboka pomarańcz'));
      expect(loc.color('c795548'), equals('Brązowy'));
      expect(loc.color('c9E9E9E'), equals('Szary'));
      expect(loc.color('c607D8B'), equals('Niebieskoszary'));
    });
  });
}
