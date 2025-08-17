import 'package:accessibility/src/core/l10n/generated/app_localizations_ka.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsKa', () {
    late AccessibilityLocalizationsKa loc;

    setUp(() {
      loc = AccessibilityLocalizationsKa();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ka'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ხელმისაწვდომობა'));
      expect(
        loc.accessibility_settings,
        equals('ხელმისაწვდომობის პარამეტრები'),
      );
      expect(
        loc.adjust_background_colors,
        equals('ფონის ფერების რეგულირება'),
      );
      expect(loc.adjust_text_colors, equals('ტექსტის ფერების რეგულირება'));
      expect(loc.align_center, equals('შუაში გასწორება'));
      expect(loc.align_left, equals('მარცხნივ გასწორება'));
      expect(loc.align_right, equals('მარჯვნივ გასწორება'));
      expect(loc.bold_text, equals('მუქი ტექსტი'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('მუქი ტექსტის შეცვლა'));
      expect(
        loc.change_pages_background_color,
        equals('გვერდების ფონის ფერის შეცვლა: '),
      );
      expect(
        loc.change_text_color,
        equals('ტექსტის ფერის შეცვლა: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('ფერის ელფერის შეცვლა: '),
      );
      expect(loc.color_adjustment, equals('ფერის რეგულირება'));
      expect(
        loc.color_profile_changed_to,
        equals('მიმდინარე ფერის პროფილი არის: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('სიტყვებს შორის დაშორების შემცირება'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('ასოებს შორის დაშორების შემცირება'),
      );
      expect(loc.decrement_line_height, equals('ხაზის სიმაღლის შემცირება'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ტექსტის მასშტაბის ფაქტორის შემცირება'),
      );
      expect(
        loc.increment_word_spacing,
        equals('სიტყვებს შორის დაშორების გაზრდა'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('ასოებს შორის დაშორების გაზრდა'),
      );
      expect(loc.increment_line_height, equals('ხაზის სიმაღლის გაზრდა'));
      expect(
        loc.increment_text_scale_factor,
        equals('ტექსტის მასშტაბის ფაქტორის გაზრდა'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('სიტყვებს შორის დაშორების გაზრდა ან შემცირება'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('ასოებს შორის დაშორების გაზრდა ან შემცირება'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('ხაზის სიმაღლის გაზრდა ან შემცირება'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ტექსტის ზომის გაზრდა ან შემცირება'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ეფექტები'));
      expect(loc.expand_text, equals('ტექსტის გაფართოება'));
      expect(loc.font_size, equals('ფონტის ზომა'));
      expect(loc.less_info, equals('ინფორმაციის დამალვა'));
      expect(loc.letter_spacing, equals('ასოებს შორის დაშორება'));
      expect(loc.line_height, equals('ხაზის სიმაღლე'));
      expect(loc.more_info, equals('ინფორმაციის ჩვენება'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ნაკლების წაკითხვა'));
      expect(loc.read_more, equals('მეტის წაკითხვა'));
      expect(loc.reduce_effects, equals('ეკრანის ეფექტების შემცირება'));
      expect(loc.reduce_text, equals('ტექსტის შემცირება'));
      expect(loc.restore_settings, equals('პარამეტრების აღდგენა'));
      expect(loc.restore_main_color, equals('მთავარი ფერის აღდგენა'));
      expect(loc.return_to_main_colors, equals('მთავარ ფერებზე დაბრუნება'));
      expect(loc.settings, equals('პარამეტრები'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ზომა და ტექსტის ჩვენება'),
      );
      expect(
        loc.slider_word_spacing,
        equals('სიტყვებს შორის დაშორების სლაიდერი'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('ასოებს შორის დაშორების სლაიდერი'),
      );
      expect(loc.slider_line_height, equals('ხაზის სიმაღლის სლაიდერი'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('თემის პროფილი ვერ ამოიცნო'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('კრუნჩხვისგან უსაფრთხო'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('მხედველობის დარღვევა'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD მეგობრული'),
      );
      expect(loc.theme_profile('none'), equals('ნაგულისხმევი'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('კრუნჩხვისგან უსაფრთხო პროფილი'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('არეკვლების მოცილება და ფერების შემცირება'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ეს პროფილი საშუალებას აძლევს მომხმარებლებს, რომლებსაც აქვთ '
          'ეპილეფსია და კრუნჩხვების რისკი, უსაფრთხოდ ათვალიერონ აპლიკაცია '
          'ციმციმა ანიმაციებისა და სარისკო ფერთა კომბინაციებით გამოწვეული '
          'კრუნჩხვების რისკის აღმოფხვრით.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('მხედველობის დარღვევის პროფილი'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('აპლიკაციის ხილვადობის გაუმჯობესება'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ეს პროფილი უზრუნველყოფს აპლიკაციის ხელმისაწვდომობას მხედველობის '
          'უმეტესი დარღვევებისთვის, როგორიცაა მხედველობის დარღვევა, '
          'ტუნელური ხედვა, კატარაქტა, გლაუკომა და სხვა.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-მეგობრული პროფილი'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('მეტი კონცენტრაცია და ნაკლები ყურადღების გაფანტვა'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ეს პროფილი მნიშვნელოვნად ამცირებს ყურადღების გამფანტავ '
          'ფაქტორებს, რაც ეხმარება ADHD-ის და ნეიროგანვითარების '
          'დარღვევების მქონე ადამიანებს, უფრო ადვილად ნავიგაცია, '
          'წაკითხვა და აპლიკაციის მნიშვნელოვან ელემენტებზე კონცენტრირება '
          'მოახდინონ.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('პარამეტრები აღდგენილია.'),
      );
      expect(loc.toggle_dark_mode, equals('ბნელი რეჟიმის გადართვა'));
      expect(loc.toggle_effects_mode, equals('ეფექტების რეჟიმის გადართვა'));
      expect(loc.toggle_font_weight, equals('ფონტის სისქის გადართვა'));
      expect(loc.toggle_theme_profile, equals('თემის პროფილის გადართვა'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('ნორმალური'));
      expect(loc.color_profile('lowSaturation'), equals('დაბალი სატურაცია'));
      expect(loc.color_profile('normal'), equals('ნორმალური'));
      expect(loc.color_profile('highSaturation'), equals('მაღალი სატურაცია'));
      expect(loc.color_profile('monochrome'), equals('მონოქრომული'));
      expect(loc.color_profile('highContrast'), equals('მაღალი კონტრასტი'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('ფერი არ არის ამოცნობილი'));
      expect(loc.color('cF44336'), equals('წითელი'));
      expect(loc.color('cE91E63'), equals('ვარდისფერი'));
      expect(loc.color('c9C27B0'), equals('იისფერი'));
      expect(loc.color('c673AB7'), equals('მუქი იისფერი'));
      expect(loc.color('c3F51B5'), equals('ინდიგო'));
      expect(loc.color('c2196F3'), equals('ლურჯი'));
      expect(loc.color('c03A9F4'), equals('ღია ლურჯი'));
      expect(loc.color('c00BCD4'), equals('ციანი'));
      expect(loc.color('c009688'), equals('ტილო'));
      expect(loc.color('c4CAF50'), equals('მწვანე'));
      expect(loc.color('c8BC34A'), equals('ღია მწვანე'));
      expect(loc.color('cCDDC39'), equals('ლაიმი'));
      expect(loc.color('cFFEB3B'), equals('ყვითელი'));
      expect(loc.color('cFFC107'), equals('ქარვისფერი'));
      expect(loc.color('cFF9800'), equals('ნარინჯისფერი'));
      expect(loc.color('cFF5722'), equals('მუქი ნარინჯისფერი'));
      expect(loc.color('c795548'), equals('ყავისფერი'));
      expect(loc.color('c9E9E9E'), equals('ნაცრისფერი'));
      expect(loc.color('c607D8B'), equals('ლურჯი-ნაცრისფერი'));
    });
  });
}
