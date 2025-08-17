// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AccessibilityLocalizationsEl extends AccessibilityLocalizations {
  AccessibilityLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get accessibility => 'Προσβασιμότητα';

  @override
  String get accessibility_settings => 'Ρυθμίσεις προσβασιμότητας';

  @override
  String get adjust_background_colors => 'Προσαρμογή χρωμάτων φόντου';

  @override
  String get adjust_text_colors => 'Προσαρμογή χρωμάτων κειμένου';

  @override
  String get align_center => 'Στοίχιση στο κέντρο';

  @override
  String get align_left => 'Στοίχιση αριστερά';

  @override
  String get align_right => 'Στοίχιση δεξιά';

  @override
  String get bold_text => 'Έντονο κείμενο';

  @override
  String get change_bold_text => 'Αλλαγή έντονου κειμένου';

  @override
  String get change_pages_background_color =>
      'Αλλαγή του χρώματος φόντου των σελίδων σε: ';

  @override
  String get change_text_color => 'Αλλαγή του χρώματος του κειμένου σε: ';

  @override
  String get change_text_color_shade =>
      'Αλλαγή του αποχρώματος του χρώματος σε: ';

  @override
  String get color_adjustment => 'Προσαρμογή χρωμάτων';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Κανονικό',
      'lowSaturation': 'Χαμηλή κορεσμός',
      'normal': 'Κανονικό',
      'highSaturation': 'Υψηλή κορεσμός',
      'monochrome': 'Μονοχρωματικό',
      'highContrast': 'Υψηλή αντίθεση',
    });
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Το τρέχον προφίλ χρώματος είναι: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Το χρώμα δεν αναγνωρίστηκε',
      'cF44336': 'Κόκκινο',
      'cE91E63': 'Ροζ',
      'c9C27B0': 'Μοβ',
      'c673AB7': 'Βαθύ μοβ',
      'c3F51B5': 'Ινδικό',
      'c2196F3': 'Μπλε',
      'c03A9F4': 'Ανοιχτό μπλε',
      'c00BCD4': 'Κυανό',
      'c009688': 'Τιρκουάζ',
      'c4CAF50': 'Πράσινο',
      'c8BC34A': 'Ανοιχτό πράσινο',
      'cCDDC39': 'Λάιμ',
      'cFFEB3B': 'Κίτρινο',
      'cFFC107': 'Κεχριμπάρι',
      'cFF9800': 'Πορτοκαλί',
      'cFF5722': 'Βαθύ πορτοκαλί',
      'c795548': 'Καφέ',
      'c9E9E9E': 'Γκρι',
      'c607D8B': 'Μπλε γκρι',
    });
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Μείωση απόστασης λέξεων';

  @override
  String get decrement_letter_spacing => 'Μείωση απόστασης γραμμάτων';

  @override
  String get decrement_line_height => 'Μείωση ύψους γραμμής';

  @override
  String get decrement_text_scale_factor =>
      'Μείωση παράγοντα κλίμακας κειμένου';

  @override
  String get effects => 'Εφέ';

  @override
  String get expand_text => 'Επέκταση κειμένου';

  @override
  String get font_size => 'Μέγεθος γραμματοσειράς';

  @override
  String get increase_or_decrease_word_spacing =>
      'Αύξηση ή μείωση απόστασης λέξεων';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Αύξηση ή μείωση απόστασης γραμμάτων';

  @override
  String get increase_or_decrease_line_height =>
      'Αύξηση ή μείωση ύψους γραμμής';

  @override
  String get increase_or_decrease_text_size =>
      'Αύξηση ή μείωση μεγέθους κειμένου';

  @override
  String get increment_word_spacing => 'Αύξηση απόστασης λέξεων';

  @override
  String get increment_letter_spacing => 'Αύξηση απόστασης γραμμάτων';

  @override
  String get increment_line_height => 'Αύξηση ύψους γραμμής';

  @override
  String get increment_text_scale_factor =>
      'Αύξηση παράγοντα κλίμακας κειμένου';

  @override
  String get less_info => 'Απόκρυψη πληροφοριών';

  @override
  String get letter_spacing => 'Απόσταση γραμμάτων';

  @override
  String get line_height => 'Ύψος γραμμής';

  @override
  String get more_info => 'Εμφάνιση πληροφοριών';

  @override
  String get read_less => 'Ανάγνωση λιγότερων';

  @override
  String get read_more => 'Ανάγνωση περισσότερων';

  @override
  String get reduce_effects => 'Μείωση εφέ στην οθόνη';

  @override
  String get reduce_text => 'Μείωση κειμένου';

  @override
  String get restore_settings => 'Επαναφορά ρυθμίσεων';

  @override
  String get restore_main_color => 'Επαναφορά κύριου χρώματος';

  @override
  String get return_to_main_colors => 'Επιστροφή στα κύρια χρώματα';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get size_and_text_display => 'Μέγεθος και εμφάνιση κειμένου';

  @override
  String get slider_word_spacing => 'Απόσταση λέξεων με ρυθμιστικό';

  @override
  String get slider_letter_spacing => 'Απόσταση γραμμάτων με ρυθμιστικό';

  @override
  String get slider_line_height => 'Ύψος γραμμής με ρυθμιστικό';

  @override
  String get theme_mode => 'Θέμα';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Το προφίλ θέματος δεν αναγνωρίστηκε',
      'seizureSafe': 'Ασφαλές για επιληψία',
      'visionImpaired': 'Για προβλήματα όρασης',
      'adhdFriendly': 'Φιλικό για ΔΕΠ-Υ',
      'none': 'Προεπιλογή',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Προφίλ ασφαλές για επιληψία';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Αφαίρεση αντανακλάσεων και μείωση χρωμάτων';

  @override
  String get theme_profile_seizure_safe_description =>
      'Αυτό το προφίλ επιτρέπει στους χρήστες με επιληψία και κίνδυνο επιληπτικών κρίσεων να περιηγούνται με ασφάλεια, εξαλείφοντας τον κίνδυνο κρίσεων που προκαλούνται από αναλαμπές και επικίνδυνους συνδυασμούς χρωμάτων.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Προφίλ για προβλήματα όρασης';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Βελτίωση ορατότητας της εφαρμογής';

  @override
  String get theme_profile_vision_impaired_description =>
      'Αυτό το προφίλ προσαρμόζει την εφαρμογή ώστε να είναι προσβάσιμη στις περισσότερες περιπτώσεις οπτικών αναπηριών, όπως μειωμένη όραση, όραση τούνελ, καταρράκτες, γλαύκωμα και άλλες.';

  @override
  String get theme_profile_adhd_friendly_title => 'Φιλικό προφίλ για ΔΕΠ-Υ';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Περισσότερη συγκέντρωση και λιγότερες διασπάσεις προσοχής';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Αυτό το προφίλ μειώνει σημαντικά τις διασπάσεις προσοχής, για να βοηθήσει τα άτομα με ΔΕΠ-Υ και νευροαναπτυξιακές διαταραχές να περιηγούνται, να διαβάζουν και να εστιάζουν στα βασικά στοιχεία της εφαρμογής με μεγαλύτερη ευκολία.';

  @override
  String get the_settings_have_been_reset => 'Οι ρυθμίσεις έχουν επαναφερθεί.';

  @override
  String get toggle_dark_mode => 'Εναλλαγή σκοτεινού μοντέλου';

  @override
  String get toggle_effects_mode => 'Εναλλαγή λειτουργίας εφέ';

  @override
  String get toggle_font_weight => 'Εναλλαγή πάχους γραμματοσειράς';

  @override
  String get toggle_theme_profile => 'Εναλλαγή προφίλ θέματος';

  @override
  String get word_spacing => 'Απόσταση λέξεων';
}
