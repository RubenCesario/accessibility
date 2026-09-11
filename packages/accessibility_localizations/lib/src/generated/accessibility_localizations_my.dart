// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AccessibilityLocalizationsMy extends AccessibilityLocalizations {
  AccessibilityLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get accessibility => 'လက်လှမ်းမှီနိုင်မှု';

  @override
  String get accessibilitySettings => 'လက်လှမ်းမှီနိုင်မှု ဆက်တင်များ';

  @override
  String get adjustBackgroundColors => 'နောက်ခံ အရောင်များကို ချိန်ညှိရန်';

  @override
  String get adjustTextColors => 'စာသား အရောင်များကို ချိန်ညှိရန်';

  @override
  String get alignCenter => 'အလယ်ညီရန်';

  @override
  String get alignLeft => 'ဘယ်ညီရန်';

  @override
  String get alignRight => 'ညာညီရန်';

  @override
  String get textAlignment => 'စာသားနေရာချမှု';

  @override
  String get boldText => 'စာလုံးမဲ';

  @override
  String get changeBoldText => 'စာလုံးမဲကို ပြောင်းရန်';

  @override
  String get changePagesBackgroundColor =>
      'စာမျက်နှာများ၏ နောက်ခံ အရောင်ကို ပြောင်းရန်: ';

  @override
  String get changeTextColor => 'စာသား၏ အရောင်ကို ပြောင်းရန်: ';

  @override
  String get changeTextColorShade => 'အရောင်၏ အရိပ်ကို ပြောင်းရန်: ';

  @override
  String get colorAdjustment => 'အရောင် ချိန်ညှိခြင်း';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ပုံမှန်',
      'lowSaturation': 'အရောင်ပျော့',
      'normal': 'ပုံမှန်',
      'highSaturation': 'အရောင်ပြင်း',
      'monochrome': 'အဖြူအမည်း',
      'highContrast': 'အရောင်ကွာဟချက်မြင့်',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'လက်ရှိအရောင်ပရိုဖိုင်မှာ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'အရောင်ကို မသိရှိပါ',
      'cF44336': 'အနီ',
      'cE91E63': 'ပန်းရောင်',
      'c9C27B0': 'ခရမ်းရောင်',
      'c673AB7': 'ခရမ်းရောင်နက်',
      'c3F51B5': 'မဲနယ်ရောင်',
      'c2196F3': 'အပြာ',
      'c03A9F4': 'အပြာဖျော့',
      'c00BCD4': 'စိမ်းပြာ',
      'c009688': 'စိမ်းပြာနက်',
      'c4CAF50': 'အစိမ်း',
      'c8BC34A': 'အစိမ်းဖျော့',
      'cCDDC39': 'သံပုရာရောင်',
      'cFFEB3B': 'အဝါ',
      'cFFC107': 'ကာရာမယ်ရောင်',
      'cFF9800': 'လိမ္မော်',
      'cFF5722': 'လိမ္မော်နက်',
      'c795548': 'အညို',
      'c9E9E9E': 'မီးခိုး',
      'c607D8B': 'ပြာမီးခိုး',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'စကားလုံး အကွာအဝေးကို လျှော့ချရန်';

  @override
  String get decrementLetterSpacing => 'စာလုံး အကွာအဝေးကို လျှော့ချရန်';

  @override
  String get decrementLineHeight => 'စာကြောင်း အမြင့်ကို လျှော့ချရန်';

  @override
  String get decrementTextScaleFactor => 'စာသား အတိုင်းအတာကို လျှော့ချရန်';

  @override
  String get effects => 'အထူးပြုလုပ်ချက်များ';

  @override
  String get expandText => 'စာသားကို ချဲ့ရန်';

  @override
  String get fontSize => 'ဖောင့်အရွယ်အစား';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'စကားလုံး အကွာအဝေးကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'စာလုံး အကွာအဝေးကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increaseOrDecreaseLineHeight =>
      'စာကြောင်း အမြင့်ကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increaseOrDecreaseTextSize =>
      'စာသားအရွယ်အစားကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get incrementWordSpacing => 'စကားလုံး အကွာအဝေးကို တိုးချဲ့ရန်';

  @override
  String get incrementLetterSpacing => 'စာလုံး အကွာအဝေးကို တိုးချဲ့ရန်';

  @override
  String get incrementLineHeight => 'စာကြောင်း အမြင့်ကို တိုးချဲ့ရန်';

  @override
  String get incrementTextScaleFactor => 'စာသား အတိုင်းအတာကို တိုးချဲ့ရန်';

  @override
  String get lessInfo => 'အချက်အလက်ကို ဖေျာက်ရန်';

  @override
  String get letterSpacing => 'စာလုံး အကွာအဝေး';

  @override
  String get lineHeight => 'စာကြောင်း အမြင့်';

  @override
  String get moreInfo => 'အချက်အလက်ကို ပြရန်';

  @override
  String get readLess => 'အနည်းငယ် ဖတ်ရန်';

  @override
  String get readMore => 'အပြည့်အစုံ ဖတ်ရန်';

  @override
  String get reduceEffects =>
      'မှန်တင်ပေါ်ရှိ အထူးပြုလုပ်ချက်များကို လျှော့ချရန်';

  @override
  String get reduceText => 'စာသားကို လျှော့ချရန်';

  @override
  String get restoreSettings => 'ဆက်တင်များကို ပြန်လည်ပြင်ဆင်ရန်';

  @override
  String get restoreMainColor => 'အခြေခံအရောင်ကို ပြန်လည်ပြင်ဆင်ရန်';

  @override
  String get returnToMainColors => 'အခြေခံအရောင်များကို ပြန်ဘန်';

  @override
  String get settings => 'ဆက်တင်များ';

  @override
  String get sizeAndTextDisplay => 'အရွယ်အစားနှင့် စာသားပြသမှု';

  @override
  String get sliderWordSpacing => 'စကားလုံး အကွာအဝေး ဆလိုက်ဒါ';

  @override
  String get sliderLetterSpacing => 'စာလုံး အကွာအဝေး ဆလိုက်ဒါ';

  @override
  String get sliderLineHeight => 'စာကြောင်း အမြင့် ဆလိုက်ဒါ';

  @override
  String get themeMode => 'အပြင်အဆင်';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'အပြင်အဆင်ပရိုဖိုင်ကို မသိရှိပါ',
      'seizureSafe': 'ဝက်ခာလှုပ်မှ ကင်းလွတ်မှု',
      'visionImpaired': 'အမြင်ချို့ယွင်းမှု',
      'adhdFriendly': 'ADHD မိတ်ဆွေ',
      'none': 'မူရင်းပရိုဖိုင်',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle =>
      'ဝက်ခာလှုပ်မှ ကင်းလွတ်သော ပရိုဖိုင်';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'ရိုက်ချောင်းလန်ရိပ်များကို ဖယ်ရှားပြီး အရောင်ကို လျှော့ချရန်';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ဤပရိုဖိုင်သည် ဝက်ခာလှုပ်ခြင်းရှိသူနှင့် ဝက်ခာလှုပ်မှုအန္တရာယ်ရှိသူများကို လျပ်ပြက်သော အလင်းအနှေ့များနှင့် အန္တရာယ်ရှိအရောင်ပေါင်းစပ်မှုများကို ဖယ်ရှားခြင်းဖြင့် လုံခြုံစွာတွေ့ကြည့်ရှုနိုင်စေရန် စီမံထားသည်။';

  @override
  String get themeProfileVisionImpairedTitle => 'အမြင်ချို့ယွင်းမှု ပရိုဖိုင်';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'အက်ပ်လီကေးရှင်း၏ မြင်သာနိုင်မှုကို တိုးမြင့်စေရန်';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ဤပရိုဖိုင်သည် အမြင်ချို့ယွင်းမှု၊ ထောင့်ထားမြင်ကွင်း၊ မျက်ကွယ်မှုန်၊ ရေတိမ်၊ ယိုးအမိုင်နှင့် အခြားသော အမြင်ချို့ယွင်းမှုများကို အသုံးပြုရန်အတွက် အက်ပ်လီကေးရှင်းကို လိုက်ဘာအပြောင်းအလဲပြုလုပ်ပေးထားသည်။';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-မိတ်ဆွေ ပရိုဖိုင်';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'အာရုံစိုက်မှု ပိုမိုနှင့် အနှောက်အယှက် လျှော့နည်းစေရန်';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ဤပရိုဖိုင်သည် ADHD နှင့် အာရုံဖွံ့ဖြိုးမှုဆိုင်ရာ နောက်ဆက်တွဲချို့ယွင်းမှုများရှိသူများကို အက်ပ်လီကေးရှင်း၏ အခြေခံအစိတ်အပိုင်းများကို ပိုမိုအာရုံစိုက်နိုင်ရန်နှင့် လွယ်ကူစွာ အနှောက်အယှက်များကို လျှော့ချပေးသည်။';

  @override
  String get theSettingsHaveBeenReset =>
      'ဆက်တင်များကို ပြန်လည်ပြင်ဆင်ပြီးပါပြီ။';

  @override
  String get toggleDarkMode => 'အမှောင်မိုဒ်ကို ပြောင်းရန်';

  @override
  String get toggleEffectsMode => 'အထူးပြုလုပ်ချက်များမိုဒ်ကို ပြောင်းရန်';

  @override
  String get toggleFontWeight => 'ဖော့အလေးချိန်ကို ပြောင်းရန်';

  @override
  String get toggleThemeProfile => 'အပြင်အဆင်ပရိုဖိုင်ကို ပြောင်းရန်';

  @override
  String get wordSpacing => 'စကားလုံး အကွာအဝေး';

  @override
  String get accessibleFont => 'အသုံးပြုနိုင်သော ဖောင့်';

  @override
  String get accessibleFontSubtitle =>
      'ပိုမိုကောင်းမွန်သော ဖတ်ရှုနိုင်မှုအတွက် အသုံးပြုရလွယ်ကူသော ဖောင့်ကို အသုံးပြုပါ';

  @override
  String get accessibleFontEnabled => 'အသုံးပြုနိုင်သော ဖောင့် ဖွင့်ထားသည်';

  @override
  String get accessibleFontDisabled => 'အသုံးပြုနိုင်သော ဖောင့် ပိတ်ထားသည်';

  @override
  String get toggleAccessibleFont => 'အသုံးပြုနိုင်သော ဖောင့်ကို ပြောင်းရန်';

  @override
  String get settingsLoading => 'လက်လှမ်းမှီနိုင်မှု ဆက်တင်များကို ဖွင့်နေသည်…';

  @override
  String get settingsLoadFailed =>
      'လက်လှမ်းမှီနိုင်မှု ဆက်တင်များကို ဖွင့်၍မရပါ။';

  @override
  String get retry => 'ထပ်စမ်းကြည့်ပါ';

  @override
  String get themeModeSystem => 'စနစ်';

  @override
  String get themeModeLight => 'အလင်း';

  @override
  String get themeModeDark => 'အမှောင်';

  @override
  String get effectsModeSystem => 'စနစ်';

  @override
  String get effectsModeEnabled => 'ဖွင့်';

  @override
  String get effectsModeDisabled => 'ပိတ်';
}
