// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AccessibilityLocalizationsSq extends AccessibilityLocalizations {
  AccessibilityLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get accessibility => 'Aksesueshmëria';

  @override
  String get accessibilitySettings => 'Cilësimet e aksesueshmërisë';

  @override
  String get adjustBackgroundColors => 'Rregullo ngjyrat e sfondit';

  @override
  String get adjustTextColors => 'Rregullo ngjyrat e tekstit';

  @override
  String get alignCenter => 'Qendërzo';

  @override
  String get alignLeft => 'Vendos majtas';

  @override
  String get alignRight => 'Vendos djathtas';

  @override
  String get textAlignment => 'Rreshtimi i tekstit';

  @override
  String get boldText => 'Tekst i trashë';

  @override
  String get changeBoldText => 'Ndrysho trashësinë e tekstit';

  @override
  String get changePagesBackgroundColor =>
      'Ndrysho ngjyrën e sfondit të faqeve në: ';

  @override
  String get changeTextColor => 'Ndrysho ngjyrën e tekstit në: ';

  @override
  String get changeTextColorShade => 'Ndrysho nuancën e ngjyrës në: ';

  @override
  String get colorAdjustment => 'Rregullimi i ngjyrave';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Ngopje e ulët',
      'normal': 'Normal',
      'highSaturation': 'Ngopje e lartë',
      'monochrome': 'Monokromatike',
      'highContrast': 'Kontrast i lartë',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Profili aktual i ngjyrave është: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Ngjyra nuk njihet',
      'cF44336': 'E kuqe',
      'cE91E63': 'Rozë',
      'c9C27B0': 'Vjollcë',
      'c673AB7': 'Vjollcë e errët',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Blu',
      'c03A9F4': 'Blu e çelët',
      'c00BCD4': 'Cian',
      'c009688': 'Blu e gjelbër',
      'c4CAF50': 'E gjelbrë',
      'c8BC34A': 'E gjelbrë e çelët',
      'cCDDC39': 'Limë',
      'cFFEB3B': 'E verdhë',
      'cFFC107': 'Qelibar',
      'cFF9800': 'Portokalli',
      'cFF5722': 'Portokalli e errët',
      'c795548': 'Kafe',
      'c9E9E9E': 'Gri',
      'c607D8B': 'Blu gri',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Zvogëlo hapësirën mes fjalëve';

  @override
  String get decrementLetterSpacing => 'Zvogëlo hapësirën mes shkronjave';

  @override
  String get decrementLineHeight => 'Zvogëlo lartësinë e rreshtit';

  @override
  String get decrementTextScaleFactor =>
      'Zvogëlo faktorin e shkallëzimit të tekstit';

  @override
  String get effects => 'Efektet';

  @override
  String get expandText => 'Zgjero tekstin';

  @override
  String get fontSize => 'Madhësia e shkrimit';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Rrit ose zvogëlo hapësirën mes fjalëve';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Rrit ose zvogëlo hapësirën mes shkronjave';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Rrit ose zvogëlo lartësinë e rreshtit';

  @override
  String get increaseOrDecreaseTextSize =>
      'Rrit ose zvogëlo madhësinë e tekstit';

  @override
  String get incrementWordSpacing => 'Rrit hapësirën mes fjalëve';

  @override
  String get incrementLetterSpacing => 'Rrit hapësirën mes shkronjave';

  @override
  String get incrementLineHeight => 'Rrit lartësinë e rreshtit';

  @override
  String get incrementTextScaleFactor =>
      'Rrit faktorin e shkallëzimit të tekstit';

  @override
  String get lessInfo => 'Fshih informacionin';

  @override
  String get letterSpacing => 'Hapësira mes shkronjave';

  @override
  String get lineHeight => 'Lartësia e rreshtit';

  @override
  String get moreInfo => 'Shfaq informacionin';

  @override
  String get readLess => 'Lexo më pak';

  @override
  String get readMore => 'Lexo më shumë';

  @override
  String get reduceEffects => 'Redukto efektet në ekran';

  @override
  String get reduceText => 'Zvogëlo tekstin';

  @override
  String get restoreSettings => 'Rikthe cilësimet';

  @override
  String get restoreMainColor => 'Rikthe ngjyrën kryesore';

  @override
  String get returnToMainColors => 'Kthehu te ngjyrat kryesore';

  @override
  String get settings => 'Cilësimet';

  @override
  String get sizeAndTextDisplay => 'Madhësia dhe shfaqja e tekstit';

  @override
  String get sliderWordSpacing => 'Rrëshqitësi i hapësirës mes fjalëve';

  @override
  String get sliderLetterSpacing => 'Rrëshqitësi i hapësirës mes shkronjave';

  @override
  String get sliderLineHeight => 'Rrëshqitësi i lartësisë së rreshtit';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profili i temës nuk njihet',
      'seizureSafe': 'I sigurt për epilepsi',
      'visionImpaired': 'Për shikim të dëmtuar',
      'adhdFriendly': 'Miqsor për ADHD',
      'none': 'Profili i parazgjedhur',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil i sigurt për epilepsi';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Hiq reflektimet dhe redukto ngjyrat';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ky profil u mundeson përdoruesve që kanë epilepsi dhe janë në rrezik për kriza të shfletojnë në mënyrë të sigurt duke eliminuar rrezikun e krizave që vijnë nga animacionet vezulluese dhe kombinimet e rrezikshme të ngjyrave.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil për shikim të dëmtuar';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Përmirso dukshmerinë e aplikacionit';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ky profil përshtat aplikacionin që të jetë i aksesueshëm për shumë dëmtime të shikimit, si dëmtimi i shikimit, shikimi tunel, katarakti, glaukoma dhe më shumë.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil miqsor për ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Më shumë përqendrim dhe më pak shpërqendrime';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ky profil redukton në mënyrë të konsiderueshme shpërqendrimet, për të ndihmuar njerëzit me ADHD dhe çrregullime neurozhvillimore të navigojnë, lexojnë dhe të përqendrohen më lehtë në elementet thelbsore të aplikacionit.';

  @override
  String get theSettingsHaveBeenReset => 'Cilësimet janë rivendosur.';

  @override
  String get toggleDarkMode => 'Ndryshoni modalitetin e errët';

  @override
  String get toggleEffectsMode => 'Ndryshoni modalitetin e efekteve';

  @override
  String get toggleFontWeight => 'Ndryshoni trashësinë e shkrimit';

  @override
  String get toggleThemeProfile => 'Ndryshoni profilin e temës';

  @override
  String get wordSpacing => 'Hapësira mes fjalëve';

  @override
  String get accessibleFont => 'Font i aksesueshëm';

  @override
  String get accessibleFontSubtitle =>
      'Përdorni një font të aksesueshëm për lexueshmëri më të mirë';

  @override
  String get accessibleFontEnabled => 'Fonti i aksesueshëm i aktivizuar';

  @override
  String get accessibleFontDisabled => 'Fonti i aksesueshëm i çaktivizuar';

  @override
  String get toggleAccessibleFont => 'Ndryshoni fontin e aksesueshëm';

  @override
  String get settingsLoading => 'Duke ngarkuar cilësimet e aksesueshmërisë…';

  @override
  String get settingsLoadFailed =>
      'Cilësimet e aksesueshmërisë nuk mund të ngarkoheshin.';

  @override
  String get retry => 'Provo përsëri';

  @override
  String get themeModeSystem => 'Sistemi';

  @override
  String get themeModeLight => 'E çelët';

  @override
  String get themeModeDark => 'E errët';

  @override
  String get effectsModeSystem => 'Sistemi';

  @override
  String get effectsModeEnabled => 'Aktiv';

  @override
  String get effectsModeDisabled => 'Çaktivizuar';
}
