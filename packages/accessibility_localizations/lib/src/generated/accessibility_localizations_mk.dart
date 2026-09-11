// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AccessibilityLocalizationsMk extends AccessibilityLocalizations {
  AccessibilityLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get accessibility => 'Пристапност';

  @override
  String get accessibilitySettings => 'Поставки за пристапност';

  @override
  String get adjustBackgroundColors => 'Прилагоди бои на позадината';

  @override
  String get adjustTextColors => 'Прилагоди бои на текстот';

  @override
  String get alignCenter => 'Порамни во средина';

  @override
  String get alignLeft => 'Порамни лево';

  @override
  String get alignRight => 'Порамни десно';

  @override
  String get textAlignment => 'Порамнување на текст';

  @override
  String get boldText => 'Задебелен текст';

  @override
  String get changeBoldText => 'Промени задебеленост на текст';

  @override
  String get changePagesBackgroundColor =>
      'Промени ја бојата на позадината на страниците во: ';

  @override
  String get changeTextColor => 'Промени ја бојата на текстот во: ';

  @override
  String get changeTextColorShade => 'Промени ја нијансата на бојата во: ';

  @override
  String get colorAdjustment => 'Прилагодување на бои';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормално',
      'lowSaturation': 'Ниска заситеност',
      'normal': 'Нормално',
      'highSaturation': 'Висока заситеност',
      'monochrome': 'Монохроматско',
      'highContrast': 'Висок контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Тековниот профил на бои е: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Бојата не е препознаена',
      'cF44336': 'Црвена',
      'cE91E63': 'Розова',
      'c9C27B0': 'Виолетова',
      'c673AB7': 'Темно виолетова',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Сина',
      'c03A9F4': 'Светло сина',
      'c00BCD4': 'Тиркизна',
      'c009688': 'Теал',
      'c4CAF50': 'Зелена',
      'c8BC34A': 'Светло зелена',
      'cCDDC39': 'Лимета',
      'cFFEB3B': 'Жолта',
      'cFFC107': 'Ќилибарна',
      'cFF9800': 'Портокалова',
      'cFF5722': 'Темно портокалова',
      'c795548': 'Кафеава',
      'c9E9E9E': 'Сива',
      'c607D8B': 'Сино-сива',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Намали растојание помеѓу зборови';

  @override
  String get decrementLetterSpacing => 'Намали растојание помеѓу букви';

  @override
  String get decrementLineHeight => 'Намали висина на линија';

  @override
  String get decrementTextScaleFactor =>
      'Намали фактор на зголемување на текст';

  @override
  String get effects => 'Ефекти';

  @override
  String get expandText => 'Прошири текст';

  @override
  String get fontSize => 'Големина на фонт';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Зголеми или намали растојание помеѓу зборови';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Зголеми или намали растојание помеѓу букви';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Зголеми или намали висина на линија';

  @override
  String get increaseOrDecreaseTextSize =>
      'Зголеми или намали големина на текст';

  @override
  String get incrementWordSpacing => 'Зголеми растојание помеѓу зборови';

  @override
  String get incrementLetterSpacing => 'Зголеми растојание помеѓу букви';

  @override
  String get incrementLineHeight => 'Зголеми висина на линија';

  @override
  String get incrementTextScaleFactor =>
      'Зголеми фактор на зголемување на текст';

  @override
  String get lessInfo => 'Скриј информации';

  @override
  String get letterSpacing => 'Растојание помеѓу букви';

  @override
  String get lineHeight => 'Висина на линија';

  @override
  String get moreInfo => 'Покажи информации';

  @override
  String get readLess => 'Читај помалку';

  @override
  String get readMore => 'Читај повеќе';

  @override
  String get reduceEffects => 'Намали ефекти на екранот';

  @override
  String get reduceText => 'Намали текст';

  @override
  String get restoreSettings => 'Врати поставки';

  @override
  String get restoreMainColor => 'Врати ја главната боја';

  @override
  String get returnToMainColors => 'Врати се на главните бои';

  @override
  String get settings => 'Поставки';

  @override
  String get sizeAndTextDisplay => 'Големина и приказ на текст';

  @override
  String get sliderWordSpacing => 'Лизгач за растојание помеѓу зборови';

  @override
  String get sliderLetterSpacing => 'Лизгач за растојание помеѓу букви';

  @override
  String get sliderLineHeight => 'Лизгач за висина на линија';

  @override
  String get themeMode => 'Тема';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Профилот на тема не е препознаен',
      'seizureSafe': 'Безбеден за напади',
      'visionImpaired': 'Прилагоден за лица со слаб вид',
      'adhdFriendly': 'Пријателски за АДХД',
      'none': 'Стандарден профил',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Безбеден профил за напади';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Отстрани одблесоци и намали бои';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Овој профил им овозможува на корисниците кои имаат епилепсија и се изложени на ризик од напади да прелистуваат безбедно со елиминирање на ризикот од напади предизвикани од трепкави анимации и ризични комбинации на бои.';

  @override
  String get themeProfileVisionImpairedTitle => 'Профил за лица со оштетен вид';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Подобри видливост на апликацијата';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Овој профил ја прилагодува апликацијата да биде достапна за повеќето визуелни оштетувања, како што се оштетен вид, тунелски вид, катаракта, глауком и друго.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Профил пријателски за АДХД';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Поголема концентрација и помалку одвлекувања';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Овој профил значително ги намалува одвлекувањата, за да им помогне на луѓето со АДХД и невроразвојни нарушувања да навигираат, читаат и се фокусираат на суштинските елементи на апликацијата полесно.';

  @override
  String get theSettingsHaveBeenReset => 'Поставките се ресетирани.';

  @override
  String get toggleDarkMode => 'Вклучи/исклучи темен режим';

  @override
  String get toggleEffectsMode => 'Вклучи/исклучи режим на ефекти';

  @override
  String get toggleFontWeight => 'Вклучи/исклучи дебелина на фонт';

  @override
  String get toggleThemeProfile => 'Вклучи/исклучи профил на тема';

  @override
  String get wordSpacing => 'Растојание помеѓу зборови';

  @override
  String get accessibleFont => 'Пристапен фонт';

  @override
  String get accessibleFontSubtitle =>
      'Користете пристапен фонт за подобра читливост';

  @override
  String get accessibleFontEnabled => 'Пристапен фонт вклучен';

  @override
  String get accessibleFontDisabled => 'Пристапен фонт исклучен';

  @override
  String get toggleAccessibleFont => 'Вклучи/исклучи пристапен фонт';

  @override
  String get settingsLoading => 'Се вчитуваат поставките за пристапност…';

  @override
  String get settingsLoadFailed =>
      'Поставките за пристапност не можеа да се вчитаат.';

  @override
  String get retry => 'Обиди се повторно';

  @override
  String get themeModeSystem => 'Системска';

  @override
  String get themeModeLight => 'Светла';

  @override
  String get themeModeDark => 'Темна';

  @override
  String get effectsModeSystem => 'Системски';

  @override
  String get effectsModeEnabled => 'Вклучени';

  @override
  String get effectsModeDisabled => 'Исклучени';
}
