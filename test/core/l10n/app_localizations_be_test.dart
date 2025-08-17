import 'package:accessibility/src/core/l10n/generated/app_localizations_be.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsBe', () {
    late AccessibilityLocalizationsBe loc;

    setUp(() {
      loc = AccessibilityLocalizationsBe();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('be'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Доступнасць'));
      expect(loc.accessibility_settings, equals('Налады доступнасці'));
      expect(
        loc.adjust_background_colors,
        equals('Падвышэнне фонавых колераў'),
      );
      expect(loc.adjust_text_colors, equals('Падвышэнне колераў тэксту'));
      expect(loc.align_center, equals('Выраўнаваць па цэнтры'));
      expect(loc.align_left, equals('Выраўнаваць па левым краі'));
      expect(loc.align_right, equals('Выраўнаваць па правым краі'));
      expect(loc.bold_text, equals('Тоўсты тэкст'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Змяніць тоўсты тэкст'));
      expect(
        loc.change_pages_background_color,
        equals('Змяніць колер фону старонак на: '),
      );
      expect(loc.change_text_color, equals('Змяніць колер тэксту на: '));
      expect(
        loc.change_text_color_shade,
        equals('Змяніць адценне колеру на: '),
      );
      expect(loc.color_adjustment, equals('Карэкцыя колеру'));
      expect(
        loc.color_profile_changed_to,
        equals('Цяперашні профіль колеру: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Зменшыць інтэрвал паміж словамі'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Зменшыць інтэрвал паміж літарамі'),
      );
      expect(loc.decrement_line_height, equals('Зменшыць вышыню радка'));
      expect(loc.decrement_text_scale_factor, equals('Зменшыць памер тэксту'));
      expect(
        loc.increment_word_spacing,
        equals('Павялічыць інтэрвал паміж словамі'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Павялічыць інтэрвал паміж літарамі'),
      );
      expect(loc.increment_line_height, equals('Павялічыць вышыню радка'));
      expect(
        loc.increment_text_scale_factor,
        equals('Павялічыць памер тэксту'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Павялічыць або зменшыць інтэрвал паміж словамі'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Павялічыць або зменшыць інтэрвал паміж літарамі'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Павялічыць або зменшыць вышыню радка'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Павялічыць або зменшыць памер тэксту'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Візуальныя эфекты'));
      expect(loc.expand_text, equals('Разгарнуць тэкст'));
      expect(loc.font_size, equals('Памер шрыфта'));
      expect(loc.less_info, equals('Схаваць інфармацыю'));
      expect(loc.letter_spacing, equals('Інтэрвал паміж літарамі'));
      expect(loc.line_height, equals('Вышыня радка'));
      expect(loc.more_info, equals('Паказаць інфармацыю'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Чытаць менш'));
      expect(loc.read_more, equals('Чытаць больш'));
      expect(loc.reduce_effects, equals('Зменшыць эфекты на экране'));
      expect(loc.reduce_text, equals('Скараціць тэкст'));
      expect(loc.restore_settings, equals('Аднавіць налады'));
      expect(loc.restore_main_color, equals('Аднавіць асноўны колер'));
      expect(loc.return_to_main_colors, equals('Вярнуцца да асноўных колераў'));
      expect(loc.settings, equals('Налады'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Памер і адлюстраванне тэксту'));
      expect(
        loc.slider_word_spacing,
        equals('Паўзунок інтэрвалу паміж словамі'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Паўзунок інтэрвалу паміж літарамі'),
      );
      expect(loc.slider_line_height, equals('Паўзунок вышыні радка'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_profile('other'), equals('Профіль тэмы не распазнаны'));
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Бяспечная пры эпілепсіі'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Для людзей з парушэннямі зроку'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('Падыходзіць для ADHD'));
      expect(loc.theme_profile('none'), equals('Стандартная'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Профіль бяспечны пры эпілепсіі'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Прыбярыце адбіткі і паменшыце колер'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Гэты профіль дазваляе людзям з эпілепсіяй або рызыкай прыступаў '
          'бяспечна карыстацца дадаткам, выдаляючы небяспечныя '
          'анімацыі і каляровыя спалучэнні.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Профіль для людзей з парушэннямі зроку'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Паляпшэнне бачнасці прыкладання'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Гэты профіль робіць дадатак даступным для людзей з рознымі '
          'парушэннямі зроку, такімі як тунэльнае зрок, катаракта, глаўкома '
          'і інш.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Профіль, прыдатны для ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Больш канцэнтрацыі, менш адцягнення'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Гэты профіль значна памяншае адцягненне, каб дапамагчы '
          'людзям з ADHD і неўраразвіццёвымі парушэннямі лягчэй '
          'арыентавацца, чытаць і канцэнтравацца на галоўных '
          'элементах прыкладання.',
        ),
      );
      expect(loc.the_settings_have_been_reset, equals('Налады былі скінуты.'));
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Пераключыць цёмны рэжым'));
      expect(loc.toggle_effects_mode, equals('Пераключыць эфекты'));
      expect(loc.toggle_font_weight, equals('Пераключыць таўшчыню шрыфта'));
      expect(loc.word_spacing, equals('Інтэрвал паміж словамі'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Нізкая насычанасць'));
      expect(loc.color_profile('normal'), equals('Звычайны'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Высокая насычанасць'),
      );
      expect(loc.color_profile('monochrome'), equals('Манаграма'));
      expect(loc.color_profile('highContrast'), equals('Высокі кантраст'));
      expect(loc.color_profile('unknown'), equals('Звычайны'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Чырвоны'));
      expect(loc.color('cE91E63'), equals('Ружовы'));
      expect(loc.color('c9C27B0'), equals('Фіялетавы'));
      expect(loc.color('c673AB7'), equals('Цёмна-фіялетавы'));
      expect(loc.color('c3F51B5'), equals('Індыга'));
      expect(loc.color('c2196F3'), equals('Сіні'));
      expect(loc.color('c03A9F4'), equals('Светла-сіні'));
      expect(loc.color('c00BCD4'), equals('Блакітны'));
      expect(loc.color('c009688'), equals('Цёмна-зялёны'));
      expect(loc.color('c4CAF50'), equals('Зялёны'));
      expect(loc.color('c8BC34A'), equals('Светла-зялёны'));
      expect(loc.color('cCDDC39'), equals('Лайм'));
      expect(loc.color('cFFEB3B'), equals('Жоўты'));
      expect(loc.color('cFFC107'), equals('Бурштынавы'));
      expect(loc.color('cFF9800'), equals('Аранжавы'));
      expect(loc.color('cFF5722'), equals('Цёмна-аранджавы'));
      expect(loc.color('c795548'), equals('Карычневы'));
      expect(loc.color('c9E9E9E'), equals('Шэры'));
      expect(loc.color('c607D8B'), equals('Сіне-шэры'));
      expect(loc.color('unknown'), equals('Колер не распазнаны'));
    });
  });
}
