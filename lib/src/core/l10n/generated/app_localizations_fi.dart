// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AccessibilityLocalizationsFi extends AccessibilityLocalizations {
  AccessibilityLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get accessibility => 'Esteettömyys';

  @override
  String get accessibility_settings => 'Esteettömyysasetukset';

  @override
  String get adjust_background_colors => 'Säädä taustavärejä';

  @override
  String get adjust_text_colors => 'Säädä tekstin värejä';

  @override
  String get align_center => 'Keskitä';

  @override
  String get align_left => 'Tasaa vasemmalle';

  @override
  String get align_right => 'Tasaa oikealle';

  @override
  String get bold_text => 'Lihavoitu teksti';

  @override
  String get change_bold_text => 'Muuta lihavoitua tekstiä';

  @override
  String get change_pages_background_color => 'Muuta sivujen taustaväri: ';

  @override
  String get change_text_color => 'Muuta tekstin väri: ';

  @override
  String get change_text_color_shade => 'Muuta värin sävyä: ';

  @override
  String get color_adjustment => 'Värien säätäminen';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normaali',
        'lowSaturation': 'Matala värikylläisyys',
        'normal': 'Normaali',
        'highSaturation': 'Korkea värikylläisyys',
        'monochrome': 'Mustavalko',
        'highContrast': 'Korkea kontrasti',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Nykyinen väriprofiili on: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Väriä ei tunnistettu',
        'cF44336': 'Punainen',
        'cE91E63': 'Pinkki',
        'c9C27B0': 'Violetti',
        'c673AB7': 'Tumma violetti',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Sininen',
        'c03A9F4': 'Vaalean sininen',
        'c00BCD4': 'Syaani',
        'c009688': 'Turkoosi',
        'c4CAF50': 'Vihreä',
        'c8BC34A': 'Vaalean vihreä',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Keltainen',
        'cFFC107': 'Meripihka',
        'cFF9800': 'Oranssi',
        'cFF5722': 'Syvä oranssi',
        'c795548': 'Ruskea',
        'c9E9E9E': 'Harmaa',
        'c607D8B': 'Siniharmaa',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Pienennä sanaetäisyyttä';

  @override
  String get decrement_letter_spacing => 'Pienennä kirjainvälejä';

  @override
  String get decrement_line_height => 'Pienennä rivikorkeuttä';

  @override
  String get decrement_text_scale_factor =>
      'Pienennä tekstin skaalauskerrointa';

  @override
  String get effects => 'Tehosteet';

  @override
  String get expand_text => 'Laajenna tekstiä';

  @override
  String get font_size => 'Fonttikoko';

  @override
  String get increase_or_decrease_word_spacing =>
      'Lisää tai vähennä sanaetäisyyttä';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Lisää tai vähennä kirjainvälejä';

  @override
  String get increase_or_decrease_line_height =>
      'Lisää tai vähennä rivikorkeutta';

  @override
  String get increase_or_decrease_text_size =>
      'Lisää tai vähennä tekstin kokoa';

  @override
  String get increment_word_spacing => 'Kasvata sanaetäisyyttä';

  @override
  String get increment_letter_spacing => 'Kasvata kirjainvälejä';

  @override
  String get increment_line_height => 'Kasvata rivikorkeutta';

  @override
  String get increment_text_scale_factor => 'Kasvata tekstin skaalauskerrointa';

  @override
  String get less_info => 'Piilota tiedot';

  @override
  String get letter_spacing => 'Kirjainväli';

  @override
  String get line_height => 'Rivikorkeus';

  @override
  String get more_info => 'Näytä tiedot';

  @override
  String get read_less => 'Lue vähemmän';

  @override
  String get read_more => 'Lue lisää';

  @override
  String get reduce_effects => 'Vähennä näytön tehosteita';

  @override
  String get reduce_text => 'Pienennä tekstiä';

  @override
  String get restore_settings => 'Palauta asetukset';

  @override
  String get restore_main_color => 'Palauta pääväri';

  @override
  String get return_to_main_colors => 'Palaa pääväreihin';

  @override
  String get settings => 'Asetukset';

  @override
  String get size_and_text_display => 'Koko ja tekstin näyttö';

  @override
  String get slider_word_spacing => 'Sanaetäisyyden liukusäädin';

  @override
  String get slider_letter_spacing => 'Kirjainvälin liukusäädin';

  @override
  String get slider_line_height => 'Rivikorkeuden liukusäädin';

  @override
  String get theme_mode => 'Teema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Teemaprofiilia ei tunnistettu',
        'seizureSafe': 'Kohtausturvallinen',
        'visionImpaired': 'Näkövammainen',
        'adhdFriendly': 'ADHD-ystävällinen',
        'none': 'Oletus',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Kohtausturvallinen profiili';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Poista heijastukset ja vähennä väriä';

  @override
  String get theme_profile_seizure_safe_description =>
      'Tämä profiili mahdollistaa käyttäjille, joilla on epilepsia ja jotka ovat alttiita kohtauksille, turvallisen selaamisen poistamalla välkkyvien animaatioiden ja riskialttiiden väriyhdistelmien aiheuttamat kohtausriskit.';

  @override
  String get theme_profile_vision_impaired_title => 'Näkövammainen profiili';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Paranna sovelluksen näkyvyyttä';

  @override
  String get theme_profile_vision_impaired_description =>
      'Tämä profiili mukauttaa sovelluksen saavutettavaksi useimmille näkövammoille, kuten näkövammaisuus, putkinäkö, kaihi, glaukooma ja muut.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-ystävällinen profiili';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Enemmän keskittymistä ja vähemmän häiriöitä';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Tämä profiili vähentää merkittävästi häiriötekijöitä auttaakseen ADHD:sta ja neuropsykiatrisista häiriöistä kärsiviä ihmisiä navigoimaan, lukemaan ja keskittymään sovelluksen olennaisiin elementteihin helpommin.';

  @override
  String get the_settings_have_been_reset => 'Asetukset on palautettu.';

  @override
  String get toggle_dark_mode => 'Vaihda tumma tila';

  @override
  String get toggle_effects_mode => 'Vaihda tehosteita';

  @override
  String get toggle_font_weight => 'Vaihda fontin paksuutta';

  @override
  String get toggle_theme_profile => 'Vaihda teemaprofiilia';

  @override
  String get word_spacing => 'Sanaetäisyys';
}
