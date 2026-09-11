// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AccessibilityLocalizationsKa extends AccessibilityLocalizations {
  AccessibilityLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get accessibility => 'ხელმისაწვდომობა';

  @override
  String get accessibilitySettings => 'ხელმისაწვდომობის პარამეტრები';

  @override
  String get adjustBackgroundColors => 'ფონის ფერების რეგულირება';

  @override
  String get adjustTextColors => 'ტექსტის ფერების რეგულირება';

  @override
  String get alignCenter => 'შუაში გასწორება';

  @override
  String get alignLeft => 'მარცხნივ გასწორება';

  @override
  String get alignRight => 'მარჯვნივ გასწორება';

  @override
  String get textAlignment => 'ტექსტის გასწორება';

  @override
  String get boldText => 'მუქი ტექსტი';

  @override
  String get changeBoldText => 'მუქი ტექსტის შეცვლა';

  @override
  String get changePagesBackgroundColor => 'გვერდების ფონის ფერის შეცვლა: ';

  @override
  String get changeTextColor => 'ტექსტის ფერის შეცვლა: ';

  @override
  String get changeTextColorShade => 'ფერის ელფერის შეცვლა: ';

  @override
  String get colorAdjustment => 'ფერის რეგულირება';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ნორმალური',
      'lowSaturation': 'დაბალი სატურაცია',
      'normal': 'ნორმალური',
      'highSaturation': 'მაღალი სატურაცია',
      'monochrome': 'მონოქრომული',
      'highContrast': 'მაღალი კონტრასტი',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'მიმდინარე ფერის პროფილი არის: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'ფერი არ არის ამოცნობილი',
      'cF44336': 'წითელი',
      'cE91E63': 'ვარდისფერი',
      'c9C27B0': 'იისფერი',
      'c673AB7': 'მუქი იისფერი',
      'c3F51B5': 'ინდიგო',
      'c2196F3': 'ლურჯი',
      'c03A9F4': 'ღია ლურჯი',
      'c00BCD4': 'ციანი',
      'c009688': 'ტილო',
      'c4CAF50': 'მწვანე',
      'c8BC34A': 'ღია მწვანე',
      'cCDDC39': 'ლაიმი',
      'cFFEB3B': 'ყვითელი',
      'cFFC107': 'ქარვისფერი',
      'cFF9800': 'ნარინჯისფერი',
      'cFF5722': 'მუქი ნარინჯისფერი',
      'c795548': 'ყავისფერი',
      'c9E9E9E': 'ნაცრისფერი',
      'c607D8B': 'ლურჯი-ნაცრისფერი',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'სიტყვებს შორის დაშორების შემცირება';

  @override
  String get decrementLetterSpacing => 'ასოებს შორის დაშორების შემცირება';

  @override
  String get decrementLineHeight => 'ხაზის სიმაღლის შემცირება';

  @override
  String get decrementTextScaleFactor => 'ტექსტის მასშტაბის ფაქტორის შემცირება';

  @override
  String get effects => 'ეფექტები';

  @override
  String get expandText => 'ტექსტის გაფართოება';

  @override
  String get fontSize => 'ფონტის ზომა';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'სიტყვებს შორის დაშორების გაზრდა ან შემცირება';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'ასოებს შორის დაშორების გაზრდა ან შემცირება';

  @override
  String get increaseOrDecreaseLineHeight =>
      'ხაზის სიმაღლის გაზრდა ან შემცირება';

  @override
  String get increaseOrDecreaseTextSize => 'ტექსტის ზომის გაზრდა ან შემცირება';

  @override
  String get incrementWordSpacing => 'სიტყვებს შორის დაშორების გაზრდა';

  @override
  String get incrementLetterSpacing => 'ასოებს შორის დაშორების გაზრდა';

  @override
  String get incrementLineHeight => 'ხაზის სიმაღლის გაზრდა';

  @override
  String get incrementTextScaleFactor => 'ტექსტის მასშტაბის ფაქტორის გაზრდა';

  @override
  String get lessInfo => 'ინფორმაციის დამალვა';

  @override
  String get letterSpacing => 'ასოებს შორის დაშორება';

  @override
  String get lineHeight => 'ხაზის სიმაღლე';

  @override
  String get moreInfo => 'ინფორმაციის ჩვენება';

  @override
  String get readLess => 'ნაკლების წაკითხვა';

  @override
  String get readMore => 'მეტის წაკითხვა';

  @override
  String get reduceEffects => 'ეკრანის ეფექტების შემცირება';

  @override
  String get reduceText => 'ტექსტის შემცირება';

  @override
  String get restoreSettings => 'პარამეტრების აღდგენა';

  @override
  String get restoreMainColor => 'მთავარი ფერის აღდგენა';

  @override
  String get returnToMainColors => 'მთავარ ფერებზე დაბრუნება';

  @override
  String get settings => 'პარამეტრები';

  @override
  String get sizeAndTextDisplay => 'ზომა და ტექსტის ჩვენება';

  @override
  String get sliderWordSpacing => 'სიტყვებს შორის დაშორების სლაიდერი';

  @override
  String get sliderLetterSpacing => 'ასოებს შორის დაშორების სლაიდერი';

  @override
  String get sliderLineHeight => 'ხაზის სიმაღლის სლაიდერი';

  @override
  String get themeMode => 'თემა';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'თემის პროფილი ვერ ამოიცნო',
      'seizureSafe': 'კრუნჩხვისგან უსაფრთხო',
      'visionImpaired': 'მხედველობის დარღვევა',
      'adhdFriendly': 'ADHD მეგობრული',
      'none': 'ნაგულისხმევი პროფილი',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'კრუნჩხვისგან უსაფრთხო პროფილი';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'არეკვლების მოცილება და ფერების შემცირება';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ეს პროფილი საშუალებას აძლევს მომხმარებლებს, რომლებსაც აქვთ ეპილეფსია და კრუნჩხვების რისკი, უსაფრთხოდ ათვალიერონ აპლიკაცია ციმციმა ანიმაციებისა და სარისკო ფერთა კომბინაციებით გამოწვეული კრუნჩხვების რისკის აღმოფხვრით.';

  @override
  String get themeProfileVisionImpairedTitle => 'მხედველობის დარღვევის პროფილი';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'აპლიკაციის ხილვადობის გაუმჯობესება';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ეს პროფილი უზრუნველყოფს აპლიკაციის ხელმისაწვდომობას მხედველობის უმეტესი დარღვევებისთვის, როგორიცაა მხედველობის დარღვევა, ტუნელური ხედვა, კატარაქტა, გლაუკომა და სხვა.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD-მეგობრული პროფილი';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'მეტი კონცენტრაცია და ნაკლები ყურადღების გაფანტვა';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ეს პროფილი მნიშვნელოვნად ამცირებს ყურადღების გამფანტავ ფაქტორებს, რაც ეხმარება ADHD-ის და ნეიროგანვითარების დარღვევების მქონე ადამიანებს, უფრო ადვილად ნავიგაცია, წაკითხვა და აპლიკაციის მნიშვნელოვან ელემენტებზე კონცენტრირება მოახდინონ.';

  @override
  String get theSettingsHaveBeenReset => 'პარამეტრები აღდგენილია.';

  @override
  String get toggleDarkMode => 'ბნელი რეჟიმის გადართვა';

  @override
  String get toggleEffectsMode => 'ეფექტების რეჟიმის გადართვა';

  @override
  String get toggleFontWeight => 'ფონტის სისქის გადართვა';

  @override
  String get toggleThemeProfile => 'თემის პროფილის გადართვა';

  @override
  String get wordSpacing => 'სიტყვებს შორის დაშორება';

  @override
  String get accessibleFont => 'ხელმისაწვდომი შრიფტი';

  @override
  String get accessibleFontSubtitle =>
      'გამოიყენეთ ხელმისაწვდომი შრიფტი უკეთესი წაკითხვადობისთვის';

  @override
  String get accessibleFontEnabled => 'ხელმისაწვდომი შრიფტი ჩართულია';

  @override
  String get accessibleFontDisabled => 'ხელმისაწვდომი შრიფტი გამორთულია';

  @override
  String get toggleAccessibleFont => 'ხელმისაწვდომი შრიფტის გადართვა';

  @override
  String get settingsLoading => 'ხელმისაწვდომობის პარამეტრები იტვირთება…';

  @override
  String get settingsLoadFailed =>
      'ხელმისაწვდომობის პარამეტრების ჩატვირთვა ვერ მოხერხდა.';

  @override
  String get retry => 'ხელახლა ცდა';

  @override
  String get themeModeSystem => 'სისტემა';

  @override
  String get themeModeLight => 'ნათელი';

  @override
  String get themeModeDark => 'ბნელი';

  @override
  String get effectsModeSystem => 'სისტემა';

  @override
  String get effectsModeEnabled => 'ჩართული';

  @override
  String get effectsModeDisabled => 'გამორთული';
}
