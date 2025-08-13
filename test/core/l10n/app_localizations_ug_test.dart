import 'package:accessibility/src/core/l10n/generated/app_localizations_ug.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsUg', () {
    late AccessibilityLocalizationsUg loc;

    setUp(() {
      loc = AccessibilityLocalizationsUg();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ug'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ئۇچۇرلۇق'));
      expect(
        loc.accessibility_settings,
        equals('ئۇچۇرلۇق تەڭشەكلەر'),
      );
      expect(
        loc.adjust_background_colors,
        equals('ئارقا كۆرۈنۈش رەڭلەرنى تەڭشەش'),
      );
      expect(loc.adjust_text_colors, equals('تېكىست رەڭلەرنى تەڭشەش'));
      expect(loc.align_center, equals('ئوتتۇرىغا تەڭشەش'));
      expect(loc.align_left, equals('سولغا تەڭشەش'));
      expect(loc.align_right, equals('ئوڭغا تەڭشەش'));
      expect(loc.bold_text, equals('توم تېكىست'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('توم تېكىستنى ئۆزگەرتىش'));
      expect(
        loc.change_pages_background_color,
        equals('بەتلەرنىڭ ئارقا كۆرۈنۈش رەڭلەرىنى ئۆزگەرتىش: '),
      );
      expect(
        loc.change_text_color,
        equals('تېكىست رەڭلەرىنى ئۆزگەرتىش: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('رەڭ سايىسىنى ئۆزگەرتىش: '),
      );
      expect(loc.color_adjustment, equals('رەڭ تەڭشەش'));
      expect(
        loc.color_profile_changed_to,
        equals('ھازىرقى رەڭ سەپى: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('سۆز ئارىلىقىنى ئازايتىش'));
      expect(loc.decrement_letter_spacing, equals('ھەرپ ئارىلىقىنى ئازايتىش'));
      expect(loc.decrement_line_height, equals('قۇر ئېگىزلىكىنى ئازايتىش'));
      expect(
        loc.decrement_text_scale_factor,
        equals('تېكىست مىقدارىنى ئازايتىش'),
      );
      expect(loc.increment_word_spacing, equals('سۆز ئارىلىقىنى كۆپەيتىش'));
      expect(loc.increment_letter_spacing, equals('ھەرپ ئارىلىقىنى كۆپەيتىش'));
      expect(loc.increment_line_height, equals('قۇر ئېگىزلىكىنى كۆپەيتىش'));
      expect(
        loc.increment_text_scale_factor,
        equals('تېكىست مىقدارىنى كۆپەيتىش'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('سۆز ئارىلىقىنى كۆپەيتىش ياكى ئازايتىش'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('ھەرپ ئارىلىقىنى كۆپەيتىش ياكى ئازايتىش'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('قۇر ئېگىزلىكىنى كۆپەيتىش ياكى ئازايتىش'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('تېكىست چوڭلۇقىنى كۆپەيتىش ياكى ئازايتىش'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ئۈنۈملەر'));
      expect(loc.expand_text, equals('تېكىستنى كېڭەيتىش'));
      expect(loc.font_size, equals('خەت چوڭلۇقى'));
      expect(loc.less_info, equals('ئۇچۇرنى يوشۇرۇش'));
      expect(loc.letter_spacing, equals('ھەرپ ئارىلىقى'));
      expect(loc.line_height, equals('قۇر ئېگىزلىكى'));
      expect(loc.more_info, equals('ئۇچۇرنى كۆرسىتىش'));
      expect(loc.word_spacing, equals('سۆز ئارىلىقى'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ئازراق ئوقۇش'));
      expect(loc.read_more, equals('كۆپرەك ئوقۇش'));
      expect(
        loc.reduce_effects,
        equals('ئېكران ئۈنۈملىرىنى ئازايتىش'),
      );
      expect(loc.reduce_text, equals('تېكىستنى ئازايتىش'));
      expect(loc.restore_settings, equals('تەڭشەكلەرنى ئەسلىگە كەلتۈرۈش'));
      expect(loc.restore_main_color, equals('ئاساسىي رەڭنى ئەسلىگە كەلتۈرۈش'));
      expect(
        loc.return_to_main_colors,
        equals('ئاساسىي رەڭلەرگە قايتىش'),
      );
      expect(loc.settings, equals('تەڭشەكلەر'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('چوڭلۇق ۋە تېكىست كۆرسىتىش'),
      );
      expect(
        loc.slider_word_spacing,
        equals('سۆز ئارىلىقى سۈرگۈچى'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('ھەرپ ئارىلىقى سۈرگۈچى'),
      );
      expect(loc.slider_line_height, equals('قۇر ئېگىزلىكى سۈرگۈچى'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ئۇسلۇب'));
      expect(
        loc.theme_profile('other'),
        equals('ئۇسلۇب سەپى تونۇلمىدى'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('تۇتقاققا بىخەتەر'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('كۆرۈش ئاجىزلىقى'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD دوستانە'),
      );
      expect(loc.theme_profile('none'), equals('كۆنۈپكى ھالەت'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('تۇتقاققا بىخەتەر سەپ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('چاقناشلارنى يوقىتىش ۋە رەڭنى ئازايتىش'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals('بۇ سەپ تۇتقاق كېسىلى بار ۋە تۇتقاق خەۋپى بولغان '
            'ئىشلەتكۈچىلەرنىڭ چاقنايدىغان ئانىماتسىيە ۋە خەتەرلىك '
            'رەڭ بىرىكمىلىرىدىن كېلىدىغان تۇتقاق خەۋپىنى '
            'يوقىتىپ، بىخەتەر كۆرۈشىنى ئىشقا ئاشۇرىدۇ.'),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('كۆرۈش ئاجىزلىقى سەپى'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ئەپنىڭ كۆرۈنۈشىنى ياخشىلاش'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals('بۇ سەپ ئەپنى كۆرۈش ئاجىزلىقى، تۇننېل كۆرۈش، '
            'كاتاراكتا، گلاۋكوما ۋە باشقا كۆپ خىل كۆرۈش '
            'ئاجىزلىقلىرىغا ئۇچۇرلۇق بولۇشقا '
            'ماسلاشتۇرىدۇ.'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD دوستانە سەپ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('تېخىمۇ دىققەت ۋە ئازراق دىققەت چېچىلىش'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals('بۇ سەپ ADHD ۋە نېرۋا تەرەققىيات بۇزۇقلۇقلىرى '
            'بار كىشىلەرنىڭ ئەپتىكى مۇھىم ئېلېمېنتلارغا '
            'تېخىمۇ ئاسان دىققەت مەركەزلەشتۈرۈشى، '
            'ئوقۇشى ۋە يول تېپىشىغا ياردەم قىلىش ئۈچۈن '
            'دىققەت چېچىلىشلارنى كۆپ دەرىجىدە ئازايتىدۇ.'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('تەڭشەكلەر ئەسلىگە قايتۇرۇلدى.'),
      );
      expect(loc.toggle_dark_mode, equals('قاراڭغۇ ھالەتنى ئالماشتۇرۇش'));
      expect(loc.toggle_effects_mode, equals('ئۈنۈم ھالىتىنى ئالماشتۇرۇش'));
      expect(loc.toggle_font_weight, equals('خەت قېلىنلىقىنى ئالماشتۇرۇش'));
      expect(loc.toggle_theme_profile, equals('ئۇسلۇب سەپىنى ئالماشتۇرۇش'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('نورمال'));
      expect(loc.color_profile('lowSaturation'), equals('تۆۋەن تويۇنۇش'));
      expect(loc.color_profile('normal'), equals('نورمال'));
      expect(
        loc.color_profile('highSaturation'),
        equals('يۇقىرى تويۇنۇش'),
      );
      expect(loc.color_profile('monochrome'), equals('ئاق قارا'));
      expect(loc.color_profile('highContrast'), equals('يۇقىرى كونتراست'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('رەڭ تونۇلمىدى'));
      expect(loc.color('cF44336'), equals('قىزىل'));
      expect(loc.color('cE91E63'), equals('قىزغۇچ'));
      expect(loc.color('c9C27B0'), equals('سۆسۈن'));
      expect(loc.color('c673AB7'), equals('چوڭقۇر سۆسۈن'));
      expect(loc.color('c3F51B5'), equals('كۆك سۆسۈن'));
      expect(loc.color('c2196F3'), equals('كۆك'));
      expect(loc.color('c03A9F4'), equals('يورۇق كۆك'));
      expect(loc.color('c00BCD4'), equals('ياش كۆك'));
      expect(loc.color('c009688'), equals('كۆك يېشىل'));
      expect(loc.color('c4CAF50'), equals('يېشىل'));
      expect(loc.color('c8BC34A'), equals('يورۇق يېشىل'));
      expect(loc.color('cCDDC39'), equals('لىمون يېشىل'));
      expect(loc.color('cFFEB3B'), equals('سېرىق'));
      expect(loc.color('cFFC107'), equals('قەھرىۋا'));
      expect(loc.color('cFF9800'), equals('قىزغۇچ سېرىق'));
      expect(loc.color('cFF5722'), equals('چوڭقۇر قىزغۇچ سېرىق'));
      expect(loc.color('c795548'), equals('قوڭۇر'));
      expect(loc.color('c9E9E9E'), equals('كۈلرەڭ'));
      expect(loc.color('c607D8B'), equals('كۆك كۈلرەڭ'));
    });
  });
}
