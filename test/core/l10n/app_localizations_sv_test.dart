import 'package:accessibility/src/core/l10n/generated/app_localizations_sv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsSv', () {
    late AccessibilityLocalizationsSv loc;

    setUp(() {
      loc = AccessibilityLocalizationsSv();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('sv'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Tillgänglighet'));
      expect(
        loc.accessibility_settings,
        equals('Tillgänglighetsinställningar'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Justera bakgrundsfärger'),
      );
      expect(loc.adjust_text_colors, equals('Justera textfärger'));
      expect(loc.align_center, equals('Centrera'));
      expect(loc.align_left, equals('Vänsterjustera'));
      expect(loc.align_right, equals('Högerjustera'));
      expect(loc.bold_text, equals('Fet text'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Ändra fet text'));
      expect(
        loc.change_pages_background_color,
        equals('Ändra sidornas bakgrundsfärg till: '),
      );
      expect(
        loc.change_text_color,
        equals('Ändra textens färg till: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Ändra färgnyansen till: '),
      );
      expect(loc.color_adjustment, equals('Färgjustering'));
      expect(
        loc.color_profile_changed_to,
        equals('Aktuell färgprofil är: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Minska ordavstånd'));
      expect(loc.decrement_letter_spacing, equals('Minska bokstavsavstånd'));
      expect(loc.decrement_line_height, equals('Minska radhöjd'));
      expect(loc.decrement_text_scale_factor, equals('Minska textskalfaktor'));
      expect(loc.increment_word_spacing, equals('Öka ordavstånd'));
      expect(loc.increment_letter_spacing, equals('Öka bokstavsavstånd'));
      expect(loc.increment_line_height, equals('Öka radhöjd'));
      expect(loc.increment_text_scale_factor, equals('Öka textskalfaktor'));
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Öka eller minska ordavstånd'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Öka eller minska bokstavsavstånd'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Öka eller minska radhöjd'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Öka eller minska textstorlek'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effekter'));
      expect(loc.expand_text, equals('Expandera text'));
      expect(loc.font_size, equals('Textstorlek'));
      expect(loc.less_info, equals('Dölj information'));
      expect(loc.letter_spacing, equals('Bokstavsavstånd'));
      expect(loc.line_height, equals('Radhöjd'));
      expect(loc.more_info, equals('Visa information'));
      expect(loc.word_spacing, equals('Ordavstånd'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Läs mindre'));
      expect(loc.read_more, equals('Läs mer'));
      expect(
        loc.reduce_effects,
        equals('Minska effekter på skärmen'),
      );
      expect(loc.reduce_text, equals('Minska text'));
      expect(loc.restore_settings, equals('Återställ inställningar'));
      expect(loc.restore_main_color, equals('Återställ huvudfärg'));
      expect(
        loc.return_to_main_colors,
        equals('Återgå till huvudfärger'),
      );
      expect(loc.settings, equals('Inställningar'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Storlek och textvisning'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Reglage för ordavstånd'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Reglage för bokstavsavstånd'),
      );
      expect(loc.slider_line_height, equals('Reglage för radhöjd'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Temaprofil känns inte igen'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Epilepsivänlig'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Synnedsatt'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD-vänlig'),
      );
      expect(loc.theme_profile('none'), equals('Standard'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Epilepsivänlig profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Ta bort reflektioner och minska färg'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Denna profil gör det möjligt för användare som '
          'har epilepsi och löper risk för anfall att '
          'surfa säkert genom att eliminera risken för '
          'anfall som orsakas av blinkande animationer '
          'och riskfyllda färgkombinationer.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil för synnedsatta'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Förbättra synligheten i applikationen'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Denna profil anpassar applikationen för att vara '
          'tillgänglig för de flesta synnedsattningar, '
          'såsom synnedsattning, tunnelseende, grå starr, '
          'glöm och mer.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD-vänlig profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Mer koncentration och mindre distraktioner'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Denna profil minskar distraktioner avseende, för '
          'att hjälpa personer med ADHD och '
          'neuroutvecklingsstörningar att navigera, läsa '
          'och fokusera på de väsentliga elementen i '
          'applikationen enklare.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Inställningarna har återställts.'),
      );
      expect(loc.toggle_dark_mode, equals('Växla mörkt läge'));
      expect(loc.toggle_effects_mode, equals('Växla effektläge'));
      expect(loc.toggle_font_weight, equals('Växla texttjocklek'));
      expect(loc.toggle_theme_profile, equals('Växla temaprofil'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(loc.color_profile('lowSaturation'), equals('Låg mättnad'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Hög mättnad'),
      );
      expect(loc.color_profile('monochrome'), equals('Monokrom'));
      expect(loc.color_profile('highContrast'), equals('Hög kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Färg känns inte igen'));
      expect(loc.color('cF44336'), equals('Röd'));
      expect(loc.color('cE91E63'), equals('Rosa'));
      expect(loc.color('c9C27B0'), equals('Lila'));
      expect(loc.color('c673AB7'), equals('Mörklila'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blå'));
      expect(loc.color('c03A9F4'), equals('Ljusblå'));
      expect(loc.color('c00BCD4'), equals('Cyan'));
      expect(loc.color('c009688'), equals('Blågrön'));
      expect(loc.color('c4CAF50'), equals('Grön'));
      expect(loc.color('c8BC34A'), equals('Ljusgrön'));
      expect(loc.color('cCDDC39'), equals('Lime'));
      expect(loc.color('cFFEB3B'), equals('Gul'));
      expect(loc.color('cFFC107'), equals('Bärnsten'));
      expect(loc.color('cFF9800'), equals('Orange'));
      expect(loc.color('cFF5722'), equals('Mörkorange'));
      expect(loc.color('c795548'), equals('Brun'));
      expect(loc.color('c9E9E9E'), equals('Grå'));
      expect(loc.color('c607D8B'), equals('Blågrå'));
    });
  });
}
