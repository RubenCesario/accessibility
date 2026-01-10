// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AccessibilityLocalizationsEt extends AccessibilityLocalizations {
  AccessibilityLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get accessibility => 'Ligipääsetavus';

  @override
  String get accessibility_settings => 'Ligipääsetavuse seaded';

  @override
  String get adjust_background_colors => 'Kohanda taustavärve';

  @override
  String get adjust_text_colors => 'Kohanda tekstivärve';

  @override
  String get align_center => 'Joonda keskele';

  @override
  String get align_left => 'Joonda vasakule';

  @override
  String get align_right => 'Joonda paremale';

  @override
  String get bold_text => 'Rasvane tekst';

  @override
  String get change_bold_text => 'Muuda teksti paksust';

  @override
  String get change_pages_background_color =>
      'Muuda lehtede taustavärv järgnevaks: ';

  @override
  String get change_text_color => 'Muuda teksti värv järgnevaks: ';

  @override
  String get change_text_color_shade => 'Muuda värvitooni järgnevaks: ';

  @override
  String get color_adjustment => 'Värvikorrektsioon';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normaal',
        'lowSaturation': 'Madal küllastus',
        'normal': 'Normaal',
        'highSaturation': 'Kõrge küllastus',
        'monochrome': 'Monokroomne',
        'highContrast': 'Kõrge kontrastsus',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Praegune värviprofiil on: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Värvi ei tunta ära',
        'cF44336': 'Punane',
        'cE91E63': 'Roosa',
        'c9C27B0': 'Lilla',
        'c673AB7': 'Tumesinine',
        'c3F51B5': 'Indigovärvine',
        'c2196F3': 'Sinine',
        'c03A9F4': 'Helesinine',
        'c00BCD4': 'Tsüaan',
        'c009688': 'Rohekassinine',
        'c4CAF50': 'Roheline',
        'c8BC34A': 'Heleroheline',
        'cCDDC39': 'Laimiroheline',
        'cFFEB3B': 'Kollane',
        'cFFC107': 'Merevaikkollane',
        'cFF9800': 'Oranž',
        'cFF5722': 'Tumeoranž',
        'c795548': 'Pruun',
        'c9E9E9E': 'Hall',
        'c607D8B': 'Sinakashall',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Vähenda sõnadevahelisi vahesid';

  @override
  String get decrement_letter_spacing => 'Vähenda tähtede vahesid';

  @override
  String get decrement_line_height => 'Vähenda reavahet';

  @override
  String get decrement_text_scale_factor => 'Vähenda teksti skaalat';

  @override
  String get effects => 'Efektid';

  @override
  String get expand_text => 'Laienda teksti';

  @override
  String get font_size => 'Fondi suurus';

  @override
  String get increase_or_decrease_word_spacing =>
      'Suurenda või vähenda sõnadevahelisi vahesid';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Suurenda või vähenda tähtede vahesid';

  @override
  String get increase_or_decrease_line_height =>
      'Suurenda või vähenda reavahet';

  @override
  String get increase_or_decrease_text_size =>
      'Suurenda või vähenda teksti suurust';

  @override
  String get increment_word_spacing => 'Suurenda sõnadevahelisi vahesid';

  @override
  String get increment_letter_spacing => 'Suurenda tähtede vahesid';

  @override
  String get increment_line_height => 'Suurenda reavahet';

  @override
  String get increment_text_scale_factor => 'Suurenda teksti skaalat';

  @override
  String get less_info => 'Peida info';

  @override
  String get letter_spacing => 'Tähtede vahed';

  @override
  String get line_height => 'Reavahe';

  @override
  String get more_info => 'Näita infot';

  @override
  String get read_less => 'Loe vähem';

  @override
  String get read_more => 'Loe rohkem';

  @override
  String get reduce_effects => 'Vähenda ekraani efekte';

  @override
  String get reduce_text => 'Vähenda teksti';

  @override
  String get restore_settings => 'Taasta seaded';

  @override
  String get restore_main_color => 'Taasta põhivärv';

  @override
  String get return_to_main_colors => 'Naase põhivärvide juurde';

  @override
  String get settings => 'Seaded';

  @override
  String get size_and_text_display => 'Suurus ja teksti kuva';

  @override
  String get slider_word_spacing => 'Sõnavahed liuguriga';

  @override
  String get slider_letter_spacing => 'Tähevahed liuguriga';

  @override
  String get slider_line_height => 'Reavahe liuguriga';

  @override
  String get theme_mode => 'Kujundus';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Teemaprofiile ei tuvastatud',
        'seizureSafe': 'Epilepsia-ohutu',
        'visionImpaired': 'Nägemispuudega',
        'adhdFriendly': 'ATH-sõbralik',
        'none': 'Vaikimisi',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsia-ohutu profiil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Eemalda peegeldused ja vähenda värve';

  @override
  String get theme_profile_seizure_safe_description =>
      'See profiil võimaldab epilepsiaga ja epilepsiahoogude riskiga kasutajatel sirvida ohutult, kõrvaldades vilkuvatest animatsioonidest ja ohtlikest värvikombinatsioonidest tulenevate hoogude riski.';

  @override
  String get theme_profile_vision_impaired_title => 'Nägemispuudega profiil';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Paranda rakenduse nähtavust';

  @override
  String get theme_profile_vision_impaired_description =>
      'See profiil kohandab rakendust, et see oleks juurdepääsetav enamikule nägemispuuetele, nagu nägemislangus, tunnelnägemine, kataraktid, glaukoom ja muud.';

  @override
  String get theme_profile_adhd_friendly_title => 'ATH-sõbralik profiil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Rohkem keskendumist ja vähem häirefaktoreid';

  @override
  String get theme_profile_adhd_friendly_description =>
      'See profiil vähendab oluliselt tähelepanu hajumist, et aidata ATH ja neuroarenguhäiretega inimestel lihtsamini navigeerida, lugeda ja keskenduda rakenduse olulistele elementidele.';

  @override
  String get the_settings_have_been_reset => 'Seaded on lähtestatud.';

  @override
  String get toggle_dark_mode => 'Lülita tumedat režiimi';

  @override
  String get toggle_effects_mode => 'Lülita efektide režiimi';

  @override
  String get toggle_font_weight => 'Lülita fondi paksust';

  @override
  String get toggle_theme_profile => 'Lülita teemaprofiili';

  @override
  String get word_spacing => 'Sõnadevahelised vahed';

  @override
  String get accessible_font => 'Ligipääsetav font';

  @override
  String get accessible_font_subtitle =>
      'Kasutage parema loetavuse jaoks fonti Verdana';

  @override
  String get accessible_font_enabled => 'Ligipääsetav font lubatud';

  @override
  String get accessible_font_disabled => 'Ligipääsetav font keelatud';

  @override
  String get toggle_accessible_font => 'Lülita ligipääsetavat fonti';
}
