import 'package:accessibility/src/core/l10n/generated/app_localizations_el.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsEl', () {
    late AccessibilityLocalizationsEl loc;

    setUp(() {
      loc = AccessibilityLocalizationsEl();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('el'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Προσβασιμότητα'));
      expect(
        loc.accessibility_settings,
        equals('Ρυθμίσεις προσβασιμότητας'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Προσαρμογή χρωμάτων φόντου'),
      );
      expect(
        loc.adjust_text_colors,
        equals('Προσαρμογή χρωμάτων κειμένου'),
      );
      expect(loc.align_center, equals('Στοίχιση στο κέντρο'));
      expect(loc.align_left, equals('Στοίχιση αριστερά'));
      expect(loc.align_right, equals('Στοίχιση δεξιά'));
      expect(loc.bold_text, equals('Έντονο κείμενο'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Αλλαγή έντονου κειμένου'));
      expect(
        loc.change_pages_background_color,
        equals('Αλλαγή του χρώματος φόντου των σελίδων σε: '),
      );
      expect(
        loc.change_text_color,
        equals('Αλλαγή του χρώματος του κειμένου σε: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Αλλαγή του αποχρώματος του χρώματος σε: '),
      );
      expect(loc.color_adjustment, equals('Προσαρμογή χρωμάτων'));
      expect(
        loc.color_profile_changed_to,
        equals('Το τρέχον προφίλ χρώματος είναι: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Μείωση απόστασης λέξεων'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Μείωση απόστασης γραμμάτων'),
      );
      expect(loc.decrement_line_height, equals('Μείωση ύψους γραμμής'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Μείωση παράγοντα κλίμακας κειμένου'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Αύξηση απόστασης λέξεων'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Αύξηση απόστασης γραμμάτων'),
      );
      expect(loc.increment_line_height, equals('Αύξηση ύψους γραμμής'));
      expect(
        loc.increment_text_scale_factor,
        equals('Αύξηση παράγοντα κλίμακας κειμένου'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Αύξηση ή μείωση απόστασης λέξεων'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Αύξηση ή μείωση απόστασης γραμμάτων'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Αύξηση ή μείωση ύψους γραμμής'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Αύξηση ή μείωση μεγέθους κειμένου'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Εφέ'));
      expect(loc.expand_text, equals('Επέκταση κειμένου'));
      expect(loc.font_size, equals('Μέγεθος γραμματοσειράς'));
      expect(loc.less_info, equals('Απόκρυψη πληροφοριών'));
      expect(loc.letter_spacing, equals('Απόσταση γραμμάτων'));
      expect(loc.line_height, equals('Ύψος γραμμής'));
      expect(loc.more_info, equals('Εμφάνιση πληροφοριών'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Ανάγνωση λιγότερων'));
      expect(loc.read_more, equals('Ανάγνωση περισσότερων'));
      expect(
        loc.reduce_effects,
        equals('Μείωση εφέ στην οθόνη'),
      );
      expect(loc.reduce_text, equals('Μείωση κειμένου'));
      expect(loc.restore_settings, equals('Επαναφορά ρυθμίσεων'));
      expect(loc.restore_main_color, equals('Επαναφορά κύριου χρώματος'));
      expect(
        loc.return_to_main_colors,
        equals('Επιστροφή στα κύρια χρώματα'),
      );
      expect(loc.settings, equals('Ρυθμίσεις'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Μέγεθος και εμφάνιση κειμένου'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Απόσταση λέξεων με ρυθμιστικό'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Απόσταση γραμμάτων με ρυθμιστικό'),
      );
      expect(
        loc.slider_line_height,
        equals('Ύψος γραμμής με ρυθμιστικό'),
      );
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Το προφίλ θέματος δεν αναγνωρίστηκε'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Ασφαλές για επιληψία'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Για προβλήματα όρασης'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Φιλικό για ΔΕΠ-Υ'),
      );
      expect(loc.theme_profile('none'), equals('Προεπιλογή'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Προφίλ ασφαλές για επιληψία'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Αφαίρεση αντανακλάσεων και μείωση χρωμάτων'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Αυτό το προφίλ επιτρέπει στους χρήστες με επιληψία και κίνδυνο '
          'επιληπτικών κρίσεων να περιηγούνται με ασφάλεια, εξαλείφοντας τον '
          'κίνδυνο κρίσεων που προκαλούνται από αναλαμπές και επικίνδυνους '
          'συνδυασμούς χρωμάτων.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Προφίλ για προβλήματα όρασης'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Βελτίωση ορατότητας της εφαρμογής'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Αυτό το προφίλ προσαρμόζει την εφαρμογή ώστε να είναι προσβάσιμη '
          'στις περισσότερες περιπτώσεις οπτικών αναπηριών, όπως μειωμένη '
          'όραση, όραση τούνελ, καταρράκτες, γλαύκωμα και άλλες.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Φιλικό προφίλ για ΔΕΠ-Υ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Περισσότερη συγκέντρωση και λιγότερες διασπάσεις προσοχής'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Αυτό το προφίλ μειώνει σημαντικά τις διασπάσεις προσοχής, για να '
          'βοηθήσει τα άτομα με ΔΕΠ-Υ και νευροαναπτυξιακές διαταραχές να '
          'περιηγούνται, να διαβάζουν και να εστιάζουν στα βασικά στοιχεία '
          'της εφαρμογής με μεγαλύτερη ευκολία.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Οι ρυθμίσεις έχουν επαναφερθεί.'),
      );
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Εναλλαγή σκοτεινού μοντέλου'));
      expect(loc.toggle_effects_mode, equals('Εναλλαγή λειτουργίας εφέ'));
      expect(loc.toggle_font_weight, equals('Εναλλαγή πάχους γραμματοσειράς'));
      expect(loc.toggle_theme_profile, equals('Εναλλαγή προφίλ θέματος'));
      expect(loc.word_spacing, equals('Απόσταση λέξεων'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Χαμηλή κορεσμός'));
      expect(loc.color_profile('normal'), equals('Κανονικό'));
      expect(loc.color_profile('highSaturation'), equals('Υψηλή κορεσμός'));
      expect(loc.color_profile('monochrome'), equals('Μονοχρωματικό'));
      expect(loc.color_profile('highContrast'), equals('Υψηλή αντίθεση'));
      expect(loc.color_profile('unknown'), equals('Κανονικό'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Κόκκινο'));
      expect(loc.color('cE91E63'), equals('Ροζ'));
      expect(loc.color('c9C27B0'), equals('Μοβ'));
      expect(loc.color('c673AB7'), equals('Βαθύ μοβ'));
      expect(loc.color('c3F51B5'), equals('Ινδικό'));
      expect(loc.color('c2196F3'), equals('Μπλε'));
      expect(loc.color('c03A9F4'), equals('Ανοιχτό μπλε'));
      expect(loc.color('c00BCD4'), equals('Κυανό'));
      expect(loc.color('c009688'), equals('Τιρκουάζ'));
      expect(loc.color('c4CAF50'), equals('Πράσινο'));
      expect(loc.color('c8BC34A'), equals('Ανοιχτό πράσινο'));
      expect(loc.color('cCDDC39'), equals('Λάιμ'));
      expect(loc.color('cFFEB3B'), equals('Κίτρινο'));
      expect(loc.color('cFFC107'), equals('Κεχριμπάρι'));
      expect(loc.color('cFF9800'), equals('Πορτοκαλί'));
      expect(loc.color('cFF5722'), equals('Βαθύ πορτοκαλί'));
      expect(loc.color('c795548'), equals('Καφέ'));
      expect(loc.color('c9E9E9E'), equals('Γκρι'));
      expect(loc.color('c607D8B'), equals('Μπλε γκρι'));
      expect(
        loc.color('unknown'),
        equals('Το χρώμα δεν αναγνωρίστηκε'),
      );
    });
  });
}
