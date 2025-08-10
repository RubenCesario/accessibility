// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AccessibilityLocalizationsMy extends AccessibilityLocalizations {
  AccessibilityLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get accessibility => 'လက်လှမ်းမှီနိုင်မှု';

  @override
  String get accessibility_settings => 'လက်လှမ်းမှီနိုင်မှု ဆက်တင်များ';

  @override
  String get adjust_background_colors => 'နောက်ခံ အရောင်များကို ချိန်ညှိရန်';

  @override
  String get adjust_text_colors => 'စာသား အရောင်များကို ချိန်ညှိရန်';

  @override
  String get align_center => 'အလယ်ညီရန်';

  @override
  String get align_left => 'ဘယ်ညီရန်';

  @override
  String get align_right => 'ညာညီရန်';

  @override
  String get bold_text => 'စာလုံးမဲ';

  @override
  String get change_bold_text => 'စာလုံးမဲကို ပြောင်းရန်';

  @override
  String get change_pages_background_color =>
      'စာမျက်နှာများ၏ နောက်ခံ အရောင်ကို ပြောင်းရန်: ';

  @override
  String get change_text_color => 'စာသား၏ အရောင်ကို ပြောင်းရန်: ';

  @override
  String get change_text_color_shade => 'အရောင်၏ အရိပ်ကို ပြောင်းရန်: ';

  @override
  String get color_adjustment => 'အရောင် ချိန်ညှိခြင်း';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'ပုံမှန်',
        'lowSaturation': 'အရောင်ပျော့',
        'normal': 'ပုံမှန်',
        'highSaturation': 'အရောင်ပြင်း',
        'monochrome': 'အဖြူအမည်း',
        'highContrast': 'အရောင်ကွာဟချက်မြင့်',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'လက်ရှိအရောင်ပရိုဖိုင်မှာ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'စကားလုံး အကွာအဝေးကို လျှော့ချရန်';

  @override
  String get decrement_letter_spacing => 'စာလုံး အကွာအဝေးကို လျှော့ချရန်';

  @override
  String get decrement_line_height => 'စာကြောင်း အမြင့်ကို လျှော့ချရန်';

  @override
  String get decrement_text_scale_factor => 'စာသား အတိုင်းအတာကို လျှော့ချရန်';

  @override
  String get effects => 'အထူးပြုလုပ်ချက်များ';

  @override
  String get expand_text => 'စာသားကို ချဲ့ရန်';

  @override
  String get font_size => 'ဖောင့်အရွယ်အစား';

  @override
  String get increase_or_decrease_word_spacing =>
      'စကားလုံး အကွာအဝေးကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increase_or_decrease_letter_spacing =>
      'စာလုံး အကွာအဝေးကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increase_or_decrease_line_height =>
      'စာကြောင်း အမြင့်ကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increase_or_decrease_text_size =>
      'စာသားအရွယ်အစားကို တိုးချဲ့ သို့မဟုတ် လျှော့ချရန်';

  @override
  String get increment_word_spacing => 'စကားလုံး အကွာအဝေးကို တိုးချဲ့ရန်';

  @override
  String get increment_letter_spacing => 'စာလုံး အကွာအဝေးကို တိုးချဲ့ရန်';

  @override
  String get increment_line_height => 'စာကြောင်း အမြင့်ကို တိုးချဲ့ရန်';

  @override
  String get increment_text_scale_factor => 'စာသား အတိုင်းအတာကို တိုးချဲ့ရန်';

  @override
  String get less_info => 'အချက်အလက်ကို ဖေျာက်ရန်';

  @override
  String get letter_spacing => 'စာလုံး အကွာအဝေး';

  @override
  String get line_height => 'စာကြောင်း အမြင့်';

  @override
  String get more_info => 'အချက်အလက်ကို ပြရန်';

  @override
  String get read_less => 'အနည်းငယ် ဖတ်ရန်';

  @override
  String get read_more => 'အပြည့်အစုံ ဖတ်ရန်';

  @override
  String get reduce_effects =>
      'မှန်တင်ပေါ်ရှိ အထူးပြုလုပ်ချက်များကို လျှော့ချရန်';

  @override
  String get reduce_text => 'စာသားကို လျှော့ချရန်';

  @override
  String get restore_settings => 'ဆက်တင်များကို ပြန်လည်ပြင်ဆင်ရန်';

  @override
  String get restore_main_color => 'အခြေခံအရောင်ကို ပြန်လည်ပြင်ဆင်ရန်';

  @override
  String get return_to_main_colors => 'အခြေခံအရောင်များကို ပြန်ဘန်';

  @override
  String get settings => 'ဆက်တင်များ';

  @override
  String get size_and_text_display => 'အရွယ်အစားနှင့် စာသားပြသမှု';

  @override
  String get slider_word_spacing => 'စကားလုံး အကွာအဝေး ဆလိုက်ဒါ';

  @override
  String get slider_letter_spacing => 'စာလုံး အကွာအဝေး ဆလိုက်ဒါ';

  @override
  String get slider_line_height => 'စာကြောင်း အမြင့် ဆလိုက်ဒါ';

  @override
  String get theme_mode => 'အပြင်အဆင်';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'အပြင်အဆင်ပရိုဖိုင်ကို မသိရှိပါ',
        'seizureSafe': 'ဝက်ခာလှုပ်မှ ကင်းလွတ်မှု',
        'visionImpaired': 'အမြင်ချို့ယွင်းမှု',
        'adhdFriendly': 'ADHD မိတ်ဆွေ',
        'none': 'ပုံသေ',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'ဝက်ခာလှုပ်မှ ကင်းလွတ်သော ပရိုဖိုင်';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'ရိုက်ချောင်းလန်ရိပ်များကို ဖယ်ရှားပြီး အရောင်ကို လျှော့ချရန်';

  @override
  String get theme_profile_seizure_safe_description =>
      'ဤပရိုဖိုင်သည် ဝက်ခာလှုပ်ခြင်းရှိသူနှင့် ဝက်ခာလှုပ်မှုအန္တရာယ်ရှိသူများကို လျပ်ပြက်သော အလင်းအနှေ့များနှင့် အန္တရာယ်ရှိအရောင်ပေါင်းစပ်မှုများကို ဖယ်ရှားခြင်းဖြင့် လုံခြုံစွာတွေ့ကြည့်ရှုနိုင်စေရန် စီမံထားသည်။';

  @override
  String get theme_profile_vision_impaired_title =>
      'အမြင်ချို့ယွင်းမှု ပရိုဖိုင်';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'အက်ပ်လီကေးရှင်း၏ မြင်သာနိုင်မှုကို တိုးမြင့်စေရန်';

  @override
  String get theme_profile_vision_impaired_description =>
      'ဤပရိုဖိုင်သည် အမြင်ချို့ယွင်းမှု၊ ထောင့်ထားမြင်ကွင်း၊ မျက်ကွယ်မှုန်၊ ရေတိမ်၊ ယိုးအမိုင်နှင့် အခြားသော အမြင်ချို့ယွင်းမှုများကို အသုံးပြုရန်အတွက် အက်ပ်လီကေးရှင်းကို လိုက်ဘာအပြောင်းအလဲပြုလုပ်ပေးထားသည်။';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-မိတ်ဆွေ ပရိုဖိုင်';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'အာရုံစိုက်မှု ပိုမိုနှင့် အနှောက်အယှက် လျှော့နည်းစေရန်';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ဤပရိုဖိုင်သည် ADHD နှင့် အာရုံဖွံ့ဖြိုးမှုဆိုင်ရာ နောက်ဆက်တွဲချို့ယွင်းမှုများရှိသူများကို အက်ပ်လီကေးရှင်း၏ အခြေခံအစိတ်အပိုင်းများကို ပိုမိုအာရုံစိုက်နိုင်ရန်နှင့် လွယ်ကူစွာ အနှောက်အယှက်များကို လျှော့ချပေးသည်။';

  @override
  String get the_settings_have_been_reset =>
      'ဆက်တင်များကို ပြန်လည်ပြင်ဆင်ပြီးပါပြီ။';

  @override
  String get toggle_dark_mode => 'အမှောင်မိုဒ်ကို ပြောင်းရန်';

  @override
  String get toggle_effects_mode => 'အထူးပြုလုပ်ချက်များမိုဒ်ကို ပြောင်းရန်';

  @override
  String get toggle_font_weight => 'ဖော့အလေးချိန်ကို ပြောင်းရန်';

  @override
  String get toggle_theme_profile => 'အပြင်အဆင်ပရိုဖိုင်ကို ပြောင်းရန်';

  @override
  String get word_spacing => 'စကားလုံး အကွာအဝေး';
}
