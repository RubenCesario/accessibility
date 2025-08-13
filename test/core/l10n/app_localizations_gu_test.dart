import 'package:accessibility/src/core/l10n/generated/app_localizations_gu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsGu', () {
    late AccessibilityLocalizationsGu loc;

    setUp(() {
      loc = AccessibilityLocalizationsGu();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('gu'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('સુલભતા'));
      expect(loc.accessibility_settings, equals('સુલભતા સેટિંગ્સ'));
      expect(
        loc.adjust_background_colors,
        equals('પૃષ્ઠભૂમિના રંગો સમાયોજિત કરો'),
      );
      expect(loc.adjust_text_colors, equals('ટેક્સ્ટ રંગો સમાયોજિત કરો'));
      expect(loc.align_center, equals('મધ્યમાં ગોઠવો'));
      expect(loc.align_left, equals('ડાબે ગોઠવો'));
      expect(loc.align_right, equals('જમણે ગોઠવો'));
      expect(loc.bold_text, equals('બોલ્ડ ટેક્સ્ટ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('બોલ્ડ ટેક્સ્ટ બદલો'));
      expect(
        loc.change_pages_background_color,
        equals('પેજોની પૃષ્ઠભૂમિનો રંગ આ પ્રમાણે બદલો: '),
      );
      expect(
        loc.change_text_color,
        equals('ટેક્સ્ટનો રંગ આ પ્રમાણે બદલો: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('રંગની છાયા આ પ્રમાણે બદલો: '),
      );
      expect(loc.color_adjustment, equals('રંગ સમાયોજન'));
      expect(
        loc.color_profile_changed_to,
        equals('હાલની રંગ પ્રોફાઇલ આ છે: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('શબ્દ અંતર ઘટાડો'));
      expect(loc.decrement_letter_spacing, equals('અક્ષર અંતર ઘટાડો'));
      expect(loc.decrement_line_height, equals('લાઇનની ઊંચાઈ ઘટાડો'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ટેક્સ્ટ સ્કેલ પરિબળ ઘટાડો'),
      );
      expect(loc.increment_word_spacing, equals('શબ્દ અંતર વધારો'));
      expect(loc.increment_letter_spacing, equals('અક્ષર અંતર વધારો'));
      expect(loc.increment_line_height, equals('લાઇનની ઊંચાઈ વધારો'));
      expect(
        loc.increment_text_scale_factor,
        equals('ટેક્સ્ટ સ્કેલ પરિબળ વધારો'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('શબ્દ અંતર વધારો અથવા ઘટાડો'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('અક્ષર અંતર વધારો અથવા ઘટાડો'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('લાઇનની ઊંચાઈ વધારો અથવા ઘટાડો'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ટેક્સ્ટનું કદ વધારો અથવા ઘટાડો'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ઇફેક્ટ્સ'));
      expect(loc.expand_text, equals('ટેક્સ્ટ વિસ્તૃત કરો'));
      expect(loc.font_size, equals('ફોન્ટનું કદ'));
      expect(loc.less_info, equals('માહિતી છુપાવો'));
      expect(loc.letter_spacing, equals('અક્ષર અંતર'));
      expect(loc.line_height, equals('લાઇનની ઊંચાઈ'));
      expect(loc.more_info, equals('માહિતી દર્શાવો'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ઓછું વાંચો'));
      expect(loc.read_more, equals('વધુ વાંચો'));
      expect(
        loc.reduce_effects,
        equals('સ્ક્રીન પરની ઇફેક્ટ્સ ઘટાડો'),
      );
      expect(loc.reduce_text, equals('ટેક્સ્ટ ઘટાડો'));
      expect(loc.restore_settings, equals('સેટિંગ્સ પુનઃસ્થાપિત કરો'));
      expect(loc.restore_main_color, equals('મુખ્ય રંગ પુનઃસ્થાપિત કરો'));
      expect(
        loc.return_to_main_colors,
        equals('મુખ્ય રંગો પર પાછા આવો'),
      );
      expect(loc.settings, equals('સેટિંગ્સ'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('કદ અને ટેક્સ્ટ ડિસ્પ્લે'));
      expect(loc.slider_word_spacing, equals('શબ્દ અંતર સ્લાઇડર'));
      expect(loc.slider_letter_spacing, equals('અક્ષર અંતર સ્લાઇડર'));
      expect(loc.slider_line_height, equals('લાઇનની ઊંચાઈ સ્લાઇડર'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('થીમ'));
      expect(
        loc.theme_profile('other'),
        equals('થીમ પ્રોફાઇલ ઓળખાતી નથી'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('આંચકી સલામત'));
      expect(loc.theme_profile('visionImpaired'), equals('દ્રષ્ટિ ખામીવાળું'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD-મૈત્રીપૂર્ણ'));
      expect(loc.theme_profile('none'), equals('ડિફોલ્ટ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('આંચકી સલામત પ્રોફાઇલ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('પ્રતિબિંબો દૂર કરો અને રંગ ઘટાડો'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'આ પ્રોફાઇલ વપરાશકર્તાઓને જેમને વારંવાર આંચકી આવે છે અને '
          'જેમને આંચકીનું જોખમ છે તેમને ફ્લેશિંગ એનિમેશન અને '
          'જોખમી રંગ સંયોજનોના કારણે થતી આંચકીના જોખમને દૂર '
          'કરીને સુરક્ષિત રીતે બ્રાઉઝ કરવા માટે સક્ષમ કરે છે.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('દ્રષ્ટિ ખામીવાળું પ્રોફાઇલ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('એપ્લિકેશનની દૃશ્યતા સુધારો'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'આ પ્રોફાઇલ મોટાભાગની દ્રશ્ટિ ક્ષતિઓ જેવી કે દ્રષ્ટિની '
          'ખામી, ટનલ દ્રષ્ટિ, મોતિયો, ગ્લુકોમા અને વધુ માટે '
          'એપ્લિકેશનને સુલભ બનાવવા માટે અનુકૂલિત કરે છે.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-મૈત્રીપૂર્ણ પ્રોફાઇલ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('વધુ એકાગ્રતા અને ઓછા વિક્ષેપો'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'આ પ્રોફાઇલ ADHD અને ન્યુરોડેવલપમેન્ટલ વિકારોવાળા '
          'લોકોને એપ્લિકેશનના મુખ્ય તત્વો પર નેવિગેટ કરવા, '
          'વાંચવા અને ધ્યાન કેંદ્રિત કરવામાં મદદ કરવા માટે '
          'વિક્ષેપોને નોંધપાત્ર રીતે ઘટાડે છે.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('સેટિંગ્સ રીસેટ કરવામાં આવી છે.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('ડાર્ક મોડ ટોગલ કરો'));
      expect(loc.toggle_effects_mode, equals('ઇફેક્ટ્સ મોડ ટોગલ કરો'));
      expect(loc.toggle_font_weight, equals('ફોન્ટ વજન ટોગલ કરો'));
      expect(loc.toggle_theme_profile, equals('થીમ પ્રોફાઇલ ટોગલ કરો'));
      expect(loc.word_spacing, equals('શબ્દ અંતર'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(
        loc.color_profile('lowSaturation'),
        equals('ઓછી સંતૃપ્તિ'),
      );
      expect(loc.color_profile('normal'), equals('સામાન્ય'));
      expect(
        loc.color_profile('highSaturation'),
        equals('ઉચ્ચ સંતૃપ્તિ'),
      );
      expect(loc.color_profile('monochrome'), equals('મોનોક્રોમ'));
      expect(loc.color_profile('highContrast'), equals('ઉચ્ચ કોન્ટ્રાસ્ટ'));
      expect(loc.color_profile('unknown'), equals('સામાન્ય'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('લાલ'));
      expect(loc.color('cE91E63'), equals('ગુલાબી'));
      expect(loc.color('c9C27B0'), equals('જાંબલી'));
      expect(loc.color('c673AB7'), equals('ઘેરો જાંબલી'));
      expect(loc.color('c3F51B5'), equals('ઇન્ડિગો'));
      expect(loc.color('c2196F3'), equals('નીલો'));
      expect(loc.color('c03A9F4'), equals('હલકો નીલો'));
      expect(loc.color('c00BCD4'), equals('સાયન'));
      expect(loc.color('c009688'), equals('ટીલ'));
      expect(loc.color('c4CAF50'), equals('લીલો'));
      expect(loc.color('c8BC34A'), equals('હલકો લીલો'));
      expect(loc.color('cCDDC39'), equals('લિંબુ રંગ'));
      expect(loc.color('cFFEB3B'), equals('પીળો'));
      expect(loc.color('cFFC107'), equals('અંબર'));
      expect(loc.color('cFF9800'), equals('નારંગી'));
      expect(loc.color('cFF5722'), equals('ઘેરો નારંગી'));
      expect(loc.color('c795548'), equals('બ્રાઉન'));
      expect(loc.color('c9E9E9E'), equals('ગ્રે'));
      expect(loc.color('c607D8B'), equals('નીલો ગ્રે'));
      expect(
        loc.color('unknown'),
        equals('રંગ ઓળખાતો નથી'),
      );
    });
  });
}
