// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AccessibilityLocalizationsFil extends AccessibilityLocalizations {
  AccessibilityLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get accessibility => 'Pagiging Madaling Gamitin';

  @override
  String get accessibilitySettings =>
      'Mga Setting ng Pagiging Madaling Gamitin';

  @override
  String get adjustBackgroundColors => 'I-adjust ang mga kulay ng background';

  @override
  String get adjustTextColors => 'I-adjust ang mga kulay ng text';

  @override
  String get alignCenter => 'I-align sa gitna';

  @override
  String get alignLeft => 'I-align sa kaliwa';

  @override
  String get alignRight => 'I-align sa kanan';

  @override
  String get textAlignment => 'Pagkakahanay ng teksto';

  @override
  String get boldText => 'Malalaking titik';

  @override
  String get changeBoldText => 'Baguhin ang malalaking titik';

  @override
  String get changePagesBackgroundColor =>
      'Baguhin ang kulay ng background ng mga pahina sa: ';

  @override
  String get changeTextColor => 'Baguhin ang kulay ng text sa: ';

  @override
  String get changeTextColorShade => 'Baguhin ang shade ng kulay sa: ';

  @override
  String get colorAdjustment => 'Pag-adjust ng kulay';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Mababang saturation',
      'normal': 'Normal',
      'highSaturation': 'Mataas na saturation',
      'monochrome': 'Monochrome',
      'highContrast': 'Mataas na contrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Ang kasalukuyang profile ng kulay ay: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Hindi nakilala ang kulay',
      'cF44336': 'Pula',
      'cE91E63': 'Pink',
      'c9C27B0': 'Lila',
      'c673AB7': 'Matingkad na lila',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Asul',
      'c03A9F4': 'Maliwanag na asul',
      'c00BCD4': 'Cyan',
      'c009688': 'Teal',
      'c4CAF50': 'Berde',
      'c8BC34A': 'Maliwanag na berde',
      'cCDDC39': 'Lime',
      'cFFEB3B': 'Dilaw',
      'cFFC107': 'Amber',
      'cFF9800': 'Kahel',
      'cFF5722': 'Matingkad na kahel',
      'c795548': 'Kayumanggi',
      'c9E9E9E': 'Kulay-abo',
      'c607D8B': 'Bughaw na kulay-abo',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Bawasan ang pagitan ng mga salita';

  @override
  String get decrementLetterSpacing => 'Bawasan ang pagitan ng mga letra';

  @override
  String get decrementLineHeight => 'Bawasan ang taas ng linya';

  @override
  String get decrementTextScaleFactor => 'Bawasan ang scale factor ng text';

  @override
  String get effects => 'Mga epekto';

  @override
  String get expandText => 'Palawakin ang text';

  @override
  String get fontSize => 'Laki ng font';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Dagdagan o bawasan ang pagitan ng mga salita';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Dagdagan o bawasan ang pagitan ng mga letra';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Dagdagan o bawasan ang taas ng linya';

  @override
  String get increaseOrDecreaseTextSize =>
      'Dagdagan o bawasan ang laki ng text';

  @override
  String get incrementWordSpacing => 'Dagdagan ang pagitan ng mga salita';

  @override
  String get incrementLetterSpacing => 'Dagdagan ang pagitan ng mga letra';

  @override
  String get incrementLineHeight => 'Dagdagan ang taas ng linya';

  @override
  String get incrementTextScaleFactor => 'Dagdagan ang scale factor ng text';

  @override
  String get lessInfo => 'Itago ang impormasyon';

  @override
  String get letterSpacing => 'Pagitan ng mga letra';

  @override
  String get lineHeight => 'Taas ng linya';

  @override
  String get moreInfo => 'Ipakita ang impormasyon';

  @override
  String get readLess => 'Magbasa ng mas kaunti';

  @override
  String get readMore => 'Magbasa pa';

  @override
  String get reduceEffects => 'Bawasan ang mga epekto sa screen';

  @override
  String get reduceText => 'Bawasan ang text';

  @override
  String get restoreSettings => 'Ibalik ang mga setting';

  @override
  String get restoreMainColor => 'Ibalik ang pangunahing kulay';

  @override
  String get returnToMainColors => 'Bumalik sa mga pangunahing kulay';

  @override
  String get settings => 'Mga Setting';

  @override
  String get sizeAndTextDisplay => 'Laki at display ng text';

  @override
  String get sliderWordSpacing => 'Slider ng pagitan ng mga salita';

  @override
  String get sliderLetterSpacing => 'Slider ng pagitan ng mga letra';

  @override
  String get sliderLineHeight => 'Slider ng taas ng linya';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Hindi nakilala ang profile ng tema',
      'seizureSafe': 'Ligtas sa seizure',
      'visionImpaired': 'Para sa may problema sa paningin',
      'adhdFriendly': 'ADHD friendly',
      'none': 'Default na profile',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profile na ligtas sa seizure';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Tanggalin ang mga reflection at bawasan ang kulay';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Ang profile na ito ay tumutulong sa mga gumagamit na may epilepsy at nasa panganib ng seizure na mag-browse nang ligtas sa pamamagitan ng pag-alis ng panganib ng seizure na nagmumula sa mga kumikislap na animation at mga mapanganib na kombinasyon ng kulay.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Profile para sa may problema sa paningin';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Pabutihin ang visibility ng application';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Ang profile na ito ay nag-a-adjust sa application upang maging accessible sa karamihan ng mga problema sa paningin, tulad ng kapansanan sa paningin, tunnel vision, katarata, glaucoma at higit pa.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profile na ADHD-friendly';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Mas mataas na konsentrasyon at mas kaunting mga nakakadistract';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Ang profile na ito ay malaking nabawasan ang mga nakakadistract, upang tulungan ang mga taong may ADHD at mga kapansanan sa neurodevelopment na mag-navigate, magbasa, at tumuon sa mga mahahalagang elemento ng application nang mas madali.';

  @override
  String get theSettingsHaveBeenReset => 'Ang mga setting ay na-reset na.';

  @override
  String get toggleDarkMode => 'I-toggle ang dark mode';

  @override
  String get toggleEffectsMode => 'I-toggle ang mode ng mga epekto';

  @override
  String get toggleFontWeight => 'I-toggle ang kapal ng font';

  @override
  String get toggleThemeProfile => 'I-toggle ang profile ng tema';

  @override
  String get wordSpacing => 'Pagitan ng mga salita';

  @override
  String get accessibleFont => 'Accessible na font';

  @override
  String get accessibleFontSubtitle =>
      'Gumamit ng naa-access na font para sa mas magandang readability';

  @override
  String get accessibleFontEnabled => 'Naka-enable ang accessible na font';

  @override
  String get accessibleFontDisabled => 'Naka-disable ang accessible na font';

  @override
  String get toggleAccessibleFont => 'I-toggle ang accessible na font';

  @override
  String get settingsLoading =>
      'Nilo-load ang mga setting ng pagiging madaling gamitin…';

  @override
  String get settingsLoadFailed =>
      'Hindi na-load ang mga setting ng pagiging madaling gamitin.';

  @override
  String get retry => 'Subukan muli';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Maliwanag';

  @override
  String get themeModeDark => 'Madilim';

  @override
  String get effectsModeSystem => 'Sistema';

  @override
  String get effectsModeEnabled => 'Naka-on';

  @override
  String get effectsModeDisabled => 'Naka-off';
}
