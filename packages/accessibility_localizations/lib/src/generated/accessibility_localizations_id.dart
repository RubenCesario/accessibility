// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AccessibilityLocalizationsId extends AccessibilityLocalizations {
  AccessibilityLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get accessibility => 'Aksesibilitas';

  @override
  String get accessibilitySettings => 'Pengaturan aksesibilitas';

  @override
  String get adjustBackgroundColors => 'Sesuaikan warna latar belakang';

  @override
  String get adjustTextColors => 'Sesuaikan warna teks';

  @override
  String get alignCenter => 'Rata tengah';

  @override
  String get alignLeft => 'Rata kiri';

  @override
  String get alignRight => 'Rata kanan';

  @override
  String get textAlignment => 'Perataan teks';

  @override
  String get boldText => 'Teks tebal';

  @override
  String get changeBoldText => 'Ubah teks tebal';

  @override
  String get changePagesBackgroundColor =>
      'Ubah warna latar belakang halaman menjadi: ';

  @override
  String get changeTextColor => 'Ubah warna teks menjadi: ';

  @override
  String get changeTextColorShade => 'Ubah bayangan warna menjadi: ';

  @override
  String get colorAdjustment => 'Penyesuaian warna';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Saturasi rendah',
      'normal': 'Normal',
      'highSaturation': 'Saturasi tinggi',
      'monochrome': 'Monokrom',
      'highContrast': 'Kontras tinggi',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Profil warna saat ini adalah: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Kurangi jarak kata';

  @override
  String get decrementLetterSpacing => 'Kurangi jarak huruf';

  @override
  String get decrementLineHeight => 'Kurangi tinggi baris';

  @override
  String get decrementTextScaleFactor => 'Kurangi faktor skala teks';

  @override
  String get effects => 'Efek';

  @override
  String get expandText => 'Perluas teks';

  @override
  String get fontSize => 'Ukuran font';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Tingkatkan atau kurangi jarak kata';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Tingkatkan atau kurangi jarak huruf';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Tingkatkan atau kurangi tinggi baris';

  @override
  String get increaseOrDecreaseTextSize =>
      'Tingkatkan atau kurangi ukuran teks';

  @override
  String get incrementWordSpacing => 'Tingkatkan jarak kata';

  @override
  String get incrementLetterSpacing => 'Tingkatkan jarak huruf';

  @override
  String get incrementLineHeight => 'Tingkatkan tinggi baris';

  @override
  String get incrementTextScaleFactor => 'Tingkatkan faktor skala teks';

  @override
  String get lessInfo => 'Sembunyikan info';

  @override
  String get letterSpacing => 'Jarak huruf';

  @override
  String get lineHeight => 'Tinggi baris';

  @override
  String get moreInfo => 'Tampilkan info';

  @override
  String get readLess => 'Baca lebih sedikit';

  @override
  String get readMore => 'Baca lebih banyak';

  @override
  String get reduceEffects => 'Kurangi efek pada layar';

  @override
  String get reduceText => 'Kurangi teks';

  @override
  String get restoreSettings => 'Pulihkan pengaturan';

  @override
  String get restoreMainColor => 'Pulihkan warna utama';

  @override
  String get returnToMainColors => 'Kembali ke warna utama';

  @override
  String get settings => 'Pengaturan';

  @override
  String get sizeAndTextDisplay => 'Ukuran dan tampilan teks';

  @override
  String get sliderWordSpacing => 'Penggeser jarak kata';

  @override
  String get sliderLetterSpacing => 'Penggeser jarak huruf';

  @override
  String get sliderLineHeight => 'Penggeser tinggi baris';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Profil tema tidak dikenali',
      'seizureSafe': 'Aman untuk kejang',
      'visionImpaired': 'Gangguan penglihatan',
      'adhdFriendly': 'Ramah ADHD',
      'none': 'Profil default',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Profil aman untuk kejang';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Hilangkan pantulan dan kurangi warna';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Profil ini memungkinkan pengguna yang memiliki epilepsi dan berisiko kejang untuk menjelajah dengan aman dengan menghilangkan risiko kejang yang diakibatkan oleh animasi berkedip dan kombinasi warna berisiko.';

  @override
  String get themeProfileVisionImpairedTitle => 'Profil gangguan penglihatan';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Tingkatkan visibilitas aplikasi';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Profil ini mengadaptasi aplikasi agar dapat diakses oleh sebagian besar gangguan penglihatan, seperti gangguan penglihatan, penglihatan terowongan, katarak, glaukoma dan lainnya.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'Profil ramah ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Konsentrasi lebih baik dan lebih sedikit gangguan';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Profil ini secara signifikan mengurangi gangguan, untuk membantu orang dengan ADHD dan gangguan perkembangan saraf untuk bernavigasi, membaca, dan fokus pada elemen penting aplikasi dengan lebih mudah.';

  @override
  String get theSettingsHaveBeenReset => 'Pengaturan telah diatur ulang.';

  @override
  String get toggleDarkMode => 'Alihkan mode gelap';

  @override
  String get toggleEffectsMode => 'Alihkan mode efek';

  @override
  String get toggleFontWeight => 'Alihkan ketebalan font';

  @override
  String get toggleThemeProfile => 'Alihkan profil tema';

  @override
  String get wordSpacing => 'Jarak kata';

  @override
  String get accessibleFont => 'Font yang dapat diakses';

  @override
  String get accessibleFontSubtitle =>
      'Gunakan font yang mudah diakses untuk keterbacaan yang lebih baik';

  @override
  String get accessibleFontEnabled => 'Font yang dapat diakses diaktifkan';

  @override
  String get accessibleFontDisabled => 'Font yang dapat diakses dinonaktifkan';

  @override
  String get toggleAccessibleFont => 'Alihkan font yang dapat diakses';

  @override
  String get settingsLoading => 'Memuat pengaturan aksesibilitas…';

  @override
  String get settingsLoadFailed =>
      'Pengaturan aksesibilitas tidak dapat dimuat.';

  @override
  String get retry => 'Coba lagi';
}
