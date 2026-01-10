// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AccessibilityLocalizationsOr extends AccessibilityLocalizations {
  AccessibilityLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get accessibility => 'ଅଭିଗମ୍ୟତା';

  @override
  String get accessibility_settings => 'ଅଭିଗମ୍ୟତା ସେଟିଂସ୍';

  @override
  String get adjust_background_colors =>
      'ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ସମ୍ବନ୍ଧୀୟ ସମାୟୋଜନ କରନ୍ତୁ';

  @override
  String get adjust_text_colors => 'ଲେଖା ରଙ୍ଗ ସମାୟୋଜନ କରନ୍ତୁ';

  @override
  String get align_center => 'ମଧ୍ୟରେ ସଜାନ୍ତୁ';

  @override
  String get align_left => 'ବାମକୁ ସଜାନ୍ତୁ';

  @override
  String get align_right => 'ଡାହାଣକୁ ସଜାନ୍ତୁ';

  @override
  String get bold_text => 'ଗାଢ଼ ଲେଖା';

  @override
  String get change_bold_text => 'ଗାଢ଼ ଲେଖା ପରିବର୍ତ୍ତନ କରନ୍ତୁ';

  @override
  String get change_pages_background_color =>
      'ପୃଷ୍ଠାଗୁଡ଼ିକର ପୃଷ୍ଠଭୂମି ରଙ୍ଗକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: ';

  @override
  String get change_text_color => 'ଲେଖାର ରଙ୍ଗକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: ';

  @override
  String get change_text_color_shade => 'ରଙ୍ଗର ଛାୟାକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: ';

  @override
  String get color_adjustment => 'ରଙ୍ଗ ସମାୟୋଜନ';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'ସାଧାରଣ',
        'lowSaturation': 'ନିମ୍ନ ସଂତୃପ୍ତି',
        'normal': 'ସାଧାରଣ',
        'highSaturation': 'ଉଚ୍ଚ ସଂତୃପ୍ତି',
        'monochrome': 'ଏକବର୍ଣିଆ',
        'highContrast': 'ଉଚ୍ଚ ବିପରୀତତା',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'ବର୍ତ୍ତମାନ ରଙ୍ଗ ପ୍ରୋଫାଇଲ୍ ହେଉଛି: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'ରଙ୍ଗ ଚିହ୍ନଟ ହେଲା ନାହିଁ',
        'cF44336': 'ଲାଲ୍',
        'cE91E63': 'ଗୁଲାବୀ',
        'c9C27B0': 'ବାଇଗଣୀ',
        'c673AB7': 'ଗାଢ଼ ବାଇଗଣୀ',
        'c3F51B5': 'ଇନ୍ଦ୍ରଧନୁ',
        'c2196F3': 'ନୀଳ',
        'c03A9F4': 'ହାଲୁକା ନୀଳ',
        'c00BCD4': 'ସିୟାନ୍',
        'c009688': 'ଟିଲ୍',
        'c4CAF50': 'ସବୁଜ',
        'c8BC34A': 'ହାଲୁକା ସବୁଜ',
        'cCDDC39': 'ଲାଇମ୍',
        'cFFEB3B': 'ହଳଦିଆ',
        'cFFC107': 'ଅମ୍ବର',
        'cFF9800': 'କମଳା',
        'cFF5722': 'ଗାଢ଼ କମଳା',
        'c795548': 'ଧୂସର',
        'c9E9E9E': 'ଧୂସର',
        'c607D8B': 'ନୀଳ ଧୂସର',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ କମ୍ କରନ୍ତୁ';

  @override
  String get decrement_letter_spacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ କମ୍ କରନ୍ତୁ';

  @override
  String get decrement_line_height => 'ଧାଡ଼ି ଉଚ୍ଚତା କମ୍ କରନ୍ତୁ';

  @override
  String get decrement_text_scale_factor => 'ଲେଖା ସ୍କେଲ୍ ଫ୍ୟାକ୍ଟର୍ କମ୍ କରନ୍ତୁ';

  @override
  String get effects => 'ପ୍ରଭାବ';

  @override
  String get expand_text => 'ଲେଖା ବଢ଼ାନ୍ତୁ';

  @override
  String get font_size => 'ଫଣ୍ଟ ଆକାର';

  @override
  String get increase_or_decrease_word_spacing =>
      'ଶବ୍ଦ ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'ଅକ୍ଷର ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increase_or_decrease_line_height =>
      'ଧାଡ଼ି ଉଚ୍ଚତା ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increase_or_decrease_text_size =>
      'ଲେଖା ଆକାର ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increment_word_spacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ';

  @override
  String get increment_letter_spacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ';

  @override
  String get increment_line_height => 'ଧାଡ଼ି ଉଚ୍ଚତା ବଢ଼ାନ୍ତୁ';

  @override
  String get increment_text_scale_factor => 'ଲେଖା ସ୍କେଲ୍ ଫ୍ୟାକ୍ଟର୍ ବଢ଼ାନ୍ତୁ';

  @override
  String get less_info => 'ସୂଚନା ଲୁଚାନ୍ତୁ';

  @override
  String get letter_spacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ';

  @override
  String get line_height => 'ଧାଡ଼ି ଉଚ୍ଚତା';

  @override
  String get more_info => 'ସୂଚନା ଦେଖାନ୍ତୁ';

  @override
  String get read_less => 'କମ୍ ପଢ଼ନ୍ତୁ';

  @override
  String get read_more => 'ଅଧିକ ପଢ଼ନ୍ତୁ';

  @override
  String get reduce_effects => 'ସ୍କ୍ରିନରେ ପ୍ରଭାବ କମ୍ କରନ୍ତୁ';

  @override
  String get reduce_text => 'ଲେଖା କମ୍ କରନ୍ତୁ';

  @override
  String get restore_settings => 'ସେଟିଂସ୍ ପୁନଃସ୍ଥାପନ କରନ୍ତୁ';

  @override
  String get restore_main_color => 'ମୁଖ୍ୟ ରଙ୍ଗ ପୁନଃସ୍ଥାପନ କରନ୍ତୁ';

  @override
  String get return_to_main_colors => 'ମୁଖ୍ୟ ରଙ୍ଗକୁ ଫେରନ୍ତୁ';

  @override
  String get settings => 'ସେଟିଂସ୍';

  @override
  String get size_and_text_display => 'ଆକାର ଏବଂ ଲେଖା ପ୍ରଦର୍ଶନ';

  @override
  String get slider_word_spacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ ସ୍ଲାଇଡର୍';

  @override
  String get slider_letter_spacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ ସ୍ଲାଇଡର୍';

  @override
  String get slider_line_height => 'ଧାଡ଼ି ଉଚ୍ଚତା ସ୍ଲାଇଡର୍';

  @override
  String get theme_mode => 'ଥିମ୍';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'ଥିମ୍ ପ୍ରୋଫାଇଲ୍ ଚିହ୍ନଟ ହେଲା ନାହିଁ',
        'seizureSafe': 'ମୃଗୀରୋଗ ସୁରକ୍ଷିତ',
        'visionImpaired': 'ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତ',
        'adhdFriendly': 'ADHD ଅନୁକୂଳ',
        'none': 'ଡିଫଲ୍ଟ',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'ମୃଗୀରୋଗ ସୁରକ୍ଷିତ ପ୍ରୋଫାଇଲ୍';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'ପ୍ରତିଫଳନ ଦୂର କରନ୍ତୁ ଏବଂ ରଙ୍ଗ କମ୍ କରନ୍ତୁ';

  @override
  String get theme_profile_seizure_safe_description =>
      'ଏହି ପ୍ରୋଫାଇଲ୍ ମୃଗୀରୋଗ ଥିବା ଏବଂ ମୃଗୀରୋଗ ଆକ୍ରମଣର ଆଶଙ୍କା ଥିବା ବ୍ୟକ୍ତିମାନଙ୍କୁ ଚମକୁଥିବା ଏନିମେସନ୍ ଏବଂ ବିପଜ୍ଜନକ ରଙ୍ଗ ସଂଯୋଜନାରୁ ଉତ୍ପନ୍ନ ହେଉଥିବା ମୃଗୀରୋଗ ଆକ୍ରମଣର ଆଶଙ୍କାକୁ ଦୂର କରି ସୁରକ୍ଷିତ ଭାବରେ ବ୍ରାଉଜ୍ କରିବାକୁ ସକ୍ଷମ କରେ।';

  @override
  String get theme_profile_vision_impaired_title =>
      'ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତ ପ୍ରୋଫାଇଲ୍';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ଆପ୍ଲିକେସନର ଦୃଶ୍ୟତା ଉନ୍ନତ କରନ୍ତୁ';

  @override
  String get theme_profile_vision_impaired_description =>
      'ଏହି ପ୍ରୋଫାଇଲ୍ ଆପ୍ଲିକେସନକୁ ଅଧିକାଂଶ ଦୃଶ୍ୟ ପ୍ରତିବନ୍ଧକତା, ଯେପରିକି ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତତା, ଟନେଲ୍ ଦୃଷ୍ଟି, ମୋତିଆବିନ୍ଦୁ, ଗ୍ଲୁକୋମା ଏବଂ ଅଧିକ ପାଇଁ ଅଭିଗମ୍ୟ ହେବା ପାଇଁ ଅନୁକୂଳିତ କରେ।';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-ଅନୁକୂଳ ପ୍ରୋଫାଇଲ୍';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'ଅଧିକ ଏକାଗ୍ରତା ଏବଂ କମ୍ ବିଚଳିତତା';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ଏହି ପ୍ରୋଫାଇଲ୍ ADHD ଏବଂ ସ୍ନାୟୁ ବିକାଶ ବ୍ୟାଧି ଥିବା ବ୍ୟକ୍ତିମାନଙ୍କୁ ଆପ୍ଲିକେସନର ଅତ୍ୟାବଶ୍ୟକ ଉପାଦାନଗୁଡ଼ିକ ଉପରେ ସହଜରେ ନେଭିଗେଟ୍ କରିବା, ପଢ଼ିବା ଏବଂ ଧ୍ୟାନ ଦେବାରେ ସାହାଯ୍ୟ କରିବା ପାଇଁ ବିଚଳିତତାକୁ ଉଲ୍ଲେଖନୀୟ ଭାବରେ କମ୍ କରେ।';

  @override
  String get the_settings_have_been_reset => 'ସେଟିଂସ୍ ପୁନଃସ୍ଥାପିତ ହୋଇଛି।';

  @override
  String get toggle_dark_mode => 'ଅନ୍ଧାର ମୋଡ୍ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get toggle_effects_mode => 'ପ୍ରଭାବ ମୋଡ୍ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get toggle_font_weight => 'ଫଣ୍ଟ ଓଜନ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get toggle_theme_profile => 'ଥିମ୍ ପ୍ରୋଫାଇଲ୍ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get word_spacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ';

  @override
  String get accessible_font => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ';

  @override
  String get accessible_font_subtitle =>
      'ଭଲ ପଠନୀୟତା ପାଇଁ Verdana ଫଣ୍ଟ ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get accessible_font_enabled => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ ସକ୍ଷମ';

  @override
  String get accessible_font_disabled => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ ଅକ୍ଷମ';

  @override
  String get toggle_accessible_font => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ ଟୋଗଲ୍ କରନ୍ତୁ';
}
