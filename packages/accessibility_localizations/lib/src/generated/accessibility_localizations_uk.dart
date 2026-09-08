// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AccessibilityLocalizationsUk extends AccessibilityLocalizations {
  AccessibilityLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get accessibility => 'Доступність';

  @override
  String get accessibilitySettings => 'Налаштування доступності';

  @override
  String get adjustBackgroundColors => 'Налаштувати кольори фону';

  @override
  String get adjustTextColors => 'Налаштувати кольори тексту';

  @override
  String get alignCenter => 'Вирівняти по центру';

  @override
  String get alignLeft => 'Вирівняти ліворуч';

  @override
  String get alignRight => 'Вирівняти праворуч';

  @override
  String get textAlignment => 'Вирівнювання тексту';

  @override
  String get boldText => 'Жирний текст';

  @override
  String get changeBoldText => 'Змінити жирний текст';

  @override
  String get changePagesBackgroundColor => 'Змінити колір фону сторінок на: ';

  @override
  String get changeTextColor => 'Змінити колір тексту на: ';

  @override
  String get changeTextColorShade => 'Змінити відтінок кольору на: ';

  @override
  String get colorAdjustment => 'Налаштування кольору';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормальний',
      'lowSaturation': 'Низька насиченість',
      'normal': 'Нормальний',
      'highSaturation': 'Висока насиченість',
      'monochrome': 'Монохромний',
      'highContrast': 'Високий контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Поточний кольоровий профіль: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Колір не розпізнано',
      'cF44336': 'Червоний',
      'cE91E63': 'Рожевий',
      'c9C27B0': 'Фіолетовий',
      'c673AB7': 'Темно-фіолетовий',
      'c3F51B5': 'Індиго',
      'c2196F3': 'Синій',
      'c03A9F4': 'Світло-синій',
      'c00BCD4': 'Бірюзовий',
      'c009688': 'Синьо-зелений',
      'c4CAF50': 'Зелений',
      'c8BC34A': 'Світло-зелений',
      'cCDDC39': 'Лаймовий',
      'cFFEB3B': 'Жовтий',
      'cFFC107': 'Бурштиновий',
      'cFF9800': 'Помаранчевий',
      'cFF5722': 'Темно-помаранчевий',
      'c795548': 'Коричневий',
      'c9E9E9E': 'Сірий',
      'c607D8B': 'Синьо-сірий',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Зменшити інтервал між словами';

  @override
  String get decrementLetterSpacing => 'Зменшити інтервал між літерами';

  @override
  String get decrementLineHeight => 'Зменшити висоту рядка';

  @override
  String get decrementTextScaleFactor =>
      'Зменшити коефіцієнт масштабування тексту';

  @override
  String get effects => 'Ефекти';

  @override
  String get expandText => 'Розгорнути текст';

  @override
  String get fontSize => 'Розмір шрифту';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Збільшити або зменшити інтервал між словами';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Збільшити або зменшити інтервал між літерами';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Збільшити або зменшити висоту рядка';

  @override
  String get increaseOrDecreaseTextSize =>
      'Збільшити або зменшити розмір тексту';

  @override
  String get incrementWordSpacing => 'Збільшити інтервал між словами';

  @override
  String get incrementLetterSpacing => 'Збільшити інтервал між літерами';

  @override
  String get incrementLineHeight => 'Збільшити висоту рядка';

  @override
  String get incrementTextScaleFactor =>
      'Збільшити коефіцієнт масштабування тексту';

  @override
  String get lessInfo => 'Сховати інформацію';

  @override
  String get letterSpacing => 'Інтервал між літерами';

  @override
  String get lineHeight => 'Висота рядка';

  @override
  String get moreInfo => 'Показати інформацію';

  @override
  String get readLess => 'Читати менше';

  @override
  String get readMore => 'Читати більше';

  @override
  String get reduceEffects => 'Зменшити ефекти екрану';

  @override
  String get reduceText => 'Зменшити текст';

  @override
  String get restoreSettings => 'Відновити налаштування';

  @override
  String get restoreMainColor => 'Відновити основний колір';

  @override
  String get returnToMainColors => 'Повернутися до основних кольорів';

  @override
  String get settings => 'Налаштування';

  @override
  String get sizeAndTextDisplay => 'Розмір та відображення тексту';

  @override
  String get sliderWordSpacing => 'Повзунок інтервалу між словами';

  @override
  String get sliderLetterSpacing => 'Повзунок інтервалу між літерами';

  @override
  String get sliderLineHeight => 'Повзунок висоти рядка';

  @override
  String get themeMode => 'Тема';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Профіль теми не розпізнано',
      'seizureSafe': 'Безпечний для епілепсії',
      'visionImpaired': 'Для людей з порушенням зору',
      'adhdFriendly': 'Дружній до ADHD',
      'none': 'Профіль за замовчуванням',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Профіль безпечний для епілепсії';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Видалити відблиски та зменшити кольори';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Цей профіль дозволяє користувачам з епілепсією та ризиком нападів безпечно переглядати сторінки, усуваючи ризик нападів, що виникають через мерехтливі анімації та ризиковані комбінації кольорів.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Профіль для людей з порушенням зору';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Покращити видимість додатку';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Цей профіль адаптує додаток для доступності більшості порушень зору, таких як погіршення зору, тунельний зір, катаракта, глаукома та інші.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Профіль дружній до ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Більше концентрації та менше відволікань';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Цей профіль значно зменшує відволікання, щоб допомогти людям з ADHD та нейророзвитковими розладами легше орієнтуватися, читати та зосереджуватися на основних елементах додатку.';

  @override
  String get theSettingsHaveBeenReset => 'Налаштування було скинуто.';

  @override
  String get toggleDarkMode => 'Перемкнути темний режим';

  @override
  String get toggleEffectsMode => 'Перемкнути режим ефектів';

  @override
  String get toggleFontWeight => 'Перемкнути товщину шрифту';

  @override
  String get toggleThemeProfile => 'Перемкнути профіль теми';

  @override
  String get wordSpacing => 'Інтервал між словами';

  @override
  String get accessibleFont => 'Доступний шрифт';

  @override
  String get accessibleFontSubtitle =>
      'Використовуйте доступний шрифт для кращої читабельності';

  @override
  String get accessibleFontEnabled => 'Доступний шрифт увімкнено';

  @override
  String get accessibleFontDisabled => 'Доступний шрифт вимкнено';

  @override
  String get toggleAccessibleFont => 'Перемкнути доступний шрифт';

  @override
  String get settingsLoading => 'Завантаження налаштувань доступності…';

  @override
  String get settingsLoadFailed =>
      'Не вдалося завантажити налаштування доступності.';

  @override
  String get retry => 'Повторити спробу';

  @override
  String get themeModeSystem => 'Системна';

  @override
  String get themeModeLight => 'Світла';

  @override
  String get themeModeDark => 'Темна';

  @override
  String get effectsModeSystem => 'Системні';

  @override
  String get effectsModeEnabled => 'Увімкнені';

  @override
  String get effectsModeDisabled => 'Вимкнені';
}
