// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AccessibilityLocalizationsId extends AccessibilityLocalizations {
  AccessibilityLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get accessibility => 'Aksesibilitas';

  @override
  String get accessibility_settings => 'Pengaturan aksesibilitas';

  @override
  String get adjust_background_colors => 'Sesuaikan warna latar belakang';

  @override
  String get adjust_text_colors => 'Sesuaikan warna teks';

  @override
  String get align_center => 'Rata tengah';

  @override
  String get align_left => 'Rata kiri';

  @override
  String get align_right => 'Rata kanan';

  @override
  String get bold_text => 'Teks tebal';

  @override
  String get change_bold_text => 'Ubah teks tebal';

  @override
  String get change_pages_background_color =>
      'Ubah warna latar belakang halaman menjadi: ';

  @override
  String get change_text_color => 'Ubah warna teks menjadi: ';

  @override
  String get change_text_color_shade => 'Ubah bayangan warna menjadi: ';

  @override
  String get color_adjustment => 'Penyesuaian warna';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Saturasi rendah',
        'normal': 'Normal',
        'highSaturation': 'Saturasi tinggi',
        'monochrome': 'Monokrom',
        'highContrast': 'Kontras tinggi',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Profil warna saat ini adalah: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Warna tidak dikenali',
        'cF44336': 'Merah',
        'cE91E63': 'Merah muda',
        'c9C27B0': 'Ungu',
        'c673AB7': 'Ungu tua',
        'c3F51B5': 'Nila',
        'c2196F3': 'Biru',
        'c03A9F4': 'Biru muda',
        'c00BCD4': 'Sian',
        'c009688': 'Hijau kebiruan',
        'c4CAF50': 'Hijau',
        'c8BC34A': 'Hijau muda',
        'cCDDC39': 'Hijau limau',
        'cFFEB3B': 'Kuning',
        'cFFC107': 'Kuning tua',
        'cFF9800': 'Oranye',
        'cFF5722': 'Oranye tua',
        'c795548': 'Cokelat',
        'c9E9E9E': 'Abu-abu',
        'c607D8B': 'Abu-abu kebiruan',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Kurangi jarak kata';

  @override
  String get decrement_letter_spacing => 'Kurangi jarak huruf';

  @override
  String get decrement_line_height => 'Kurangi tinggi baris';

  @override
  String get decrement_text_scale_factor => 'Kurangi faktor skala teks';

  @override
  String get effects => 'Efek';

  @override
  String get expand_text => 'Perluas teks';

  @override
  String get font_size => 'Ukuran font';

  @override
  String get increase_or_decrease_word_spacing =>
      'Tingkatkan atau kurangi jarak kata';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Tingkatkan atau kurangi jarak huruf';

  @override
  String get increase_or_decrease_line_height =>
      'Tingkatkan atau kurangi tinggi baris';

  @override
  String get increase_or_decrease_text_size =>
      'Tingkatkan atau kurangi ukuran teks';

  @override
  String get increment_word_spacing => 'Tingkatkan jarak kata';

  @override
  String get increment_letter_spacing => 'Tingkatkan jarak huruf';

  @override
  String get increment_line_height => 'Tingkatkan tinggi baris';

  @override
  String get increment_text_scale_factor => 'Tingkatkan faktor skala teks';

  @override
  String get less_info => 'Sembunyikan info';

  @override
  String get letter_spacing => 'Jarak huruf';

  @override
  String get line_height => 'Tinggi baris';

  @override
  String get more_info => 'Tampilkan info';

  @override
  String get read_less => 'Baca lebih sedikit';

  @override
  String get read_more => 'Baca lebih banyak';

  @override
  String get reduce_effects => 'Kurangi efek pada layar';

  @override
  String get reduce_text => 'Kurangi teks';

  @override
  String get restore_settings => 'Pulihkan pengaturan';

  @override
  String get restore_main_color => 'Pulihkan warna utama';

  @override
  String get return_to_main_colors => 'Kembali ke warna utama';

  @override
  String get settings => 'Pengaturan';

  @override
  String get size_and_text_display => 'Ukuran dan tampilan teks';

  @override
  String get slider_word_spacing => 'Penggeser jarak kata';

  @override
  String get slider_letter_spacing => 'Penggeser jarak huruf';

  @override
  String get slider_line_height => 'Penggeser tinggi baris';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Profil tema tidak dikenali',
        'seizureSafe': 'Aman untuk kejang',
        'visionImpaired': 'Gangguan penglihatan',
        'adhdFriendly': 'Ramah ADHD',
        'none': 'Default',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Profil aman untuk kejang';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Hilangkan pantulan dan kurangi warna';

  @override
  String get theme_profile_seizure_safe_description =>
      'Profil ini memungkinkan pengguna yang memiliki epilepsi dan berisiko kejang untuk menjelajah dengan aman dengan menghilangkan risiko kejang yang diakibatkan oleh animasi berkedip dan kombinasi warna berisiko.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Profil gangguan penglihatan';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Tingkatkan visibilitas aplikasi';

  @override
  String get theme_profile_vision_impaired_description =>
      'Profil ini mengadaptasi aplikasi agar dapat diakses oleh sebagian besar gangguan penglihatan, seperti gangguan penglihatan, penglihatan terowongan, katarak, glaukoma dan lainnya.';

  @override
  String get theme_profile_adhd_friendly_title => 'Profil ramah ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Konsentrasi lebih baik dan lebih sedikit gangguan';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Profil ini secara signifikan mengurangi gangguan, untuk membantu orang dengan ADHD dan gangguan perkembangan saraf untuk bernavigasi, membaca, dan fokus pada elemen penting aplikasi dengan lebih mudah.';

  @override
  String get the_settings_have_been_reset => 'Pengaturan telah diatur ulang.';

  @override
  String get toggle_dark_mode => 'Alihkan mode gelap';

  @override
  String get toggle_effects_mode => 'Alihkan mode efek';

  @override
  String get toggle_font_weight => 'Alihkan ketebalan font';

  @override
  String get toggle_theme_profile => 'Alihkan profil tema';

  @override
  String get word_spacing => 'Jarak kata';

  @override
  String get accessible_font => 'Font yang dapat diakses';

  @override
  String get accessible_font_subtitle =>
      'Gunakan font Verdana untuk keterbacaan yang lebih baik';

  @override
  String get accessible_font_enabled => 'Font yang dapat diakses diaktifkan';

  @override
  String get accessible_font_disabled =>
      'Font yang dapat diakses dinonaktifkan';

  @override
  String get toggle_accessible_font => 'Alihkan font yang dapat diakses';
}
