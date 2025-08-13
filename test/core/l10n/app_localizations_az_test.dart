import 'package:accessibility/src/core/l10n/generated/app_localizations_az.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsAz', () {
    late AccessibilityLocalizationsAz loc;

    setUp(() {
      loc = AccessibilityLocalizationsAz();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('az'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Əlçatanlıq'));
      expect(loc.accessibility_settings, equals('Əlçatanlıq ayarları'));
      expect(
        loc.adjust_background_colors,
        equals('Arxa fon rənglərini tənzimləyin'),
      );
      expect(loc.adjust_text_colors, equals('Mətn rənglərini tənzimləyin'));
      expect(loc.align_center, equals('Ortaya düzlə'));
      expect(loc.align_left, equals('Sola düzlə'));
      expect(loc.align_right, equals('Sağa düzlə'));
      expect(loc.bold_text, equals('Qalın mətn'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Qalın mətni dəyiş'));
      expect(
        loc.change_pages_background_color,
        equals('Səhifələrin arxa fon rəngini dəyişin: '),
      );
      expect(loc.change_text_color, equals('Mətnin rəngini dəyişin: '));
      expect(loc.change_text_color_shade, equals('Rəngin çalarını dəyişin: '));
      expect(loc.color_adjustment, equals('Rəng tənzimləməsi'));
      expect(loc.color_profile_changed_to, equals('Cari rəng profili: '));
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Söz aralığını azalt'));
      expect(loc.decrement_letter_spacing, equals('Hərf aralığını azalt'));
      expect(loc.decrement_line_height, equals('Sətir hündürlüyünü azalt'));
      expect(loc.decrement_text_scale_factor, equals('Mətn ölçüsünü azalt'));
      expect(loc.increment_word_spacing, equals('Söz aralığını artırın'));
      expect(loc.increment_letter_spacing, equals('Hərf aralığını artırın'));
      expect(loc.increment_line_height, equals('Sətir hündürlüyünü artırın'));
      expect(loc.increment_text_scale_factor, equals('Mətn ölçüsünü artırın'));
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Söz aralığını artır və ya azalt'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Hərf aralığını artır və ya azalt'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Sətir hündürlüyünü artır və ya azalt'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Mətn ölçüsünü artır və ya azalt'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effektlər'));
      expect(loc.expand_text, equals('Mətni genişləndir'));
      expect(loc.font_size, equals('Şrift ölçüsü'));
      expect(loc.less_info, equals('Məlumatı gizlət'));
      expect(loc.letter_spacing, equals('Hərf aralığı'));
      expect(loc.line_height, equals('Sətir hündürlüyü'));
      expect(loc.more_info, equals('Daha çox məlumat göstər'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Daha az oxu'));
      expect(loc.read_more, equals('Daha çox oxu'));
      expect(loc.reduce_effects, equals('Ekran effektlərini azalt'));
      expect(loc.reduce_text, equals('Mətni azalt'));
      expect(loc.restore_settings, equals('Ayarları bərpa edin'));
      expect(loc.restore_main_color, equals('Əsas rəngi bərpa edin'));
      expect(loc.return_to_main_colors, equals('Əsas rənglərə qayıdın'));
      expect(loc.settings, equals('Ayarlar'));
    });

    test('should return the correct settings string values', () {
      expect(loc.size_and_text_display, equals('Ölçü və mətn görüntüləmə'));
      expect(loc.slider_word_spacing, equals('Söz aralığı sürgüsü'));
      expect(loc.slider_letter_spacing, equals('Hərf aralığı sürgüsü'));
      expect(loc.slider_line_height, equals('Sətir hündürlüyü sürgüsü'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_profile('other'), equals('Tema profili tanınmadı'));
      expect(loc.theme_profile('seizureSafe'), equals('Tutma təhlükəsiz'));
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Görmə məhdudiyyətli'),
      );
      expect(loc.theme_profile('adhdFriendly'), equals('ADHD dostu'));
      expect(loc.theme_profile('none'), equals('Standart'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Tutma təhlükəsiz profili'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Parıltıları aradan qaldırın və rəngi azaldın'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Bu profil epilepsiyası və tutma riski olan istifadəçilər '
          'üçün təhlükəli animasiyaları və riskli rəng birləşmələrini '
          'aradan qaldıraraq təhlükəsiz istifadəni təmin edir.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Görmə məhdudiyyətli profil'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Tətbiqin görünüşünü yaxşılaşdırın'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Bu profil görmə məhdudiyyətləri, tunel görməsi, katarakta, '
          'qlaukoma və digər görmə problemləri olan istifadəçilər üçün '
          'tətbiqi əlçatan edir.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD dostu profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Daha çox diqqət, az yayındırıcı'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Bu profil ADHD və nevroinkişaf pozuntuları olan istifadəçilər üçün '
          'yayındırıcıları azaldır, əsas məqamları oxumaq və diqqət etmək üçün '
          'kömək edir.',
        ),
      );
      expect(loc.the_settings_have_been_reset, equals('Ayarlar sıfırlandı.'));
    });

    test('should return the correct toggle string values', () {
      expect(loc.toggle_dark_mode, equals('Qaranlıq rejimi dəyiş'));
      expect(loc.toggle_effects_mode, equals('Effekt rejimini dəyiş'));
      expect(loc.toggle_font_weight, equals('Şrift qalınlığını dəyiş'));
      expect(loc.word_spacing, equals('Söz aralığı'));
    });

    test('should handle color_profile selection logic correctly', () {
      expect(loc.color_profile('lowSaturation'), equals('Aşağı doymuşluq'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(loc.color_profile('highSaturation'), equals('Yüksək doymuşluq'));
      expect(loc.color_profile('monochrome'), equals('Monoxrom'));
      expect(loc.color_profile('highContrast'), equals('Yüksək kontrast'));
      expect(loc.color_profile('unknown'), equals('Normal'));
    });

    test('should handle color selection logic correctly', () {
      expect(loc.color('cF44336'), equals('Qırmızı'));
      expect(loc.color('cE91E63'), equals('Çəhrayı'));
      expect(loc.color('c9C27B0'), equals('Bənövşəyi'));
      expect(loc.color('c673AB7'), equals('Tünd bənövşəyi'));
      expect(loc.color('c3F51B5'), equals('İndiqo'));
      expect(loc.color('c2196F3'), equals('Mavi'));
      expect(loc.color('c03A9F4'), equals('Açıq mavi'));
      expect(loc.color('c00BCD4'), equals('Siyan'));
      expect(loc.color('c009688'), equals('Tünd yaşıl'));
      expect(loc.color('c4CAF50'), equals('Yaşıl'));
      expect(loc.color('c8BC34A'), equals('Açıq yaşıl'));
      expect(loc.color('cCDDC39'), equals('Limon'));
      expect(loc.color('cFFEB3B'), equals('Sarı'));
      expect(loc.color('cFFC107'), equals('Kəhrəba'));
      expect(loc.color('cFF9800'), equals('Narıncı'));
      expect(loc.color('cFF5722'), equals('Tünd narıncı'));
      expect(loc.color('c795548'), equals('Qəhvəyi'));
      expect(loc.color('c9E9E9E'), equals('Boz'));
      expect(loc.color('c607D8B'), equals('Mavi-boz'));
      expect(loc.color('unknown'), equals('Rəng tanınmadı'));
    });
  });
}
