// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AccessibilityLocalizationsMs extends AccessibilityLocalizations {
  AccessibilityLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get accessibility => 'Kebolehcapaian';

  @override
  String get accessibilitySettings => 'Tetapan kebolehcapaian';

  @override
  String get adjustBackgroundColors => 'Laraskan warna latar belakang';

  @override
  String get adjustTextColors => 'Laraskan warna teks';

  @override
  String get alignCenter => 'Jajarkan tengah';

  @override
  String get alignLeft => 'Jajarkan kiri';

  @override
  String get alignRight => 'Jajarkan kanan';

  @override
  String get textAlignment => 'Penjajaran teks';

  @override
  String get boldText => 'Teks tebal';

  @override
  String get changeBoldText => 'Tukar teks tebal';

  @override
  String get changePagesBackgroundColor =>
      'Tukar warna latar belakang halaman kepada: ';

  @override
  String get changeTextColor => 'Tukar warna teks kepada: ';

  @override
  String get changeTextColorShade => 'Tukar bayangan warna kepada: ';

  @override
  String get colorAdjustment => 'Pelarasan warna';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Penepuan rendah',
      'normal': 'Normal',
      'highSaturation': 'Penepuan tinggi',
      'monochrome': 'Monokrom',
      'highContrast': 'Kontras tinggi',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Profil warna semasa ialah: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'Warna tidak dikenali',
      'cF44336': 'Merah',
      'cE91E63': 'Merah jambu',
      'c9C27B0': 'Ungu',
      'c673AB7': 'Ungu gelap',
      'c3F51B5': 'Indigo',
      'c2196F3': 'Biru',
      'c03A9F4': 'Biru cerah',
      'c00BCD4': 'Sian',
      'c009688': 'Hijau kebiruan',
      'c4CAF50': 'Hijau',
      'c8BC34A': 'Hijau cerah',
      'cCDDC39': 'Limau nipis',
      'cFFEB3B': 'Kuning',
      'cFFC107': 'Kuning kehitaman',
      'cFF9800': 'Oren',
      'cFF5722': 'Oren gelap',
      'c795548': 'Perang',
      'c9E9E9E': 'Kelabu',
      'c607D8B': 'Kelabu kebiruan',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Kurangkan jarak perkataan';

  @override
  String get decrementLetterSpacing => 'Kurangkan jarak huruf';

  @override
  String get decrementLineHeight => 'Kurangkan ketinggian baris';

  @override
  String get decrementTextScaleFactor => 'Kurangkan faktor skala teks';

  @override
  String get effects => 'Kesan';

  @override
  String get expandText => 'Kembangkan teks';

  @override
  String get fontSize => 'Saiz fon';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Tambah atau kurangkan jarak perkataan';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Tambah atau kurangkan jarak huruf';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Tambah atau kurangkan ketinggian baris';

  @override
  String get increaseOrDecreaseTextSize => 'Tambah atau kurangkan saiz teks';

  @override
  String get incrementWordSpacing => 'Tambah jarak perkataan';

  @override
  String get incrementLetterSpacing => 'Tambah jarak huruf';

  @override
  String get incrementLineHeight => 'Tambah ketinggian baris';

  @override
  String get incrementTextScaleFactor => 'Tambah faktor skala teks';

  @override
  String get lessInfo => 'Sembunyikan maklumat';

  @override
  String get letterSpacing => 'Jarak huruf';

  @override
  String get lineHeight => 'Ketinggian baris';

  @override
  String get moreInfo => 'Tunjukkan maklumat';

  @override
  String get readLess => 'Baca kurang';

  @override
  String get readMore => 'Baca lagi';

  @override
  String get reduceEffects => 'Kurangkan kesan pada skrin';

  @override
  String get reduceText => 'Kurangkan teks';

  @override
  String get restoreSettings => 'Pulihkan tetapan';

  @override
  String get restoreMainColor => 'Pulihkan warna utama';

  @override
  String get returnToMainColors => 'Kembali ke warna utama';

  @override
  String get settings => 'Tetapan';

  @override
  String get sizeAndTextDisplay => 'Saiz dan paparan teks';

  @override
  String get sliderWordSpacing => 'Penggelongsor jarak perkataan';

  @override
  String get sliderLetterSpacing => 'Penggelongsor jarak huruf';

  @override
  String get sliderLineHeight => 'Penggelongsor ketinggian baris';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil tema tidak dikenali',
      'seizureSafe': 'Selamat sawan',
      'visionImpaired': 'Penglihatan terjejas',
      'adhdFriendly': 'Mesra ADHD',
      'none': 'Profil lalai',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil selamat sawan';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Singkirkan pantulan dan kurangkan warna';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Profil ini membolehkan pengguna yang mengalami epilepsi dan berisiko sawan untuk melayari dengan selamat dengan menghapuskan risiko sawan yang berpunca daripada animasi berkelip dan kombinasi warna berisiko.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil penglihatan terjejas';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Tingkatkan keterlihatan aplikasi';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Profil ini menyesuaikan aplikasi supaya boleh diakses oleh kebanyakan masalah penglihatan, seperti penglihatan terjejas, penglihatan terowong, katarak, glaukoma dan banyak lagi.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil mesra ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Lebih tumpuan dan kurang gangguan';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Profil ini mengurangkan gangguan dengan ketara, untuk membantu orang dengan ADHD dan gangguan perkembangan neuro untuk menavigasi, membaca, dan memberi tumpuan kepada elemen penting aplikasi dengan lebih mudah.';

  @override
  String get theSettingsHaveBeenReset => 'Tetapan telah ditetapkan semula.';

  @override
  String get toggleDarkMode => 'Togol mod gelap';

  @override
  String get toggleEffectsMode => 'Togol mod kesan';

  @override
  String get toggleFontWeight => 'Togol berat fon';

  @override
  String get toggleThemeProfile => 'Togol profil tema';

  @override
  String get wordSpacing => 'Jarak perkataan';

  @override
  String get accessibleFont => 'Fon yang boleh diakses';

  @override
  String get accessibleFontSubtitle =>
      'Gunakan fon yang mudah diakses untuk kebolehbacaan yang lebih baik';

  @override
  String get accessibleFontEnabled => 'Fon yang boleh diakses diaktifkan';

  @override
  String get accessibleFontDisabled => 'Fon yang boleh diakses dinyahaktifkan';

  @override
  String get toggleAccessibleFont => 'Togol fon yang boleh diakses';

  @override
  String get settingsLoading => 'Memuatkan tetapan kebolehcapaian…';

  @override
  String get settingsLoadFailed =>
      'Tetapan kebolehcapaian tidak dapat dimuatkan.';

  @override
  String get retry => 'Cuba lagi';

  @override
  String get themeModeSystem => 'Sistem';

  @override
  String get themeModeLight => 'Terang';

  @override
  String get themeModeDark => 'Gelap';

  @override
  String get effectsModeSystem => 'Sistem';

  @override
  String get effectsModeEnabled => 'Hidup';

  @override
  String get effectsModeDisabled => 'Mati';
}
