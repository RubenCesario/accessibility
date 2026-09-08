// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AccessibilityLocalizationsMn extends AccessibilityLocalizations {
  AccessibilityLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get accessibility => 'Хүртээмж';

  @override
  String get accessibilitySettings => 'Хүртээмжийн тохиргоо';

  @override
  String get adjustBackgroundColors => 'Дэвсгэрийн өнгийг тохируулах';

  @override
  String get adjustTextColors => 'Текстийн өнгийг тохируулах';

  @override
  String get alignCenter => 'Төвд зэрэгцүүлэх';

  @override
  String get alignLeft => 'Зүүн талд зэрэгцүүлэх';

  @override
  String get alignRight => 'Баруун талд зэрэгцүүлэх';

  @override
  String get textAlignment => 'Текстийн зэрэгцүүлэлт';

  @override
  String get boldText => 'Тод текст';

  @override
  String get changeBoldText => 'Тод текстийг өөрчлөх';

  @override
  String get changePagesBackgroundColor =>
      'Хуудсуудын дэвсгэрийн өнгийг дараах байдлаар өөрчлөх: ';

  @override
  String get changeTextColor => 'Текстийн өнгийг дараах байдлаар өөрчлөх: ';

  @override
  String get changeTextColorShade =>
      'Өнгийн сүүдэрлэлтийг дараах байдлаар өөрчлөх: ';

  @override
  String get colorAdjustment => 'Өнгийн тохиргоо';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Хэвийн',
      'lowSaturation': 'Бага хангалт',
      'normal': 'Хэвийн',
      'highSaturation': 'Өндөр хангалт',
      'monochrome': 'Монохром',
      'highContrast': 'Өндөр контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Өнөөгийн өнгөний профайл нь: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Үгийн зайг багасгах';

  @override
  String get decrementLetterSpacing => 'Үсгийн зайг багасгах';

  @override
  String get decrementLineHeight => 'Мөрийн өндөрийг багасгах';

  @override
  String get decrementTextScaleFactor => 'Текстийн масштабын факторыг багасгах';

  @override
  String get effects => 'Эффектүүд';

  @override
  String get expandText => 'Текстийг өргөтгөх';

  @override
  String get fontSize => 'Фонтын хэмжээ';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Үгийн зайг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Үсгийн зайг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Мөрийн өндөрийг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get increaseOrDecreaseTextSize =>
      'Текстийн хэмжээг нэмэгдүүлэх эсвэл багасгах';

  @override
  String get incrementWordSpacing => 'Үгийн зайг нэмэгдүүлэх';

  @override
  String get incrementLetterSpacing => 'Үсгийн зайг нэмэгдүүлэх';

  @override
  String get incrementLineHeight => 'Мөрийн өндөрийг нэмэгдүүлэх';

  @override
  String get incrementTextScaleFactor =>
      'Текстийн масштабын факторыг нэмэгдүүлэх';

  @override
  String get lessInfo => 'Мэдээллийг нуух';

  @override
  String get letterSpacing => 'Үсгийн зай';

  @override
  String get lineHeight => 'Мөрийн өндөр';

  @override
  String get moreInfo => 'Мэдээлэл харуулах';

  @override
  String get readLess => 'Бага унших';

  @override
  String get readMore => 'Илүү унших';

  @override
  String get reduceEffects => 'Дэлгэцийн эффектийг багасгах';

  @override
  String get reduceText => 'Текстийг багасгах';

  @override
  String get restoreSettings => 'Тохиргоог сэргээх';

  @override
  String get restoreMainColor => 'Үндсэн өнгийг сэргээх';

  @override
  String get returnToMainColors => 'Үндсэн өнгөнүүд рүү буцах';

  @override
  String get settings => 'Тохиргоо';

  @override
  String get sizeAndTextDisplay => 'Хэмжээ ба текстийн харуулалт';

  @override
  String get sliderWordSpacing => 'Үгийн зайн слайдер';

  @override
  String get sliderLetterSpacing => 'Үсгийн зайн слайдер';

  @override
  String get sliderLineHeight => 'Мөрийн өндрийн слайдер';

  @override
  String get themeMode => 'Тема';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Теманы профайл танигдаагүй',
      'seizureSafe': 'Уналтаас хамгаалсан',
      'visionImpaired': 'Хараа суларсан',
      'adhdFriendly': 'ADHD тааламжтай',
      'none': 'Үндсэн профайл',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Уналтаас хамгаалсан профайл';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Тусгалыг арилгаж өнгийг багасгах';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Энэ профайл нь уналтаас өвчтэй болон уналтын эрсдэлтэй хэрэглэгчдэд гялтганах анимаци болон эрсдэлтэй өнгийн хослолоос үүдэлтэй уналтын эрсдлийг арилгах замаар аюулгүй хэрэглэх боломжийг олгодог.';

  @override
  String get themeProfileVisionImpairedTitle => 'Хараа суларсан профайл';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Аппликейшний харагдахуйцыг сайжруулах';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Энэ профайл нь харааны бэрхшээл, туннелийн хараа, болор цагаан, глауком болон бусад олон харааны бэрхшээлтэй хүмүүст хүртээмжтэй болгохоор аппликейшнийг тохируулдаг.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-тааламжтай профайл';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Илүү төвлөрөл ба бага анхаарал сарниулалт';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Энэ профайл нь ADHD болон мэдрэлийн хөгжлийн эмгэгтэй хүмүүст аппликейшний чухал элементүүдэд илүү хялбараар чиглүүлэх, унших, анхаарлаа төвлөрүүлэхэд туслахын тулд анхаарал сарниулалтыг ихээхэн багасгадаг.';

  @override
  String get theSettingsHaveBeenReset => 'Тохиргоо дахин тохируулагдсан.';

  @override
  String get toggleDarkMode => 'Хар горимыг тогглдох';

  @override
  String get toggleEffectsMode => 'Эффектийн горимыг тогглдох';

  @override
  String get toggleFontWeight => 'Фонтын жинг тогглдох';

  @override
  String get toggleThemeProfile => 'Теманы профайлыг тогглдох';

  @override
  String get wordSpacing => 'Үгийн зай';

  @override
  String get accessibleFont => 'Хүртээмжтэй фонт';

  @override
  String get accessibleFontSubtitle =>
      'Илүү сайн уншихад хялбар фонт ашиглана уу';

  @override
  String get accessibleFontEnabled => 'Хүртээмжтэй фонт идэвхтэй';

  @override
  String get accessibleFontDisabled => 'Хүртээмжтэй фонт идэвхгүй';

  @override
  String get toggleAccessibleFont => 'Хүртээмжтэй фонтыг тогглдох';

  @override
  String get settingsLoading => 'Хүртээмжийн тохиргоог ачаалж байна…';

  @override
  String get settingsLoadFailed => 'Хүртээмжийн тохиргоог ачаалж чадсангүй.';

  @override
  String get retry => 'Дахин оролдох';

  @override
  String get themeModeSystem => 'Систем';

  @override
  String get themeModeLight => 'Цайвар';

  @override
  String get themeModeDark => 'Хар';

  @override
  String get effectsModeSystem => 'Систем';

  @override
  String get effectsModeEnabled => 'Асаалттай';

  @override
  String get effectsModeDisabled => 'Унтраалттай';
}
