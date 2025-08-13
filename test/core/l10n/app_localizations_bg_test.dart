import 'package:accessibility/src/core/l10n/generated/app_localizations_bg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsBg', () {
    late AccessibilityLocalizationsBg loc;

    setUp(() {
      loc = AccessibilityLocalizationsBg();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('bg'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Достъпност'));
      expect(loc.accessibility_settings, equals('Настройки за достъпност'));
      expect(
        loc.adjust_background_colors,
        equals('Настройване на фоновите цветове'),
      );
      expect(
        loc.adjust_text_colors,
        equals('Настройване на цветовете на текста'),
      );
      expect(loc.align_center, equals('Центриране'));
      expect(loc.align_left, equals('Подравняване вляво'));
      expect(loc.align_right, equals('Подравняване вдясно'));
      expect(loc.bold_text, equals('Удебелен текст'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Промяна на удебелен текст'));
      expect(
        loc.change_pages_background_color,
        equals('Промяна на фоновия цвят на страниците на: '),
      );
      expect(loc.change_text_color, equals('Промяна на цвета на текста на: '));
      expect(
        loc.change_text_color_shade,
        equals('Промяна на нюанса на цвета на: '),
      );
      expect(loc.color_adjustment, equals('Настройка на цветовете'));
      expect(
        loc.color_profile_changed_to,
        equals('Текущият цветови профил е: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Намаляване на разстоянието между думите'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Намаляване на разстоянието между буквите'),
      );
      expect(
        loc.decrement_line_height,
        equals('Намаляване на височината на реда'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Намаляване на размера на текста'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Увеличаване на разстоянието между думите'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Увеличаване на разстоянието между буквите'),
      );
      expect(
        loc.increment_line_height,
        equals('Увеличаване на височината на реда'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Увеличаване на размера на текста'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Увеличаване или намаляване на разстоянието между думите'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Увеличаване или намаляване на разстоянието между буквите'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Увеличаване или намаляване на височината на реда'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Увеличаване или намаляване на размера на текста'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Ефекти'));
      expect(loc.expand_text, equals('Разширяване на текста'));
      expect(loc.font_size, equals('Размер на шрифта'));
      expect(loc.less_info, equals('Скрий информацията'));
      expect(loc.letter_spacing, equals('Разстояние между буквите'));
      expect(loc.line_height, equals('Височина на реда'));
      expect(loc.more_info, equals('Покажи информацията'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Прочети по-малко'));
      expect(loc.read_more, equals('Прочети повече'));
      expect(loc.reduce_effects, equals('Намали ефектите на екрана'));
      expect(loc.reduce_text, equals('Намали текста'));
      expect(loc.restore_settings, equals('Възстанови настройките'));
      expect(loc.restore_main_color, equals('Възстанови основния цвят'));
      expect(
        loc.return_to_main_colors,
        equals('Върни се към основните цветове'),
      );
      expect(loc.settings, equals('Настройки'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Размер и показване на текста'));
      expect(
        loc.slider_word_spacing,
        equals('Плъзгач за разстояние между думите'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Плъзгач за разстояние между буквите'),
      );
      expect(loc.slider_line_height, equals('Плъзгач за височина на реда'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_profile('other'), equals('Темата не е разпозната'));
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Безопасна при епилепсия'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('За хора с нарушено зрение'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('Подходяща за ADHD'));
      expect(loc.theme_profile('none'), equals('Стандартна'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Профил безопасен при епилепсия'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Премахни отблясъците и намали цветовете'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Този профил позволява на хора с епилепсия или риск от '
          'пристъпи да използват приложението безопасно, като премахва '
          'опасни анимации и цветови комбинации.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Профил за хора с нарушено зрение'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Подобри видимостта на приложението'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Този профил прави приложението достъпно за хора с различни '
          'зрителни увреждания като тунелно зрение, катаракта, глаукома '
          'и други.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Профил подходящ за ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Повече концентрация, по-малко разсейване'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Този профил значително намалява разсейването, за да помогне '
          'на хора с ADHD и невроразвитийни затруднения да се ориентират, '
          'четат и фокусират върху важните елементи на приложението.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Настройките бяха върнати в начално състояние.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Превключи тъмен режим'));
      expect(loc.toggle_effects_mode, equals('Превключи ефекти'));
      expect(loc.toggle_font_weight, equals('Превключи дебелина на шрифта'));
      expect(loc.word_spacing, equals('Разстояние между думите'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Ниска наситеност'));
      expect(loc.color_profile('normal'), equals('Нормален'));
      expect(loc.color_profile('highSaturation'), equals('Висока наситеност'));
      expect(loc.color_profile('monochrome'), equals('Монохромен'));
      expect(loc.color_profile('highContrast'), equals('Висок контраст'));
      expect(loc.color_profile('unknown'), equals('Нормален'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Червен'));
      expect(loc.color('cE91E63'), equals('Розов'));
      expect(loc.color('c9C27B0'), equals('Лилав'));
      expect(loc.color('c673AB7'), equals('Тъмнолилав'));
      expect(loc.color('c3F51B5'), equals('Индиго'));
      expect(loc.color('c2196F3'), equals('Син'));
      expect(loc.color('c03A9F4'), equals('Светлосин'));
      expect(loc.color('c00BCD4'), equals('Циан'));
      expect(loc.color('c009688'), equals('Тъмнозелен'));
      expect(loc.color('c4CAF50'), equals('Зелен'));
      expect(loc.color('c8BC34A'), equals('Светлозелен'));
      expect(loc.color('cCDDC39'), equals('Лайм'));
      expect(loc.color('cFFEB3B'), equals('Жълт'));
      expect(loc.color('cFFC107'), equals('Кехлибарен'));
      expect(loc.color('cFF9800'), equals('Оранжев'));
      expect(loc.color('cFF5722'), equals('Тъмнооранжев'));
      expect(loc.color('c795548'), equals('Кафяв'));
      expect(loc.color('c9E9E9E'), equals('Сив'));
      expect(loc.color('c607D8B'), equals('Синьо-сив'));
      expect(loc.color('unknown'), equals('Цветът не е разпознат'));
    });
  });
}
