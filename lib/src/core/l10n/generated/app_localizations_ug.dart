// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AccessibilityLocalizationsUg extends AccessibilityLocalizations {
  AccessibilityLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get accessibility => 'ئۇچۇرلۇق';

  @override
  String get accessibility_settings => 'ئۇچۇرلۇق تەڭشەكلەر';

  @override
  String get adjust_background_colors => 'ئارقا كۆرۈنۈش رەڭلەرنى تەڭشەش';

  @override
  String get adjust_text_colors => 'تېكىست رەڭلەرنى تەڭشەش';

  @override
  String get align_center => 'ئوتتۇرىغا تەڭشەش';

  @override
  String get align_left => 'سولغا تەڭشەش';

  @override
  String get align_right => 'ئوڭغا تەڭشەش';

  @override
  String get bold_text => 'توم تېكىست';

  @override
  String get change_bold_text => 'توم تېكىستنى ئۆزگەرتىش';

  @override
  String get change_pages_background_color =>
      'بەتلەرنىڭ ئارقا كۆرۈنۈش رەڭلەرىنى ئۆزگەرتىش: ';

  @override
  String get change_text_color => 'تېكىست رەڭلەرىنى ئۆزگەرتىش: ';

  @override
  String get change_text_color_shade => 'رەڭ سايىسىنى ئۆزگەرتىش: ';

  @override
  String get color_adjustment => 'رەڭ تەڭشەش';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'نورمال',
        'lowSaturation': 'تۆۋەن تويۇنۇش',
        'normal': 'نورمال',
        'highSaturation': 'يۇقىرى تويۇنۇش',
        'monochrome': 'ئاق قارا',
        'highContrast': 'يۇقىرى كونتراست',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'ھازىرقى رەڭ سەپى: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'رەڭ تونۇلمىدى',
        'cF44336': 'قىزىل',
        'cE91E63': 'قىزغۇچ',
        'c9C27B0': 'سۆسۈن',
        'c673AB7': 'چوڭقۇر سۆسۈن',
        'c3F51B5': 'كۆك سۆسۈن',
        'c2196F3': 'كۆك',
        'c03A9F4': 'يورۇق كۆك',
        'c00BCD4': 'ياش كۆك',
        'c009688': 'كۆك يېشىل',
        'c4CAF50': 'يېشىل',
        'c8BC34A': 'يورۇق يېشىل',
        'cCDDC39': 'لىمون يېشىل',
        'cFFEB3B': 'سېرىق',
        'cFFC107': 'قەھرىۋا',
        'cFF9800': 'قىزغۇچ سېرىق',
        'cFF5722': 'چوڭقۇر قىزغۇچ سېرىق',
        'c795548': 'قوڭۇر',
        'c9E9E9E': 'كۈلرەڭ',
        'c607D8B': 'كۆك كۈلرەڭ',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'سۆز ئارىلىقىنى ئازايتىش';

  @override
  String get decrement_letter_spacing => 'ھەرپ ئارىلىقىنى ئازايتىش';

  @override
  String get decrement_line_height => 'قۇر ئېگىزلىكىنى ئازايتىش';

  @override
  String get decrement_text_scale_factor => 'تېكىست مىقدارىنى ئازايتىش';

  @override
  String get effects => 'ئۈنۈملەر';

  @override
  String get expand_text => 'تېكىستنى كېڭەيتىش';

  @override
  String get font_size => 'خەت چوڭلۇقى';

  @override
  String get increase_or_decrease_word_spacing =>
      'سۆز ئارىلىقىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increase_or_decrease_letter_spacing =>
      'ھەرپ ئارىلىقىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increase_or_decrease_line_height =>
      'قۇر ئېگىزلىكىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increase_or_decrease_text_size =>
      'تېكىست چوڭلۇقىنى كۆپەيتىش ياكى ئازايتىش';

  @override
  String get increment_word_spacing => 'سۆز ئارىلىقىنى كۆپەيتىش';

  @override
  String get increment_letter_spacing => 'ھەرپ ئارىلىقىنى كۆپەيتىش';

  @override
  String get increment_line_height => 'قۇر ئېگىزلىكىنى كۆپەيتىش';

  @override
  String get increment_text_scale_factor => 'تېكىست مىقدارىنى كۆپەيتىش';

  @override
  String get less_info => 'ئۇچۇرنى يوشۇرۇش';

  @override
  String get letter_spacing => 'ھەرپ ئارىلىقى';

  @override
  String get line_height => 'قۇر ئېگىزلىكى';

  @override
  String get more_info => 'ئۇچۇرنى كۆرسىتىش';

  @override
  String get read_less => 'ئازراق ئوقۇش';

  @override
  String get read_more => 'كۆپرەك ئوقۇش';

  @override
  String get reduce_effects => 'ئېكران ئۈنۈملىرىنى ئازايتىش';

  @override
  String get reduce_text => 'تېكىستنى ئازايتىش';

  @override
  String get restore_settings => 'تەڭشەكلەرنى ئەسلىگە كەلتۈرۈش';

  @override
  String get restore_main_color => 'ئاساسىي رەڭنى ئەسلىگە كەلتۈرۈش';

  @override
  String get return_to_main_colors => 'ئاساسىي رەڭلەرگە قايتىش';

  @override
  String get settings => 'تەڭشەكلەر';

  @override
  String get size_and_text_display => 'چوڭلۇق ۋە تېكىست كۆرسىتىش';

  @override
  String get slider_word_spacing => 'سۆز ئارىلىقى سۈرگۈچى';

  @override
  String get slider_letter_spacing => 'ھەرپ ئارىلىقى سۈرگۈچى';

  @override
  String get slider_line_height => 'قۇر ئېگىزلىكى سۈرگۈچى';

  @override
  String get theme_mode => 'ئۇسلۇب';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'ئۇسلۇب سەپى تونۇلمىدى',
        'seizureSafe': 'تۇتقاققا بىخەتەر',
        'visionImpaired': 'كۆرۈش ئاجىزلىقى',
        'adhdFriendly': 'ADHD دوستانە',
        'none': 'كۆنۈپكى ھالەت',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'تۇتقاققا بىخەتەر سەپ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'چاقناشلارنى يوقىتىش ۋە رەڭنى ئازايتىش';

  @override
  String get theme_profile_seizure_safe_description =>
      'بۇ سەپ تۇتقاق كېسىلى بار ۋە تۇتقاق خەۋپى بولغان ئىشلەتكۈچىلەرنىڭ چاقنايدىغان ئانىماتسىيە ۋە خەتەرلىك رەڭ بىرىكمىلىرىدىن كېلىدىغان تۇتقاق خەۋپىنى يوقىتىپ، بىخەتەر كۆرۈشىنى ئىشقا ئاشۇرىدۇ.';

  @override
  String get theme_profile_vision_impaired_title => 'كۆرۈش ئاجىزلىقى سەپى';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ئەپنىڭ كۆرۈنۈشىنى ياخشىلاش';

  @override
  String get theme_profile_vision_impaired_description =>
      'بۇ سەپ ئەپنى كۆرۈش ئاجىزلىقى، تۇننېل كۆرۈش، كاتاراكتا، گلاۋكوما ۋە باشقا كۆپ خىل كۆرۈش ئاجىزلىقلىرىغا ئۇچۇرلۇق بولۇشقا ماسلاشتۇرىدۇ.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD دوستانە سەپ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'تېخىمۇ دىققەت ۋە ئازراق دىققەت چېچىلىش';

  @override
  String get theme_profile_adhd_friendly_description =>
      'بۇ سەپ ADHD ۋە نېرۋا تەرەققىيات بۇزۇقلۇقلىرى بار كىشىلەرنىڭ ئەپتىكى مۇھىم ئېلېمېنتلارغا تېخىمۇ ئاسان دىققەت مەركەزلەشتۈرۈشى، ئوقۇشى ۋە يول تېپىشىغا ياردەم قىلىش ئۈچۈن دىققەت چېچىلىشلارنى كۆپ دەرىجىدە ئازايتىدۇ.';

  @override
  String get the_settings_have_been_reset => 'تەڭشەكلەر ئەسلىگە قايتۇرۇلدى.';

  @override
  String get toggle_dark_mode => 'قاراڭغۇ ھالەتنى ئالماشتۇرۇش';

  @override
  String get toggle_effects_mode => 'ئۈنۈم ھالىتىنى ئالماشتۇرۇش';

  @override
  String get toggle_font_weight => 'خەت قېلىنلىقىنى ئالماشتۇرۇش';

  @override
  String get toggle_theme_profile => 'ئۇسلۇب سەپىنى ئالماشتۇرۇش';

  @override
  String get word_spacing => 'سۆز ئارىلىقى';

  @override
  String get accessible_font => 'ئۇچۇرلۇق خەت نۇسخىسى';

  @override
  String get accessible_font_subtitle =>
      'تېخىمۇ ياخشى ئوقۇش ئۈچۈن Verdana خەت نۇسخىسىنى ئىشلىتىڭ';

  @override
  String get accessible_font_enabled => 'ئۇچۇرلۇق خەت نۇسخىسى قوزغىتىلدى';

  @override
  String get accessible_font_disabled => 'ئۇچۇرلۇق خەت نۇسخىسى چەكلەندى';

  @override
  String get toggle_accessible_font => 'ئۇچۇرلۇق خەت نۇسخىسىنى ئالماشتۇرۇش';
}
