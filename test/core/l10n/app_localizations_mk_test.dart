import 'package:accessibility/src/core/l10n/generated/app_localizations_mk.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsMk', () {
    late AccessibilityLocalizationsMk loc;

    setUp(() {
      loc = AccessibilityLocalizationsMk();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('mk'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Пристапност'));
      expect(
        loc.accessibility_settings,
        equals('Поставки за пристапност'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Прилагоди бои на позадината'),
      );
      expect(loc.adjust_text_colors, equals('Прилагоди бои на текстот'));
      expect(loc.align_center, equals('Порамни во средина'));
      expect(loc.align_left, equals('Порамни лево'));
      expect(loc.align_right, equals('Порамни десно'));
      expect(loc.bold_text, equals('Задебелен текст'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('Промени задебеленост на текст'),
      );
      expect(
        loc.change_pages_background_color,
        equals(
          'Промени ја бојата на позадината на страниците во: ',
        ),
      );
      expect(
        loc.change_text_color,
        equals('Промени ја бојата на текстот во: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Промени ја нијансата на бојата во: '),
      );
      expect(loc.color_adjustment, equals('Прилагодување на бои'));
      expect(
        loc.color_profile_changed_to,
        equals('Тековниот профил на бои е: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Намали растојание помеѓу зборови'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Намали растојание помеѓу букви'),
      );
      expect(loc.decrement_line_height, equals('Намали висина на линија'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Намали фактор на зголемување на текст'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Зголеми растојание помеѓу зборови'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Зголеми растојание помеѓу букви'),
      );
      expect(loc.increment_line_height, equals('Зголеми висина на линија'));
      expect(
        loc.increment_text_scale_factor,
        equals('Зголеми фактор на зголемување на текст'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Зголеми или намали растојание помеѓу зборови'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Зголеми или намали растојание помеѓу букви'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Зголеми или намали висина на линија'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Зголеми или намали големина на текст'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Ефекти'));
      expect(loc.expand_text, equals('Прошири текст'));
      expect(loc.font_size, equals('Големина на фонт'));
      expect(loc.less_info, equals('Скриј информации'));
      expect(
        loc.letter_spacing,
        equals('Растојание помеѓу букви'),
      );
      expect(loc.line_height, equals('Висина на линија'));
      expect(loc.more_info, equals('Покажи информации'));
      expect(
        loc.word_spacing,
        equals('Растојание помеѓу зборови'),
      );
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Читај помалку'));
      expect(loc.read_more, equals('Читај повеќе'));
      expect(loc.reduce_effects, equals('Намали ефекти на екранот'));
      expect(loc.reduce_text, equals('Намали текст'));
      expect(loc.restore_settings, equals('Врати поставки'));
      expect(loc.restore_main_color, equals('Врати ја главната боја'));
      expect(loc.return_to_main_colors, equals('Врати се на главните бои'));
      expect(loc.settings, equals('Поставки'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Големина и приказ на текст'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Лизгач за растојание помеѓу зборови'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Лизгач за растојание помеѓу букви'),
      );
      expect(
        loc.slider_line_height,
        equals('Лизгач за висина на линија'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Тема'));
      expect(
        loc.theme_profile('other'),
        equals('Профилот на тема не е препознаен'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Безбеден за напади'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Прилагоден за лица со слаб вид'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Пријателски за АДХД'),
      );
      expect(loc.theme_profile('none'), equals('Стандардно'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Безбеден профил за напади'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Отстрани одблесоци и намали бои'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Овој профил им овозможува на корисниците кои имаат '
          'епилепсија и се изложени на ризик од напади да '
          'прелистуваат безбедно со елиминирање на ризикот од '
          'напади предизвикани од трепкави анимации и ризични '
          'комбинации на бои.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Профил за лица со оштетен вид'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Подобри видливост на апликацијата'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Овој профил ја прилагодува апликацијата да биде достапна '
          'за повеќето визуелни оштетувања, како што се оштетен '
          'вид, тунелски вид, катаракта, глауком и друго.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Профил пријателски за АДХД'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Поголема концентрација и помалку одвлекувања'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Овој профил значително ги намалува одвлекувањата, за да '
          'им помогне на луѓето со АДХД и невроразвојни нарушувања '
          'да навигираат, читаат и се фокусираат на суштинските '
          'елементи на апликацијата полесно.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Поставките се ресетирани.'),
      );
      expect(
        loc.toggle_dark_mode,
        equals('Вклучи/исклучи темен режим'),
      );
      expect(
        loc.toggle_effects_mode,
        equals('Вклучи/исклучи режим на ефекти'),
      );
      expect(
        loc.toggle_font_weight,
        equals('Вклучи/исклучи дебелина на фонт'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('Вклучи/исклучи профил на тема'),
      );
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Нормално'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Ниска заситеност'),
      );
      expect(loc.color_profile('normal'), equals('Нормално'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Висока заситеност'),
      );
      expect(loc.color_profile('monochrome'), equals('Монохроматско'));
      expect(
        loc.color_profile('highContrast'),
        equals('Висок контраст'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Бојата не е препознаена'));
      expect(loc.color('cF44336'), equals('Црвена'));
      expect(loc.color('cE91E63'), equals('Розова'));
      expect(loc.color('c9C27B0'), equals('Виолетова'));
      expect(loc.color('c673AB7'), equals('Темно виолетова'));
      expect(loc.color('c3F51B5'), equals('Индиго'));
      expect(loc.color('c2196F3'), equals('Сина'));
      expect(loc.color('c03A9F4'), equals('Светло сина'));
      expect(loc.color('c00BCD4'), equals('Тиркизна'));
      expect(loc.color('c009688'), equals('Теал'));
      expect(loc.color('c4CAF50'), equals('Зелена'));
      expect(loc.color('c8BC34A'), equals('Светло зелена'));
      expect(loc.color('cCDDC39'), equals('Лимета'));
      expect(loc.color('cFFEB3B'), equals('Жолта'));
      expect(loc.color('cFFC107'), equals('Ќилибарна'));
      expect(loc.color('cFF9800'), equals('Портокалова'));
      expect(loc.color('cFF5722'), equals('Темно портокалова'));
      expect(loc.color('c795548'), equals('Кафеава'));
      expect(loc.color('c9E9E9E'), equals('Сива'));
      expect(loc.color('c607D8B'), equals('Сино-сива'));
    });
  });
}
