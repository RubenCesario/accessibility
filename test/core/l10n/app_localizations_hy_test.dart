import 'package:accessibility/src/core/l10n/generated/app_localizations_hy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsHy', () {
    late AccessibilityLocalizationsHy loc;

    setUp(() {
      loc = AccessibilityLocalizationsHy();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('hy'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Մատչելիություն'));
      expect(
        loc.accessibility_settings,
        equals('Մատչելիության կարգավորումներ'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Կարգավորել ֆոնի գույները'),
      );
      expect(loc.adjust_text_colors, equals('Կարգավորել տեքստի գույները'));
      expect(loc.align_center, equals('Հավասարեցնել կենտրոնում'));
      expect(loc.align_left, equals('Հավասարեցնել ձախից'));
      expect(loc.align_right, equals('Հավասարեցնել աջից'));
      expect(loc.bold_text, equals('Թավ տեքստ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Փոխել թավ տեքստը'));
      expect(
        loc.change_pages_background_color,
        equals('Փոխել էջի ֆոնի գույնը. '),
      );
      expect(
        loc.change_text_color,
        equals('Փոխել տեքստի գույնը. '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Փոխել գույնի երանգը. '),
      );
      expect(loc.color_adjustment, equals('Գույնի կարգավորում'));
      expect(
        loc.color_profile_changed_to,
        equals('Ոնթացիկ գունային պրոֆիլն է. '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Նվազեցնել բառերի միջեւ հեռավորությունը'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Նվազեցնել տառերի միջեւ հեռավորությունը'),
      );
      expect(
        loc.decrement_line_height,
        equals('Նվազեցնել տողի բարձրությունը'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Նվազեցնել տեքստի չափը'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Ավելացնել բառերի միջեւ հեռավորությունը'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Ավելացնել տառերի միջեւ հեռավորությունը'),
      );
      expect(
        loc.increment_line_height,
        equals('Ավելացնել տողի բարձրությունը'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('Ավելացնել տեքստի չափը'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Ավելացնել կամ նվազեցնել բառերի միջեւ հեռավորությունը'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Ավելացնել կամ նվազեցնել տառերի միջեւ հեռավորությունը'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Ավելացնել կամ նվազեցնել տողի բարձրությունը'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Ավելացնել կամ նվազեցնել տեքստի չափը'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Էֆեկտներ'));
      expect(loc.expand_text, equals('Ընդլայնել տեքստը'));
      expect(loc.font_size, equals('Տառաչափ'));
      expect(loc.less_info, equals('Թաքցնել տեղեկատվությունը'));
      expect(loc.letter_spacing, equals('Տառերի միջեւ հեռավորություն'));
      expect(loc.line_height, equals('Տողի բարձրություն'));
      expect(loc.more_info, equals('Ցուցադրել տեղեկատվությունը'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Կարդալ պակաս'));
      expect(loc.read_more, equals('Կարդալ ավելին'));
      expect(
        loc.reduce_effects,
        equals('Նվազեցնել էկրանի էֆեկտները'),
      );
      expect(loc.reduce_text, equals('Քչացնել տեքստը'));
      expect(loc.restore_settings, equals('Վերականգնել կարգավորումները'));
      expect(loc.restore_main_color, equals('Վերականգնել հիմնական գույնը'));
      expect(
        loc.return_to_main_colors,
        equals('Վերադառնալ հիմնական գույներին'),
      );
      expect(loc.settings, equals('Կարգավորումներ'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Չափս եւ տեքստի ցուցադրում'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Սուրյակ Բառերի միջեւ հեռավորություն'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Սուրյակ Տառերի միջեւ հեռավորություն'),
      );
      expect(
        loc.slider_line_height,
        equals('Սուրյակ Տողի բարձրություն'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Թեմայի պրոֆիլը ճանաչված չէ'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Ցնցումային անվտանգ'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Տեսողության թերությամբ'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD բարեկամական'),
      );
      expect(loc.theme_profile('none'), equals('Լռակարգային'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Ցնցումային անվտանգ պրոֆիլ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Վերացնել արտացոլումները եւ նվազեցնել գույները'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Այս պրոֆիլը թույլ է տալիս վտանգի ենթակա եւ էպիլեպսիա ունեցող '
          'օգտատերերին ապահով դիտարկելթ վերացնելով ցնցումների '
          'վտանգները, որոնք առաջանում են թարթող անիմացիաներից եւ '
          'վտանգավոր գունային կոմբինացիաներից։',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Տեսողության թերությամբ անձանց պրոֆիլ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Բարելավել հավելվածի տեսանելիությունը'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Այս պրոֆիլը հարմարեցնում է հավելվածը տեսողության բոլոր տեսակի '
          'թերություններին, ինչպիսիք են տեսողության խանգարումները, '
          'թունելային տեսողությունը, կատարակտը, գլաուկոման եւ այլն։',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-բարեկամական պրոֆիլ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Ավելի կենտրոնացում եւ պակաս շեղումներ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Այս պրոֆիլը նշանակալիորեն նվազեցնում է շեղումները օգնելու '
          'ADHD եւ նյարդային զարգացման խանգարումներ ունեցող անձանց '
          'նավիգացիայի, ընթերցանության եւ հավելվածի կարեւոր տարրերի '
          'վրա ավելի հեշտ կենտրոնանալու համար։',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Կարգավորումները վերականգնվել են:'),
      );
      expect(loc.toggle_dark_mode, equals('Փոխարկել մութ ռեժիմը'));
      expect(loc.toggle_effects_mode, equals('Փոխարկել էֆեկտների ռեժիմը'));
      expect(
        loc.toggle_font_weight,
        equals('Փոխարկել տառատեսակի հաստությունը'),
      );
      expect(loc.toggle_theme_profile, equals('Փոխարկել թեմայի պրոֆիլը'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Նորմալ'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Ցածր հագեցածություն'),
      );
      expect(loc.color_profile('normal'), equals('Նորմալ'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Բարձր հագեցածություն'),
      );
      expect(loc.color_profile('monochrome'), equals('Մոնոխրոմ'));
      expect(loc.color_profile('highContrast'), equals('Բարձր հակադրություն'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Գույնը ճանաչված չէ'));
      expect(loc.color('cF44336'), equals('Կարմիր'));
      expect(loc.color('cE91E63'), equals('Վարդագույն'));
      expect(loc.color('c9C27B0'), equals('Մանուշակագույն'));
      expect(loc.color('c673AB7'), equals('Մուգ մանուշակագույն'));
      expect(loc.color('c3F51B5'), equals('Ինդիգո'));
      expect(loc.color('c2196F3'), equals('Կապույտ'));
      expect(loc.color('c03A9F4'), equals('Բաց կապույտ'));
      expect(loc.color('c00BCD4'), equals('Կապույտկանաչ'));
      expect(loc.color('c009688'), equals('Թիալ'));
      expect(loc.color('c4CAF50'), equals('Կանաչ'));
      expect(loc.color('c8BC34A'), equals('Բաց կանաչ'));
      expect(loc.color('cCDDC39'), equals('Լայմ'));
      expect(loc.color('cFFEB3B'), equals('Դեղին'));
      expect(loc.color('cFFC107'), equals('Սատուրն'));
      expect(loc.color('cFF9800'), equals('Նարնջագույն'));
      expect(loc.color('cFF5722'), equals('Մուգ նարնջագույն'));
      expect(loc.color('c795548'), equals('Գորշ'));
      expect(loc.color('c9E9E9E'), equals('Մոխրագույն'));
      expect(loc.color('c607D8B'), equals('Կապտարամոխրագույն'));
    });
  });
}
