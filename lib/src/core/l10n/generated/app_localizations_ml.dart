// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AccessibilityLocalizationsMl extends AccessibilityLocalizations {
  AccessibilityLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get accessibility => 'ആക്സസിബിലിറ്റി';

  @override
  String get accessibility_settings => 'ആക്സസിബിലിറ്റി ക്രമീകരണങ്ങൾ';

  @override
  String get adjust_background_colors => 'പിൻനില നിറങ്ങൾ ക്രമീകരിക്കുക';

  @override
  String get adjust_text_colors => 'ടെക്സ്റ്റ് നിറങ്ങൾ ക്രമീകരിക്കുക';

  @override
  String get align_center => 'നടുവിൽ വിന്യസിക്കുക';

  @override
  String get align_left => 'ഇടത്ത് വിന്യസിക്കുക';

  @override
  String get align_right => 'വലത്ത് വിന്യസിക്കുക';

  @override
  String get bold_text => 'ബോൾഡ് ടെക്സ്റ്റ്';

  @override
  String get change_bold_text => 'ബോൾഡ് ടെക്സ്റ്റ് മാറ്റുക';

  @override
  String get change_pages_background_color => 'പേജുകളുടെ പിൻനിറം മാറ്റുക: ';

  @override
  String get change_text_color => 'ടെക്സ്റ്റിന്റെ നിറം മാറ്റുക: ';

  @override
  String get change_text_color_shade => 'നിറത്തിന്റെ ഷേഡ് മാറ്റുക: ';

  @override
  String get color_adjustment => 'നിറം ക്രമീകരണം';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'സാധാരണം',
        'lowSaturation': 'കുറഞ്ഞ സാച്ചുറേഷൻ',
        'normal': 'സാധാരണം',
        'highSaturation': 'ഉയർന്ന സാച്ചുറേഷൻ',
        'monochrome': 'മോണോക്രോം',
        'highContrast': 'ഉയർന്ന കോൺട്രാസ്റ്റ്',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'നിലവിലെ നിറ പ്രൊഫൈൽ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'നിറം തിരിച്ചറിഞ്ഞിട്ടില്ല',
        'cF44336': 'ചുവപ്പ്',
        'cE91E63': 'പിങ്ക്',
        'c9C27B0': 'പർപ്പിൾ',
        'c673AB7': 'കടും പർപ്പിൾ',
        'c3F51B5': 'ഇന്‍ഡിഗോ',
        'c2196F3': 'നീല',
        'c03A9F4': 'ലൈറ്റ് ബ്ലൂ',
        'c00BCD4': 'സയൻ',
        'c009688': 'ടീൽ',
        'c4CAF50': 'പച്ച',
        'c8BC34A': 'ലൈറ്റ് ഗ്രീൻ',
        'cCDDC39': 'ലൈം',
        'cFFEB3B': 'മഞ്ഞ',
        'cFFC107': 'ആംബർ',
        'cFF9800': 'ഓറഞ്ച്',
        'cFF5722': 'കടും ഓറഞ്ച്',
        'c795548': 'തവിട്ട്',
        'c9E9E9E': 'ചാരനിറം',
        'c607D8B': 'നീല ചാരനിറം',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'വാക്കുകൾ തമ്മിലുള്ള അകലം കുറയ്ക്കുക';

  @override
  String get decrement_letter_spacing => 'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം കുറയ്ക്കുക';

  @override
  String get decrement_line_height => 'വരി ഉയരം കുറയ്ക്കുക';

  @override
  String get decrement_text_scale_factor =>
      'ടെക്സ്റ്റ് സ്കെയിൽ ഫാക്ടർ കുറയ്ക്കുക';

  @override
  String get effects => 'ഇഫക്റ്റുകൾ';

  @override
  String get expand_text => 'ടെക്സ്റ്റ് വിസ്തരിക്കുക';

  @override
  String get font_size => 'ഫോണ്ട് വലിപ്പം';

  @override
  String get increase_or_decrease_word_spacing =>
      'വാക്കുകൾ തമ്മിലുള്ള അകലം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increase_or_decrease_letter_spacing =>
      'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increase_or_decrease_line_height =>
      'വരി ഉയരം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increase_or_decrease_text_size =>
      'ടെക്സ്റ്റ് വലിപ്പം കൂട്ടുക അല്ലെങ്കിൽ കുറയ്ക്കുക';

  @override
  String get increment_word_spacing => 'വാക്കുകൾ തമ്മിലുള്ള അകലം കൂട്ടുക';

  @override
  String get increment_letter_spacing => 'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം കൂട്ടുക';

  @override
  String get increment_line_height => 'വരി ഉയരം കൂട്ടുക';

  @override
  String get increment_text_scale_factor => 'ടെക്സ്റ്റ് സ്കെയിൽ ഫാക്ടർ കൂട്ടുക';

  @override
  String get less_info => 'വിവരങ്ങൾ മറയ്ക്കുക';

  @override
  String get letter_spacing => 'അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം';

  @override
  String get line_height => 'വരി ഉയരം';

  @override
  String get more_info => 'വിവരങ്ങൾ കാണിക്കുക';

  @override
  String get read_less => 'കുറച്ച് വായിക്കുക';

  @override
  String get read_more => 'കൂടുതൽ വായിക്കുക';

  @override
  String get reduce_effects => 'സ്ക്രീനിലെ ഇഫക്റ്റുകൾ കുറയ്ക്കുക';

  @override
  String get reduce_text => 'ടെക്സ്റ്റ് കുറയ്ക്കുക';

  @override
  String get restore_settings => 'ക്രമീകരണങ്ങൾ പുനഃസ്ഥാപിക്കുക';

  @override
  String get restore_main_color => 'പ്രധാന നിറം പുനഃസ്ഥാപിക്കുക';

  @override
  String get return_to_main_colors => 'പ്രധാന നിറങ്ങളിലേക്ക് മടങ്ങുക';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get size_and_text_display => 'വലിപ്പവും ടെക്സ്റ്റ് പ്രദർശനവും';

  @override
  String get slider_word_spacing => 'സ്ലൈഡർ വാക്കുകൾ തമ്മിലുള്ള അകലം';

  @override
  String get slider_letter_spacing => 'സ്ലൈഡർ അക്ഷരങ്ങൾ തമ്മിലുള്ള അകലം';

  @override
  String get slider_line_height => 'സ്ലൈഡർ വരി ഉയരം';

  @override
  String get theme_mode => 'തീം';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'തീം പ്രൊഫൈൽ തിരിച്ചറിഞ്ഞിട്ടില്ല',
        'seizureSafe': 'അപസ്മാരം സുരക്ഷിതം',
        'visionImpaired': 'കാഴ്ച വെകല്യമുള്ളവർക്ക്',
        'adhdFriendly': 'ADHD സൌഹൃദം',
        'none': 'സ്ഥിരം',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'അപസ്മാരം സുരക്ഷിത പ്രൊഫൈൽ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'പ്രതിഫലനങ്ങൾ നീക്കം ചെയ്യുകയും നിറം കുറയ്ക്കുകയും ചെയ്യുക';

  @override
  String get theme_profile_seizure_safe_description =>
      'മിന്നുന്ന ആനിമേഷനുകളിൽ നിന്നും അപകടകരമായ വർണ്ണ സംയോജനങ്ങളിൽ നിന്നും ഉണ്ടാകുന്ന അപസ്മാരങ്ങളുടെ അപകടസാധ്യത ഇല്ലാതാക്കി അപസ്മാരമുള്ളവർക്കും അപസ്മാരത്തിന്റെ അപകടസാധ്യതയുള്ളവർക്കും സുരക്ഷിതമായി ബ്രൗസ് ചെയ്യാൻ ഈ പ്രൊഫൈൽ ഉപയോക്താക്കളെ സഹായിക്കുന്നു.';

  @override
  String get theme_profile_vision_impaired_title =>
      'കാഴ്ച വെകല്യം ഉള്ളവർക്കുള്ള പ്രൊഫൈൽ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ആപ്ലിക്കേഷന്റെ ദൃശ്യത മെച്ചപ്പെടുത്തുക';

  @override
  String get theme_profile_vision_impaired_description =>
      'കാഴ്ചവെകല്യം, ടണൽ കാഴ്ച, തിമിരം, ഗ്ലോക്കോമ തുടങ്ങിയ മിക്ക കാഴ്ച വെകല്യങ്ങളുള്ളവർക്കും ആക്സസ് ചെയ്യാൻ കഴിയുന്ന രീതിയിൽ ഈ പ്രൊഫൈൽ ആപ്ലിക്കേഷൻ അനുയോജ്യമാക്കുന്നു.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD സൌഹൃദ പ്രൊഫൈൽ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'കൂടുതൽ ഏകാഗ്രതയും കുറഞ്ഞ ശ്രദ്ധ വിട്ടുമാറ്റലുകളും';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ഈ പ്രൊഫൈൽ ADHD യും ന്യൂറോഡെവലപ്‌മെന്റൽ അപാകതകളുമുള്ള ആളുകൾക്ക് ആപ്ലിക്കേഷന്റെ അവശ്യഘടകങ്ങളിൽ എളുപ്പം നാവിഗേറ്റ് ചെയ്യാനും, വായിക്കാനും, ശ്രദ്ധ കേന്ദ്രീകരിക്കാനും സഹായിക്കുന്നതിന് ശ്രദ്ധ വിട്ടുമാറ്റലുകൾ ഗണ്യമായി കുറയ്ക്കുന്നു.';

  @override
  String get the_settings_have_been_reset =>
      'ക്രമീകരണങ്ങൾ പുനഃക്രമീകരിച്ചിരിക്കുന്നു.';

  @override
  String get toggle_dark_mode => 'ഡാർക്ക് മോഡ് ടോഗിൾ ചെയ്യുക';

  @override
  String get toggle_effects_mode => 'ഇഫക്റ്റ്സ് മോഡ് ടോഗിൾ ചെയ്യുക';

  @override
  String get toggle_font_weight => 'ഫോണ്ട് തടി ടോഗിൾ ചെയ്യുക';

  @override
  String get toggle_theme_profile => 'തീം പ്രൊഫൈൽ ടോഗിൾ ചെയ്യുക';

  @override
  String get word_spacing => 'വാക്കുകൾ തമ്മിലുള്ള അകലം';
}
