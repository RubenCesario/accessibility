// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AccessibilityLocalizationsAm extends AccessibilityLocalizations {
  AccessibilityLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get accessibility => 'ተደራሽነት';

  @override
  String get accessibilitySettings => 'የተደራሽነት ቅንብሮች';

  @override
  String get adjustBackgroundColors => 'የጀርባ ቀለሞችን ማስተካከል';

  @override
  String get adjustTextColors => 'የጽሑፍ ቀለሞችን ማስተካከል';

  @override
  String get alignCenter => 'መሀከል ማሰለፍ';

  @override
  String get alignLeft => 'ግራ ማሰለፍ';

  @override
  String get alignRight => 'ቀኝ ማሰለፍ';

  @override
  String get textAlignment => 'የጽሑፍ አሰላለፍ';

  @override
  String get boldText => 'ደማቅ ጽሑፍ';

  @override
  String get changeBoldText => 'ደማቅ ጽሑፍ መቀየር';

  @override
  String get changePagesBackgroundColor => 'የገጾች የጀርባ ቀለም መቀየር';

  @override
  String get changeTextColor => 'የጽሑፍ ቀለም መቀየር';

  @override
  String get changeTextColorShade => 'የጽሑፍ ቀለም ጥላ መቀየር';

  @override
  String get colorAdjustment => 'የቀለም ማስተካከያ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'መደበኛ',
      'lowSaturation': 'ዝቅተኛ የቀለም ጥልቀት',
      'normal': 'መደበኛ',
      'highSaturation': 'ከፍተኛ የቀለም ጥልቀት',
      'monochrome': 'ነጠላ ቀለም',
      'highContrast': 'ከፍተኛ ንፅፅር',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'የአሁኑ የቀለም ድባብ ነው፡ ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'የቃላት ክፍተትን መቀነስ';

  @override
  String get decrementLetterSpacing => 'የፊደላት ክፍተትን መቀነስ';

  @override
  String get decrementLineHeight => 'የመስመር ቁመትን መቀነስ';

  @override
  String get decrementTextScaleFactor => 'የጽሑፍ መጠን መስፋት መቀነስ';

  @override
  String get effects => 'ተጽዕኖዎች';

  @override
  String get expandText => 'ጽሑፍ ማስፋት';

  @override
  String get fontSize => 'የፊደል መጠን';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'የቃላት መካከል ያለውን ክፍተት መጨመር ወይም መቀነስ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'የፊደላት መካከል ያለውን ክፍተት መጨመር ወይም መቀነስ';

  @override
  String get increaseOrDecreaseLineHeight => 'የመስመር ቁመትን መጨመር ወይም መቀነስ';

  @override
  String get increaseOrDecreaseTextSize => 'የጽሑፍ መጠን መጨመር ወይም መቀነስ';

  @override
  String get incrementWordSpacing => 'የቃላት ክፍተትን መጨመር';

  @override
  String get incrementLetterSpacing => 'የፊደላት ክፍተትን መጨመር';

  @override
  String get incrementLineHeight => 'የመስመር ቁመትን መጨመር';

  @override
  String get incrementTextScaleFactor => 'የጽሑፍ መጠን መስፋትን መጨመር';

  @override
  String get lessInfo => 'መረጃ መዝጋት';

  @override
  String get letterSpacing => 'የፊደላት ክፍተት';

  @override
  String get lineHeight => 'የመስመር ቁመት';

  @override
  String get moreInfo => 'ተጨማሪ መረጃ አሳይ';

  @override
  String get readLess => 'በአነስተኛ መልኩ አንብብ';

  @override
  String get readMore => 'በተጨማሪ መልኩ አንብብ';

  @override
  String get reduceEffects => 'የማያ ገፅ ላይ ያሉ ተጽዕኖዎችን መቀነስ';

  @override
  String get reduceText => 'ጽሑፍ መቀነስ';

  @override
  String get restoreSettings => 'ቅንብሮችን ወደ ነባሪ ሁኔታ መመለስ';

  @override
  String get restoreMainColor => 'ዋና ቀለም መመለስ';

  @override
  String get returnToMainColors => 'ወደ ዋና ቀለሞች መመለስ';

  @override
  String get settings => 'ቅንብር ማደሪያ';

  @override
  String get sizeAndTextDisplay => 'የመጠን እና የጽሑፍ ማሳያ';

  @override
  String get sliderWordSpacing => 'የቃላት ክፍተት መቀየሪያ መደርደሪያ';

  @override
  String get sliderLetterSpacing => 'የፊደላት ክፍተት መቀየሪያ መደርደሪያ';

  @override
  String get sliderLineHeight => 'የመስመር ቁመት መቀየሪያ መደርደሪያ';

  @override
  String get themeMode => 'ገጽታ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'የገጽታ መከላከያ አልታወቀም',
      'seizureSafe': 'ለሚጥል ደህንነት የተሟላ',
      'visionImpaired': 'ለእይታ ጉዳት የተሟላ',
      'adhdFriendly': 'ለኤዲኤችዲ የተሟላ',
      'none': 'ነባሪ መገለጫ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'ለሚጥል በሽታ ደህንነት ገጽታ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'የብልጭታ እና ሚጥል የሚያስከትሉ ቀለሞችን ማስወገድ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ይህ ገጽታ ለሚጥል በሽታ ያላቸው ወይም ለሚጥል በሽታ ተጋላጭ የሆኑ ተጠቃሚዎች ብልጭታ ያላቸው ምስሎች እና አደገኛ የቀለም ውህዶች የሚያስከትሉትን የሚጥል በሽታ አደጋ በመቀነስ በደህንነት እንዲጠቀሙ ያስችላል።';

  @override
  String get themeProfileVisionImpairedTitle => 'ለእይታ ጉዳት ገጽታ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'የመተግበሪያውን ታይነትና ተደራሽነት ማሻሻል';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ይህ ገጽታ ለተለያዩ የእይታ ጉዳቶች ተጠቃሚዎች ተደራሽነትና ታይነት ይሰጣል። ለእይታ እክል፣ ቱቦ ዕይታ፣ የዓይን ብናኝነት፣ ግሎኮማ እና ሌሎች የእይታ ጉዳቶች ይረዳል።';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ለኤዲኤችዲ ምቹ ገጽታ';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'ትኩረት ለማበረታታት እና ማትኮሎችን ለመቀነስ';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ይህ ገጽታ የትኩረት ማትኮሎችን ይቀንሳል። ለኤዲኤችዲ እና ሌሎች ነርቮሳዊ ዕድገት እክል ያላቸው ተጠቃሚዎች በቀላሉ መተግበሪያውን ለመጠቀም፣ ለማንበብ እና በአስፈላጊ ነገሮች ላይ ትኩረት ለማድረግ ይረዳል።';

  @override
  String get theSettingsHaveBeenReset => 'ቅንብሮቹ ዳግም ተጀምረዋል።';

  @override
  String get toggleDarkMode => 'ጨለማ ገጽታን መቀያየር';

  @override
  String get toggleEffectsMode => 'የተጽዕኖ ገጽታን መቀያየር';

  @override
  String get toggleFontWeight => 'የፊደል ክብደትን መቀያየር';

  @override
  String get toggleThemeProfile => 'የገጽታ ድባብን መቀያየር';

  @override
  String get wordSpacing => 'የቃላት ክፍተት';

  @override
  String get accessibleFont => 'ተደራሽ ፊደል';

  @override
  String get accessibleFontSubtitle => 'ለተሻለ ንባብ ቀላል ለማንበብ የሚያስችል ቅርጸ-ቁምፊ ይጠቀሙ';

  @override
  String get accessibleFontEnabled => 'ተደራሽ ፊደል ነቅቷል';

  @override
  String get accessibleFontDisabled => 'ተደራሽ ፊደል ተሰናክሏል';

  @override
  String get toggleAccessibleFont => 'ተደራሽ ፊደልን መቀያየር';

  @override
  String get settingsLoading => 'የተደራሽነት ቅንብሮች በመጫን ላይ…';

  @override
  String get settingsLoadFailed => 'የተደራሽነት ቅንብሮች መጫን አልተቻለም።';

  @override
  String get retry => 'እንደገና ሞክር';

  @override
  String get themeModeSystem => 'ስርዓት';

  @override
  String get themeModeLight => 'ብሩህ';

  @override
  String get themeModeDark => 'ጨለማ';

  @override
  String get effectsModeSystem => 'ስርዓት';

  @override
  String get effectsModeEnabled => 'በርቷል';

  @override
  String get effectsModeDisabled => 'ጠፍቷል';
}
