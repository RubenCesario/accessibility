import 'package:accessibility/src/core/l10n/generated/app_localizations_am.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsAm', () {
    late AccessibilityLocalizationsAm loc;

    setUp(() {
      loc = AccessibilityLocalizationsAm();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('am'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ተደራሽነት'));
      expect(loc.accessibility_settings, equals('የተደራሽነት ቅንብሮች'));
      expect(loc.adjust_background_colors, equals('የጀርባ ቀለሞችን ማስተካከል'));
      expect(loc.adjust_text_colors, equals('የጽሑፍ ቀለሞችን ማስተካከል'));
      expect(loc.align_center, equals('መሀከል ማሰለፍ'));
      expect(loc.align_left, equals('ግራ ማሰለፍ'));
      expect(loc.align_right, equals('ቀኝ ማሰለፍ'));
      expect(loc.bold_text, equals('ደማቅ ጽሑፍ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ደማቅ ጽሑፍ መቀየር'));
      expect(loc.change_pages_background_color, equals('የገጾች የጀርባ ቀለም መቀየር'));
      expect(loc.change_text_color, equals('የጽሑፍ ቀለም መቀየር'));
      expect(loc.change_text_color_shade, equals('የጽሑፍ ቀለም ጥላ መቀየር'));
      expect(loc.color_adjustment, equals('የቀለም ማስተካከያ'));
      expect(loc.color_profile_changed_to, equals('የአሁኑ የቀለም ድባብ ነው፡ '));
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('የቃላት ክፍተትን መቀነስ'));
      expect(loc.decrement_letter_spacing, equals('የፊደላት ክፍተትን መቀነስ'));
      expect(loc.decrement_line_height, equals('የመስመር ቁመትን መቀነስ'));
      expect(loc.decrement_text_scale_factor, equals('የጽሑፍ መጠን መስፋት መቀነስ'));
      expect(loc.increment_word_spacing, equals('የቃላት ክፍተትን መጨመር'));
      expect(loc.increment_letter_spacing, equals('የፊደላት ክፍተትን መጨመር'));
      expect(loc.increment_line_height, equals('የመስመር ቁመትን መጨመር'));
      expect(loc.increment_text_scale_factor, equals('የጽሑፍ መጠን መስፋትን መጨመር'));
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('የቃላት መካከል ያለውን ክፍተት መጨመር ወይም መቀነስ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('የፊደላት መካከል ያለውን ክፍተት መጨመር ወይም መቀነስ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('የመስመር ቁመትን መጨመር ወይም መቀነስ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('የጽሑፍ መጠን መጨመር ወይም መቀነስ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ተጽዕኖዎች'));
      expect(loc.expand_text, equals('ጽሑፍ ማስፋት'));
      expect(loc.font_size, equals('የፊደል መጠን'));
      expect(loc.less_info, equals('መረጃ መዝጋት'));
      expect(loc.letter_spacing, equals('የፊደላት ክፍተት'));
      expect(loc.line_height, equals('የመስመር ቁመት'));
      expect(loc.more_info, equals('ተጨማሪ መረጃ አሳይ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('በአነስተኛ መልኩ አንብብ'));
      expect(loc.read_more, equals('በተጨማሪ መልኩ አንብብ'));
      expect(loc.reduce_effects, equals('የማያ ገፅ ላይ ያሉ ተጽዕኖዎችን መቀነስ'));
      expect(loc.reduce_text, equals('ጽሑፍ መቀነስ'));
      expect(loc.restore_settings, equals('ቅንብሮችን ወደ ነባሪ ሁኔታ መመለስ'));
      expect(loc.restore_main_color, equals('ዋና ቀለም መመለስ'));
      expect(loc.return_to_main_colors, equals('ወደ ዋና ቀለሞች መመለስ'));
      expect(loc.settings, equals('ቅንብር ማደሪያ'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('የመጠን እና የጽሑፍ ማሳያ'));
      expect(loc.slider_word_spacing, equals('የቃላት ክፍተት መቀየሪያ መደርደሪያ'));
      expect(loc.slider_letter_spacing, equals('የፊደላት ክፍተት መቀየሪያ መደርደሪያ'));
      expect(loc.slider_line_height, equals('የመስመር ቁመት መቀየሪያ መደርደሪያ'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_profile('other'), equals('የገጽታ መከላከያ አልታወቀም'));
      expect(loc.theme_profile('seizureSafe'), equals('ለሚጥል ደህንነት የተሟላ'));
      expect(loc.theme_profile('visionImpaired'), equals('ለእይታ ጉዳት የተሟላ'));
      expect(loc.theme_profile('adhdFriendly'), equals('ለኤዲኤችዲ የተሟላ'));
      expect(loc.theme_profile('none'), equals('መደበኛ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ለሚጥል በሽታ ደህንነት ገጽታ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('የብልጭታ እና ሚጥል የሚያስከትሉ ቀለሞችን ማስወገድ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ይህ ገጽታ ለሚጥል በሽታ ያላቸው ወይም ለሚጥል በሽታ ተጋላጭ የሆኑ '
          'ተጠቃሚዎች ብልጭታ ያላቸው ምስሎች እና አደገኛ የቀለም ውህዶች የሚያስከትሉትን '
          'የሚጥል በሽታ አደጋ በመቀነስ በደህንነት እንዲጠቀሙ ያስችላል።',
        ),
      );
      expect(loc.theme_profile_vision_impaired_title, equals('ለእይታ ጉዳት ገጽታ'));
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('የመተግበሪያውን ታይነትና ተደራሽነት ማሻሻል'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ይህ ገጽታ ለተለያዩ የእይታ ጉዳቶች ተጠቃሚዎች ተደራሽነትና ታይነት ይሰጣል። '
          'ለእይታ እክል፣ ቱቦ ዕይታ፣ የዓይን ብናኝነት፣ ግሎኮማ እና ሌሎች የእይታ ጉዳቶች ይረዳል።',
        ),
      );
      expect(loc.theme_profile_adhd_friendly_title, equals('ለኤዲኤችዲ ምቹ ገጽታ'));
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ትኩረት ለማበረታታት እና ማትኮሎችን ለመቀነስ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ይህ ገጽታ የትኩረት ማትኮሎችን ይቀንሳል። ለኤዲኤችዲ እና ሌሎች ነርቮሳዊ ዕድገት እክል ያላቸው '
          'ተጠቃሚዎች በቀላሉ መተግበሪያውን ለመጠቀም፣ ለማንበብ እና በአስፈላጊ '
          'ነገሮች ላይ ትኩረት ለማድረግ ይረዳል።',
        ),
      );
      expect(loc.the_settings_have_been_reset, equals('ቅንብሮቹ ዳግም ተጀምረዋል።'));
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('ጨለማ ገጽታን መቀያየር'));
      expect(loc.toggle_effects_mode, equals('የተጽዕኖ ገጽታን መቀያየር'));
      expect(loc.toggle_font_weight, equals('የፊደል ክብደትን መቀያየር'));
      expect(loc.word_spacing, equals('የቃላት ክፍተት'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('ዝቅተኛ የቀለም ጥልቀት'));
      expect(loc.color_profile('normal'), equals('መደበኛ'));
      expect(loc.color_profile('highSaturation'), equals('ከፍተኛ የቀለም ጥልቀት'));
      expect(loc.color_profile('monochrome'), equals('ነጠላ ቀለም'));
      expect(loc.color_profile('highContrast'), equals('ከፍተኛ ንፅፅር'));
      expect(loc.color_profile('unknown'), equals('መደበኛ'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('ቀይ'));
      expect(loc.color('cE91E63'), equals('ሮዝ'));
      expect(loc.color('c9C27B0'), equals('ወይን ጠጅ'));
      expect(loc.color('c673AB7'), equals('ጥልቅ ወይን ጠጅ'));
      expect(loc.color('c3F51B5'), equals('ኢንዲጎ'));
      expect(loc.color('c2196F3'), equals('ሰማያዊ'));
      expect(loc.color('c03A9F4'), equals('ፈካ ሰማያዊ'));
      expect(loc.color('c00BCD4'), equals('አረንጓዴ-ሰማያዊ'));
      expect(loc.color('c009688'), equals('ደማቅ አረንጓዴ-ሰማያዊ'));
      expect(loc.color('c4CAF50'), equals('አረንጓዴ'));
      expect(loc.color('c8BC34A'), equals('ፈካ አረንጓዴ'));
      expect(loc.color('cCDDC39'), equals('ሎሚ'));
      expect(loc.color('cFFEB3B'), equals('ቢጫ'));
      expect(loc.color('cFFC107'), equals('አምበር'));
      expect(loc.color('cFF9800'), equals('ብርትኳናማ'));
      expect(loc.color('cFF5722'), equals('ጥልቅ ብርትኳናማ'));
      expect(loc.color('c795548'), equals('ቡናማ'));
      expect(loc.color('c9E9E9E'), equals('ግራጫ'));
      expect(loc.color('c607D8B'), equals('ሰማያዊ ግራጫ'));
      expect(loc.color('unknown'), equals('ቀለም አልታወቀም'));
    });
  });
}
