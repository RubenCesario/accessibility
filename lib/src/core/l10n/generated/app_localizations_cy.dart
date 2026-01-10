// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AccessibilityLocalizationsCy extends AccessibilityLocalizations {
  AccessibilityLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get accessibility => 'Hygyrchedd';

  @override
  String get accessibility_settings => 'Gosodiadau hygyrchedd';

  @override
  String get adjust_background_colors => 'Addasu lliwiau cefndir';

  @override
  String get adjust_text_colors => 'Addasu lliwiau testun';

  @override
  String get align_center => 'Alinio i\'r canol';

  @override
  String get align_left => 'Alinio i\'r chwith';

  @override
  String get align_right => 'Alinio i\'r dde';

  @override
  String get bold_text => 'Testun bras';

  @override
  String get change_bold_text => 'Newid testun bras';

  @override
  String get change_pages_background_color =>
      'Newid lliw cefndir y tudalennau i: ';

  @override
  String get change_text_color => 'Newid lliw testun i: ';

  @override
  String get change_text_color_shade => 'Newid arlliw lliw i: ';

  @override
  String get color_adjustment => 'Addasiad lliw';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Arferol',
        'lowSaturation': 'Dirlawnder isel',
        'normal': 'Arferol',
        'highSaturation': 'Dirlawnder uchel',
        'monochrome': 'Du a gwyn',
        'highContrast': 'Cyferbyniad uchel',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Y proffil lliw presennol yw: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Lliw heb ei gydnabod',
        'cF44336': 'Coch',
        'cE91E63': 'Pinc',
        'c9C27B0': 'Porffor',
        'c673AB7': 'Porffor Tywyll',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Glas',
        'c03A9F4': 'Glas Golau',
        'c00BCD4': 'Cyan',
        'c009688': 'Gwyrddlas',
        'c4CAF50': 'Gwyrdd',
        'c8BC34A': 'Gwyrdd Golau',
        'cCDDC39': 'Leim',
        'cFFEB3B': 'Melyn',
        'cFFC107': 'Ambr',
        'cFF9800': 'Oren',
        'cFF5722': 'Oren Tywyll',
        'c795548': 'Brown',
        'c9E9E9E': 'Llwyd',
        'c607D8B': 'Llwyd Glas',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Lleihau bylchau rhwng geiriau';

  @override
  String get decrement_letter_spacing => 'Lleihau bylchau rhwng llythrennau';

  @override
  String get decrement_line_height => 'Lleihau uchder llinell';

  @override
  String get decrement_text_scale_factor => 'Lleihau ffactor graddio testun';

  @override
  String get effects => 'Effeithiau';

  @override
  String get expand_text => 'Ehangu testun';

  @override
  String get font_size => 'Maint ffont';

  @override
  String get increase_or_decrease_word_spacing =>
      'Cynyddu neu leihau bylchau rhwng geiriau';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Cynyddu neu leihau bylchau rhwng llythrennau';

  @override
  String get increase_or_decrease_line_height =>
      'Cynyddu neu leihau uchder llinell';

  @override
  String get increase_or_decrease_text_size =>
      'Cynyddu neu leihau maint testun';

  @override
  String get increment_word_spacing => 'Cynyddu bylchau rhwng geiriau';

  @override
  String get increment_letter_spacing => 'Cynyddu bylchau rhwng llythrennau';

  @override
  String get increment_line_height => 'Cynyddu uchder llinell';

  @override
  String get increment_text_scale_factor => 'Cynyddu ffactor graddio testun';

  @override
  String get less_info => 'Cuddio gwybodaeth';

  @override
  String get letter_spacing => 'Bylchau llythrennau';

  @override
  String get line_height => 'Uchder llinell';

  @override
  String get more_info => 'Dangos gwybodaeth';

  @override
  String get read_less => 'Darllen llai';

  @override
  String get read_more => 'Darllen mwy';

  @override
  String get reduce_effects => 'Lleihau effeithiau ar y sgrin';

  @override
  String get reduce_text => 'Lleihau testun';

  @override
  String get restore_settings => 'Adfer gosodiadau';

  @override
  String get restore_main_color => 'Adfer prif liw';

  @override
  String get return_to_main_colors => 'Dychwelyd i\'r prif liwiau';

  @override
  String get settings => 'Gosodiadau';

  @override
  String get size_and_text_display => 'Maint a dangosiad testun';

  @override
  String get slider_word_spacing => 'Llithrydd bylchau geiriau';

  @override
  String get slider_letter_spacing => 'Llithrydd bylchau llythrennau';

  @override
  String get slider_line_height => 'Llithrydd uchder llinell';

  @override
  String get theme_mode => 'Thema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Proffil thema heb ei gydnabod',
        'seizureSafe': 'Diogel rhag ffit',
        'visionImpaired': 'Nam ar y golwg',
        'adhdFriendly': 'Cyfeillgar i ADHD',
        'none': 'Rhagosodedig',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Proffil diogel rhag ffit';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Dileu adlewyrchiadau a lleihau lliw';

  @override
  String get theme_profile_seizure_safe_description =>
      'Mae\'r proffil hwn yn galluogi defnyddwyr sydd ag epilepsi ac sydd mewn perygl o ffitiau i bori\'n ddiogel trwy ddileu\'r risg o ffitiau sy\'n deillio o animeiddiadau fflachio a chyfuniadau lliw peryglus.';

  @override
  String get theme_profile_vision_impaired_title => 'Proffil nam ar y golwg';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Gwella gwelededd y rhaglen';

  @override
  String get theme_profile_vision_impaired_description =>
      'Mae\'r proffil hwn yn addasu\'r rhaglen i fod yn hygyrch i\'r rhan fwyaf o namau ar y golwg, megis nam ar y golwg, golwg twnnel, cataractau, glawcoma a mwy.';

  @override
  String get theme_profile_adhd_friendly_title => 'Proffil cyfeillgar i ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mwy o ganolbwyntio a llai o dargyfeiriadau';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Mae\'r proffil hwn yn lleihau tynnu sylw yn sylweddol, i helpu pobl ag ADHD ac anhwylderau niwroddatblygiadol i lywio, darllen, a chanolbwyntio ar elfennau hanfodol y rhaglen yn haws.';

  @override
  String get the_settings_have_been_reset =>
      'Mae\'r gosodiadau wedi\'u hailosod.';

  @override
  String get toggle_dark_mode => 'Toglo modd tywyll';

  @override
  String get toggle_effects_mode => 'Toglo modd effeithiau';

  @override
  String get toggle_font_weight => 'Toglo pwysau ffont';

  @override
  String get toggle_theme_profile => 'Toglo proffil thema';

  @override
  String get word_spacing => 'Bylchau geiriau';

  @override
  String get accessible_font => 'Ffont hygyrch';

  @override
  String get accessible_font_subtitle =>
      'Defnyddiwch ffont Verdana ar gyfer darllenedd gwell';

  @override
  String get accessible_font_enabled => 'Ffont hygyrch wedi\'i galluogi';

  @override
  String get accessible_font_disabled => 'Ffont hygyrch wedi\'i analluogi';

  @override
  String get toggle_accessible_font => 'Toglo ffont hygyrch';
}
