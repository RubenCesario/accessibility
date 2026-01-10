// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AccessibilityLocalizationsAm extends AccessibilityLocalizations {
  AccessibilityLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get accessibility => 'ተደራሽነት';

  @override
  String get accessibility_settings => 'የተደራሽነት ቅንብሮች';

  @override
  String get adjust_background_colors => 'የጀርባ ቀለሞችን ማስተካከል';

  @override
  String get adjust_text_colors => 'የጽሑፍ ቀለሞችን ማስተካከል';

  @override
  String get align_center => 'መሀከል ማሰለፍ';

  @override
  String get align_left => 'ግራ ማሰለፍ';

  @override
  String get align_right => 'ቀኝ ማሰለፍ';

  @override
  String get bold_text => 'ደማቅ ጽሑፍ';

  @override
  String get change_bold_text => 'ደማቅ ጽሑፍ መቀየር';

  @override
  String get change_pages_background_color => 'የገጾች የጀርባ ቀለም መቀየር';

  @override
  String get change_text_color => 'የጽሑፍ ቀለም መቀየር';

  @override
  String get change_text_color_shade => 'የጽሑፍ ቀለም ጥላ መቀየር';

  @override
  String get color_adjustment => 'የቀለም ማስተካከያ';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'መደበኛ',
        'lowSaturation': 'ዝቅተኛ የቀለም ጥልቀት',
        'normal': 'መደበኛ',
        'highSaturation': 'ከፍተኛ የቀለም ጥልቀት',
        'monochrome': 'ነጠላ ቀለም',
        'highContrast': 'ከፍተኛ ንፅፅር',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'የአሁኑ የቀለም ድባብ ነው፡ ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'ቀለም አልታወቀም',
        'cF44336': 'ቀይ',
        'cE91E63': 'ሮዝ',
        'c9C27B0': 'ወይን ጠጅ',
        'c673AB7': 'ጥልቅ ወይን ጠጅ',
        'c3F51B5': 'ኢንዲጎ',
        'c2196F3': 'ሰማያዊ',
        'c03A9F4': 'ፈካ ሰማያዊ',
        'c00BCD4': 'አረንጓዴ-ሰማያዊ',
        'c009688': 'ደማቅ አረንጓዴ-ሰማያዊ',
        'c4CAF50': 'አረንጓዴ',
        'c8BC34A': 'ፈካ አረንጓዴ',
        'cCDDC39': 'ሎሚ',
        'cFFEB3B': 'ቢጫ',
        'cFFC107': 'አምበር',
        'cFF9800': 'ብርትኳናማ',
        'cFF5722': 'ጥልቅ ብርትኳናማ',
        'c795548': 'ቡናማ',
        'c9E9E9E': 'ግራጫ',
        'c607D8B': 'ሰማያዊ ግራጫ',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'የቃላት ክፍተትን መቀነስ';

  @override
  String get decrement_letter_spacing => 'የፊደላት ክፍተትን መቀነስ';

  @override
  String get decrement_line_height => 'የመስመር ቁመትን መቀነስ';

  @override
  String get decrement_text_scale_factor => 'የጽሑፍ መጠን መስፋት መቀነስ';

  @override
  String get effects => 'ተጽዕኖዎች';

  @override
  String get expand_text => 'ጽሑፍ ማስፋት';

  @override
  String get font_size => 'የፊደል መጠን';

  @override
  String get increase_or_decrease_word_spacing =>
      'የቃላት መካከል ያለውን ክፍተት መጨመር ወይም መቀነስ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'የፊደላት መካከል ያለውን ክፍተት መጨመር ወይም መቀነስ';

  @override
  String get increase_or_decrease_line_height => 'የመስመር ቁመትን መጨመር ወይም መቀነስ';

  @override
  String get increase_or_decrease_text_size => 'የጽሑፍ መጠን መጨመር ወይም መቀነስ';

  @override
  String get increment_word_spacing => 'የቃላት ክፍተትን መጨመር';

  @override
  String get increment_letter_spacing => 'የፊደላት ክፍተትን መጨመር';

  @override
  String get increment_line_height => 'የመስመር ቁመትን መጨመር';

  @override
  String get increment_text_scale_factor => 'የጽሑፍ መጠን መስፋትን መጨመር';

  @override
  String get less_info => 'መረጃ መዝጋት';

  @override
  String get letter_spacing => 'የፊደላት ክፍተት';

  @override
  String get line_height => 'የመስመር ቁመት';

  @override
  String get more_info => 'ተጨማሪ መረጃ አሳይ';

  @override
  String get read_less => 'በአነስተኛ መልኩ አንብብ';

  @override
  String get read_more => 'በተጨማሪ መልኩ አንብብ';

  @override
  String get reduce_effects => 'የማያ ገፅ ላይ ያሉ ተጽዕኖዎችን መቀነስ';

  @override
  String get reduce_text => 'ጽሑፍ መቀነስ';

  @override
  String get restore_settings => 'ቅንብሮችን ወደ ነባሪ ሁኔታ መመለስ';

  @override
  String get restore_main_color => 'ዋና ቀለም መመለስ';

  @override
  String get return_to_main_colors => 'ወደ ዋና ቀለሞች መመለስ';

  @override
  String get settings => 'ቅንብር ማደሪያ';

  @override
  String get size_and_text_display => 'የመጠን እና የጽሑፍ ማሳያ';

  @override
  String get slider_word_spacing => 'የቃላት ክፍተት መቀየሪያ መደርደሪያ';

  @override
  String get slider_letter_spacing => 'የፊደላት ክፍተት መቀየሪያ መደርደሪያ';

  @override
  String get slider_line_height => 'የመስመር ቁመት መቀየሪያ መደርደሪያ';

  @override
  String get theme_mode => 'ገጽታ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'የገጽታ መከላከያ አልታወቀም',
        'seizureSafe': 'ለሚጥል ደህንነት የተሟላ',
        'visionImpaired': 'ለእይታ ጉዳት የተሟላ',
        'adhdFriendly': 'ለኤዲኤችዲ የተሟላ',
        'none': 'መደበኛ',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'ለሚጥል በሽታ ደህንነት ገጽታ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'የብልጭታ እና ሚጥል የሚያስከትሉ ቀለሞችን ማስወገድ';

  @override
  String get theme_profile_seizure_safe_description =>
      'ይህ ገጽታ ለሚጥል በሽታ ያላቸው ወይም ለሚጥል በሽታ ተጋላጭ የሆኑ ተጠቃሚዎች ብልጭታ ያላቸው ምስሎች እና አደገኛ የቀለም ውህዶች የሚያስከትሉትን የሚጥል በሽታ አደጋ በመቀነስ በደህንነት እንዲጠቀሙ ያስችላል።';

  @override
  String get theme_profile_vision_impaired_title => 'ለእይታ ጉዳት ገጽታ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'የመተግበሪያውን ታይነትና ተደራሽነት ማሻሻል';

  @override
  String get theme_profile_vision_impaired_description =>
      'ይህ ገጽታ ለተለያዩ የእይታ ጉዳቶች ተጠቃሚዎች ተደራሽነትና ታይነት ይሰጣል። ለእይታ እክል፣ ቱቦ ዕይታ፣ የዓይን ብናኝነት፣ ግሎኮማ እና ሌሎች የእይታ ጉዳቶች ይረዳል።';

  @override
  String get theme_profile_adhd_friendly_title => 'ለኤዲኤችዲ ምቹ ገጽታ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'ትኩረት ለማበረታታት እና ማትኮሎችን ለመቀነስ';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ይህ ገጽታ የትኩረት ማትኮሎችን ይቀንሳል። ለኤዲኤችዲ እና ሌሎች ነርቮሳዊ ዕድገት እክል ያላቸው ተጠቃሚዎች በቀላሉ መተግበሪያውን ለመጠቀም፣ ለማንበብ እና በአስፈላጊ ነገሮች ላይ ትኩረት ለማድረግ ይረዳል።';

  @override
  String get the_settings_have_been_reset => 'ቅንብሮቹ ዳግም ተጀምረዋል።';

  @override
  String get toggle_dark_mode => 'ጨለማ ገጽታን መቀያየር';

  @override
  String get toggle_effects_mode => 'የተጽዕኖ ገጽታን መቀያየር';

  @override
  String get toggle_font_weight => 'የፊደል ክብደትን መቀያየር';

  @override
  String get toggle_theme_profile => 'የገጽታ ድባብን መቀያየር';

  @override
  String get word_spacing => 'የቃላት ክፍተት';

  @override
  String get accessible_font => 'ተደራሽ ፊደል';

  @override
  String get accessible_font_subtitle => 'ለተሻለ ንባብ Verdana ፊደል ይጠቀሙ';

  @override
  String get accessible_font_enabled => 'ተደራሽ ፊደል ነቅቷል';

  @override
  String get accessible_font_disabled => 'ተደራሽ ፊደል ተሰናክሏል';

  @override
  String get toggle_accessible_font => 'ተደራሽ ፊደልን መቀያየር';
}
