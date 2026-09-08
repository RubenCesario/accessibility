// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AccessibilityLocalizationsRu extends AccessibilityLocalizations {
  AccessibilityLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get accessibility => 'Доступность';

  @override
  String get accessibilitySettings => 'Настройки доступности';

  @override
  String get adjustBackgroundColors => 'Настроить цвета фона';

  @override
  String get adjustTextColors => 'Настроить цвета текста';

  @override
  String get alignCenter => 'Выровнять по центру';

  @override
  String get alignLeft => 'Выровнять по левому краю';

  @override
  String get alignRight => 'Выровнять по правому краю';

  @override
  String get textAlignment => 'Выравнивание текста';

  @override
  String get boldText => 'Жирный текст';

  @override
  String get changeBoldText => 'Изменить жирный текст';

  @override
  String get changePagesBackgroundColor => 'Изменить цвет фона страниц на: ';

  @override
  String get changeTextColor => 'Изменить цвет текста на: ';

  @override
  String get changeTextColorShade => 'Изменить оттенок цвета на: ';

  @override
  String get colorAdjustment => 'Настройка цвета';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Нормальный',
      'lowSaturation': 'Низкая насыщенность',
      'normal': 'Нормальный',
      'highSaturation': 'Высокая насыщенность',
      'monochrome': 'Монохромный',
      'highContrast': 'Высокий контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Текущий профиль цвета: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Цвет не распознан',
      'cF44336': 'Красный',
      'cE91E63': 'Розовый',
      'c9C27B0': 'Фиолетовый',
      'c673AB7': 'Тёмно-фиолетовый',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Синий',
      'c03A9F4': 'Светло-синий',
      'c00BCD4': 'Голубой',
      'c009688': 'Бирюзовый',
      'c4CAF50': 'Зелёный',
      'c8BC34A': 'Светло-зелёный',
      'cCDDC39': 'Лайм',
      'cFFEB3B': 'Жёлтый',
      'cFFC107': 'Янтарный',
      'cFF9800': 'Оранжевый',
      'cFF5722': 'Тёмно-оранжевый',
      'c795548': 'Коричневый',
      'c9E9E9E': 'Серый',
      'c607D8B': 'Сине-серый',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Уменьшить интервал между словами';

  @override
  String get decrementLetterSpacing => 'Уменьшить интервал между буквами';

  @override
  String get decrementLineHeight => 'Уменьшить высоту строки';

  @override
  String get decrementTextScaleFactor =>
      'Уменьшить коэффициент масштабирования текста';

  @override
  String get effects => 'Эффекты';

  @override
  String get expandText => 'Развернуть текст';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Увеличить или уменьшить интервал между словами';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Увеличить или уменьшить интервал между буквами';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Увеличить или уменьшить высоту строки';

  @override
  String get increaseOrDecreaseTextSize =>
      'Увеличить или уменьшить размер текста';

  @override
  String get incrementWordSpacing => 'Увеличить интервал между словами';

  @override
  String get incrementLetterSpacing => 'Увеличить интервал между буквами';

  @override
  String get incrementLineHeight => 'Увеличить высоту строки';

  @override
  String get incrementTextScaleFactor =>
      'Увеличить коэффициент масштабирования текста';

  @override
  String get lessInfo => 'Скрыть информацию';

  @override
  String get letterSpacing => 'Интервал между буквами';

  @override
  String get lineHeight => 'Высота строки';

  @override
  String get moreInfo => 'Показать информацию';

  @override
  String get readLess => 'Читать меньше';

  @override
  String get readMore => 'Читать больше';

  @override
  String get reduceEffects => 'Уменьшить эффекты на экране';

  @override
  String get reduceText => 'Свернуть текст';

  @override
  String get restoreSettings => 'Восстановить настройки';

  @override
  String get restoreMainColor => 'Восстановить основной цвет';

  @override
  String get returnToMainColors => 'Вернуться к основным цветам';

  @override
  String get settings => 'Настройки';

  @override
  String get sizeAndTextDisplay => 'Размер и отображение текста';

  @override
  String get sliderWordSpacing => 'Ползунок интервала между словами';

  @override
  String get sliderLetterSpacing => 'Ползунок интервала между буквами';

  @override
  String get sliderLineHeight => 'Ползунок высоты строки';

  @override
  String get themeMode => 'Тема';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Профиль темы не распознан',
      'seizureSafe': 'Безопасный для эпилептиков',
      'visionImpaired': 'Для слабовидящих',
      'adhdFriendly': 'Для людей с СДВГ',
      'none': 'Профиль по умолчанию',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'Безопасный профиль для эпилептиков';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Убрать отражения и уменьшить цвет';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Этот профиль позволяет пользователям с эпилепсией и риском приступов безопасно пользоваться приложением, устраняя риск приступов, вызванных мерцающими анимациями и опасными цветовыми комбинациями.';

  @override
  String get themeProfileVisionImpairedTitle => 'Профиль для слабовидящих';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Улучшить видимость приложения';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Этот профиль адаптирует приложение для доступности большинству людей с нарушениями зрения, такими как слабовидение, туннельное зрение, катаракта, глаукома и другие.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Профиль для людей с СДВГ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Больше концентрации и меньше отвлечений';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Этот профиль значительно уменьшает отвлекающие факторы, чтобы помочь людям с СДВГ и нейроразвитийными расстройствами легче ориентироваться, читать и сосредоточиться на важных элементах приложения.';

  @override
  String get theSettingsHaveBeenReset => 'Настройки были сброшены.';

  @override
  String get toggleDarkMode => 'Переключить тёмный режим';

  @override
  String get toggleEffectsMode => 'Переключить режим эффектов';

  @override
  String get toggleFontWeight => 'Переключить толщину шрифта';

  @override
  String get toggleThemeProfile => 'Переключить профиль темы';

  @override
  String get wordSpacing => 'Интервал между словами';

  @override
  String get accessibleFont => 'Доступный шрифт';

  @override
  String get accessibleFontSubtitle =>
      'Используйте доступный шрифт для лучшей читаемости';

  @override
  String get accessibleFontEnabled => 'Доступный шрифт включён';

  @override
  String get accessibleFontDisabled => 'Доступный шрифт отключён';

  @override
  String get toggleAccessibleFont => 'Переключить доступный шрифт';

  @override
  String get settingsLoading => 'Загрузка настроек доступности…';

  @override
  String get settingsLoadFailed =>
      'Не удалось загрузить настройки доступности.';

  @override
  String get retry => 'Повторить попытку';
}
