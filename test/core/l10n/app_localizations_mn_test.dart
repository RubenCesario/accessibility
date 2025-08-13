import 'package:accessibility/src/core/l10n/generated/app_localizations_mn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsMn', () {
    late AccessibilityLocalizationsMn loc;

    setUp(() {
      loc = AccessibilityLocalizationsMn();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('mn'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Хүртээмж'));
      expect(loc.accessibility_settings, equals('Хүртээмжийн тохиргоо'));
      expect(
        loc.adjust_background_colors,
        equals('Дэвсгэрийн өнгийг тохируулах'),
      );
      expect(loc.adjust_text_colors, equals('Текстийн өнгийг тохируулах'));
      expect(loc.align_center, equals('Төвд зэрэгцүүлэх'));
      expect(loc.align_left, equals('Зүүн талд зэрэгцүүлэх'));
      expect(loc.align_right, equals('Баруун талд зэрэгцүүлэх'));
      expect(loc.bold_text, equals('Тод текст'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Тод текстийг өөрчлөх'));
      expect(
        loc.change_pages_background_color,
        equals(
          'Хуудсуудын дэвсгэрийн өнгийг дараах байдлаар өөрчлөх: ',
        ),
      );
      expect(
        loc.change_text_color,
        equals('Текстийн өнгийг дараах байдлаар өөрчлөх: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Өнгийн сүүдэрлэлтийг дараах байдлаар өөрчлөх: '),
      );
      expect(loc.color_adjustment, equals('Өнгийн тохиргоо'));
      expect(
        loc.color_profile_changed_to,
        equals('Өнөөгийн өнгөний профайл нь: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Үгийн зайг багасгах'));
      expect(loc.decrement_letter_spacing, equals('Үсгийн зайг багасгах'));
      expect(loc.decrement_line_height, equals('Мөрийн өндөрийг багасгах'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Текстийн масштабын факторыг багасгах'),
      );
      expect(loc.increment_word_spacing, equals('Үгийн зайг нэмэгдүүлэх'));
      expect(loc.increment_letter_spacing, equals('Үсгийн зайг нэмэгдүүлэх'));
      expect(
        loc.increment_line_height,
        equals('Мөрийн өндөрийг нэмэгдүүлэх'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Текстийн масштабын факторыг нэмэгдүүлэх'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Эффектүүд'));
      expect(loc.expand_text, equals('Текстийг өргөтгөх'));
      expect(loc.font_size, equals('Фонтын хэмжээ'));
      expect(loc.less_info, equals('Мэдээллийг нуух'));
      expect(loc.letter_spacing, equals('Үсгийн зай'));
      expect(loc.line_height, equals('Мөрийн өндөр'));
      expect(loc.more_info, equals('Мэдээлэл харуулах'));
      expect(loc.word_spacing, equals('Үгийн зай'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Бага унших'));
      expect(loc.read_more, equals('Илүү унших'));
      expect(loc.reduce_effects, equals('Дэлгэцийн эффектийг багасгах'));
      expect(loc.reduce_text, equals('Текстийг багасгах'));
      expect(loc.restore_settings, equals('Тохиргоог сэргээх'));
      expect(loc.restore_main_color, equals('Үндсэн өнгийг сэргээх'));
      expect(
        loc.return_to_main_colors,
        equals('Үндсэн өнгөнүүд рүү буцах'),
      );
      expect(loc.settings, equals('Тохиргоо'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Хэмжээ ба текстийн харуулалт'),
      );
      expect(loc.slider_word_spacing, equals('Үгийн зайн слайдер'));
      expect(loc.slider_letter_spacing, equals('Үсгийн зайн слайдер'));
      expect(loc.slider_line_height, equals('Мөрийн өндрийн слайдер'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Тема'));
      expect(
        loc.theme_profile('other'),
        equals('Теманы профайл танигдаагүй'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Уналтаас хамгаалсан'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Хараа суларсан'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD тааламжтай'),
      );
      expect(loc.theme_profile('none'), equals('Үндсэн'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Уналтаас хамгаалсан профайл'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Тусгалыг арилгаж өнгийг багасгах'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Энэ профайл нь уналтаас өвчтэй болон уналтын эрсдэлтэй '
          'хэрэглэгчдэд гялтганах анимаци болон эрсдэлтэй өнгийн '
          'хослолоос үүдэлтэй уналтын эрсдлийг арилгах замаар '
          'аюулгүй хэрэглэх боломжийг олгодог.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Хараа суларсан профайл'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Аппликейшний харагдахуйцыг сайжруулах'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Энэ профайл нь харааны бэрхшээл, туннелийн хараа, болор '
          'цагаан, глауком болон бусад олон харааны бэрхшээлтэй '
          'хүмүүст хүртээмжтэй болгохоор аппликейшнийг '
          'тохируулдаг.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-тааламжтай профайл'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Илүү төвлөрөл ба бага анхаарал сарниулалт'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Энэ профайл нь ADHD болон мэдрэлийн хөгжлийн эмгэгтэй '
          'хүмүүст аппликейшний чухал элементүүдэд илүү '
          'хялбараар чиглүүлэх, унших, анхаарлаа төвлөрүүлэхэд '
          'туслахын тулд анхаарал сарниулалтыг ихээхэн '
          'багасгадаг.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Тохиргоо дахин тохируулагдсан.'),
      );
      expect(loc.toggle_dark_mode, equals('Хар горимыг тогглдох'));
      expect(loc.toggle_effects_mode, equals('Эффектийн горимыг тогглдох'));
      expect(loc.toggle_font_weight, equals('Фонтын жинг тогглдох'));
      expect(loc.toggle_theme_profile, equals('Теманы профайлыг тогглдох'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Хэвийн'));
      expect(loc.color_profile('lowSaturation'), equals('Бага хангалт'));
      expect(loc.color_profile('normal'), equals('Хэвийн'));
      expect(loc.color_profile('highSaturation'), equals('Өндөр хангалт'));
      expect(loc.color_profile('monochrome'), equals('Монохром'));
      expect(loc.color_profile('highContrast'), equals('Өндөр контраст'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Өнгийг таньсангүй'));
      expect(loc.color('cF44336'), equals('Улаан'));
      expect(loc.color('cE91E63'), equals('Ягаан'));
      expect(loc.color('c9C27B0'), equals('Ягаан хөх'));
      expect(loc.color('c673AB7'), equals('Гүн ягаан хөх'));
      expect(loc.color('c3F51B5'), equals('Индиго'));
      expect(loc.color('c2196F3'), equals('Хөх'));
      expect(loc.color('c03A9F4'), equals('Цайвар хөх'));
      expect(loc.color('c00BCD4'), equals('Огторгуй'));
      expect(loc.color('c009688'), equals('Усан хөх'));
      expect(loc.color('c4CAF50'), equals('Ногоон'));
      expect(loc.color('c8BC34A'), equals('Цайвар ногоон'));
      expect(loc.color('cCDDC39'), equals('Лайм'));
      expect(loc.color('cFFEB3B'), equals('Шар'));
      expect(loc.color('cFFC107'), equals('Амбар'));
      expect(loc.color('cFF9800'), equals('Улбар шар'));
      expect(loc.color('cFF5722'), equals('Гүн улбар шар'));
      expect(loc.color('c795548'), equals('Бор'));
      expect(loc.color('c9E9E9E'), equals('Саарал'));
      expect(loc.color('c607D8B'), equals('Хөхөвтөр саарал'));
    });
  });
}
