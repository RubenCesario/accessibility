// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AccessibilityLocalizationsGu extends AccessibilityLocalizations {
  AccessibilityLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get accessibility => 'સુલભતા';

  @override
  String get accessibility_settings => 'સુલભતા સેટિંગ્સ';

  @override
  String get adjust_background_colors => 'પૃષ્ઠભૂમિના રંગો સમાયોજિત કરો';

  @override
  String get adjust_text_colors => 'ટેક્સ્ટ રંગો સમાયોજિત કરો';

  @override
  String get align_center => 'મધ્યમાં ગોઠવો';

  @override
  String get align_left => 'ડાબે ગોઠવો';

  @override
  String get align_right => 'જમણે ગોઠવો';

  @override
  String get bold_text => 'બોલ્ડ ટેક્સ્ટ';

  @override
  String get change_bold_text => 'બોલ્ડ ટેક્સ્ટ બદલો';

  @override
  String get change_pages_background_color =>
      'પેજોની પૃષ્ઠભૂમિનો રંગ આ પ્રમાણે બદલો: ';

  @override
  String get change_text_color => 'ટેક્સ્ટનો રંગ આ પ્રમાણે બદલો: ';

  @override
  String get change_text_color_shade => 'રંગની છાયા આ પ્રમાણે બદલો: ';

  @override
  String get color_adjustment => 'રંગ સમાયોજન';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'સામાન્ય',
        'lowSaturation': 'ઓછી સંતૃપ્તિ',
        'normal': 'સામાન્ય',
        'highSaturation': 'ઉચ્ચ સંતૃપ્તિ',
        'monochrome': 'મોનોક્રોમ',
        'highContrast': 'ઉચ્ચ કોન્ટ્રાસ્ટ',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'હાલની રંગ પ્રોફાઇલ આ છે: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'રંગ ઓળખાતો નથી',
        'cF44336': 'લાલ',
        'cE91E63': 'ગુલાબી',
        'c9C27B0': 'જાંબલી',
        'c673AB7': 'ઘેરો જાંબલી',
        'c3F51B5': 'ઇન્ડિગો',
        'c2196F3': 'નીલો',
        'c03A9F4': 'હલકો નીલો',
        'c00BCD4': 'સાયન',
        'c009688': 'ટીલ',
        'c4CAF50': 'લીલો',
        'c8BC34A': 'હલકો લીલો',
        'cCDDC39': 'લિંબુ રંગ',
        'cFFEB3B': 'પીળો',
        'cFFC107': 'અંબર',
        'cFF9800': 'નારંગી',
        'cFF5722': 'ઘેરો નારંગી',
        'c795548': 'બ્રાઉન',
        'c9E9E9E': 'ગ્રે',
        'c607D8B': 'નીલો ગ્રે',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'શબ્દ અંતર ઘટાડો';

  @override
  String get decrement_letter_spacing => 'અક્ષર અંતર ઘટાડો';

  @override
  String get decrement_line_height => 'લાઇનની ઊંચાઈ ઘટાડો';

  @override
  String get decrement_text_scale_factor => 'ટેક્સ્ટ સ્કેલ પરિબળ ઘટાડો';

  @override
  String get effects => 'ઇફેક્ટ્સ';

  @override
  String get expand_text => 'ટેક્સ્ટ વિસ્તૃત કરો';

  @override
  String get font_size => 'ફોન્ટનું કદ';

  @override
  String get increase_or_decrease_word_spacing => 'શબ્દ અંતર વધારો અથવા ઘટાડો';

  @override
  String get increase_or_decrease_letter_spacing =>
      'અક્ષર અંતર વધારો અથવા ઘટાડો';

  @override
  String get increase_or_decrease_line_height =>
      'લાઇનની ઊંચાઈ વધારો અથવા ઘટાડો';

  @override
  String get increase_or_decrease_text_size => 'ટેક્સ્ટનું કદ વધારો અથવા ઘટાડો';

  @override
  String get increment_word_spacing => 'શબ્દ અંતર વધારો';

  @override
  String get increment_letter_spacing => 'અક્ષર અંતર વધારો';

  @override
  String get increment_line_height => 'લાઇનની ઊંચાઈ વધારો';

  @override
  String get increment_text_scale_factor => 'ટેક્સ્ટ સ્કેલ પરિબળ વધારો';

  @override
  String get less_info => 'માહિતી છુપાવો';

  @override
  String get letter_spacing => 'અક્ષર અંતર';

  @override
  String get line_height => 'લાઇનની ઊંચાઈ';

  @override
  String get more_info => 'માહિતી દર્શાવો';

  @override
  String get read_less => 'ઓછું વાંચો';

  @override
  String get read_more => 'વધુ વાંચો';

  @override
  String get reduce_effects => 'સ્ક્રીન પરની ઇફેક્ટ્સ ઘટાડો';

  @override
  String get reduce_text => 'ટેક્સ્ટ ઘટાડો';

  @override
  String get restore_settings => 'સેટિંગ્સ પુનઃસ્થાપિત કરો';

  @override
  String get restore_main_color => 'મુખ્ય રંગ પુનઃસ્થાપિત કરો';

  @override
  String get return_to_main_colors => 'મુખ્ય રંગો પર પાછા આવો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get size_and_text_display => 'કદ અને ટેક્સ્ટ ડિસ્પ્લે';

  @override
  String get slider_word_spacing => 'શબ્દ અંતર સ્લાઇડર';

  @override
  String get slider_letter_spacing => 'અક્ષર અંતર સ્લાઇડર';

  @override
  String get slider_line_height => 'લાઇનની ઊંચાઈ સ્લાઇડર';

  @override
  String get theme_mode => 'થીમ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'થીમ પ્રોફાઇલ ઓળખાતી નથી',
        'seizureSafe': 'આંચકી સલામત',
        'visionImpaired': 'દ્રષ્ટિ ખામીવાળું',
        'adhdFriendly': 'ADHD-મૈત્રીપૂર્ણ',
        'none': 'ડિફોલ્ટ',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'આંચકી સલામત પ્રોફાઇલ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'પ્રતિબિંબો દૂર કરો અને રંગ ઘટાડો';

  @override
  String get theme_profile_seizure_safe_description =>
      'આ પ્રોફાઇલ વપરાશકર્તાઓને જેમને વારંવાર આંચકી આવે છે અને જેમને આંચકીનું જોખમ છે તેમને ફ્લેશિંગ એનિમેશન અને જોખમી રંગ સંયોજનોના કારણે થતી આંચકીના જોખમને દૂર કરીને સુરક્ષિત રીતે બ્રાઉઝ કરવા માટે સક્ષમ કરે છે.';

  @override
  String get theme_profile_vision_impaired_title =>
      'દ્રષ્ટિ ખામીવાળું પ્રોફાઇલ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'એપ્લિકેશનની દૃશ્યતા સુધારો';

  @override
  String get theme_profile_vision_impaired_description =>
      'આ પ્રોફાઇલ મોટાભાગની દ્રશ્ટિ ક્ષતિઓ જેવી કે દ્રષ્ટિની ખામી, ટનલ દ્રષ્ટિ, મોતિયો, ગ્લુકોમા અને વધુ માટે એપ્લિકેશનને સુલભ બનાવવા માટે અનુકૂલિત કરે છે.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-મૈત્રીપૂર્ણ પ્રોફાઇલ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'વધુ એકાગ્રતા અને ઓછા વિક્ષેપો';

  @override
  String get theme_profile_adhd_friendly_description =>
      'આ પ્રોફાઇલ ADHD અને ન્યુરોડેવલપમેન્ટલ વિકારોવાળા લોકોને એપ્લિકેશનના મુખ્ય તત્વો પર નેવિગેટ કરવા, વાંચવા અને ધ્યાન કેંદ્રિત કરવામાં મદદ કરવા માટે વિક્ષેપોને નોંધપાત્ર રીતે ઘટાડે છે.';

  @override
  String get the_settings_have_been_reset => 'સેટિંગ્સ રીસેટ કરવામાં આવી છે.';

  @override
  String get toggle_dark_mode => 'ડાર્ક મોડ ટોગલ કરો';

  @override
  String get toggle_effects_mode => 'ઇફેક્ટ્સ મોડ ટોગલ કરો';

  @override
  String get toggle_font_weight => 'ફોન્ટ વજન ટોગલ કરો';

  @override
  String get toggle_theme_profile => 'થીમ પ્રોફાઇલ ટોગલ કરો';

  @override
  String get word_spacing => 'શબ્દ અંતર';
}
