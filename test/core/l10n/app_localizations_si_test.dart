import 'package:accessibility/src/core/l10n/generated/app_localizations_si.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsSi', () {
    late AccessibilityLocalizationsSi loc;

    setUp(() {
      loc = AccessibilityLocalizationsSi();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('si'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ප්‍රවේශ්‍යතාව'));
      expect(
        loc.accessibility_settings,
        equals('ප්‍රවේශ්‍යතා සැකසීම්'),
      );
      expect(
        loc.adjust_background_colors,
        equals('පසුබිම් වර්ණ සකසන්න'),
      );
      expect(loc.adjust_text_colors, equals('පෙළ වර්ණ සකසන්න'));
      expect(loc.align_center, equals('මධ්‍යයට පෙළ ගස්වන්න'));
      expect(loc.align_left, equals('වමට පෙළ ගස්වන්න'));
      expect(loc.align_right, equals('දකුණට පෙළ ගස්වන්න'));
      expect(loc.bold_text, equals('තද පෙළ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('තද පෙළ වෙනස් කරන්න'));
      expect(
        loc.change_pages_background_color,
        equals('පිටුවල පසුබිම් වර්ණය වෙනස් කරන්න: '),
      );
      expect(loc.change_text_color, equals('පෙළ වර්ණය වෙනස් කරන්න: '));
      expect(
        loc.change_text_color_shade,
        equals('වර්ණයේ ශේඩ් වෙනස් කරන්න: '),
      );
      expect(loc.color_adjustment, equals('වර්ණ ගැලපීම'));
      expect(
        loc.color_profile_changed_to,
        equals('වර්තමාන වර්ණ පැතිකඩ: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('වචන අතර පරතරය අඩු කරන්න'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('අකුරු අතර පරතරය අඩු කරන්න'),
      );
      expect(loc.decrement_line_height, equals('පේළි උස අඩු කරන්න'));
      expect(
        loc.decrement_text_scale_factor,
        equals('පෙළ පරිමාණ සාධකය අඩු කරන්න'),
      );
      expect(
        loc.increment_word_spacing,
        equals('වචන අතර පරතරය වැඩි කරන්න'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('අකුරු අතර පරතරය වැඩි කරන්න'),
      );
      expect(loc.increment_line_height, equals('පේළි උස වැඩි කරන්න'));
      expect(
        loc.increment_text_scale_factor,
        equals('පෙළ පරිමාණ සාධකය වැඩි කරන්න'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('වචන අතර පරතරය වැඩි හෝ අඩු කරන්න'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('අකුරු අතර පරතරය වැඩි හෝ අඩු කරන්න'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('පේළි උස වැඩි හෝ අඩු කරන්න'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('පෙළ ප්‍රමාණය වැඩි හෝ අඩු කරන්න'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('බලපෑම්'));
      expect(loc.expand_text, equals('පෙළ විස්තීරණය කරන්න'));
      expect(loc.font_size, equals('අකුරු ප්‍රමාණය'));
      expect(loc.less_info, equals('තොරතුරු සඟවන්න'));
      expect(loc.letter_spacing, equals('අකුරු අතර පරතරය'));
      expect(loc.line_height, equals('පේළි උස'));
      expect(loc.more_info, equals('තොරතුරු පෙන්වන්න'));
      expect(loc.word_spacing, equals('වචන අතර පරතරය'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('අඩුවෙන් කියවන්න'));
      expect(loc.read_more, equals('වැඩියෙන් කියවන්න'));
      expect(
        loc.reduce_effects,
        equals('තිරයට ඇති බලපෑම් අඩු කරන්න'),
      );
      expect(loc.reduce_text, equals('පෙළ අඩු කරන්න'));
      expect(loc.restore_settings, equals('සැකසීම් නැවත සකසන්න'));
      expect(loc.restore_main_color, equals('ප්‍රධාන වර්ණය නැවත සකසන්න'));
      expect(
        loc.return_to_main_colors,
        equals('ප්‍රධාන වර්ණ වලට නැවත යන්න'),
      );
      expect(loc.settings, equals('සැකසීම්'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ප්‍රමාණය සහ පෙළ ප්‍රදර්ශනය'),
      );
      expect(
        loc.slider_word_spacing,
        equals('වචන අතර පරතරය ස්ලයිඩරය'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('අකුරු අතර පරතරය ස්ලයිඩරය'),
      );
      expect(loc.slider_line_height, equals('පේළි උස ස්ලයිඩරය'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('තේමාව'));
      expect(
        loc.theme_profile('other'),
        equals('තේමා පැතිකඩ හඳුනාගත නොහැක'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('අපස්මාරයෙන් ආරක්ෂිත'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('දෘෂ්ටි ආබාධිත'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD හිතකාමී'),
      );
      expect(loc.theme_profile('none'), equals('පෙරනිමි'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('අපස්මාරයෙන් ආරක්ෂිත පැතිකඩ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ප්‍රතිබිම්බ ඉවත් කර වර්ණ අඩු කරන්න'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'මෙම පැතිකඩ මගින් අපස්මාර රෝගය ඇති සහ අපස්මාර '
          'අවදානමක් ඇති පරිශීලකයින්ට විද්යුත් සංචලන සහ '
          'අවදානම් සහිත වර්ණ සංයෝග මගින් ඇතිවන අපස්මාර '
          'අවදානම ඉවත් කරමින් ආරක්ෂිතව පිරික්සීමට ඉඩ '
          'සලසයි.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('දෘෂ්ටි ආබාධිත පැතිකඩ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('යෙදුමේ දෘශ්‍යමානතාවය වැඩි දියුණු කරන්න'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'මෙම පැතිකඩ යෙදුම දෘෂ්ටි ආබාධ, ටනල් දෘෂ්ටිය, '
          'කැටරැක්ට්, ග්ලූකෝමා සහ තවත් බොහෝ දෘෂ්ටි ආබාධ '
          'සහිත පුද්ගලයින්ට ප්‍රවේශ විය හැකි පරිදි යෙදුම '
          'අනුවර්තනය කරයි.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-හිතකාමී පැතිකඩ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('වැඩි අවධානයක් සහ අඩු විසිරීමක්'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'මෙම පැතිකඩ මගින් ADHD සහ ස්නායු සංවර්ධන ආබාධ '
          'සහිත පුද්ගලයින්ට යෙදුමේ අත්‍යවශ්‍ය කොටස් වලට '
          'පහසුවෙන් සංචාලනය කිරීමට, කියවීමට සහ අවධානය '
          'යොමු කිරීමට උපකාර වන පරිදි විසිරීම් සැලකිය යුතු ලෙස '
          'අඩු කරයි.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('සැකසීම් නැවත සකසා ඇත.'),
      );
      expect(loc.toggle_dark_mode, equals('අඳුරු මාදිලිය මාරු කරන්න'));
      expect(loc.toggle_effects_mode, equals('බලපෑම් මාදිලිය මාරු කරන්න'));
      expect(loc.toggle_font_weight, equals('අකුරු බර මාරු කරන්න'));
      expect(loc.toggle_theme_profile, equals('තේමා පැතිකඩ මාරු කරන්න'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('සාමාන්‍ය'));
      expect(loc.color_profile('lowSaturation'), equals('අඩු සංතෘප්තිය'));
      expect(loc.color_profile('normal'), equals('සාමාන්‍ය'));
      expect(loc.color_profile('highSaturation'), equals('ඉහළ සංතෘප්තිය'));
      expect(loc.color_profile('monochrome'), equals('එකවර්ණ'));
      expect(loc.color_profile('highContrast'), equals('ඉහළ අනුපාතය'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('වර්ණය හඳුනාගත නොහැක'));
      expect(loc.color('cF44336'), equals('රතු'));
      expect(loc.color('cE91E63'), equals('රෝස'));
      expect(loc.color('c9C27B0'), equals('දම් පාට'));
      expect(loc.color('c673AB7'), equals('ගැඹුරු දම් පාට'));
      expect(loc.color('c3F51B5'), equals('ඉන්ඩිගෝ'));
      expect(loc.color('c2196F3'), equals('නිල්'));
      expect(loc.color('c03A9F4'), equals('ළා නිල්'));
      expect(loc.color('c00BCD4'), equals('සයන්'));
      expect(loc.color('c009688'), equals('ටීල්'));
      expect(loc.color('c4CAF50'), equals('කොළ'));
      expect(loc.color('c8BC34A'), equals('ළා කොළ'));
      expect(loc.color('cCDDC39'), equals('දෙහි'));
      expect(loc.color('cFFEB3B'), equals('කහ'));
      expect(loc.color('cFFC107'), equals('ඇම්බර්'));
      expect(loc.color('cFF9800'), equals('තැම්බිලි'));
      expect(loc.color('cFF5722'), equals('ගැඹුරු තැම්බිලි'));
      expect(loc.color('c795548'), equals('දුඹුරු'));
      expect(loc.color('c9E9E9E'), equals('අළු'));
      expect(loc.color('c607D8B'), equals('නිල්-අළු'));
    });
  });
}
