// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AccessibilityLocalizationsZu extends AccessibilityLocalizations {
  AccessibilityLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get accessibility => 'Ukufinyelela';

  @override
  String get accessibilitySettings => 'Izilungiselelo zokufinyelela';

  @override
  String get adjustBackgroundColors => 'Lungisa imibala yangemuva';

  @override
  String get adjustTextColors => 'Lungisa imibala yombhalo';

  @override
  String get alignCenter => 'Qondanisa maphakathi';

  @override
  String get alignLeft => 'Qondanisa kwesokunxele';

  @override
  String get alignRight => 'Qondanisa kwesokudla';

  @override
  String get textAlignment => 'Ukuqondaniswa kombhalo';

  @override
  String get boldText => 'Umbhalo oqinile';

  @override
  String get changeBoldText => 'Shintsha umbhalo oqinile';

  @override
  String get changePagesBackgroundColor =>
      'Shintsha umbala wangemuva wamakhasi ku: ';

  @override
  String get changeTextColor => 'Shintsha umbala wombhalo ku: ';

  @override
  String get changeTextColorShade => 'Shintsha umthunzi wombala ku: ';

  @override
  String get colorAdjustment => 'Ukulungisa kombala';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Okujwayelekile',
      'lowSaturation': 'Ukuqiniseka okuphansi',
      'normal': 'Okujwayelekile',
      'highSaturation': 'Ukuqiniseka okuphezulu',
      'monochrome': 'Umbala owodwa',
      'highContrast': 'Umehluko ophezulu',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Iphrofayela yombala yamanje ithi: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Umbala ongaziwa',
      'cF44336': 'Obomvu',
      'cE91E63': 'Opinki',
      'c9C27B0': 'Okunsomi',
      'c673AB7': 'Okunsomi okujulile',
      'c3F51B5': 'I-indigo',
      'c2196F3': 'Okuluhlaza okwesibhakabhaka',
      'c03A9F4': 'Okuluhlaza okwesibhakabhaka okukhanyayo',
      'c00BCD4': 'I-cyan',
      'c009688': 'I-teal',
      'c4CAF50': 'Okuluhlaza okotshani',
      'c8BC34A': 'Okuluhlaza okotshani okukhanyayo',
      'cCDDC39': 'I-layimu',
      'cFFEB3B': 'Okuphuzi',
      'cFFC107': 'I-amber',
      'cFF9800': 'Iwolintshi',
      'cFF5722': 'Iwolintshi ejulile',
      'c795548': 'Onsundu',
      'c9E9E9E': 'Ompunga',
      'c607D8B': 'Ompunga oluhlaza okwesibhakabhaka',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Nciphisa isikhala samagama';

  @override
  String get decrementLetterSpacing => 'Nciphisa isikhala sezinhlamvu';

  @override
  String get decrementLineHeight => 'Nciphisa ukuphakama komugqa';

  @override
  String get decrementTextScaleFactor => 'Nciphisa isikali sombhalo';

  @override
  String get effects => 'Imiphumela';

  @override
  String get expandText => 'Nweba umbhalo';

  @override
  String get fontSize => 'Usayizi wombhalo';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Khuphula noma unciphise isikhala samagama';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Khuphula noma unciphise isikhala sezinhlamvu';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Khuphula noma unciphise ukuphakama komugqa';

  @override
  String get increaseOrDecreaseTextSize =>
      'Khuphula noma unciphise usayizi wombhalo';

  @override
  String get incrementWordSpacing => 'Khuphula isikhala samagama';

  @override
  String get incrementLetterSpacing => 'Khuphula isikhala sezinhlamvu';

  @override
  String get incrementLineHeight => 'Khuphula ukuphakama komugqa';

  @override
  String get incrementTextScaleFactor => 'Khuphula isikali sombhalo';

  @override
  String get lessInfo => 'Fihla ulwazi';

  @override
  String get letterSpacing => 'Isikhala sezinhlamvu';

  @override
  String get lineHeight => 'Ukuphakama komugqa';

  @override
  String get moreInfo => 'Bonisa ulwazi';

  @override
  String get readLess => 'Funda kancane';

  @override
  String get readMore => 'Funda kabanzi';

  @override
  String get reduceEffects => 'Nciphisa imiphumela esikrini';

  @override
  String get reduceText => 'Nciphisa umbhalo';

  @override
  String get restoreSettings => 'Buyisela izilungiselelo';

  @override
  String get restoreMainColor => 'Buyisela umbala omkhulu';

  @override
  String get returnToMainColors => 'Buyela emibala eyinhloko';

  @override
  String get settings => 'Izilungiselelo';

  @override
  String get sizeAndTextDisplay => 'Usayizi nokuboniswa kombhalo';

  @override
  String get sliderWordSpacing => 'Isilayi sesikhala samagama';

  @override
  String get sliderLetterSpacing => 'Isilayi sesikhala sezinhlamvu';

  @override
  String get sliderLineHeight => 'Isilayi sokuphakama komugqa';

  @override
  String get themeMode => 'Itimu';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Iphrofayela yetimu engaziwa',
      'seizureSafe': 'Ukuphepha kwesifo sokuwa',
      'visionImpaired': 'Ukungaboni kahle',
      'adhdFriendly': 'Kulungele i-ADHD',
      'none': 'Iphrofayela ezenzakalelayo',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'Iphrofayela yokuphepha kwesifo sokuwa';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Susa ukuphazima futhi unciphise umbala';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Le phrofayela ivumela abasebenzisi abanesifo sokuwa futhi abasengozini yokuwa ukuthi babhekise ngokuphepha ngokususa ingozi yokuwa okubangelwa ukuphazima kwezithombe ezinyakazayo kanye nezinhlanganisela zemibala eziyingozi.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Iphrofayela yabanenkinga yokubona';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Thuthukisa ukubonakala kohlelo lokusebenza';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Le phrofayela ilungisa uhlelo lokusebenza ukuze lufinyelele ezinkingeni eziningi zokubona, njengokungaboni kahle, ukubona okuncane, isifo samehlo esiluhlaza, isifo samehlo esingokwehla kwengcindezi kanye nokunye.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Iphrofayela elungele i-ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Ukugxila okuningi nokudideka okuncane';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Le phrofayela inciphisa kakhulu ukuphazamiseka, ukusiza abantu abane-ADHD kanye nezifo zokuthuthuka kwemizwa ukuthi bahambe, bafunde, futhi bagxile ezintweni ezibalulekile zohlelo lokusebenza kalula.';

  @override
  String get theSettingsHaveBeenReset => 'Izilungiselelo zisethwe kabusha.';

  @override
  String get toggleDarkMode => 'Guqula imodi emnyama';

  @override
  String get toggleEffectsMode => 'Guqula imodi yemiphumela';

  @override
  String get toggleFontWeight => 'Guqula ubunzima bombhalo';

  @override
  String get toggleThemeProfile => 'Guqula iphrofayela yetimu';

  @override
  String get wordSpacing => 'Isikhala samagama';

  @override
  String get accessibleFont => 'Ifonti efinyelelekayo';

  @override
  String get accessibleFontSubtitle =>
      'Sebenzisa ifonti efinyelelekayo ukuze kufundeke kangcono';

  @override
  String get accessibleFontEnabled => 'Ifonti efinyelelekayo ivuliwe';

  @override
  String get accessibleFontDisabled => 'Ifonti efinyelelekayo ivaliwe';

  @override
  String get toggleAccessibleFont => 'Guqula ifonti efinyelelekayo';

  @override
  String get settingsLoading => 'Kulayishwa izilungiselelo zokufinyelela…';

  @override
  String get settingsLoadFailed =>
      'Izilungiselelo zokufinyelela azikwazanga ukulayishwa.';

  @override
  String get retry => 'Zama futhi';
}
