// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AccessibilityLocalizationsKk extends AccessibilityLocalizations {
  AccessibilityLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get accessibility => 'Қолжетімділік';

  @override
  String get accessibilitySettings => 'Қолжетімділік параметрлері';

  @override
  String get adjustBackgroundColors => 'Фон түстерін реттеу';

  @override
  String get adjustTextColors => 'Мәтін түстерін реттеу';

  @override
  String get alignCenter => 'Ортаға туралау';

  @override
  String get alignLeft => 'Солға туралау';

  @override
  String get alignRight => 'Оңға туралау';

  @override
  String get textAlignment => 'Мәтінді туралау';

  @override
  String get boldText => 'Қалың мәтін';

  @override
  String get changeBoldText => 'Қалың мәтінді өзгерту';

  @override
  String get changePagesBackgroundColor =>
      'Беттердің фон түсін келесіге өзгерту: ';

  @override
  String get changeTextColor => 'Мәтіннің түсін келесіге өзгерту: ';

  @override
  String get changeTextColorShade => 'Түстің реңкін келесіге өзгерту: ';

  @override
  String get colorAdjustment => 'Түс реттеу';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Қалыпты',
      'lowSaturation': 'Төмен қанықтылық',
      'normal': 'Қалыпты',
      'highSaturation': 'Жоғары қанықтылық',
      'monochrome': 'Монохромды',
      'highContrast': 'Жоғары контраст',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Ағымдағы түс профилі: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Түс танылмады',
      'cF44336': 'Қызыл',
      'cE91E63': 'Қызғылт',
      'c9C27B0': 'Қызыл көк',
      'c673AB7': 'Қоңыр қызыл көк',
      'c3F51B5': 'Индиго',
      'c2196F3': 'Көк',
      'c03A9F4': 'Ашық көк',
      'c00BCD4': 'Көгілдір',
      'c009688': 'Жасыл-көк',
      'c4CAF50': 'Жасыл',
      'c8BC34A': 'Ашық жасыл',
      'cCDDC39': 'Әк',
      'cFFEB3B': 'Сары',
      'cFFC107': 'Қызғылт сары',
      'cFF9800': 'Қызғылт-сары',
      'cFF5722': 'Қоңыр қызғылт-сары',
      'c795548': 'Қоңыр',
      'c9E9E9E': 'Сұр',
      'c607D8B': 'Көк сұр',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Сөздер арасындағы арақашықтықты азайту';

  @override
  String get decrementLetterSpacing =>
      'Әріптер арасындағы арақашықтықты азайту';

  @override
  String get decrementLineHeight => 'Жол биіктігін азайту';

  @override
  String get decrementTextScaleFactor => 'Мәтін масштабы факторын азайту';

  @override
  String get effects => 'Эффекттер';

  @override
  String get expandText => 'Мәтінді ұлғайту';

  @override
  String get fontSize => 'Қаріп өлшемі';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Сөздер арасындағы арақашықтықты ұлғайту немесе азайту';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Әріптер арасындағы арақашықтықты ұлғайту немесе азайту';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Жол биіктігін ұлғайту немесе азайту';

  @override
  String get increaseOrDecreaseTextSize =>
      'Мәтін өлшемін ұлғайту немесе азайту';

  @override
  String get incrementWordSpacing => 'Сөздер арасындағы арақашықтықты ұлғайту';

  @override
  String get incrementLetterSpacing =>
      'Әріптер арасындағы арақашықтықты ұлғайту';

  @override
  String get incrementLineHeight => 'Жол биіктігін ұлғайту';

  @override
  String get incrementTextScaleFactor => 'Мәтін масштабы факторын ұлғайту';

  @override
  String get lessInfo => 'Ақпаратты жасыру';

  @override
  String get letterSpacing => 'Әріптер арасындағы арақашықтық';

  @override
  String get lineHeight => 'Жол биіктігі';

  @override
  String get moreInfo => 'Ақпаратты көрсету';

  @override
  String get readLess => 'Азырақ оқу';

  @override
  String get readMore => 'Көбірек оқу';

  @override
  String get reduceEffects => 'Экран эффекттерін азайту';

  @override
  String get reduceText => 'Мәтінді азайту';

  @override
  String get restoreSettings => 'Параметрлерді қалпына келтіру';

  @override
  String get restoreMainColor => 'Негізгі түсті қалпына келтіру';

  @override
  String get returnToMainColors => 'Негізгі түстерге оралу';

  @override
  String get settings => 'Параметрлер';

  @override
  String get sizeAndTextDisplay => 'Өлшем және мәтін көрсетілімі';

  @override
  String get sliderWordSpacing =>
      'Сөздер арасындағы арақашықтықтың жылжымалы бақылауы';

  @override
  String get sliderLetterSpacing =>
      'Әріптер арасындағы арақашықтықтың жылжымалы бақылауы';

  @override
  String get sliderLineHeight => 'Жол биіктігінің жылжымалы бақылауы';

  @override
  String get themeMode => 'Тақырып';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Тақырып профилі танылмады',
      'seizureSafe': 'Талмаудан қауіпсіз',
      'visionImpaired': 'Көру қабілеті нашар',
      'adhdFriendly': 'ADHD үшін қолайлы',
      'none': 'Әдепкі профиль',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Талмаудан қауіпсіз профиль';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Шағылысуларды жою және түстерді азайту';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Бұл профиль эпилепсия және талмау қаупі бар пайдаланушыларға жылтылдаған анимациялар мен қауіпті түс комбинацияларынан туындайтын талмау қаупін жою арқылы қауіпсіз шолуға мүмкіндік береді.';

  @override
  String get themeProfileVisionImpairedTitle => 'Көру қабілеті нашар профилі';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Қосымшаның көрінісін жақсарту';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Бұл профиль қосымшаны көру қабілеті нашар, туннельдік көру, катаракта, глаукома және басқа да көз зақымдануын азайтады.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-достық профилі';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Көбірек шоғырлану және аз алаңдату';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Бұл профиль алаңдатуды айтарлықтай азайтып, ADHD және нейродаму бұзылыстары бар адамдарға қосымшаның негізгі элементтерін оңай шарлауға, оқуға және назар салуға көмектеседі.';

  @override
  String get theSettingsHaveBeenReset => 'Параметрлер қалпына келтірілді.';

  @override
  String get toggleDarkMode => 'Қараңғы режимді қосу/өшіру';

  @override
  String get toggleEffectsMode => 'Эффекттер режимін қосу/өшіру';

  @override
  String get toggleFontWeight => 'Қаріп қалыңдығын қосу/өшіру';

  @override
  String get toggleThemeProfile => 'Тақырып профилін қосу/өшіру';

  @override
  String get wordSpacing => 'Сөздер арасындағы арақашықтық';

  @override
  String get accessibleFont => 'Қол жетімді қаріп';

  @override
  String get accessibleFontSubtitle =>
      'Жақсырақ оқылу үшін қолжетімді қаріпті пайдаланыңыз';

  @override
  String get accessibleFontEnabled => 'Қол жетімді қаріп қосулы';

  @override
  String get accessibleFontDisabled => 'Қол жетімді қаріп өшірулі';

  @override
  String get toggleAccessibleFont => 'Қол жетімді қаріпті қосу/өшіру';

  @override
  String get settingsLoading => 'Қолжетімділік параметрлері жүктелуде…';

  @override
  String get settingsLoadFailed =>
      'Қолжетімділік параметрлерін жүктеу мүмкін болмады.';

  @override
  String get retry => 'Қайталап көру';

  @override
  String get themeModeSystem => 'Жүйе';

  @override
  String get themeModeLight => 'Ашық';

  @override
  String get themeModeDark => 'Қараңғы';

  @override
  String get effectsModeSystem => 'Жүйе';

  @override
  String get effectsModeEnabled => 'Қосулы';

  @override
  String get effectsModeDisabled => 'Өшірулі';
}
