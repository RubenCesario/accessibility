import 'package:accessibility/src/core/l10n/generated/app_localizations_uk.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsUk', () {
    late AccessibilityLocalizationsUk loc;

    setUp(() {
      loc = AccessibilityLocalizationsUk();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('uk'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Доступність'));
      expect(
        loc.accessibility_settings,
        equals('Налаштування доступності'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Налаштувати кольори фону'),
      );
      expect(loc.adjust_text_colors, equals('Налаштувати кольори тексту'));
      expect(loc.align_center, equals('Вирівняти по центру'));
      expect(loc.align_left, equals('Вирівняти ліворуч'));
      expect(loc.align_right, equals('Вирівняти праворуч'));
      expect(loc.bold_text, equals('Жирний текст'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Змінити жирний текст'));
      expect(
        loc.change_pages_background_color,
        equals('Змінити колір фону сторінок на: '),
      );
      expect(
        loc.change_text_color,
        equals('Змінити колір тексту на: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Змінити відтінок кольору на: '),
      );
      expect(loc.color_adjustment, equals('Налаштування кольору'));
      expect(
        loc.color_profile_changed_to,
        equals('Поточний кольоровий профіль: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Зменшити інтервал між словами'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Зменшити інтервал між літерами'),
      );
      expect(loc.decrement_line_height, equals('Зменшити висоту рядка'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Зменшити коефіцієнт масштабування тексту'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Збільшити інтервал між словами'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Збільшити інтервал між літерами'),
      );
      expect(loc.increment_line_height, equals('Збільшити висоту рядка'));
      expect(
        loc.increment_text_scale_factor,
        equals('Збільшити коефіцієнт масштабування тексту'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Збільшити або зменшити інтервал між словами'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Збільшити або зменшити інтервал між літерами'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Збільшити або зменшити висоту рядка'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Збільшити або зменшити розмір тексту'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Ефекти'));
      expect(loc.expand_text, equals('Розгорнути текст'));
      expect(loc.font_size, equals('Розмір шрифту'));
      expect(loc.less_info, equals('Сховати інформацію'));
      expect(loc.letter_spacing, equals('Інтервал між літерами'));
      expect(loc.line_height, equals('Висота рядка'));
      expect(loc.more_info, equals('Показати інформацію'));
      expect(loc.word_spacing, equals('Інтервал між словами'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Читати менше'));
      expect(loc.read_more, equals('Читати більше'));
      expect(
        loc.reduce_effects,
        equals('Зменшити ефекти екрану'),
      );
      expect(loc.reduce_text, equals('Зменшити текст'));
      expect(loc.restore_settings, equals('Відновити налаштування'));
      expect(loc.restore_main_color, equals('Відновити основний колір'));
      expect(
        loc.return_to_main_colors,
        equals('Повернутися до основних кольорів'),
      );
      expect(loc.settings, equals('Налаштування'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Розмір та відображення тексту'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Повзунок інтервалу між словами'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Повзунок інтервалу між літерами'),
      );
      expect(loc.slider_line_height, equals('Повзунок висоти рядка'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Тема'));
      expect(
        loc.theme_profile('other'),
        equals('Профіль теми не розпізнано'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Безпечний для епілепсії'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Для людей з порушенням зору'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Дружній до ADHD'),
      );
      expect(loc.theme_profile('none'), equals('За замовчуванням'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Профіль безпечний для епілепсії'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Видалити відблиски та зменшити кольори'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals('Цей профіль дозволяє користувачам з епілепсією та '
            'ризиком нападів безпечно переглядати сторінки, '
            'усуваючи ризик нападів, що виникають через '
            'мерехтливі анімації та ризиковані комбінації '
            'кольорів.'),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Профіль для людей з порушенням зору'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Покращити видимість додатку'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals('Цей профіль адаптує додаток для доступності більшості '
            'порушень зору, таких як погіршення зору, тунельний '
            'зір, катаракта, глаукома та інші.'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Профіль дружній до ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Більше концентрації та менше відволікань'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals('Цей профіль значно зменшує відволікання, щоб '
            'допомогти людям з ADHD та нейророзвитковими '
            'розладами легше орієнтуватися, читати та '
            'зосереджуватися на основних елементах додатку.'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Налаштування було скинуто.'),
      );
      expect(loc.toggle_dark_mode, equals('Перемкнути темний режим'));
      expect(loc.toggle_effects_mode, equals('Перемкнути режим ефектів'));
      expect(loc.toggle_font_weight, equals('Перемкнути товщину шрифту'));
      expect(loc.toggle_theme_profile, equals('Перемкнути профіль теми'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Нормальний'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Низька насиченість'),
      );
      expect(loc.color_profile('normal'), equals('Нормальний'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Висока насиченість'),
      );
      expect(loc.color_profile('monochrome'), equals('Монохромний'));
      expect(loc.color_profile('highContrast'), equals('Високий контраст'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Колір не розпізнано'));
      expect(loc.color('cF44336'), equals('Червоний'));
      expect(loc.color('cE91E63'), equals('Рожевий'));
      expect(loc.color('c9C27B0'), equals('Фіолетовий'));
      expect(loc.color('c673AB7'), equals('Темно-фіолетовий'));
      expect(loc.color('c3F51B5'), equals('Індиго'));
      expect(loc.color('c2196F3'), equals('Синій'));
      expect(loc.color('c03A9F4'), equals('Світло-синій'));
      expect(loc.color('c00BCD4'), equals('Бірюзовий'));
      expect(loc.color('c009688'), equals('Синьо-зелений'));
      expect(loc.color('c4CAF50'), equals('Зелений'));
      expect(loc.color('c8BC34A'), equals('Світло-зелений'));
      expect(loc.color('cCDDC39'), equals('Лаймовий'));
      expect(loc.color('cFFEB3B'), equals('Жовтий'));
      expect(loc.color('cFFC107'), equals('Бурштиновий'));
      expect(loc.color('cFF9800'), equals('Помаранчевий'));
      expect(loc.color('cFF5722'), equals('Темно-помаранчевий'));
      expect(loc.color('c795548'), equals('Коричневий'));
      expect(loc.color('c9E9E9E'), equals('Сірий'));
      expect(loc.color('c607D8B'), equals('Синьо-сірий'));
    });
  });
}
