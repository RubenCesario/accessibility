// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AccessibilityLocalizationsOr extends AccessibilityLocalizations {
  AccessibilityLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get accessibility => 'ଅଭିଗମ୍ୟତା';

  @override
  String get accessibilitySettings => 'ଅଭିଗମ୍ୟତା ସେଟିଂସ୍';

  @override
  String get adjustBackgroundColors =>
      'ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ସମ୍ବନ୍ଧୀୟ ସମାୟୋଜନ କରନ୍ତୁ';

  @override
  String get adjustTextColors => 'ଲେଖା ରଙ୍ଗ ସମାୟୋଜନ କରନ୍ତୁ';

  @override
  String get alignCenter => 'ମଧ୍ୟରେ ସଜାନ୍ତୁ';

  @override
  String get alignLeft => 'ବାମକୁ ସଜାନ୍ତୁ';

  @override
  String get alignRight => 'ଡାହାଣକୁ ସଜାନ୍ତୁ';

  @override
  String get textAlignment => 'ଟେକ୍ସଟ ସଜ୍ଜିକରଣ';

  @override
  String get boldText => 'ଗାଢ଼ ଲେଖା';

  @override
  String get changeBoldText => 'ଗାଢ଼ ଲେଖା ପରିବର୍ତ୍ତନ କରନ୍ତୁ';

  @override
  String get changePagesBackgroundColor =>
      'ପୃଷ୍ଠାଗୁଡ଼ିକର ପୃଷ୍ଠଭୂମି ରଙ୍ଗକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: ';

  @override
  String get changeTextColor => 'ଲେଖାର ରଙ୍ଗକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: ';

  @override
  String get changeTextColorShade => 'ରଙ୍ଗର ଛାୟାକୁ ପରିବର୍ତ୍ତନ କରନ୍ତୁ: ';

  @override
  String get colorAdjustment => 'ରଙ୍ଗ ସମାୟୋଜନ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ସାଧାରଣ',
      'lowSaturation': 'ନିମ୍ନ ସଂତୃପ୍ତି',
      'normal': 'ସାଧାରଣ',
      'highSaturation': 'ଉଚ୍ଚ ସଂତୃପ୍ତି',
      'monochrome': 'ଏକବର୍ଣିଆ',
      'highContrast': 'ଉଚ୍ଚ ବିପରୀତତା',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ବର୍ତ୍ତମାନ ରଙ୍ଗ ପ୍ରୋଫାଇଲ୍ ହେଉଛି: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ କମ୍ କରନ୍ତୁ';

  @override
  String get decrementLetterSpacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ କମ୍ କରନ୍ତୁ';

  @override
  String get decrementLineHeight => 'ଧାଡ଼ି ଉଚ୍ଚତା କମ୍ କରନ୍ତୁ';

  @override
  String get decrementTextScaleFactor => 'ଲେଖା ସ୍କେଲ୍ ଫ୍ୟାକ୍ଟର୍ କମ୍ କରନ୍ତୁ';

  @override
  String get effects => 'ପ୍ରଭାବ';

  @override
  String get expandText => 'ଲେଖା ବଢ଼ାନ୍ତୁ';

  @override
  String get fontSize => 'ଫଣ୍ଟ ଆକାର';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'ଶବ୍ଦ ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'ଅକ୍ଷର ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increaseOrDecreaseLineHeight =>
      'ଧାଡ଼ି ଉଚ୍ଚତା ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get increaseOrDecreaseTextSize =>
      'ଲେଖା ଆକାର ବଢ଼ାନ୍ତୁ କିମ୍ବା କମ୍ କରନ୍ତୁ';

  @override
  String get incrementWordSpacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ';

  @override
  String get incrementLetterSpacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ ବଢ଼ାନ୍ତୁ';

  @override
  String get incrementLineHeight => 'ଧାଡ଼ି ଉଚ୍ଚତା ବଢ଼ାନ୍ତୁ';

  @override
  String get incrementTextScaleFactor => 'ଲେଖା ସ୍କେଲ୍ ଫ୍ୟାକ୍ଟର୍ ବଢ଼ାନ୍ତୁ';

  @override
  String get lessInfo => 'ସୂଚନା ଲୁଚାନ୍ତୁ';

  @override
  String get letterSpacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ';

  @override
  String get lineHeight => 'ଧାଡ଼ି ଉଚ୍ଚତା';

  @override
  String get moreInfo => 'ସୂଚନା ଦେଖାନ୍ତୁ';

  @override
  String get readLess => 'କମ୍ ପଢ଼ନ୍ତୁ';

  @override
  String get readMore => 'ଅଧିକ ପଢ଼ନ୍ତୁ';

  @override
  String get reduceEffects => 'ସ୍କ୍ରିନରେ ପ୍ରଭାବ କମ୍ କରନ୍ତୁ';

  @override
  String get reduceText => 'ଲେଖା କମ୍ କରନ୍ତୁ';

  @override
  String get restoreSettings => 'ସେଟିଂସ୍ ପୁନଃସ୍ଥାପନ କରନ୍ତୁ';

  @override
  String get restoreMainColor => 'ମୁଖ୍ୟ ରଙ୍ଗ ପୁନଃସ୍ଥାପନ କରନ୍ତୁ';

  @override
  String get returnToMainColors => 'ମୁଖ୍ୟ ରଙ୍ଗକୁ ଫେରନ୍ତୁ';

  @override
  String get settings => 'ସେଟିଂସ୍';

  @override
  String get sizeAndTextDisplay => 'ଆକାର ଏବଂ ଲେଖା ପ୍ରଦର୍ଶନ';

  @override
  String get sliderWordSpacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ ସ୍ଲାଇଡର୍';

  @override
  String get sliderLetterSpacing => 'ଅକ୍ଷର ବ୍ୟବଧାନ ସ୍ଲାଇଡର୍';

  @override
  String get sliderLineHeight => 'ଧାଡ଼ି ଉଚ୍ଚତା ସ୍ଲାଇଡର୍';

  @override
  String get themeMode => 'ଥିମ୍';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ଥିମ୍ ପ୍ରୋଫାଇଲ୍ ଚିହ୍ନଟ ହେଲା ନାହିଁ',
      'seizureSafe': 'ମୃଗୀରୋଗ ସୁରକ୍ଷିତ',
      'visionImpaired': 'ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତ',
      'adhdFriendly': 'ADHD ଅନୁକୂଳ',
      'none': 'ଡିଫଲ୍ଟ ପ୍ରୋଫାଇଲ୍',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'ମୃଗୀରୋଗ ସୁରକ୍ଷିତ ପ୍ରୋଫାଇଲ୍';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'ପ୍ରତିଫଳନ ଦୂର କରନ୍ତୁ ଏବଂ ରଙ୍ଗ କମ୍ କରନ୍ତୁ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ଏହି ପ୍ରୋଫାଇଲ୍ ମୃଗୀରୋଗ ଥିବା ଏବଂ ମୃଗୀରୋଗ ଆକ୍ରମଣର ଆଶଙ୍କା ଥିବା ବ୍ୟକ୍ତିମାନଙ୍କୁ ଚମକୁଥିବା ଏନିମେସନ୍ ଏବଂ ବିପଜ୍ଜନକ ରଙ୍ଗ ସଂଯୋଜନାରୁ ଉତ୍ପନ୍ନ ହେଉଥିବା ମୃଗୀରୋଗ ଆକ୍ରମଣର ଆଶଙ୍କାକୁ ଦୂର କରି ସୁରକ୍ଷିତ ଭାବରେ ବ୍ରାଉଜ୍ କରିବାକୁ ସକ୍ଷମ କରେ।';

  @override
  String get themeProfileVisionImpairedTitle => 'ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତ ପ୍ରୋଫାଇଲ୍';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ଆପ୍ଲିକେସନର ଦୃଶ୍ୟତା ଉନ୍ନତ କରନ୍ତୁ';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ଏହି ପ୍ରୋଫାଇଲ୍ ଆପ୍ଲିକେସନକୁ ଅଧିକାଂଶ ଦୃଶ୍ୟ ପ୍ରତିବନ୍ଧକତା, ଯେପରିକି ଦୃଷ୍ଟି ପ୍ରତିବନ୍ଧିତତା, ଟନେଲ୍ ଦୃଷ୍ଟି, ମୋତିଆବିନ୍ଦୁ, ଗ୍ଲୁକୋମା ଏବଂ ଅଧିକ ପାଇଁ ଅଭିଗମ୍ୟ ହେବା ପାଇଁ ଅନୁକୂଳିତ କରେ।';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-ଅନୁକୂଳ ପ୍ରୋଫାଇଲ୍';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'ଅଧିକ ଏକାଗ୍ରତା ଏବଂ କମ୍ ବିଚଳିତତା';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ଏହି ପ୍ରୋଫାଇଲ୍ ADHD ଏବଂ ସ୍ନାୟୁ ବିକାଶ ବ୍ୟାଧି ଥିବା ବ୍ୟକ୍ତିମାନଙ୍କୁ ଆପ୍ଲିକେସନର ଅତ୍ୟାବଶ୍ୟକ ଉପାଦାନଗୁଡ଼ିକ ଉପରେ ସହଜରେ ନେଭିଗେଟ୍ କରିବା, ପଢ଼ିବା ଏବଂ ଧ୍ୟାନ ଦେବାରେ ସାହାଯ୍ୟ କରିବା ପାଇଁ ବିଚଳିତତାକୁ ଉଲ୍ଲେଖନୀୟ ଭାବରେ କମ୍ କରେ।';

  @override
  String get theSettingsHaveBeenReset => 'ସେଟିଂସ୍ ପୁନଃସ୍ଥାପିତ ହୋଇଛି।';

  @override
  String get toggleDarkMode => 'ଅନ୍ଧାର ମୋଡ୍ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get toggleEffectsMode => 'ପ୍ରଭାବ ମୋଡ୍ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get toggleFontWeight => 'ଫଣ୍ଟ ଓଜନ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get toggleThemeProfile => 'ଥିମ୍ ପ୍ରୋଫାଇଲ୍ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get wordSpacing => 'ଶବ୍ଦ ବ୍ୟବଧାନ';

  @override
  String get accessibleFont => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ';

  @override
  String get accessibleFontSubtitle =>
      'ଭଲ ପଠନୀୟତା ପାଇଁ ଏକ ସୁଲଭ ଫଣ୍ଟ ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get accessibleFontEnabled => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ ସକ୍ଷମ';

  @override
  String get accessibleFontDisabled => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ ଅକ୍ଷମ';

  @override
  String get toggleAccessibleFont => 'ଅଭିଗମ୍ୟ ଫଣ୍ଟ ଟୋଗଲ୍ କରନ୍ତୁ';

  @override
  String get settingsLoading => 'ଅଭିଗମ୍ୟତା ସେଟିଂସ୍ ଲୋଡ୍ ହେଉଛି…';

  @override
  String get settingsLoadFailed => 'ଅଭିଗମ୍ୟତା ସେଟିଂସ୍ ଲୋଡ୍ ହୋଇପାରିଲା ନାହିଁ।';

  @override
  String get retry => 'ପୁନଃ ଚେଷ୍ଟା କରନ୍ତୁ';
}
