// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AccessibilityLocalizationsKa extends AccessibilityLocalizations {
  AccessibilityLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get accessibility => 'ხელმისაწვდომობა';

  @override
  String get accessibility_settings => 'ხელმისაწვდომობის პარამეტრები';

  @override
  String get adjust_background_colors => 'ფონის ფერების რეგულირება';

  @override
  String get adjust_text_colors => 'ტექსტის ფერების რეგულირება';

  @override
  String get align_center => 'შუაში გასწორება';

  @override
  String get align_left => 'მარცხნივ გასწორება';

  @override
  String get align_right => 'მარჯვნივ გასწორება';

  @override
  String get bold_text => 'მუქი ტექსტი';

  @override
  String get change_bold_text => 'მუქი ტექსტის შეცვლა';

  @override
  String get change_pages_background_color => 'გვერდების ფონის ფერის შეცვლა: ';

  @override
  String get change_text_color => 'ტექსტის ფერის შეცვლა: ';

  @override
  String get change_text_color_shade => 'ფერის ელფერის შეცვლა: ';

  @override
  String get color_adjustment => 'ფერის რეგულირება';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'ნორმალური',
        'lowSaturation': 'დაბალი სატურაცია',
        'normal': 'ნორმალური',
        'highSaturation': 'მაღალი სატურაცია',
        'monochrome': 'მონოქრომული',
        'highContrast': 'მაღალი კონტრასტი',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'მიმდინარე ფერის პროფილი არის: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
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
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'სიტყვებს შორის დაშორების შემცირება';

  @override
  String get decrement_letter_spacing => 'ასოებს შორის დაშორების შემცირება';

  @override
  String get decrement_line_height => 'ხაზის სიმაღლის შემცირება';

  @override
  String get decrement_text_scale_factor =>
      'ტექსტის მასშტაბის ფაქტორის შემცირება';

  @override
  String get effects => 'ეფექტები';

  @override
  String get expand_text => 'ტექსტის გაფართოება';

  @override
  String get font_size => 'ფონტის ზომა';

  @override
  String get increase_or_decrease_word_spacing =>
      'სიტყვებს შორის დაშორების გაზრდა ან შემცირება';

  @override
  String get increase_or_decrease_letter_spacing =>
      'ასოებს შორის დაშორების გაზრდა ან შემცირება';

  @override
  String get increase_or_decrease_line_height =>
      'ხაზის სიმაღლის გაზრდა ან შემცირება';

  @override
  String get increase_or_decrease_text_size =>
      'ტექსტის ზომის გაზრდა ან შემცირება';

  @override
  String get increment_word_spacing => 'სიტყვებს შორის დაშორების გაზრდა';

  @override
  String get increment_letter_spacing => 'ასოებს შორის დაშორების გაზრდა';

  @override
  String get increment_line_height => 'ხაზის სიმაღლის გაზრდა';

  @override
  String get increment_text_scale_factor => 'ტექსტის მასშტაბის ფაქტორის გაზრდა';

  @override
  String get less_info => 'ინფორმაციის დამალვა';

  @override
  String get letter_spacing => 'ასოებს შორის დაშორება';

  @override
  String get line_height => 'ხაზის სიმაღლე';

  @override
  String get more_info => 'ინფორმაციის ჩვენება';

  @override
  String get read_less => 'ნაკლების წაკითხვა';

  @override
  String get read_more => 'მეტის წაკითხვა';

  @override
  String get reduce_effects => 'ეკრანის ეფექტების შემცირება';

  @override
  String get reduce_text => 'ტექსტის შემცირება';

  @override
  String get restore_settings => 'პარამეტრების აღდგენა';

  @override
  String get restore_main_color => 'მთავარი ფერის აღდგენა';

  @override
  String get return_to_main_colors => 'მთავარ ფერებზე დაბრუნება';

  @override
  String get settings => 'პარამეტრები';

  @override
  String get size_and_text_display => 'ზომა და ტექსტის ჩვენება';

  @override
  String get slider_word_spacing => 'სიტყვებს შორის დაშორების სლაიდერი';

  @override
  String get slider_letter_spacing => 'ასოებს შორის დაშორების სლაიდერი';

  @override
  String get slider_line_height => 'ხაზის სიმაღლის სლაიდერი';

  @override
  String get theme_mode => 'თემა';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'თემის პროფილი ვერ ამოიცნო',
        'seizureSafe': 'კრუნჩხვისგან უსაფრთხო',
        'visionImpaired': 'მხედველობის დარღვევა',
        'adhdFriendly': 'ADHD მეგობრული',
        'none': 'ნაგულისხმევი',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'კრუნჩხვისგან უსაფრთხო პროფილი';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'არეკვლების მოცილება და ფერების შემცირება';

  @override
  String get theme_profile_seizure_safe_description =>
      'ეს პროფილი საშუალებას აძლევს მომხმარებლებს, რომლებსაც აქვთ ეპილეფსია და კრუნჩხვების რისკი, უსაფრთხოდ ათვალიერონ აპლიკაცია ციმციმა ანიმაციებისა და სარისკო ფერთა კომბინაციებით გამოწვეული კრუნჩხვების რისკის აღმოფხვრით.';

  @override
  String get theme_profile_vision_impaired_title =>
      'მხედველობის დარღვევის პროფილი';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'აპლიკაციის ხილვადობის გაუმჯობესება';

  @override
  String get theme_profile_vision_impaired_description =>
      'ეს პროფილი უზრუნველყოფს აპლიკაციის ხელმისაწვდომობას მხედველობის უმეტესი დარღვევებისთვის, როგორიცაა მხედველობის დარღვევა, ტუნელური ხედვა, კატარაქტა, გლაუკომა და სხვა.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD-მეგობრული პროფილი';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'მეტი კონცენტრაცია და ნაკლები ყურადღების გაფანტვა';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ეს პროფილი მნიშვნელოვნად ამცირებს ყურადღების გამფანტავ ფაქტორებს, რაც ეხმარება ADHD-ის და ნეიროგანვითარების დარღვევების მქონე ადამიანებს, უფრო ადვილად ნავიგაცია, წაკითხვა და აპლიკაციის მნიშვნელოვან ელემენტებზე კონცენტრირება მოახდინონ.';

  @override
  String get the_settings_have_been_reset => 'პარამეტრები აღდგენილია.';

  @override
  String get toggle_dark_mode => 'ბნელი რეჟიმის გადართვა';

  @override
  String get toggle_effects_mode => 'ეფექტების რეჟიმის გადართვა';

  @override
  String get toggle_font_weight => 'ფონტის სისქის გადართვა';

  @override
  String get toggle_theme_profile => 'თემის პროფილის გადართვა';

  @override
  String get word_spacing => 'სიტყვებს შორის დაშორება';

  @override
  String get accessible_font => 'ხელმისაწვდომი შრიფტი';

  @override
  String get accessible_font_subtitle =>
      'გამოიყენეთ Verdana შრიფტი უკეთესი წაკითხვადობისთვის';

  @override
  String get accessible_font_enabled => 'ხელმისაწვდომი შრიფტი ჩართულია';

  @override
  String get accessible_font_disabled => 'ხელმისაწვდომი შრიფტი გამორთულია';

  @override
  String get toggle_accessible_font => 'ხელმისაწვდომი შრიფტის გადართვა';
}
