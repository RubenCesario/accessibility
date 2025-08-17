import 'package:accessibility/src/core/l10n/generated/app_localizations_ru.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsRu', () {
    late AccessibilityLocalizationsRu loc;

    setUp(() {
      loc = AccessibilityLocalizationsRu();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ru'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Доступность'));
      expect(
        loc.accessibility_settings,
        equals('Настройки доступности'),
      );
      expect(loc.adjust_background_colors, equals('Настроить цвета фона'));
      expect(loc.adjust_text_colors, equals('Настроить цвета текста'));
      expect(loc.align_center, equals('Выровнять по центру'));
      expect(loc.align_left, equals('Выровнять по левому краю'));
      expect(loc.align_right, equals('Выровнять по правому краю'));
      expect(loc.bold_text, equals('Жирный текст'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Изменить жирный текст'));
      expect(
        loc.change_pages_background_color,
        equals('Изменить цвет фона страниц на: '),
      );
      expect(loc.change_text_color, equals('Изменить цвет текста на: '));
      expect(
        loc.change_text_color_shade,
        equals('Изменить оттенок цвета на: '),
      );
      expect(loc.color_adjustment, equals('Настройка цвета'));
      expect(
        loc.color_profile_changed_to,
        equals('Текущий профиль цвета: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Уменьшить интервал между словами'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Уменьшить интервал между буквами'),
      );
      expect(loc.decrement_line_height, equals('Уменьшить высоту строки'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Уменьшить коэффициент масштабирования текста'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Увеличить интервал между словами'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Увеличить интервал между буквами'),
      );
      expect(loc.increment_line_height, equals('Увеличить высоту строки'));
      expect(
        loc.increment_text_scale_factor,
        equals('Увеличить коэффициент масштабирования текста'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Увеличить или уменьшить интервал между словами'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Увеличить или уменьшить интервал между буквами'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Увеличить или уменьшить высоту строки'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Увеличить или уменьшить размер текста'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Эффекты'));
      expect(loc.expand_text, equals('Развернуть текст'));
      expect(loc.font_size, equals('Размер шрифта'));
      expect(loc.less_info, equals('Скрыть информацию'));
      expect(loc.letter_spacing, equals('Интервал между буквами'));
      expect(loc.line_height, equals('Высота строки'));
      expect(loc.more_info, equals('Показать информацию'));
      expect(loc.word_spacing, equals('Интервал между словами'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Читать меньше'));
      expect(loc.read_more, equals('Читать больше'));
      expect(loc.reduce_effects, equals('Уменьшить эффекты на экране'));
      expect(loc.reduce_text, equals('Свернуть текст'));
      expect(loc.restore_settings, equals('Восстановить настройки'));
      expect(loc.restore_main_color, equals('Восстановить основной цвет'));
      expect(
        loc.return_to_main_colors,
        equals('Вернуться к основным цветам'),
      );
      expect(loc.settings, equals('Настройки'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Размер и отображение текста'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Ползунок интервала между словами'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Ползунок интервала между буквами'),
      );
      expect(loc.slider_line_height, equals('Ползунок высоты строки'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Тема'));
      expect(
        loc.theme_profile('other'),
        equals('Профиль темы не распознан'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Безопасный для эпилептиков'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Для слабовидящих'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Для людей с СДВГ'),
      );
      expect(loc.theme_profile('none'), equals('По умолчанию'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Безопасный профиль для эпилептиков'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Убрать отражения и уменьшить цвет'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Этот профиль позволяет пользователям с эпилепсией и '
          'риском приступов безопасно пользоваться '
          'приложением, устраняя риск приступов, вызванных '
          'мерцающими анимациями и опасными цветовыми '
          'комбинациями.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Профиль для слабовидящих'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Улучшить видимость приложения'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Этот профиль адаптирует приложение для доступности '
          'большинству людей с нарушениями зрения, такими как '
          'слабовидение, туннельное зрение, катаракта, '
          'глаукома и другие.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Профиль для людей с СДВГ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Больше концентрации и меньше отвлечений'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Этот профиль значительно уменьшает отвлекающие '
          'факторы, чтобы помочь людям с СДВГ и '
          'нейроразвитийными расстройствами легче '
          'ориентироваться, читать и сосредоточиться на '
          'важных элементах приложения.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Настройки были сброшены.'),
      );
      expect(loc.toggle_dark_mode, equals('Переключить тёмный режим'));
      expect(loc.toggle_effects_mode, equals('Переключить режим эффектов'));
      expect(loc.toggle_font_weight, equals('Переключить толщину шрифта'));
      expect(loc.toggle_theme_profile, equals('Переключить профиль темы'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Нормальный'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Низкая насыщенность'),
      );
      expect(loc.color_profile('normal'), equals('Нормальный'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Высокая насыщенность'),
      );
      expect(loc.color_profile('monochrome'), equals('Монохромный'));
      expect(loc.color_profile('highContrast'), equals('Высокий контраст'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Цвет не распознан'));
      expect(loc.color('cF44336'), equals('Красный'));
      expect(loc.color('cE91E63'), equals('Розовый'));
      expect(loc.color('c9C27B0'), equals('Фиолетовый'));
      expect(loc.color('c673AB7'), equals('Тёмно-фиолетовый'));
      expect(loc.color('c3F51B5'), equals('Индиго'));
      expect(loc.color('c2196F3'), equals('Синий'));
      expect(loc.color('c03A9F4'), equals('Светло-синий'));
      expect(loc.color('c00BCD4'), equals('Голубой'));
      expect(loc.color('c009688'), equals('Бирюзовый'));
      expect(loc.color('c4CAF50'), equals('Зелёный'));
      expect(loc.color('c8BC34A'), equals('Светло-зелёный'));
      expect(loc.color('cCDDC39'), equals('Лайм'));
      expect(loc.color('cFFEB3B'), equals('Жёлтый'));
      expect(loc.color('cFFC107'), equals('Янтарный'));
      expect(loc.color('cFF9800'), equals('Оранжевый'));
      expect(loc.color('cFF5722'), equals('Тёмно-оранжевый'));
      expect(loc.color('c795548'), equals('Коричневый'));
      expect(loc.color('c9E9E9E'), equals('Серый'));
      expect(loc.color('c607D8B'), equals('Сине-серый'));
    });
  });
}
