// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AccessibilityLocalizationsMs extends AccessibilityLocalizations {
  AccessibilityLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get accessibility => 'Kebolehcapaian';

  @override
  String get accessibility_settings => 'Tetapan kebolehcapaian';

  @override
  String get adjust_background_colors => 'Laraskan warna latar belakang';

  @override
  String get adjust_text_colors => 'Laraskan warna teks';

  @override
  String get align_center => 'Jajarkan tengah';

  @override
  String get align_left => 'Jajarkan kiri';

  @override
  String get align_right => 'Jajarkan kanan';

  @override
  String get bold_text => 'Teks tebal';

  @override
  String get change_bold_text => 'Tukar teks tebal';

  @override
  String get change_pages_background_color =>
      'Tukar warna latar belakang halaman kepada: ';

  @override
  String get change_text_color => 'Tukar warna teks kepada: ';

  @override
  String get change_text_color_shade => 'Tukar bayangan warna kepada: ';

  @override
  String get color_adjustment => 'Pelarasan warna';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'Profil warna semasa ialah: ';

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
  String get decrement_word_spacing => 'Kurangkan jarak perkataan';

  @override
  String get decrement_letter_spacing => 'Kurangkan jarak huruf';

  @override
  String get decrement_line_height => 'Kurangkan ketinggian baris';

  @override
  String get decrement_text_scale_factor => 'Kurangkan faktor skala teks';

  @override
  String get effects => 'Kesan';

  @override
  String get expand_text => 'Kembangkan teks';

  @override
  String get font_size => 'Saiz fon';

  @override
  String get increase_or_decrease_word_spacing =>
      'Tambah atau kurangkan jarak perkataan';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Tambah atau kurangkan jarak huruf';

  @override
  String get increase_or_decrease_line_height =>
      'Tambah atau kurangkan ketinggian baris';

  @override
  String get increase_or_decrease_text_size =>
      'Tambah atau kurangkan saiz teks';

  @override
  String get increment_word_spacing => 'Tambah jarak perkataan';

  @override
  String get increment_letter_spacing => 'Tambah jarak huruf';

  @override
  String get increment_line_height => 'Tambah ketinggian baris';

  @override
  String get increment_text_scale_factor => 'Tambah faktor skala teks';

  @override
  String get less_info => 'Sembunyikan maklumat';

  @override
  String get letter_spacing => 'Jarak huruf';

  @override
  String get line_height => 'Ketinggian baris';

  @override
  String get more_info => 'Tunjukkan maklumat';

  @override
  String get read_less => 'Baca kurang';

  @override
  String get read_more => 'Baca lagi';

  @override
  String get reduce_effects => 'Kurangkan kesan pada skrin';

  @override
  String get reduce_text => 'Kurangkan teks';

  @override
  String get restore_settings => 'Pulihkan tetapan';

  @override
  String get restore_main_color => 'Pulihkan warna utama';

  @override
  String get return_to_main_colors => 'Kembali ke warna utama';

  @override
  String get settings => 'Tetapan';

  @override
  String get size_and_text_display => 'Saiz dan paparan teks';

  @override
  String get slider_word_spacing => 'Penggelongsor jarak perkataan';

  @override
  String get slider_letter_spacing => 'Penggelongsor jarak huruf';

  @override
  String get slider_line_height => 'Penggelongsor ketinggian baris';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil tema tidak dikenali',
      'seizureSafe': 'Selamat sawan',
      'visionImpaired': 'Penglihatan terjejas',
      'adhdFriendly': 'Mesra ADHD',
      'none': 'Lalai',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Profil selamat sawan';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Singkirkan pantulan dan kurangkan warna';

  @override
  String get theme_profile_seizure_safe_description =>
      'Profil ini membolehkan pengguna yang mengalami epilepsi dan berisiko sawan untuk melayari dengan selamat dengan menghapuskan risiko sawan yang berpunca daripada animasi berkelip dan kombinasi warna berisiko.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil penglihatan terjejas';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Tingkatkan keterlihatan aplikasi';

  @override
  String get theme_profile_vision_impaired_description =>
      'Profil ini menyesuaikan aplikasi supaya boleh diakses oleh kebanyakan masalah penglihatan, seperti penglihatan terjejas, penglihatan terowong, katarak, glaukoma dan banyak lagi.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil mesra ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Lebih tumpuan dan kurang gangguan';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Profil ini mengurangkan gangguan dengan ketara, untuk membantu orang dengan ADHD dan gangguan perkembangan neuro untuk menavigasi, membaca, dan memberi tumpuan kepada elemen penting aplikasi dengan lebih mudah.';

  @override
  String get the_settings_have_been_reset => 'Tetapan telah ditetapkan semula.';

  @override
  String get toggle_dark_mode => 'Togol mod gelap';

  @override
  String get toggle_effects_mode => 'Togol mod kesan';

  @override
  String get toggle_font_weight => 'Togol berat fon';

  @override
  String get toggle_theme_profile => 'Togol profil tema';

  @override
  String get word_spacing => 'Jarak perkataan';
}
