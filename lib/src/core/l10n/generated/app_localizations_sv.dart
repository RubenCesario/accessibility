// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AccessibilityLocalizationsSv extends AccessibilityLocalizations {
  AccessibilityLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get accessibility => 'Tillgänglighet';

  @override
  String get accessibility_settings => 'Tillgänglighetsinställningar';

  @override
  String get adjust_background_colors => 'Justera bakgrundsfärger';

  @override
  String get adjust_text_colors => 'Justera textfärger';

  @override
  String get align_center => 'Centrera';

  @override
  String get align_left => 'Vänsterjustera';

  @override
  String get align_right => 'Högerjustera';

  @override
  String get bold_text => 'Fet text';

  @override
  String get change_bold_text => 'Ändra fet text';

  @override
  String get change_pages_background_color =>
      'Ändra sidornas bakgrundsfärg till: ';

  @override
  String get change_text_color => 'Ändra textens färg till: ';

  @override
  String get change_text_color_shade => 'Ändra färgnyansen till: ';

  @override
  String get color_adjustment => 'Färgjustering';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Låg mättnad',
        'normal': 'Normal',
        'highSaturation': 'Hög mättnad',
        'monochrome': 'Monokrom',
        'highContrast': 'Hög kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Aktuell färgprofil är: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Färg känns inte igen',
        'cF44336': 'Röd',
        'cE91E63': 'Rosa',
        'c9C27B0': 'Lila',
        'c673AB7': 'Mörklila',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Blå',
        'c03A9F4': 'Ljusblå',
        'c00BCD4': 'Cyan',
        'c009688': 'Blågrön',
        'c4CAF50': 'Grön',
        'c8BC34A': 'Ljusgrön',
        'cCDDC39': 'Lime',
        'cFFEB3B': 'Gul',
        'cFFC107': 'Bärnsten',
        'cFF9800': 'Orange',
        'cFF5722': 'Mörkorange',
        'c795548': 'Brun',
        'c9E9E9E': 'Grå',
        'c607D8B': 'Blågrå',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Minska ordavstånd';

  @override
  String get decrement_letter_spacing => 'Minska bokstavsavstånd';

  @override
  String get decrement_line_height => 'Minska radhöjd';

  @override
  String get decrement_text_scale_factor => 'Minska textskalfaktor';

  @override
  String get effects => 'Effekter';

  @override
  String get expand_text => 'Expandera text';

  @override
  String get font_size => 'Textstorlek';

  @override
  String get increase_or_decrease_word_spacing => 'Öka eller minska ordavstånd';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Öka eller minska bokstavsavstånd';

  @override
  String get increase_or_decrease_line_height => 'Öka eller minska radhöjd';

  @override
  String get increase_or_decrease_text_size => 'Öka eller minska textstorlek';

  @override
  String get increment_word_spacing => 'Öka ordavstånd';

  @override
  String get increment_letter_spacing => 'Öka bokstavsavstånd';

  @override
  String get increment_line_height => 'Öka radhöjd';

  @override
  String get increment_text_scale_factor => 'Öka textskalfaktor';

  @override
  String get less_info => 'Dölj information';

  @override
  String get letter_spacing => 'Bokstavsavstånd';

  @override
  String get line_height => 'Radhöjd';

  @override
  String get more_info => 'Visa information';

  @override
  String get read_less => 'Läs mindre';

  @override
  String get read_more => 'Läs mer';

  @override
  String get reduce_effects => 'Minska effekter på skärmen';

  @override
  String get reduce_text => 'Minska text';

  @override
  String get restore_settings => 'Återställ inställningar';

  @override
  String get restore_main_color => 'Återställ huvudfärg';

  @override
  String get return_to_main_colors => 'Återgå till huvudfärger';

  @override
  String get settings => 'Inställningar';

  @override
  String get size_and_text_display => 'Storlek och textvisning';

  @override
  String get slider_word_spacing => 'Reglage för ordavstånd';

  @override
  String get slider_letter_spacing => 'Reglage för bokstavsavstånd';

  @override
  String get slider_line_height => 'Reglage för radhöjd';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Temaprofil känns inte igen',
        'seizureSafe': 'Epilepsivänlig',
        'visionImpaired': 'Synnedsatt',
        'adhdFriendly': 'ADHD-vänlig',
        'none': 'Standard',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Epilepsivänlig profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Ta bort reflektioner och minska färg';

  @override
  String get theme_profile_seizure_safe_description =>
      'Denna profil gör det möjligt för användare som har epilepsi och löper risk för anfall att surfa säkert genom att eliminera risken för anfall som orsakas av blinkande animationer och riskfyllda färgkombinationer.';

  @override
  String get theme_profile_vision_impaired_title => 'Profil för synnedsatta';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Förbättra synligheten i applikationen';

  @override
  String get theme_profile_vision_impaired_description =>
      'Denna profil anpassar applikationen för att vara tillgänglig för de flesta synnedsattningar, såsom synnedsattning, tunnelseende, grå starr, glöm och mer.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-vänlig profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Mer koncentration och mindre distraktioner';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Denna profil minskar distraktioner avseende, för att hjälpa personer med ADHD och neuroutvecklingsstörningar att navigera, läsa och fokusera på de väsentliga elementen i applikationen enklare.';

  @override
  String get the_settings_have_been_reset => 'Inställningarna har återställts.';

  @override
  String get toggle_dark_mode => 'Växla mörkt läge';

  @override
  String get toggle_effects_mode => 'Växla effektläge';

  @override
  String get toggle_font_weight => 'Växla texttjocklek';

  @override
  String get toggle_theme_profile => 'Växla temaprofil';

  @override
  String get word_spacing => 'Ordavstånd';

  @override
  String get accessible_font => 'Tillgängligt typsnitt';

  @override
  String get accessible_font_subtitle =>
      'Använd Verdana-typsnitt för bättre läsbarhet';

  @override
  String get accessible_font_enabled => 'Tillgängligt typsnitt aktiverat';

  @override
  String get accessible_font_disabled => 'Tillgängligt typsnitt inaktiverat';

  @override
  String get toggle_accessible_font => 'Växla tillgängligt typsnitt';
}
