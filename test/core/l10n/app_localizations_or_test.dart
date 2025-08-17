import 'package:accessibility/src/core/l10n/generated/app_localizations_or.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsOr', () {
    late AccessibilityLocalizationsOr loc;

    setUp(() {
      loc = AccessibilityLocalizationsOr();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('or'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ଅଭିଗମ୍ୟତା'));
      expect(loc.accessibility_settings, equals('ଅଭିଗମ୍ୟତା ସେଟିଂସ୍'));
      expect(
        loc.adjust_background_colors,
        equals('ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ସମ୍ବନ୍ଧୀୟ ସମାୟୋଜନ କରନ୍ତୁ'),
      );
      expect(loc.adjust_text_colors, equals('ଲେଖା ରଙ୍ଗ ସମାୟୋଜନ କରନ୍ତୁ'));
      expect(loc.align_center, equals('ମଧ୍ୟରେ ସଜାନ୍ତୁ'));
      expect(loc.align_left, equals('ବାମକୁ ସଜାନ୍ତୁ'));
      expect(loc.align_right, equals('ଡାହାଣକୁ ସଜାନ୍ତୁ'));
      expect(loc.bold_text, equals('ଗାଢ଼ ଲେଖା'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('ଗାଢ଼ ଲେଖା ପରିବର୍ତ୍ତନ କରନ୍ତୁ'),
      );
      expect(
        loc.change_pages_background_color,
        equals('ପୃଷ୍ଠାଗୁଡ଼ିକର ପୃଷ୍ଠଭୂମି ରଙ୍ଗକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: '),
      );
      expect(
        loc.change_text_color,
        equals('ଲେଖାର ରଙ୍ଗକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('ରଙ୍ଗର ଛାୟାକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: '),
      );
      expect(loc.color_adjustment, equals('ରଙ୍ଗ ସମାୟୋଜନ'));
      expect(
        loc.color_profile_changed_to,
        equals('ବର୍ତ୍ତମାନ ରଙ୍ଗ ପ୍ରୋଫାଇଲ୍ ହେଉଛି: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('ଶବ୍ଦ ବ୍ୟବଧାନ କମ୍ କରନ୍ତୁ'));
      expect(
        loc.decrement_letter_spacing,
        equals('ଅକ୍ଷର ବ୍ୟବଧାନ କମ୍ କରନ୍ତୁ'),
      );
      expect(loc.decrement_line_height, equals('ଧାଡ଼ି ଉଚ୍ଚତା କମ୍ କରନ୍ତୁ'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ଲେଖା ସ୍କେଲ୍ ଫ୍ୟାକ୍ଟର୍ କମ୍ କରନ୍ତୁ'),
      );
      expect(loc.increment_word_spacing, equals('ଶବ୍ଦ ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ'));
      expect(loc.increment_letter_spacing, equals('ଅକ୍ଷର ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ'));
      expect(loc.increment_line_height, equals('ଧାଡ଼ି ଉଚ୍ଚତା ବଢ଼ାନ୍ତୁ'));
      expect(
        loc.increment_text_scale_factor,
        equals('ଲେଖା ସ୍କେଲ୍ ଫ୍ୟାକ୍ଟର୍ ବଢ଼ାନ୍ତୁ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('ଶବ୍ଦ ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('ଅକ୍ଷର ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('ଧାଡ଼ି ଉଚ୍ଚତା ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ଲେଖା ଆକାର ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ପ୍ରଭାବ'));
      expect(loc.expand_text, equals('ଲେଖା ବଢ଼ାନ୍ତୁ'));
      expect(loc.font_size, equals('ଫଣ୍ଟ ଆକାର'));
      expect(loc.less_info, equals('ସୂଚନା ଲୁଚାନ୍ତୁ'));
      expect(loc.letter_spacing, equals('ଅକ୍ଷର ବ୍ୟବଧାନ'));
      expect(loc.line_height, equals('ଧାଡ଼ି ଉଚ୍ଚତା'));
      expect(loc.more_info, equals('ସୂଚନା ଦେଖାନ୍ତୁ'));
      expect(loc.word_spacing, equals('ଶବ୍ଦ ବ୍ୟବଧାନ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('କମ୍ ପଢ଼ନ୍ତୁ'));
      expect(loc.read_more, equals('ଅଧିକ ପଢ଼ନ୍ତୁ'));
      expect(
        loc.reduce_effects,
        equals('ସ୍କ୍ରିନରେ ପ୍ରଭାବ କମ୍ କରନ୍ତୁ'),
      );
      expect(loc.reduce_text, equals('ଲେଖା କମ୍ କରନ୍ତୁ'));
      expect(loc.restore_settings, equals('ସେଟିଂସ୍ ପୁନଃସ୍ଥାପନ କରନ୍ତୁ'));
      expect(loc.restore_main_color, equals('ମୁଖ୍ୟ ରଙ୍ଗ ପୁନଃସ୍ଥାପନ କରନ୍ତୁ'));
      expect(loc.return_to_main_colors, equals('ମୁଖ୍ୟ ରଙ୍ଗକୁ ଫେରନ୍ତୁ'));
      expect(loc.settings, equals('ସେଟିଂସ୍'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ଆକାର ଏବଂ ଲେଖା ପ୍ରଦର୍ଶନ'),
      );
      expect(loc.slider_word_spacing, equals('ଶବ୍ଦ ବ୍ୟବଧାନ ସ୍ଲାଇଡର୍'));
      expect(loc.slider_letter_spacing, equals('ଅକ୍ଷର ବ୍ୟବଧାନ ସ୍ଲାଇଡର୍'));
      expect(loc.slider_line_height, equals('ଧାଡ଼ି ଉଚ୍ଚତା ସ୍ଲାଇଡର୍'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ଥିମ୍'));
      expect(
        loc.theme_profile('other'),
        equals('ଥିମ୍ ପ୍ରୋଫାଇଲ୍ ଚିହ୍ନଟ ହେଲା ନାହିଁ'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('ମୃଗୀରୋଗ ସୁରକ୍ଷିତ'));
      expect(loc.theme_profile('visionImpaired'), equals('ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତ'));
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD ଅନୁକୂଳ'));
      expect(loc.theme_profile('none'), equals('ଡିଫଲ୍ଟ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ମୃଗୀରୋଗ ସୁରକ୍ଷିତ ପ୍ରୋଫାଇଲ୍'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ପ୍ରତିଫଳନ ଦୂର କରନ୍ତୁ ଏବଂ ରଙ୍ଗ କମ୍ କରନ୍ତୁ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ଏହି ପ୍ରୋଫାଇଲ୍ ମୃଗୀରୋଗ ଥିବା ଏବଂ ମୃଗୀରୋଗ ଆକ୍ରମଣର '
          'ଆଶଙ୍କା ଥିବା ବ୍ୟକ୍ତିମାନଙ୍କୁ ଚମକୁଥିବା ଏନିମେସନ୍ ଏବଂ '
          'ବିପଜ୍ଜନକ ରଙ୍ଗ ସଂଯୋଜନାରୁ ଉତ୍ପନ୍ନ ହେଉଥିବା ମୃଗୀରୋଗ '
          'ଆକ୍ରମଣର ଆଶଙ୍କାକୁ ଦୂର କରି ସୁରକ୍ଷିତ ଭାବରେ '
          'ବ୍ରାଉଜ୍ କରିବାକୁ ସକ୍ଷମ କରେ।',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତ ପ୍ରୋଫାଇଲ୍'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ଆପ୍ଲିକେସନର ଦୃଶ୍ୟତା ଉନ୍ନତ କରନ୍ତୁ'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ଏହି ପ୍ରୋଫାଇଲ୍ ଆପ୍ଲିକେସନକୁ ଅଧିକାଂଶ ଦୃଶ୍ୟ '
          'ପ୍ରତିବନ୍ଧକତା, ଯେପରିକି ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତତା, '
          'ଟନେଲ୍ ଦୃଷ୍ଟି, ମୋତିଆବିନ୍ଦୁ, ଗ୍ଲୁକୋମା ଏବଂ ଅଧିକ '
          'ପାଇଁ ଅଭିଗମ୍ୟ ହେବା ପାଇଁ ଅନୁକୂଳିତ କରେ।',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-ଅନୁକୂଳ ପ୍ରୋଫାଇଲ୍'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ଅଧିକ ଏକାଗ୍ରତା ଏବଂ କମ୍ ବିଚଳିତତା'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ଏହି ପ୍ରୋଫାଇଲ୍ ADHD ଏବଂ ସ୍ନାୟୁ ବିକାଶ ବ୍ୟାଧି ଥିବା '
          'ବ୍ୟକ୍ତିମାନଙ୍କୁ ଆପ୍ଲିକେସନର ଅତ୍ୟାବଶ୍ୟକ '
          'ଉପାଦାନଗୁଡ଼ିକ ଉପରେ ସହଜରେ ନେଭିଗେଟ୍ କରିବା, '
          'ପଢ଼ିବା ଏବଂ ଧ୍ୟାନ ଦେବାରେ ସାହାଯ୍ୟ କରିବା '
          'ପାଇଁ ବିଚଳିତତାକୁ ଉଲ୍ଲେଖନୀୟ ଭାବରେ କମ୍ କରେ।',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ସେଟିଂସ୍ ପୁନଃସ୍ଥାପିତ ହୋଇଛି।'),
      );
      expect(loc.toggle_dark_mode, equals('ଅନ୍ଧାର ମୋଡ୍ ଟୋଗଲ୍ କରନ୍ତୁ'));
      expect(loc.toggle_effects_mode, equals('ପ୍ରଭାବ ମୋଡ୍ ଟୋଗଲ୍ କରନ୍ତୁ'));
      expect(loc.toggle_font_weight, equals('ଫଣ୍ଟ ଓଜନ ଟୋଗଲ୍ କରନ୍ତୁ'));
      expect(loc.toggle_theme_profile, equals('ଥିମ୍ ପ୍ରୋଫାଇଲ୍ ଟୋଗଲ୍ କରନ୍ତୁ'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('ସାଧାରଣ'));
      expect(loc.color_profile('lowSaturation'), equals('ନିମ୍ନ ସଂତୃପ୍ତି'));
      expect(loc.color_profile('normal'), equals('ସାଧାରଣ'));
      expect(loc.color_profile('highSaturation'), equals('ଉଚ୍ଚ ସଂତୃପ୍ତି'));
      expect(loc.color_profile('monochrome'), equals('ଏକବର୍ଣିଆ'));
      expect(loc.color_profile('highContrast'), equals('ଉଚ୍ଚ ବିପରୀତତା'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('ରଙ୍ଗ ଚିହ୍ନଟ ହେଲା ନାହିଁ'));
      expect(loc.color('cF44336'), equals('ଲାଲ୍'));
      expect(loc.color('cE91E63'), equals('ଗୁଲାବୀ'));
      expect(loc.color('c9C27B0'), equals('ବାଇଗଣୀ'));
      expect(loc.color('c673AB7'), equals('ଗାଢ଼ ବାଇଗଣୀ'));
      expect(loc.color('c3F51B5'), equals('ଇନ୍ଦ୍ରଧନୁ'));
      expect(loc.color('c2196F3'), equals('ନୀଳ'));
      expect(loc.color('c03A9F4'), equals('ହାଲୁକା ନୀଳ'));
      expect(loc.color('c00BCD4'), equals('ସିୟାନ୍'));
      expect(loc.color('c009688'), equals('ଟିଲ୍'));
      expect(loc.color('c4CAF50'), equals('ସବୁଜ'));
      expect(loc.color('c8BC34A'), equals('ହାଲୁକା ସବୁଜ'));
      expect(loc.color('cCDDC39'), equals('ଲାଇମ୍'));
      expect(loc.color('cFFEB3B'), equals('ହଳଦିଆ'));
      expect(loc.color('cFFC107'), equals('ଅମ୍ବର'));
      expect(loc.color('cFF9800'), equals('କମଳା'));
      expect(loc.color('cFF5722'), equals('ଗାଢ଼ କମଳା'));
      expect(loc.color('c795548'), equals('ଧୂସର'));
      expect(loc.color('c9E9E9E'), equals('ଧୂସର'));
      expect(loc.color('c607D8B'), equals('ନୀଳ ଧୂସର'));
    });
  });
}
