// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AccessibilityLocalizationsHy extends AccessibilityLocalizations {
  AccessibilityLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get accessibility => 'Մատչելիություն';

  @override
  String get accessibilitySettings => 'Մատչելիության կարգավորումներ';

  @override
  String get adjustBackgroundColors => 'Կարգավորել ֆոնի գույները';

  @override
  String get adjustTextColors => 'Կարգավորել տեքստի գույները';

  @override
  String get alignCenter => 'Հավասարեցնել կենտրոնում';

  @override
  String get alignLeft => 'Հավասարեցնել ձախից';

  @override
  String get alignRight => 'Հավասարեցնել աջից';

  @override
  String get textAlignment => 'Տեքստի հավասարեցում';

  @override
  String get boldText => 'Թավ տեքստ';

  @override
  String get changeBoldText => 'Փոխել թավ տեքստը';

  @override
  String get changePagesBackgroundColor => 'Փոխել էջի ֆոնի գույնը. ';

  @override
  String get changeTextColor => 'Փոխել տեքստի գույնը. ';

  @override
  String get changeTextColorShade => 'Փոխել գույնի երանգը. ';

  @override
  String get colorAdjustment => 'Գույնի կարգավորում';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Նորմալ',
      'lowSaturation': 'Ցածր հագեցածություն',
      'normal': 'Նորմալ',
      'highSaturation': 'Բարձր հագեցածություն',
      'monochrome': 'Մոնոխրոմ',
      'highContrast': 'Բարձր հակադրություն',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Ոնթացիկ գունային պրոֆիլն է. ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Գույնը ճանաչված չէ',
      'cF44336': 'Կարմիր',
      'cE91E63': 'Վարդագույն',
      'c9C27B0': 'Մանուշակագույն',
      'c673AB7': 'Մուգ մանուշակագույն',
      'c3F51B5': 'Ինդիգո',
      'c2196F3': 'Կապույտ',
      'c03A9F4': 'Բաց կապույտ',
      'c00BCD4': 'Կապույտկանաչ',
      'c009688': 'Թիալ',
      'c4CAF50': 'Կանաչ',
      'c8BC34A': 'Բաց կանաչ',
      'cCDDC39': 'Լայմ',
      'cFFEB3B': 'Դեղին',
      'cFFC107': 'Սատուրն',
      'cFF9800': 'Նարնջագույն',
      'cFF5722': 'Մուգ նարնջագույն',
      'c795548': 'Գորշ',
      'c9E9E9E': 'Մոխրագույն',
      'c607D8B': 'Կապտարամոխրագույն',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Նվազեցնել բառերի միջեւ հեռավորությունը';

  @override
  String get decrementLetterSpacing => 'Նվազեցնել տառերի միջեւ հեռավորությունը';

  @override
  String get decrementLineHeight => 'Նվազեցնել տողի բարձրությունը';

  @override
  String get decrementTextScaleFactor => 'Նվազեցնել տեքստի չափը';

  @override
  String get effects => 'Էֆեկտներ';

  @override
  String get expandText => 'Ընդլայնել տեքստը';

  @override
  String get fontSize => 'Տառաչափ';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Ավելացնել կամ նվազեցնել բառերի միջեւ հեռավորությունը';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Ավելացնել կամ նվազեցնել տառերի միջեւ հեռավորությունը';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Ավելացնել կամ նվազեցնել տողի բարձրությունը';

  @override
  String get increaseOrDecreaseTextSize =>
      'Ավելացնել կամ նվազեցնել տեքստի չափը';

  @override
  String get incrementWordSpacing => 'Ավելացնել բառերի միջեւ հեռավորությունը';

  @override
  String get incrementLetterSpacing => 'Ավելացնել տառերի միջեւ հեռավորությունը';

  @override
  String get incrementLineHeight => 'Ավելացնել տողի բարձրությունը';

  @override
  String get incrementTextScaleFactor => 'Ավելացնել տեքստի չափը';

  @override
  String get lessInfo => 'Թաքցնել տեղեկատվությունը';

  @override
  String get letterSpacing => 'Տառերի միջեւ հեռավորություն';

  @override
  String get lineHeight => 'Տողի բարձրություն';

  @override
  String get moreInfo => 'Ցուցադրել տեղեկատվությունը';

  @override
  String get readLess => 'Կարդալ պակաս';

  @override
  String get readMore => 'Կարդալ ավելին';

  @override
  String get reduceEffects => 'Նվազեցնել էկրանի էֆեկտները';

  @override
  String get reduceText => 'Քչացնել տեքստը';

  @override
  String get restoreSettings => 'Վերականգնել կարգավորումները';

  @override
  String get restoreMainColor => 'Վերականգնել հիմնական գույնը';

  @override
  String get returnToMainColors => 'Վերադառնալ հիմնական գույներին';

  @override
  String get settings => 'Կարգավորումներ';

  @override
  String get sizeAndTextDisplay => 'Չափս եւ տեքստի ցուցադրում';

  @override
  String get sliderWordSpacing => 'Սուրյակ Բառերի միջեւ հեռավորություն';

  @override
  String get sliderLetterSpacing => 'Սուրյակ Տառերի միջեւ հեռավորություն';

  @override
  String get sliderLineHeight => 'Սուրյակ Տողի բարձրություն';

  @override
  String get themeMode => 'Թեմա';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Թեմայի պրոֆիլը ճանաչված չէ',
      'seizureSafe': 'Ցնցումային անվտանգ',
      'visionImpaired': 'Տեսողության թերությամբ',
      'adhdFriendly': 'ADHD բարեկամական',
      'none': 'Կանխադրված պրոֆիլ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Ցնցումային անվտանգ պրոֆիլ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Վերացնել արտացոլումները եւ նվազեցնել գույները';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Այս պրոֆիլը թույլ է տալիս վտանգի ենթակա եւ էպիլեպսիա ունեցող օգտատերերին ապահով դիտարկելթ վերացնելով ցնցումների վտանգները, որոնք առաջանում են թարթող անիմացիաներից եւ վտանգավոր գունային կոմբինացիաներից։';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Տեսողության թերությամբ անձանց պրոֆիլ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Բարելավել հավելվածի տեսանելիությունը';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Այս պրոֆիլը հարմարեցնում է հավելվածը տեսողության բոլոր տեսակի թերություններին, ինչպիսիք են տեսողության խանգարումները, թունելային տեսողությունը, կատարակտը, գլաուկոման եւ այլն։';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-բարեկամական պրոֆիլ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Ավելի կենտրոնացում եւ պակաս շեղումներ';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Այս պրոֆիլը նշանակալիորեն նվազեցնում է շեղումները օգնելու ADHD եւ նյարդային զարգացման խանգարումներ ունեցող անձանց նավիգացիայի, ընթերցանության եւ հավելվածի կարեւոր տարրերի վրա ավելի հեշտ կենտրոնանալու համար։';

  @override
  String get theSettingsHaveBeenReset => 'Կարգավորումները վերականգնվել են:';

  @override
  String get toggleDarkMode => 'Փոխարկել մութ ռեժիմը';

  @override
  String get toggleEffectsMode => 'Փոխարկել էֆեկտների ռեժիմը';

  @override
  String get toggleFontWeight => 'Փոխարկել տառատեսակի հաստությունը';

  @override
  String get toggleThemeProfile => 'Փոխարկել թեմայի պրոֆիլը';

  @override
  String get wordSpacing => 'Բառերի միջեւ հեռավորություն';

  @override
  String get accessibleFont => 'Մատչելի տառատեսակ';

  @override
  String get accessibleFontSubtitle =>
      'Օգտագործեք հասանելի տառատեսակ՝ ավելի լավ ընթեռնելիության համար';

  @override
  String get accessibleFontEnabled => 'Մատչելի տառատեսակը միացված է';

  @override
  String get accessibleFontDisabled => 'Մատչելի տառատեսակը անջատված է';

  @override
  String get toggleAccessibleFont => 'Փոխարկել մատչելի տառատեսակը';

  @override
  String get settingsLoading => 'Մատչելիության կարգավորումների բեռնում…';

  @override
  String get settingsLoadFailed =>
      'Չհաջողվեց բեռնել մատչելիության կարգավորումները։';

  @override
  String get retry => 'Կրկին փորձել';
}
