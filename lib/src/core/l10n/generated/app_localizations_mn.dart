// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AccessibilityLocalizationsMn extends AccessibilityLocalizations {
  AccessibilityLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get accessibility => 'Хүртээмж';

  @override
  String get accessibility_settings => 'Хүртээмжийн тохиргоо';

  @override
  String get adjust_background_colors => 'Дэвсгэрийн өнгийг тохируулах';

  @override
  String get adjust_text_colors => 'Текстийн өнгийг тохируулах';

  @override
  String get align_center => 'Төвд зэрэгцүүлэх';

  @override
  String get align_left => 'Зүүн талд зэрэгцүүлэх';

  @override
  String get align_right => 'Баруун талд зэрэгцүүлэх';

  @override
  String get bold_text => 'Тод текст';

  @override
  String get change_bold_text => 'Тод текстийг өөрчлөх';

  @override
  String get change_pages_background_color =>
      'Хуудсуудын дэвсгэрийн өнгийг дараах байдлаар өөрчлөх: ';

  @override
  String get change_text_color => 'Текстийн өнгийг дараах байдлаар өөрчлөх: ';

  @override
  String get change_text_color_shade =>
      'Өнгийн сүүдэрлэлтийг дараах байдлаар өөрчлөх: ';

  @override
  String get color_adjustment => 'Өнгийн тохиргоо';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Хэвийн',
        'lowSaturation': 'Бага хангалт',
        'normal': 'Хэвийн',
        'highSaturation': 'Өндөр хангалт',
        'monochrome': 'Монохром',
        'highContrast': 'Өндөр контраст',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Өнөөгийн өнгөний профайл нь: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Өнгийг таньсангүй',
        'cF44336': 'Улаан',
        'cE91E63': 'Ягаан',
        'c9C27B0': 'Ягаан хөх',
        'c673AB7': 'Гүн ягаан хөх',
        'c3F51B5': 'Индиго',
        'c2196F3': 'Хөх',
        'c03A9F4': 'Цайвар хөх',
        'c00BCD4': 'Огторгуй',
        'c009688': 'Усан хөх',
        'c4CAF50': 'Ногоон',
        'c8BC34A': 'Цайвар ногоон',
        'cCDDC39': 'Лайм',
        'cFFEB3B': 'Шар',
        'cFFC107': 'Амбар',
        'cFF9800': 'Улбар шар',
        'cFF5722': 'Гүн улбар шар',
        'c795548': 'Бор',
        'c9E9E9E': 'Саарал',
        'c607D8B': 'Хөхөвтөр саарал',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Үгийн зайг багасгах';

  @override
  String get decrement_letter_spacing => 'Үсгийн зайг багасгах';

  @override
  String get decrement_line_height => 'Мөрийн өндөрийг багасгах';

  @override
  String get decrement_text_scale_factor =>
      'Текстийн масштабын факторыг багасгах';

  @override
  String get effects => 'Эффектүүд';

  @override
  String get expand_text => 'Текстийг өргөтгөх';

  @override
  String get font_size => 'Фонтын хэмжээ';

  @override
  String get increase_or_decrease_word_spacing =>
      'Үгийн зайг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Үсгийн зайг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increase_or_decrease_line_height =>
      'Мөрийн өндөрийг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increase_or_decrease_text_size =>
      'Текстийн хэмжээг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increment_word_spacing => 'Үгийн зайг нэмэгдүүлэх';

  @override
  String get increment_letter_spacing => 'Үсгийн зайг нэмэгдүүлэх';

  @override
  String get increment_line_height => 'Мөрийн өндөрийг нэмэгдүүлэх';

  @override
  String get increment_text_scale_factor =>
      'Текстийн масштабын факторыг нэмэгдүүлэх';

  @override
  String get less_info => 'Мэдээллийг нуух';

  @override
  String get letter_spacing => 'Үсгийн зай';

  @override
  String get line_height => 'Мөрийн өндөр';

  @override
  String get more_info => 'Мэдээлэл харуулах';

  @override
  String get read_less => 'Бага унших';

  @override
  String get read_more => 'Илүү унших';

  @override
  String get reduce_effects => 'Дэлгэцийн эффектийг багасгах';

  @override
  String get reduce_text => 'Текстийг багасгах';

  @override
  String get restore_settings => 'Тохиргоог сэргээх';

  @override
  String get restore_main_color => 'Үндсэн өнгийг сэргээх';

  @override
  String get return_to_main_colors => 'Үндсэн өнгөнүүд рүү буцах';

  @override
  String get settings => 'Тохиргоо';

  @override
  String get size_and_text_display => 'Хэмжээ ба текстийн харуулалт';

  @override
  String get slider_word_spacing => 'Үгийн зайн слайдер';

  @override
  String get slider_letter_spacing => 'Үсгийн зайн слайдер';

  @override
  String get slider_line_height => 'Мөрийн өндрийн слайдер';

  @override
  String get theme_mode => 'Тема';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Теманы профайл танигдаагүй',
        'seizureSafe': 'Уналтаас хамгаалсан',
        'visionImpaired': 'Хараа суларсан',
        'adhdFriendly': 'ADHD тааламжтай',
        'none': 'Үндсэн',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Уналтаас хамгаалсан профайл';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Тусгалыг арилгаж өнгийг багасгах';

  @override
  String get theme_profile_seizure_safe_description =>
      'Энэ профайл нь уналтаас өвчтэй болон уналтын эрсдэлтэй хэрэглэгчдэд гялтганах анимаци болон эрсдэлтэй өнгийн хослолоос үүдэлтэй уналтын эрсдлийг арилгах замаар аюулгүй хэрэглэх боломжийг олгодог.';

  @override
  String get theme_profile_vision_impaired_title => 'Хараа суларсан профайл';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Аппликейшний харагдахуйцыг сайжруулах';

  @override
  String get theme_profile_vision_impaired_description =>
      'Энэ профайл нь харааны бэрхшээл, туннелийн хараа, болор цагаан, глауком болон бусад олон харааны бэрхшээлтэй хүмүүст хүртээмжтэй болгохоор аппликейшнийг тохируулдаг.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-тааламжтай профайл';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Илүү төвлөрөл ба бага анхаарал сарниулалт';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Энэ профайл нь ADHD болон мэдрэлийн хөгжлийн эмгэгтэй хүмүүст аппликейшний чухал элементүүдэд илүү хялбараар чиглүүлэх, унших, анхаарлаа төвлөрүүлэхэд туслахын тулд анхаарал сарниулалтыг ихээхэн багасгадаг.';

  @override
  String get the_settings_have_been_reset => 'Тохиргоо дахин тохируулагдсан.';

  @override
  String get toggle_dark_mode => 'Хар горимыг тогглдох';

  @override
  String get toggle_effects_mode => 'Эффектийн горимыг тогглдох';

  @override
  String get toggle_font_weight => 'Фонтын жинг тогглдох';

  @override
  String get toggle_theme_profile => 'Теманы профайлыг тогглдох';

  @override
  String get word_spacing => 'Үгийн зай';
}
