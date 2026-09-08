// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AccessibilityLocalizationsBe extends AccessibilityLocalizations {
  AccessibilityLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get accessibility => 'Доступнасць';

  @override
  String get accessibilitySettings => 'Налады доступнасці';

  @override
  String get adjustBackgroundColors => 'Падвышэнне фонавых колераў';

  @override
  String get adjustTextColors => 'Падвышэнне колераў тэксту';

  @override
  String get alignCenter => 'Выраўнаваць па цэнтры';

  @override
  String get alignLeft => 'Выраўнаваць па левым краі';

  @override
  String get alignRight => 'Выраўнаваць па правым краі';

  @override
  String get textAlignment => 'Выраўноўванне тэксту';

  @override
  String get boldText => 'Тоўсты тэкст';

  @override
  String get changeBoldText => 'Змяніць тоўсты тэкст';

  @override
  String get changePagesBackgroundColor => 'Змяніць колер фону старонак на: ';

  @override
  String get changeTextColor => 'Змяніць колер тэксту на: ';

  @override
  String get changeTextColorShade => 'Змяніць адценне колеру на: ';

  @override
  String get colorAdjustment => 'Карэкцыя колеру';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Звычайны',
      'lowSaturation': 'Нізкая насычанасць',
      'normal': 'Звычайны',
      'highSaturation': 'Высокая насычанасць',
      'monochrome': 'Манаграма',
      'highContrast': 'Высокі кантраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Цяперашні профіль колеру: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Колер не распазнаны',
      'cF44336': 'Чырвоны',
      'cE91E63': 'Ружовы',
      'c9C27B0': 'Фіялетавы',
      'c673AB7': 'Цёмна-фіялетавы',
      'c3F51B5': 'Індыга',
      'c2196F3': 'Сіні',
      'c03A9F4': 'Светла-сіні',
      'c00BCD4': 'Блакітны',
      'c009688': 'Цёмна-зялёны',
      'c4CAF50': 'Зялёны',
      'c8BC34A': 'Светла-зялёны',
      'cCDDC39': 'Лайм',
      'cFFEB3B': 'Жоўты',
      'cFFC107': 'Бурштынавы',
      'cFF9800': 'Аранжавы',
      'cFF5722': 'Цёмна-аранджавы',
      'c795548': 'Карычневы',
      'c9E9E9E': 'Шэры',
      'c607D8B': 'Сіне-шэры',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Зменшыць інтэрвал паміж словамі';

  @override
  String get decrementLetterSpacing => 'Зменшыць інтэрвал паміж літарамі';

  @override
  String get decrementLineHeight => 'Зменшыць вышыню радка';

  @override
  String get decrementTextScaleFactor => 'Зменшыць памер тэксту';

  @override
  String get effects => 'Візуальныя эфекты';

  @override
  String get expandText => 'Разгарнуць тэкст';

  @override
  String get fontSize => 'Памер шрыфта';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Павялічыць або зменшыць інтэрвал паміж словамі';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Павялічыць або зменшыць інтэрвал паміж літарамі';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Павялічыць або зменшыць вышыню радка';

  @override
  String get increaseOrDecreaseTextSize =>
      'Павялічыць або зменшыць памер тэксту';

  @override
  String get incrementWordSpacing => 'Павялічыць інтэрвал паміж словамі';

  @override
  String get incrementLetterSpacing => 'Павялічыць інтэрвал паміж літарамі';

  @override
  String get incrementLineHeight => 'Павялічыць вышыню радка';

  @override
  String get incrementTextScaleFactor => 'Павялічыць памер тэксту';

  @override
  String get lessInfo => 'Схаваць інфармацыю';

  @override
  String get letterSpacing => 'Інтэрвал паміж літарамі';

  @override
  String get lineHeight => 'Вышыня радка';

  @override
  String get moreInfo => 'Паказаць інфармацыю';

  @override
  String get readLess => 'Чытаць менш';

  @override
  String get readMore => 'Чытаць больш';

  @override
  String get reduceEffects => 'Зменшыць эфекты на экране';

  @override
  String get reduceText => 'Скараціць тэкст';

  @override
  String get restoreSettings => 'Аднавіць налады';

  @override
  String get restoreMainColor => 'Аднавіць асноўны колер';

  @override
  String get returnToMainColors => 'Вярнуцца да асноўных колераў';

  @override
  String get settings => 'Налады';

  @override
  String get sizeAndTextDisplay => 'Памер і адлюстраванне тэксту';

  @override
  String get sliderWordSpacing => 'Паўзунок інтэрвалу паміж словамі';

  @override
  String get sliderLetterSpacing => 'Паўзунок інтэрвалу паміж літарамі';

  @override
  String get sliderLineHeight => 'Паўзунок вышыні радка';

  @override
  String get themeMode => 'Тэма';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Профіль тэмы не распазнаны',
      'seizureSafe': 'Бяспечная пры эпілепсіі',
      'visionImpaired': 'Для людзей з парушэннямі зроку',
      'adhdFriendly': 'Падыходзіць для ADHD',
      'none': 'Прафіль па змаўчанні',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Профіль бяспечны пры эпілепсіі';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Прыбярыце адбіткі і паменшыце колер';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Гэты профіль дазваляе людзям з эпілепсіяй або рызыкай прыступаў бяспечна карыстацца дадаткам, выдаляючы небяспечныя анімацыі і каляровыя спалучэнні.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Профіль для людзей з парушэннямі зроку';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Паляпшэнне бачнасці прыкладання';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Гэты профіль робіць дадатак даступным для людзей з рознымі парушэннямі зроку, такімі як тунэльнае зрок, катаракта, глаўкома і інш.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Профіль, прыдатны для ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Больш канцэнтрацыі, менш адцягнення';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Гэты профіль значна памяншае адцягненне, каб дапамагчы людзям з ADHD і неўраразвіццёвымі парушэннямі лягчэй арыентавацца, чытаць і канцэнтравацца на галоўных элементах прыкладання.';

  @override
  String get theSettingsHaveBeenReset => 'Налады былі скінуты.';

  @override
  String get toggleDarkMode => 'Пераключыць цёмны рэжым';

  @override
  String get toggleEffectsMode => 'Пераключыць эфекты';

  @override
  String get toggleFontWeight => 'Пераключыць таўшчыню шрыфта';

  @override
  String get toggleThemeProfile => 'Пераключыць профіль тэмы';

  @override
  String get wordSpacing => 'Інтэрвал паміж словамі';

  @override
  String get accessibleFont => 'Даступны шрыфт';

  @override
  String get accessibleFontSubtitle =>
      'Выкарыстоўвайце даступны шрыфт для лепшай чытальнасці';

  @override
  String get accessibleFontEnabled => 'Даступны шрыфт уключаны';

  @override
  String get accessibleFontDisabled => 'Даступны шрыфт выключаны';

  @override
  String get toggleAccessibleFont => 'Пераключыць даступны шрыфт';

  @override
  String get settingsLoading => 'Ідзе загрузка налад доступнасці…';

  @override
  String get settingsLoadFailed => 'Не ўдалося загрузіць налады доступнасці.';

  @override
  String get retry => 'Паўтарыць спробу';

  @override
  String get themeModeSystem => 'Сістэма';

  @override
  String get themeModeLight => 'Светлы';

  @override
  String get themeModeDark => 'Цёмны';

  @override
  String get effectsModeSystem => 'Сістэма';

  @override
  String get effectsModeEnabled => 'Уключана';

  @override
  String get effectsModeDisabled => 'Выключана';
}
