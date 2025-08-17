import 'package:accessibility/src/core/l10n/generated/app_localizations_my.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsMy', () {
    late AccessibilityLocalizationsMy loc;

    setUp(() {
      loc = AccessibilityLocalizationsMy();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('my'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('လက်လှမ်းမှီနိုင်မှု'));
      expect(
        loc.accessibility_settings,
        equals('လက်လှမ်းမှီနိုင်မှု ဆက်တင်များ'),
      );
      expect(
        loc.adjust_background_colors,
        equals('နောက်ခံ အရောင်များကို ချိန်ညှိရန်'),
      );
      expect(
        loc.adjust_text_colors,
        equals('စာသား အရောင်များကို ချိန်ညှိရန်'),
      );
      expect(loc.align_center, equals('အလယ်ညီရန်'));
      expect(loc.align_left, equals('ဘယ်ညီရန်'));
      expect(loc.align_right, equals('ညာညီရန်'));
      expect(loc.bold_text, equals('စာလုံးမဲ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('စာလုံးမဲကို ပြောင်းရန်'));
      expect(
        loc.change_pages_background_color,
        equals('စာမျက်နှာများ၏ နောက်ခံ အရောင်ကို ပြောင်းရန်: '),
      );
      expect(
        loc.change_text_color,
        equals('စာသား၏ အရောင်ကို ပြောင်းရန်: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('အရောင်၏ အရိပ်ကို ပြောင်းရန်: '),
      );
      expect(loc.color_adjustment, equals('အရောင် ချိန်ညှိခြင်း'));
      expect(
        loc.color_profile_changed_to,
        equals('လက်ရှိအရောင်ပရိုဖိုင်မှာ: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('စကားလုံး အကွာအဝေးကို လျှော့ချရန်'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('စာလုံး အကွာအဝေးကို လျှော့ချရန်'),
      );
      expect(
        loc.decrement_line_height,
        equals('စာကြောင်း အမြင့်ကို လျှော့ချရန်'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('စာသား အတိုင်းအတာကို လျှော့ချရန်'),
      );
      expect(
        loc.increment_word_spacing,
        equals('စကားလုံး အကွာအဝေးကို တိုးချဲ့ရန်'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('စာလုံး အကွာအဝေးကို တိုးချဲ့ရန်'),
      );
      expect(
        loc.increment_line_height,
        equals('စာကြောင်း အမြင့်ကို တိုးချဲ့ရန်'),
      );
      expect(
        loc.increment_text_scale_factor,
        equals('စာသား အတိုင်းအတာကို တိုးချဲ့ရန်'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('အထူးပြုလုပ်ချက်များ'));
      expect(loc.expand_text, equals('စာသားကို ချဲ့ရန်'));
      expect(loc.font_size, equals('ဖောင့်အရွယ်အစား'));
      expect(loc.less_info, equals('အချက်အလက်ကို ဖေျာက်ရန်'));
      expect(loc.letter_spacing, equals('စာလုံး အကွာအဝေး'));
      expect(loc.line_height, equals('စာကြောင်း အမြင့်'));
      expect(loc.more_info, equals('အချက်အလက်ကို ပြရန်'));
      expect(loc.word_spacing, equals('စကားလုံး အကွာအဝေး'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('အနည်းငယ် ဖတ်ရန်'));
      expect(loc.read_more, equals('အပြည့်အစုံ ဖတ်ရန်'));
      expect(
        loc.reduce_effects,
        equals('မှန်တင်ပေါ်ရှိ အထူးပြုလုပ်ချက်များကို လျှော့ချရန်'),
      );
      expect(loc.reduce_text, equals('စာသားကို လျှော့ချရန်'));
      expect(
        loc.restore_settings,
        equals('ဆက်တင်များကို ပြန်လည်ပြင်ဆင်ရန်'),
      );
      expect(
        loc.restore_main_color,
        equals('အခြေခံအရောင်ကို ပြန်လည်ပြင်ဆင်ရန်'),
      );
      expect(
        loc.return_to_main_colors,
        equals('အခြေခံအရောင်များကို ပြန်ဘန်'),
      );
      expect(loc.settings, equals('ဆက်တင်များ'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('အရွယ်အစားနှင့် စာသားပြသမှု'),
      );
      expect(
        loc.slider_word_spacing,
        equals('စကားလုံး အကွာအဝေး ဆလိုက်ဒါ'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('စာလုံး အကွာအဝေး ဆလိုက်ဒါ'),
      );
      expect(
        loc.slider_line_height,
        equals('စာကြောင်း အမြင့် ဆလိုက်ဒါ'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('အပြင်အဆင်'));
      expect(
        loc.theme_profile('other'),
        equals('အပြင်အဆင်ပရိုဖိုင်ကို မသိရှိပါ'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('ဝက်ခာလှုပ်မှ ကင်းလွတ်မှု'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('အမြင်ချို့ယွင်းမှု'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD မိတ်ဆွေ'));
      expect(loc.theme_profile('none'), equals('ပုံသေ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ဝက်ခာလှုပ်မှ ကင်းလွတ်သော ပရိုဖိုင်'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ရိုက်ချောင်းလန်ရိပ်များကို ဖယ်ရှားပြီး အရောင်ကို '
            'လျှော့ချရန်'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ဤပရိုဖိုင်သည် ဝက်ခာလှုပ်ခြင်းရှိသူနှင့် '
          'ဝက်ခာလှုပ်မှုအန္တရာယ်ရှိသူများကို လျပ်ပြက်သော '
          'အလင်းအနှေ့များနှင့် အန္တရာယ်ရှိအရောင်ပေါင်းစပ်မှုများကို '
          'ဖယ်ရှားခြင်းဖြင့် လုံခြုံစွာတွေ့ကြည့်ရှုနိုင်စေရန် '
          'စီမံထားသည်။',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('အမြင်ချို့ယွင်းမှု ပရိုဖိုင်'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('အက်ပ်လီကေးရှင်း၏ မြင်သာနိုင်မှုကို တိုးမြင့်စေရန်'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ဤပရိုဖိုင်သည် အမြင်ချို့ယွင်းမှု၊ ထောင့်ထားမြင်ကွင်း၊ '
          'မျက်ကွယ်မှုန်၊ ရေတိမ်၊ ယိုးအမိုင်နှင့် အခြားသော '
          'အမြင်ချို့ယွင်းမှုများကို အသုံးပြုရန်အတွက် '
          'အက်ပ်လီကေးရှင်းကို လိုက်ဘာအပြောင်းအလဲပြုလုပ်ပေးထားသည်။',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-မိတ်ဆွေ ပရိုဖိုင်'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('အာရုံစိုက်မှု ပိုမိုနှင့် အနှောက်အယှက် လျှော့နည်းစေရန်'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ဤပရိုဖိုင်သည် ADHD နှင့် အာရုံဖွံ့ဖြိုးမှုဆိုင်ရာ '
          'နောက်ဆက်တွဲချို့ယွင်းမှုများရှိသူများကို '
          'အက်ပ်လီကေးရှင်း၏ အခြေခံအစိတ်အပိုင်းများကို '
          'ပိုမိုအာရုံစိုက်နိုင်ရန်နှင့် လွယ်ကူစွာ '
          'အနှောက်အယှက်များကို လျှော့ချပေးသည်။',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ဆက်တင်များကို ပြန်လည်ပြင်ဆင်ပြီးပါပြီ။'),
      );
      expect(loc.toggle_dark_mode, equals('အမှောင်မိုဒ်ကို ပြောင်းရန်'));
      expect(
        loc.toggle_effects_mode,
        equals('အထူးပြုလုပ်ချက်များမိုဒ်ကို ပြောင်းရန်'),
      );
      expect(loc.toggle_font_weight, equals('ဖော့အလေးချိန်ကို ပြောင်းရန်'));
      expect(
        loc.toggle_theme_profile,
        equals('အပြင်အဆင်ပရိုဖိုင်ကို ပြောင်းရန်'),
      );
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('ပုံမှန်'));
      expect(loc.color_profile('lowSaturation'), equals('အရောင်ပျော့'));
      expect(loc.color_profile('normal'), equals('ပုံမှန်'));
      expect(loc.color_profile('highSaturation'), equals('အရောင်ပြင်း'));
      expect(loc.color_profile('monochrome'), equals('အဖြူအမည်း'));
      expect(
        loc.color_profile('highContrast'),
        equals('အရောင်ကွာဟချက်မြင့်'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('အရောင်ကို မသိရှိပါ'));
      expect(loc.color('cF44336'), equals('အနီ'));
      expect(loc.color('cE91E63'), equals('ပန်းရောင်'));
      expect(loc.color('c9C27B0'), equals('ခရမ်းရောင်'));
      expect(loc.color('c673AB7'), equals('ခရမ်းရောင်နက်'));
      expect(loc.color('c3F51B5'), equals('မဲနယ်ရောင်'));
      expect(loc.color('c2196F3'), equals('အပြာ'));
      expect(loc.color('c03A9F4'), equals('အပြာဖျော့'));
      expect(loc.color('c00BCD4'), equals('စိမ်းပြာ'));
      expect(loc.color('c009688'), equals('စိမ်းပြာနက်'));
      expect(loc.color('c4CAF50'), equals('အစိမ်း'));
      expect(loc.color('c8BC34A'), equals('အစိမ်းဖျော့'));
      expect(loc.color('cCDDC39'), equals('သံပုရာရောင်'));
      expect(loc.color('cFFEB3B'), equals('အဝါ'));
      expect(loc.color('cFFC107'), equals('ကာရာမယ်ရောင်'));
      expect(loc.color('cFF9800'), equals('လိမ္မော်'));
      expect(loc.color('cFF5722'), equals('လိမ္မော်နက်'));
      expect(loc.color('c795548'), equals('အညို'));
      expect(loc.color('c9E9E9E'), equals('မီးခိုး'));
      expect(loc.color('c607D8B'), equals('ပြာမီးခိုး'));
    });
  });
}
