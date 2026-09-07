// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AccessibilityLocalizationsKy extends AccessibilityLocalizations {
  AccessibilityLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get accessibility => 'Жеткиликтүүлүк';

  @override
  String get accessibilitySettings => 'Жеткиликтүүлүк параметрлери';

  @override
  String get adjustBackgroundColors => 'Фон түстөрүн теңдөө';

  @override
  String get adjustTextColors => 'Текст түстөрүн теңдөө';

  @override
  String get alignCenter => 'Борборго түзөө';

  @override
  String get alignLeft => 'Солго түзөө';

  @override
  String get alignRight => 'Оңго түзөө';

  @override
  String get textAlignment => 'Текстти тегиздөө';

  @override
  String get boldText => 'Калың текст';

  @override
  String get changeBoldText => 'Калың текстти өзгөртүү';

  @override
  String get changePagesBackgroundColor =>
      'Беттердин фон түсүн буга өзгөртүү: ';

  @override
  String get changeTextColor => 'Тексттин түсүн буга өзгөртүү: ';

  @override
  String get changeTextColorShade => 'Түстүн тонун буга өзгөртүү: ';

  @override
  String get colorAdjustment => 'Түс жөндөө';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Кадимки',
      'lowSaturation': 'Төмөн каныктырылган',
      'normal': 'Кадимки',
      'highSaturation': 'Жогорку каныктырылган',
      'monochrome': 'Монохром',
      'highContrast': 'Жогорку контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Учурдагы түс профили: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Түс таанылган жок',
      'cF44336': 'Кызыл',
      'cE91E63': 'Кызгылт',
      'c9C27B0': 'Сыя',
      'c673AB7': 'Кочкул сыя',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Көк',
      'c03A9F4': 'Ачык көк',
      'c00BCD4': 'Көгүлтүр',
      'c009688': 'Жашыл-көк',
      'c4CAF50': 'Жашыл',
      'c8BC34A': 'Ачык жашыл',
      'cCDDC39': 'Лайм',
      'cFFEB3B': 'Сары',
      'cFFC107': 'Янтарь',
      'cFF9800': 'Күрөң',
      'cFF5722': 'Кочкул күрөң',
      'c795548': 'Күрөң',
      'c9E9E9E': 'Боз',
      'c607D8B': 'Көк-боз',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Сөз аралыгын азайтуу';

  @override
  String get decrementLetterSpacing => 'Тамга аралыгын азайтуу';

  @override
  String get decrementLineHeight => 'Сап бийиктигин азайтуу';

  @override
  String get decrementTextScaleFactor => 'Текст масштаб факторун азайтуу';

  @override
  String get effects => 'Эффекттер';

  @override
  String get expandText => 'Текстти кеңейтүү';

  @override
  String get fontSize => 'Шрифт өлчөмү';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Сөз аралыгын көбөйтүү же азайтуу';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Тамга аралыгын көбөйтүү же азайтуу';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Сап бийиктигин көбөйтүү же азайтуу';

  @override
  String get increaseOrDecreaseTextSize => 'Текст өлчөмүн көбөйтүү же азайтуу';

  @override
  String get incrementWordSpacing => 'Сөз аралыгын көбөйтүү';

  @override
  String get incrementLetterSpacing => 'Тамга аралыгын көбөйтүү';

  @override
  String get incrementLineHeight => 'Сап бийиктигин көбөйтүү';

  @override
  String get incrementTextScaleFactor => 'Текст масштаб факторун көбөйтүү';

  @override
  String get lessInfo => 'Маалыматты жашыруу';

  @override
  String get letterSpacing => 'Тамга аралыгы';

  @override
  String get lineHeight => 'Сап бийиктиги';

  @override
  String get moreInfo => 'Маалыматты көрсөтүү';

  @override
  String get readLess => 'Азыраак окуу';

  @override
  String get readMore => 'Көбүрөөк окуу';

  @override
  String get reduceEffects => 'Экрандагы эффекттерди азайтуу';

  @override
  String get reduceText => 'Текстти азайтуу';

  @override
  String get restoreSettings => 'Орундарды калыбына келтирүү';

  @override
  String get restoreMainColor => 'Башкы түстү калыбына келтирүү';

  @override
  String get returnToMainColors => 'Башкы түстөргө кайтуу';

  @override
  String get settings => 'Орундар';

  @override
  String get sizeAndTextDisplay => 'Өлчөм жана текст көрсөтүү';

  @override
  String get sliderWordSpacing => 'Сөз аралыгы слайдеры';

  @override
  String get sliderLetterSpacing => 'Тамга аралыгы слайдеры';

  @override
  String get sliderLineHeight => 'Сап бийиктиги слайдеры';

  @override
  String get themeMode => 'Тема режими';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Тема профили таанылган жок',
      'seizureSafe': 'Эпилепсияга ыңгайлуу',
      'visionImpaired': 'Көрүүгө тоскоолдуктуу',
      'adhdFriendly': 'ADHDга ыңгайлуу',
      'none': 'Демейки профиль',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Эпилепсияга ыңгайлуу профиль';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Чагылуучу элементтерди алып салуу жана түстөрдү азайтуу';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Бул профиль эпилепсиясы бар жана талмалардын коркунучунда болгон колдонуучуларга жаркыраган анимациялардан жана коркунучтуу түс айкалыштарынан талмалардын коркунучун четтетүү менен коопсуз барактоого жардам берет.';

  @override
  String get themeProfileVisionImpairedTitle => 'Көрүүгө тоскоолдуктуу профиль';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Тиркеменин көрүнүшүн жакшыртуу';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Бул профиль көз көрүү начар, туннелдик көрүү, катаракта, глаукома жана башка сыяктуу жалпы көрүү жөндөмүнө байланыштуу мүмкүнчүлүктөрү чектелген колдонуучуларга ыңгайлуу болуш үчүн тиркемени ыңгайлаштырат.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHDга ыңгайлуу профиль';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Көбүрөөк көңүл буруучу, азыраак бөлүнүүчүлүк';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Бул профиль көңүл буруу азайтып, АДВГ жана неврологиялык бузулуулары бар адамдарга тиркеменин маанилүү бөлүктөрүнө көңүл топтоп, бир кылка окуп жана багыттоо оңойураак болушуна жардам берет.';

  @override
  String get theSettingsHaveBeenReset =>
      'Орнотуулар баштапкы абалына келтирилди.';

  @override
  String get toggleDarkMode => 'Караңгы режимин которуу';

  @override
  String get toggleEffectsMode => 'Эффекттер режимин которуу';

  @override
  String get toggleFontWeight => 'Шрифт калыңдыгын которуу';

  @override
  String get toggleThemeProfile => 'Тема профилин которуу';

  @override
  String get wordSpacing => 'Сөз аралыгы';

  @override
  String get accessibleFont => 'Жеткиликтүү шрифт';

  @override
  String get accessibleFontSubtitle =>
      'Жакшыраак окулушу үчүн жеткиликтүү шрифтти колдонуңуз';

  @override
  String get accessibleFontEnabled => 'Жеткиликтүү шрифт иштетилди';

  @override
  String get accessibleFontDisabled => 'Жеткиликтүү шрифт өчүрүлдү';

  @override
  String get toggleAccessibleFont => 'Жеткиликтүү шрифтти которуу';

  @override
  String get settingsLoading => 'Жеткиликтүүлүк параметрлери жүктөлүүдө…';

  @override
  String get settingsLoadFailed =>
      'Жеткиликтүүлүк параметрлерин жүктөө мүмкүн болгон жок.';

  @override
  String get retry => 'Кайра аракет кылуу';
}
