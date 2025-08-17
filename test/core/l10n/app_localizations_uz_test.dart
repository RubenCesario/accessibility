import 'package:accessibility/src/core/l10n/generated/app_localizations_uz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsUz', () {
    late AccessibilityLocalizationsUz loc;

    setUp(() {
      loc = AccessibilityLocalizationsUz();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('uz'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Qulayliklar'));
      expect(
        loc.accessibility_settings,
        equals('Qulayliklar sozlamalari'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Fon ranglarini sozlash'),
      );
      expect(loc.adjust_text_colors, equals('Matn ranglarini sozlash'));
      expect(loc.align_center, equals('Markazga tekislash'));
      expect(loc.align_left, equals('Chapga tekislash'));
      expect(loc.align_right, equals("O'ngga tekislash"));
      expect(loc.bold_text, equals('Qalin matn'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals("Qalin matnni o'zgartirish"));
      expect(
        loc.change_pages_background_color,
        equals("Sahifalar fon rangini o'zgartirish: "),
      );
      expect(
        loc.change_text_color,
        equals("Matn rangini o'zgartirish: "),
      );
      expect(
        loc.change_text_color_shade,
        equals("Rang tusini o'zgartirish: "),
      );
      expect(loc.color_adjustment, equals('Rang sozlamasi'));
      expect(
        loc.color_profile_changed_to,
        equals('Joriy rang profili: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals("So'zlar orasidagi masofani kamaytirish"),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Harflar orasidagi masofani kamaytirish'),
      );
      expect(
        loc.decrement_line_height,
        equals('Qator balandligini kamaytirish'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Matn masshtab koeffitsientini kamaytirish'),
      );
      expect(
        loc.increment_word_spacing,
        equals("So'zlar orasidagi masofani oshirish"),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Harflar orasidagi masofani oshirish'),
      );
      expect(loc.increment_line_height, equals('Qator balandligini oshirish'));
      expect(
        loc.increment_text_scale_factor,
        equals('Matn masshtab koeffitsientini oshirish'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals("So'zlar orasidagi masofani oshirish yoki kamaytirish"),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Harflar orasidagi masofani oshirish yoki kamaytirish'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Qator balandligini oshirish yoki kamaytirish'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals("Matn o'lchamini oshirish yoki kamaytirish"),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Effektlar'));
      expect(loc.expand_text, equals('Matnni kengaytirish'));
      expect(loc.font_size, equals("Shrift o'lchami"));
      expect(loc.less_info, equals("Ma'lumotni yashirish"));
      expect(loc.letter_spacing, equals('Harflar orasidagi masofa'));
      expect(loc.line_height, equals('Qator balandligi'));
      expect(loc.more_info, equals("Ma'lumotni ko'rsatish"));
      expect(loc.word_spacing, equals("So'zlar orasidagi masofa"));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals("Kamroq o'qish"));
      expect(loc.read_more, equals("Ko'proq o'qish"));
      expect(
        loc.reduce_effects,
        equals('Ekrandagi effektlarni kamaytirish'),
      );
      expect(loc.reduce_text, equals('Matnni kamaytirish'));
      expect(loc.restore_settings, equals('Sozlamalarni tiklash'));
      expect(loc.restore_main_color, equals('Asosiy rangni tiklash'));
      expect(
        loc.return_to_main_colors,
        equals('Asosiy ranglarga qaytish'),
      );
      expect(loc.settings, equals('Sozlamalar'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals("O'lcham va matn ko'rinishi"),
      );
      expect(
        loc.slider_word_spacing,
        equals("So'zlar orasidagi masofa slayderi"),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Harflar orasidagi masofa slayderi'),
      );
      expect(loc.slider_line_height, equals('Qator balandligi slayderi'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Mavzu'));
      expect(
        loc.theme_profile('other'),
        equals('Mavzu profili aniqlanmadi'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Tutqanoqdan himoyalangan'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals("Ko'rish qobiliyati cheklangan"),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ADHD uchun qulay'),
      );
      expect(loc.theme_profile('none'), equals('Standart'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Tutqanoqdan himoyalangan profil'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Akslarni olib tashlash va ranglarni kamaytirish'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals("Bu profil epilepsiya va tutqanoq xavfi bo'lgan "
            'foydalanuvchilarga miltillovchi animatsiyalar va '
            'xavfli rang kombinatsiyalaridan kelib chiqadigan '
            'tutqanoq xavfini bartaraf etish orqali xavfsiz '
            "ko'rib chiqish imkoniyatini beradi."),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals("Ko'rish qobiliyati cheklangan profil"),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals("Ilova ko'rinishini yaxshilash"),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals("Bu profil ilovani ko'rish qobiliyati cheklangan, "
            "tunnel ko'rish, katarakta, glaukoma va boshqa "
            "ko'p ko'rish buzilishlari uchun qulay qilib "
            'moslaydi.'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ADHD uchun qulay profil'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals("Ko'proq diqqat va kamroq chalg'itishlar"),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals("Bu profil ADHD va neyrorivoj buzilishlari bo'lgan "
            'odamlarga ilovaning muhim elementlarini osonroq '
            "ko'rib chiqish, o'qish va ularga e'tibor "
            "qaratishga yordam berish uchun chalg'itishlarni "
            'sezilarli darajada kamaytiradi.'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Sozlamalar qayta tiklandi.'),
      );
      expect(loc.toggle_dark_mode, equals("Qorong'i rejimni almashtirish"));
      expect(
        loc.toggle_effects_mode,
        equals('Effektlar rejimini almashtirish'),
      );
      expect(loc.toggle_font_weight, equals('Shrift qalinligini almashtirish'));
      expect(loc.toggle_theme_profile, equals('Mavzu profilini almashtirish'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(
        loc.color_profile('lowSaturation'),
        equals("Past to'yinganlik"),
      );
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals("Yuqori to'yinganlik"),
      );
      expect(loc.color_profile('monochrome'), equals('Monoxrom'));
      expect(loc.color_profile('highContrast'), equals('Yuqori kontrast'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Rang aniqlanmadi'));
      expect(loc.color('cF44336'), equals('Qizil'));
      expect(loc.color('cE91E63'), equals('Pushti'));
      expect(loc.color('c9C27B0'), equals('Siyohrang'));
      expect(loc.color('c673AB7'), equals("To'q siyohrang"));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals("Ko'k"));
      expect(loc.color('c03A9F4'), equals("Och ko'k"));
      expect(loc.color('c00BCD4'), equals('Moviy'));
      expect(loc.color('c009688'), equals('Zangori'));
      expect(loc.color('c4CAF50'), equals('Yashil'));
      expect(loc.color('c8BC34A'), equals('Och yashil'));
      expect(loc.color('cCDDC39'), equals('Laym'));
      expect(loc.color('cFFEB3B'), equals('Sariq'));
      expect(loc.color('cFFC107'), equals('Qahrabo'));
      expect(loc.color('cFF9800'), equals('Apelsin rang'));
      expect(loc.color('cFF5722'), equals("To'q apelsin rang"));
      expect(loc.color('c795548'), equals('Jigarrang'));
      expect(loc.color('c9E9E9E'), equals('Kulrang'));
      expect(loc.color('c607D8B'), equals("Ko'k-kulrang"));
    });
  });
}
