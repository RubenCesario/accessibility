// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AccessibilityLocalizationsEl extends AccessibilityLocalizations {
  AccessibilityLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get accessibility => 'Προσβασιμότητα';

  @override
  String get accessibilitySettings => 'Ρυθμίσεις προσβασιμότητας';

  @override
  String get adjustBackgroundColors => 'Προσαρμογή χρωμάτων φόντου';

  @override
  String get adjustTextColors => 'Προσαρμογή χρωμάτων κειμένου';

  @override
  String get alignCenter => 'Στοίχιση στο κέντρο';

  @override
  String get alignLeft => 'Στοίχιση αριστερά';

  @override
  String get alignRight => 'Στοίχιση δεξιά';

  @override
  String get textAlignment => 'Στοίχιση κειμένου';

  @override
  String get boldText => 'Έντονο κείμενο';

  @override
  String get changeBoldText => 'Αλλαγή έντονου κειμένου';

  @override
  String get changePagesBackgroundColor =>
      'Αλλαγή του χρώματος φόντου των σελίδων σε: ';

  @override
  String get changeTextColor => 'Αλλαγή του χρώματος του κειμένου σε: ';

  @override
  String get changeTextColorShade => 'Αλλαγή του αποχρώματος του χρώματος σε: ';

  @override
  String get colorAdjustment => 'Προσαρμογή χρωμάτων';

  @override
  String colorProfile(String profile) {
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
  String get colorProfileChangedTo => 'Το τρέχον προφίλ χρώματος είναι: ';

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
  String get decrementWordSpacing => 'Μείωση απόστασης λέξεων';

  @override
  String get decrementLetterSpacing => 'Μείωση απόστασης γραμμάτων';

  @override
  String get decrementLineHeight => 'Μείωση ύψους γραμμής';

  @override
  String get decrementTextScaleFactor => 'Μείωση παράγοντα κλίμακας κειμένου';

  @override
  String get effects => 'Εφέ';

  @override
  String get expandText => 'Επέκταση κειμένου';

  @override
  String get fontSize => 'Μέγεθος γραμματοσειράς';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Αύξηση ή μείωση απόστασης λέξεων';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Αύξηση ή μείωση απόστασης γραμμάτων';

  @override
  String get increaseOrDecreaseLineHeight => 'Αύξηση ή μείωση ύψους γραμμής';

  @override
  String get increaseOrDecreaseTextSize => 'Αύξηση ή μείωση μεγέθους κειμένου';

  @override
  String get incrementWordSpacing => 'Αύξηση απόστασης λέξεων';

  @override
  String get incrementLetterSpacing => 'Αύξηση απόστασης γραμμάτων';

  @override
  String get incrementLineHeight => 'Αύξηση ύψους γραμμής';

  @override
  String get incrementTextScaleFactor => 'Αύξηση παράγοντα κλίμακας κειμένου';

  @override
  String get lessInfo => 'Απόκρυψη πληροφοριών';

  @override
  String get letterSpacing => 'Απόσταση γραμμάτων';

  @override
  String get lineHeight => 'Ύψος γραμμής';

  @override
  String get moreInfo => 'Εμφάνιση πληροφοριών';

  @override
  String get readLess => 'Ανάγνωση λιγότερων';

  @override
  String get readMore => 'Ανάγνωση περισσότερων';

  @override
  String get reduceEffects => 'Μείωση εφέ στην οθόνη';

  @override
  String get reduceText => 'Μείωση κειμένου';

  @override
  String get restoreSettings => 'Επαναφορά ρυθμίσεων';

  @override
  String get restoreMainColor => 'Επαναφορά κύριου χρώματος';

  @override
  String get returnToMainColors => 'Επιστροφή στα κύρια χρώματα';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get sizeAndTextDisplay => 'Μέγεθος και εμφάνιση κειμένου';

  @override
  String get sliderWordSpacing => 'Απόσταση λέξεων με ρυθμιστικό';

  @override
  String get sliderLetterSpacing => 'Απόσταση γραμμάτων με ρυθμιστικό';

  @override
  String get sliderLineHeight => 'Ύψος γραμμής με ρυθμιστικό';

  @override
  String get themeMode => 'Θέμα';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Το προφίλ θέματος δεν αναγνωρίστηκε',
      'seizureSafe': 'Ασφαλές για επιληψία',
      'visionImpaired': 'Για προβλήματα όρασης',
      'adhdFriendly': 'Φιλικό για ΔΕΠ-Υ',
      'none': 'Προεπιλεγμένο προφίλ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Προφίλ ασφαλές για επιληψία';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Αφαίρεση αντανακλάσεων και μείωση χρωμάτων';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Αυτό το προφίλ επιτρέπει στους χρήστες με επιληψία και κίνδυνο επιληπτικών κρίσεων να περιηγούνται με ασφάλεια, εξαλείφοντας τον κίνδυνο κρίσεων που προκαλούνται από αναλαμπές και επικίνδυνους συνδυασμούς χρωμάτων.';

  @override
  String get themeProfileVisionImpairedTitle => 'Προφίλ για προβλήματα όρασης';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Βελτίωση ορατότητας της εφαρμογής';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Αυτό το προφίλ προσαρμόζει την εφαρμογή ώστε να είναι προσβάσιμη στις περισσότερες περιπτώσεις οπτικών αναπηριών, όπως μειωμένη όραση, όραση τούνελ, καταρράκτες, γλαύκωμα και άλλες.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Φιλικό προφίλ για ΔΕΠ-Υ';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Περισσότερη συγκέντρωση και λιγότερες διασπάσεις προσοχής';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Αυτό το προφίλ μειώνει σημαντικά τις διασπάσεις προσοχής, για να βοηθήσει τα άτομα με ΔΕΠ-Υ και νευροαναπτυξιακές διαταραχές να περιηγούνται, να διαβάζουν και να εστιάζουν στα βασικά στοιχεία της εφαρμογής με μεγαλύτερη ευκολία.';

  @override
  String get theSettingsHaveBeenReset => 'Οι ρυθμίσεις έχουν επαναφερθεί.';

  @override
  String get toggleDarkMode => 'Εναλλαγή σκοτεινού μοντέλου';

  @override
  String get toggleEffectsMode => 'Εναλλαγή λειτουργίας εφέ';

  @override
  String get toggleFontWeight => 'Εναλλαγή πάχους γραμματοσειράς';

  @override
  String get toggleThemeProfile => 'Εναλλαγή προφίλ θέματος';

  @override
  String get wordSpacing => 'Απόσταση λέξεων';

  @override
  String get accessibleFont => 'Προσβάσιμη γραμματοσειρά';

  @override
  String get accessibleFontSubtitle =>
      'Χρησιμοποιήστε μια προσβάσιμη γραμματοσειρά για καλύτερη αναγνωσιμότητα';

  @override
  String get accessibleFontEnabled => 'Προσβάσιμη γραμματοσειρά ενεργοποιημένη';

  @override
  String get accessibleFontDisabled =>
      'Προσβάσιμη γραμματοσειρά απενεργοποιημένη';

  @override
  String get toggleAccessibleFont => 'Εναλλαγή προσβάσιμης γραμματοσειράς';

  @override
  String get settingsLoading => 'Φόρτωση ρυθμίσεων προσβασιμότητας…';

  @override
  String get settingsLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των ρυθμίσεων προσβασιμότητας.';

  @override
  String get retry => 'Δοκιμάστε ξανά';

  @override
  String get themeModeSystem => 'Σύστημα';

  @override
  String get themeModeLight => 'Φωτεινό';

  @override
  String get themeModeDark => 'Σκοτεινό';

  @override
  String get effectsModeSystem => 'Σύστημα';

  @override
  String get effectsModeEnabled => 'Ενεργό';

  @override
  String get effectsModeDisabled => 'Ανενεργό';
}
