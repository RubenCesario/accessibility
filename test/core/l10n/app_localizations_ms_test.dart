import 'package:accessibility/src/core/l10n/generated/app_localizations_ms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsMs', () {
    late AccessibilityLocalizationsMs loc;

    setUp(() {
      loc = AccessibilityLocalizationsMs();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('ms'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Kebolehcapaian'));
      expect(
        loc.accessibility_settings,
        equals('Tetapan kebolehcapaian'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Laraskan warna latar belakang'),
      );
      expect(loc.adjust_text_colors, equals('Laraskan warna teks'));
      expect(loc.align_center, equals('Jajarkan tengah'));
      expect(loc.align_left, equals('Jajarkan kiri'));
      expect(loc.align_right, equals('Jajarkan kanan'));
      expect(loc.bold_text, equals('Teks tebal'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Tukar teks tebal'));
      expect(
        loc.change_pages_background_color,
        equals('Tukar warna latar belakang halaman kepada: '),
      );
      expect(
        loc.change_text_color,
        equals('Tukar warna teks kepada: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Tukar bayangan warna kepada: '),
      );
      expect(loc.color_adjustment, equals('Pelarasan warna'));
      expect(
        loc.color_profile_changed_to,
        equals('Profil warna semasa ialah: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Kurangkan jarak perkataan'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Kurangkan jarak huruf'),
      );
      expect(
        loc.decrement_line_height,
        equals('Kurangkan ketinggian baris'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Kurangkan faktor skala teks'),
      );
      expect(loc.increment_word_spacing, equals('Tambah jarak perkataan'));
      expect(loc.increment_letter_spacing, equals('Tambah jarak huruf'));
      expect(loc.increment_line_height, equals('Tambah ketinggian baris'));
      expect(
        loc.increment_text_scale_factor,
        equals('Tambah faktor skala teks'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Tambah atau kurangkan jarak perkataan'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Tambah atau kurangkan jarak huruf'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Tambah atau kurangkan ketinggian baris'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Tambah atau kurangkan saiz teks'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Kesan'));
      expect(loc.expand_text, equals('Kembangkan teks'));
      expect(loc.font_size, equals('Saiz fon'));
      expect(loc.less_info, equals('Sembunyikan maklumat'));
      expect(loc.letter_spacing, equals('Jarak huruf'));
      expect(loc.line_height, equals('Ketinggian baris'));
      expect(loc.more_info, equals('Tunjukkan maklumat'));
      expect(loc.word_spacing, equals('Jarak perkataan'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Baca kurang'));
      expect(loc.read_more, equals('Baca lagi'));
      expect(
        loc.reduce_effects,
        equals('Kurangkan kesan pada skrin'),
      );
      expect(loc.reduce_text, equals('Kurangkan teks'));
      expect(loc.restore_settings, equals('Pulihkan tetapan'));
      expect(loc.restore_main_color, equals('Pulihkan warna utama'));
      expect(loc.return_to_main_colors, equals('Kembali ke warna utama'));
      expect(loc.settings, equals('Tetapan'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Saiz dan paparan teks'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Penggelongsor jarak perkataan'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Penggelongsor jarak huruf'),
      );
      expect(
        loc.slider_line_height,
        equals('Penggelongsor ketinggian baris'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Profil tema tidak dikenali'),
      );
      expect(loc.theme_profile('seizureSafe'), equals('Selamat sawan'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Penglihatan terjejas'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('Mesra ADHD'));
      expect(loc.theme_profile('none'), equals('Lalai'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil selamat sawan'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Singkirkan pantulan dan kurangkan warna'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Profil ini membolehkan pengguna yang mengalami epilepsi '
          'dan berisiko sawan untuk melayari dengan selamat dengan '
          'menghapuskan risiko sawan yang berpunca daripada animasi '
          'berkelip dan kombinasi warna berisiko.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil penglihatan terjejas'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Tingkatkan keterlihatan aplikasi'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Profil ini menyesuaikan aplikasi supaya boleh diakses oleh '
          'kebanyakan masalah penglihatan, seperti penglihatan '
          'terjejas, penglihatan terowong, katarak, glaukoma dan '
          'banyak lagi.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil mesra ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Lebih tumpuan dan kurang gangguan'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Profil ini mengurangkan gangguan dengan ketara, untuk '
          'membantu orang dengan ADHD dan gangguan perkembangan '
          'neuro untuk menavigasi, membaca, dan memberi tumpuan '
          'kepada elemen penting aplikasi dengan lebih mudah.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Tetapan telah ditetapkan semula.'),
      );
      expect(loc.toggle_dark_mode, equals('Togol mod gelap'));
      expect(loc.toggle_effects_mode, equals('Togol mod kesan'));
      expect(loc.toggle_font_weight, equals('Togol berat fon'));
      expect(loc.toggle_theme_profile, equals('Togol profil tema'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(loc.color_profile('lowSaturation'), equals('Penepuan rendah'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Penepuan tinggi'));
      expect(loc.color_profile('monochrome'), equals('Monokrom'));
      expect(loc.color_profile('highContrast'), equals('Kontras tinggi'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Warna tidak dikenali'));
      expect(loc.color('cF44336'), equals('Merah'));
      expect(loc.color('cE91E63'), equals('Merah jambu'));
      expect(loc.color('c9C27B0'), equals('Ungu'));
      expect(loc.color('c673AB7'), equals('Ungu gelap'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Biru'));
      expect(loc.color('c03A9F4'), equals('Biru cerah'));
      expect(loc.color('c00BCD4'), equals('Sian'));
      expect(loc.color('c009688'), equals('Hijau kebiruan'));
      expect(loc.color('c4CAF50'), equals('Hijau'));
      expect(loc.color('c8BC34A'), equals('Hijau cerah'));
      expect(loc.color('cCDDC39'), equals('Limau nipis'));
      expect(loc.color('cFFEB3B'), equals('Kuning'));
      expect(loc.color('cFFC107'), equals('Kuning kehitaman'));
      expect(loc.color('cFF9800'), equals('Oren'));
      expect(loc.color('cFF5722'), equals('Oren gelap'));
      expect(loc.color('c795548'), equals('Perang'));
      expect(loc.color('c9E9E9E'), equals('Kelabu'));
      expect(loc.color('c607D8B'), equals('Kelabu kebiruan'));
    });
  });
}
