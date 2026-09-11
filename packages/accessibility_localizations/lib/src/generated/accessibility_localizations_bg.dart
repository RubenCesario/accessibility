// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AccessibilityLocalizationsBg extends AccessibilityLocalizations {
  AccessibilityLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get accessibility => 'Достъпност';

  @override
  String get accessibilitySettings => 'Настройки за достъпност';

  @override
  String get adjustBackgroundColors => 'Настройване на фоновите цветове';

  @override
  String get adjustTextColors => 'Настройване на цветовете на текста';

  @override
  String get alignCenter => 'Центриране';

  @override
  String get alignLeft => 'Подравняване вляво';

  @override
  String get alignRight => 'Подравняване вдясно';

  @override
  String get textAlignment => 'Подравняване на текста';

  @override
  String get boldText => 'Удебелен текст';

  @override
  String get changeBoldText => 'Промяна на удебелен текст';

  @override
  String get changePagesBackgroundColor =>
      'Промяна на фоновия цвят на страниците на: ';

  @override
  String get changeTextColor => 'Промяна на цвета на текста на: ';

  @override
  String get changeTextColorShade => 'Промяна на нюанса на цвета на: ';

  @override
  String get colorAdjustment => 'Настройка на цветовете';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормален',
      'lowSaturation': 'Ниска наситеност',
      'normal': 'Нормален',
      'highSaturation': 'Висока наситеност',
      'monochrome': 'Монохромен',
      'highContrast': 'Висок контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Текущият цветови профил е: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Цветът не е разпознат',
      'cF44336': 'Червен',
      'cE91E63': 'Розов',
      'c9C27B0': 'Лилав',
      'c673AB7': 'Тъмнолилав',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Син',
      'c03A9F4': 'Светлосин',
      'c00BCD4': 'Циан',
      'c009688': 'Тъмнозелен',
      'c4CAF50': 'Зелен',
      'c8BC34A': 'Светлозелен',
      'cCDDC39': 'Лайм',
      'cFFEB3B': 'Жълт',
      'cFFC107': 'Кехлибарен',
      'cFF9800': 'Оранжев',
      'cFF5722': 'Тъмнооранжев',
      'c795548': 'Кафяв',
      'c9E9E9E': 'Сив',
      'c607D8B': 'Синьо-сив',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Намаляване на разстоянието между думите';

  @override
  String get decrementLetterSpacing =>
      'Намаляване на разстоянието между буквите';

  @override
  String get decrementLineHeight => 'Намаляване на височината на реда';

  @override
  String get decrementTextScaleFactor => 'Намаляване на размера на текста';

  @override
  String get effects => 'Ефекти';

  @override
  String get expandText => 'Разширяване на текста';

  @override
  String get fontSize => 'Размер на шрифта';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Увеличаване или намаляване на разстоянието между думите';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Увеличаване или намаляване на разстоянието между буквите';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Увеличаване или намаляване на височината на реда';

  @override
  String get increaseOrDecreaseTextSize =>
      'Увеличаване или намаляване на размера на текста';

  @override
  String get incrementWordSpacing => 'Увеличаване на разстоянието между думите';

  @override
  String get incrementLetterSpacing =>
      'Увеличаване на разстоянието между буквите';

  @override
  String get incrementLineHeight => 'Увеличаване на височината на реда';

  @override
  String get incrementTextScaleFactor => 'Увеличаване на размера на текста';

  @override
  String get lessInfo => 'Скрий информацията';

  @override
  String get letterSpacing => 'Разстояние между буквите';

  @override
  String get lineHeight => 'Височина на реда';

  @override
  String get moreInfo => 'Покажи информацията';

  @override
  String get readLess => 'Прочети по-малко';

  @override
  String get readMore => 'Прочети повече';

  @override
  String get reduceEffects => 'Намали ефектите на екрана';

  @override
  String get reduceText => 'Намали текста';

  @override
  String get restoreSettings => 'Възстанови настройките';

  @override
  String get restoreMainColor => 'Възстанови основния цвят';

  @override
  String get returnToMainColors => 'Върни се към основните цветове';

  @override
  String get settings => 'Настройки';

  @override
  String get sizeAndTextDisplay => 'Размер и показване на текста';

  @override
  String get sliderWordSpacing => 'Плъзгач за разстояние между думите';

  @override
  String get sliderLetterSpacing => 'Плъзгач за разстояние между буквите';

  @override
  String get sliderLineHeight => 'Плъзгач за височина на реда';

  @override
  String get themeMode => 'Тема';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Темата не е разпозната',
      'seizureSafe': 'Безопасна при епилепсия',
      'visionImpaired': 'За хора с нарушено зрение',
      'adhdFriendly': 'Подходяща за ADHD',
      'none': 'Профил по подразбиране',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Профил безопасен при епилепсия';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Премахни отблясъците и намали цветовете';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Този профил позволява на хора с епилепсия или риск от пристъпи да използват приложението безопасно, като премахва опасни анимации и цветови комбинации.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Профил за хора с нарушено зрение';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Подобри видимостта на приложението';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Този профил прави приложението достъпно за хора с различни зрителни увреждания като тунелно зрение, катаракта, глаукома и други.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Профил подходящ за ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Повече концентрация, по-малко разсейване';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Този профил значително намалява разсейването, за да помогне на хора с ADHD и невроразвитийни затруднения да се ориентират, четат и фокусират върху важните елементи на приложението.';

  @override
  String get theSettingsHaveBeenReset =>
      'Настройките бяха върнати в начално състояние.';

  @override
  String get toggleDarkMode => 'Превключи тъмен режим';

  @override
  String get toggleEffectsMode => 'Превключи ефекти';

  @override
  String get toggleFontWeight => 'Превключи дебелина на шрифта';

  @override
  String get toggleThemeProfile => 'Превключи профил на тема';

  @override
  String get wordSpacing => 'Разстояние между думите';

  @override
  String get accessibleFont => 'Достъпен шрифт';

  @override
  String get accessibleFontSubtitle =>
      'Използвайте достъпен шрифт за по-добра четимост';

  @override
  String get accessibleFontEnabled => 'Достъпен шрифт включен';

  @override
  String get accessibleFontDisabled => 'Достъпен шрифт изключен';

  @override
  String get toggleAccessibleFont => 'Превключи достъпен шрифт';

  @override
  String get settingsLoading => 'Зареждане на настройките за достъпност…';

  @override
  String get settingsLoadFailed =>
      'Настройките за достъпност не можаха да бъдат заредени.';

  @override
  String get retry => 'Опитай отново';

  @override
  String get themeModeSystem => 'Системна';

  @override
  String get themeModeLight => 'Светла';

  @override
  String get themeModeDark => 'Тъмна';

  @override
  String get effectsModeSystem => 'Системни';

  @override
  String get effectsModeEnabled => 'Включени';

  @override
  String get effectsModeDisabled => 'Изключени';
}
