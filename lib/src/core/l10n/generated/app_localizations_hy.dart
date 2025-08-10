// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AccessibilityLocalizationsHy extends AccessibilityLocalizations {
  AccessibilityLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get accessibility => 'Մատչելիություն';

  @override
  String get accessibility_settings => 'Մատչելիության կարգավորումներ';

  @override
  String get adjust_background_colors => 'Կարգավորել ֆոնի գույները';

  @override
  String get adjust_text_colors => 'Կարգավորել տեքստի գույները';

  @override
  String get align_center => 'Հավասարեցնել կենտրոնում';

  @override
  String get align_left => 'Հավասարեցնել ձախից';

  @override
  String get align_right => 'Հավասարեցնել աջից';

  @override
  String get bold_text => 'Թավ տեքստ';

  @override
  String get change_bold_text => 'Փոխել թավ տեքստը';

  @override
  String get change_pages_background_color => 'Փոխել էջի ֆոնի գույնը. ';

  @override
  String get change_text_color => 'Փոխել տեքստի գույնը. ';

  @override
  String get change_text_color_shade => 'Փոխել գույնի երանգը. ';

  @override
  String get color_adjustment => 'Գույնի կարգավորում';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Նորմալ',
        'lowSaturation': 'Ցածր հագեցածություն',
        'normal': 'Նորմալ',
        'highSaturation': 'Բարձր հագեցածություն',
        'monochrome': 'Մոնոխրոմ',
        'highContrast': 'Բարձր հակադրություն',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Ոնթացիկ գունային պրոֆիլն է. ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Նվազեցնել բառերի միջեւ հեռավորությունը';

  @override
  String get decrement_letter_spacing =>
      'Նվազեցնել տառերի միջեւ հեռավորությունը';

  @override
  String get decrement_line_height => 'Նվազեցնել տողի բարձրությունը';

  @override
  String get decrement_text_scale_factor => 'Նվազեցնել տեքստի չափը';

  @override
  String get effects => 'Էֆեկտներ';

  @override
  String get expand_text => 'Ընդլայնել տեքստը';

  @override
  String get font_size => 'Տառաչափ';

  @override
  String get increase_or_decrease_word_spacing =>
      'Ավելացնել կամ նվազեցնել բառերի միջեւ հեռավորությունը';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Ավելացնել կամ նվազեցնել տառերի միջեւ հեռավորությունը';

  @override
  String get increase_or_decrease_line_height =>
      'Ավելացնել կամ նվազեցնել տողի բարձրությունը';

  @override
  String get increase_or_decrease_text_size =>
      'Ավելացնել կամ նվազեցնել տեքստի չափը';

  @override
  String get increment_word_spacing => 'Ավելացնել բառերի միջեւ հեռավորությունը';

  @override
  String get increment_letter_spacing =>
      'Ավելացնել տառերի միջեւ հեռավորությունը';

  @override
  String get increment_line_height => 'Ավելացնել տողի բարձրությունը';

  @override
  String get increment_text_scale_factor => 'Ավելացնել տեքստի չափը';

  @override
  String get less_info => 'Թաքցնել տեղեկատվությունը';

  @override
  String get letter_spacing => 'Տառերի միջեւ հեռավորություն';

  @override
  String get line_height => 'Տողի բարձրություն';

  @override
  String get more_info => 'Ցուցադրել տեղեկատվությունը';

  @override
  String get read_less => 'Կարդալ պակաս';

  @override
  String get read_more => 'Կարդալ ավելին';

  @override
  String get reduce_effects => 'Նվազեցնել էկրանի էֆեկտները';

  @override
  String get reduce_text => 'Քչացնել տեքստը';

  @override
  String get restore_settings => 'Վերականգնել կարգավորումները';

  @override
  String get restore_main_color => 'Վերականգնել հիմնական գույնը';

  @override
  String get return_to_main_colors => 'Վերադառնալ հիմնական գույներին';

  @override
  String get settings => 'Կարգավորումներ';

  @override
  String get size_and_text_display => 'Չափս եւ տեքստի ցուցադրում';

  @override
  String get slider_word_spacing => 'Սուրյակ Բառերի միջեւ հեռավորություն';

  @override
  String get slider_letter_spacing => 'Սուրյակ Տառերի միջեւ հեռավորություն';

  @override
  String get slider_line_height => 'Սուրյակ Տողի բարձրություն';

  @override
  String get theme_mode => 'Թեմա';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Թեմայի պրոֆիլը ճանաչված չէ',
        'seizureSafe': 'Ցնցումային անվտանգ',
        'visionImpaired': 'Տեսողության թերությամբ',
        'adhdFriendly': 'ADHD բարեկամական',
        'none': 'Լռակարգային',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Ցնցումային անվտանգ պրոֆիլ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Վերացնել արտացոլումները եւ նվազեցնել գույները';

  @override
  String get theme_profile_seizure_safe_description =>
      'Այս պրոֆիլը թույլ է տալիս վտանգի ենթակա եւ էպիլեպսիա ունեցող օգտատերերին ապահով դիտարկելթ վերացնելով ցնցումների վտանգները, որոնք առաջանում են թարթող անիմացիաներից եւ վտանգավոր գունային կոմբինացիաներից։';

  @override
  String get theme_profile_vision_impaired_title =>
      'Տեսողության թերությամբ անձանց պրոֆիլ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Բարելավել հավելվածի տեսանելիությունը';

  @override
  String get theme_profile_vision_impaired_description =>
      'Այս պրոֆիլը հարմարեցնում է հավելվածը տեսողության բոլոր տեսակի թերություններին, ինչպիսիք են տեսողության խանգարումները, թունելային տեսողությունը, կատարակտը, գլաուկոման եւ այլն։';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-բարեկամական պրոֆիլ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Ավելի կենտրոնացում եւ պակաս շեղումներ';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Այս պրոֆիլը նշանակալիորեն նվազեցնում է շեղումները օգնելու ADHD եւ նյարդային զարգացման խանգարումներ ունեցող անձանց նավիգացիայի, ընթերցանության եւ հավելվածի կարեւոր տարրերի վրա ավելի հեշտ կենտրոնանալու համար։';

  @override
  String get the_settings_have_been_reset => 'Կարգավորումները վերականգնվել են:';

  @override
  String get toggle_dark_mode => 'Փոխարկել մութ ռեժիմը';

  @override
  String get toggle_effects_mode => 'Փոխարկել էֆեկտների ռեժիմը';

  @override
  String get toggle_font_weight => 'Փոխարկել տառատեսակի հաստությունը';

  @override
  String get toggle_theme_profile => 'Փոխարկել թեմայի պրոֆիլը';

  @override
  String get word_spacing => 'Բառերի միջեւ հեռավորություն';
}
