import 'package:accessibility/src/core/l10n/generated/app_localizations_id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsId', () {
    late AccessibilityLocalizationsId loc;

    setUp(() {
      loc = AccessibilityLocalizationsId();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('id'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Aksesibilitas'));
      expect(
        loc.accessibility_settings,
        equals('Pengaturan aksesibilitas'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Sesuaikan warna latar belakang'),
      );
      expect(loc.adjust_text_colors, equals('Sesuaikan warna teks'));
      expect(loc.align_center, equals('Rata tengah'));
      expect(loc.align_left, equals('Rata kiri'));
      expect(loc.align_right, equals('Rata kanan'));
      expect(loc.bold_text, equals('Teks tebal'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Ubah teks tebal'));
      expect(
        loc.change_pages_background_color,
        equals('Ubah warna latar belakang halaman menjadi: '),
      );
      expect(
        loc.change_text_color,
        equals('Ubah warna teks menjadi: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Ubah bayangan warna menjadi: '),
      );
      expect(loc.color_adjustment, equals('Penyesuaian warna'));
      expect(
        loc.color_profile_changed_to,
        equals('Profil warna saat ini adalah: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Kurangi jarak kata'));
      expect(loc.decrement_letter_spacing, equals('Kurangi jarak huruf'));
      expect(loc.decrement_line_height, equals('Kurangi tinggi baris'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Kurangi faktor skala teks'),
      );
      expect(loc.increment_word_spacing, equals('Tingkatkan jarak kata'));
      expect(loc.increment_letter_spacing, equals('Tingkatkan jarak huruf'));
      expect(loc.increment_line_height, equals('Tingkatkan tinggi baris'));
      expect(
        loc.increment_text_scale_factor,
        equals('Tingkatkan faktor skala teks'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Tingkatkan atau kurangi jarak kata'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Tingkatkan atau kurangi jarak huruf'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Tingkatkan atau kurangi tinggi baris'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Tingkatkan atau kurangi ukuran teks'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efek'));
      expect(loc.expand_text, equals('Perluas teks'));
      expect(loc.font_size, equals('Ukuran font'));
      expect(loc.less_info, equals('Sembunyikan info'));
      expect(loc.letter_spacing, equals('Jarak huruf'));
      expect(loc.line_height, equals('Tinggi baris'));
      expect(loc.more_info, equals('Tampilkan info'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Baca lebih sedikit'));
      expect(loc.read_more, equals('Baca lebih banyak'));
      expect(
        loc.reduce_effects,
        equals('Kurangi efek pada layar'),
      );
      expect(loc.reduce_text, equals('Kurangi teks'));
      expect(loc.restore_settings, equals('Pulihkan pengaturan'));
      expect(loc.restore_main_color, equals('Pulihkan warna utama'));
      expect(
        loc.return_to_main_colors,
        equals('Kembali ke warna utama'),
      );
      expect(loc.settings, equals('Pengaturan'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Ukuran dan tampilan teks'),
      );
      expect(loc.slider_word_spacing, equals('Penggeser jarak kata'));
      expect(loc.slider_letter_spacing, equals('Penggeser jarak huruf'));
      expect(loc.slider_line_height, equals('Penggeser tinggi baris'));
    });

    test('should return the correct theme string values', () {
      expect(
        loc.theme_profile('other'),
        equals('Profil tema tidak dikenali'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Aman untuk kejang'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Gangguan penglihatan'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Ramah ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Default'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil aman untuk kejang'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Hilangkan pantulan dan kurangi warna'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Profil ini memungkinkan pengguna yang memiliki epilepsi dan '
          'berisiko kejang untuk menjelajah dengan aman dengan '
          'menghilangkan risiko kejang yang diakibatkan oleh animasi '
          'berkedip dan kombinasi warna berisiko.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil gangguan penglihatan'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Tingkatkan visibilitas aplikasi'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Profil ini mengadaptasi aplikasi agar dapat diakses oleh '
          'sebagian besar gangguan penglihatan, seperti gangguan '
          'penglihatan, penglihatan terowongan, katarak, glaukoma dan '
          'lainnya.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil ramah ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Konsentrasi lebih baik dan lebih sedikit gangguan'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Profil ini secara signifikan mengurangi gangguan, untuk '
          'membantu orang dengan ADHD dan gangguan perkembangan '
          'saraf untuk bernavigasi, membaca, dan fokus pada elemen '
          'penting aplikasi dengan lebih mudah.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Pengaturan telah diatur ulang.'),
      );
      expect(loc.toggle_dark_mode, equals('Alihkan mode gelap'));
      expect(loc.toggle_effects_mode, equals('Alihkan mode efek'));
      expect(loc.toggle_font_weight, equals('Alihkan ketebalan font'));
      expect(loc.toggle_theme_profile, equals('Alihkan profil tema'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Saturasi rendah'),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Saturasi tinggi'),
      );
      expect(loc.color_profile('monochrome'), equals('Monokrom'));
      expect(loc.color_profile('highContrast'), equals('Kontras tinggi'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Warna tidak dikenali'));
      expect(loc.color('cF44336'), equals('Merah'));
      expect(loc.color('cE91E63'), equals('Merah muda'));
      expect(loc.color('c9C27B0'), equals('Ungu'));
      expect(loc.color('c673AB7'), equals('Ungu tua'));
      expect(loc.color('c3F51B5'), equals('Nila'));
      expect(loc.color('c2196F3'), equals('Biru'));
      expect(loc.color('c03A9F4'), equals('Biru muda'));
      expect(loc.color('c00BCD4'), equals('Sian'));
      expect(loc.color('c009688'), equals('Hijau kebiruan'));
      expect(loc.color('c4CAF50'), equals('Hijau'));
      expect(loc.color('c8BC34A'), equals('Hijau muda'));
      expect(loc.color('cCDDC39'), equals('Hijau limau'));
      expect(loc.color('cFFEB3B'), equals('Kuning'));
      expect(loc.color('cFFC107'), equals('Kuning tua'));
      expect(loc.color('cFF9800'), equals('Oranye'));
      expect(loc.color('cFF5722'), equals('Oranye tua'));
      expect(loc.color('c795548'), equals('Cokelat'));
      expect(loc.color('c9E9E9E'), equals('Abu-abu'));
      expect(loc.color('c607D8B'), equals('Abu-abu kebiruan'));
    });
  });
}
