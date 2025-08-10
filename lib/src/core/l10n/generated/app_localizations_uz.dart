// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AccessibilityLocalizationsUz extends AccessibilityLocalizations {
  AccessibilityLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get accessibility => 'Qulayliklar';

  @override
  String get accessibility_settings => 'Qulayliklar sozlamalari';

  @override
  String get adjust_background_colors => 'Fon ranglarini sozlash';

  @override
  String get adjust_text_colors => 'Matn ranglarini sozlash';

  @override
  String get align_center => 'Markazga tekislash';

  @override
  String get align_left => 'Chapga tekislash';

  @override
  String get align_right => 'O\'ngga tekislash';

  @override
  String get bold_text => 'Qalin matn';

  @override
  String get change_bold_text => 'Qalin matnni o\'zgartirish';

  @override
  String get change_pages_background_color =>
      'Sahifalar fon rangini o\'zgartirish: ';

  @override
  String get change_text_color => 'Matn rangini o\'zgartirish: ';

  @override
  String get change_text_color_shade => 'Rang tusini o\'zgartirish: ';

  @override
  String get color_adjustment => 'Rang sozlamasi';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Past to\'yinganlik',
        'normal': 'Normal',
        'highSaturation': 'Yuqori to\'yinganlik',
        'monochrome': 'Monoxrom',
        'highContrast': 'Yuqori kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Joriy rang profili: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Rang aniqlanmadi',
        'cF44336': 'Qizil',
        'cE91E63': 'Pushti',
        'c9C27B0': 'Siyohrang',
        'c673AB7': 'To\'q siyohrang',
        'c3F51B5': 'Indigo',
        'c2196F3': 'Ko\'k',
        'c03A9F4': 'Och ko\'k',
        'c00BCD4': 'Moviy',
        'c009688': 'Zangori',
        'c4CAF50': 'Yashil',
        'c8BC34A': 'Och yashil',
        'cCDDC39': 'Laym',
        'cFFEB3B': 'Sariq',
        'cFFC107': 'Qahrabo',
        'cFF9800': 'Apelsin rang',
        'cFF5722': 'To\'q apelsin rang',
        'c795548': 'Jigarrang',
        'c9E9E9E': 'Kulrang',
        'c607D8B': 'Ko\'k-kulrang',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing =>
      'So\'zlar orasidagi masofani kamaytirish';

  @override
  String get decrement_letter_spacing =>
      'Harflar orasidagi masofani kamaytirish';

  @override
  String get decrement_line_height => 'Qator balandligini kamaytirish';

  @override
  String get decrement_text_scale_factor =>
      'Matn masshtab koeffitsientini kamaytirish';

  @override
  String get effects => 'Effektlar';

  @override
  String get expand_text => 'Matnni kengaytirish';

  @override
  String get font_size => 'Shrift o\'lchami';

  @override
  String get increase_or_decrease_word_spacing =>
      'So\'zlar orasidagi masofani oshirish yoki kamaytirish';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Harflar orasidagi masofani oshirish yoki kamaytirish';

  @override
  String get increase_or_decrease_line_height =>
      'Qator balandligini oshirish yoki kamaytirish';

  @override
  String get increase_or_decrease_text_size =>
      'Matn o\'lchamini oshirish yoki kamaytirish';

  @override
  String get increment_word_spacing => 'So\'zlar orasidagi masofani oshirish';

  @override
  String get increment_letter_spacing => 'Harflar orasidagi masofani oshirish';

  @override
  String get increment_line_height => 'Qator balandligini oshirish';

  @override
  String get increment_text_scale_factor =>
      'Matn masshtab koeffitsientini oshirish';

  @override
  String get less_info => 'Ma\'lumotni yashirish';

  @override
  String get letter_spacing => 'Harflar orasidagi masofa';

  @override
  String get line_height => 'Qator balandligi';

  @override
  String get more_info => 'Ma\'lumotni ko\'rsatish';

  @override
  String get read_less => 'Kamroq o\'qish';

  @override
  String get read_more => 'Ko\'proq o\'qish';

  @override
  String get reduce_effects => 'Ekrandagi effektlarni kamaytirish';

  @override
  String get reduce_text => 'Matnni kamaytirish';

  @override
  String get restore_settings => 'Sozlamalarni tiklash';

  @override
  String get restore_main_color => 'Asosiy rangni tiklash';

  @override
  String get return_to_main_colors => 'Asosiy ranglarga qaytish';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get size_and_text_display => 'O\'lcham va matn ko\'rinishi';

  @override
  String get slider_word_spacing => 'So\'zlar orasidagi masofa slayderi';

  @override
  String get slider_letter_spacing => 'Harflar orasidagi masofa slayderi';

  @override
  String get slider_line_height => 'Qator balandligi slayderi';

  @override
  String get theme_mode => 'Mavzu';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Mavzu profili aniqlanmadi',
        'seizureSafe': 'Tutqanoqdan himoyalangan',
        'visionImpaired': 'Ko\'rish qobiliyati cheklangan',
        'adhdFriendly': 'ADHD uchun qulay',
        'none': 'Standart',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Tutqanoqdan himoyalangan profil';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Akslarni olib tashlash va ranglarni kamaytirish';

  @override
  String get theme_profile_seizure_safe_description =>
      'Bu profil epilepsiya va tutqanoq xavfi bo\'lgan foydalanuvchilarga miltillovchi animatsiyalar va xavfli rang kombinatsiyalaridan kelib chiqadigan tutqanoq xavfini bartaraf etish orqali xavfsiz ko\'rib chiqish imkoniyatini beradi.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Ko\'rish qobiliyati cheklangan profil';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Ilova ko\'rinishini yaxshilash';

  @override
  String get theme_profile_vision_impaired_description =>
      'Bu profil ilovani ko\'rish qobiliyati cheklangan, tunnel ko\'rish, katarakta, glaukoma va boshqa ko\'p ko\'rish buzilishlari uchun qulay qilib moslaydi.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD uchun qulay profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Ko\'proq diqqat va kamroq chalg\'itishlar';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Bu profil ADHD va neyrorivoj buzilishlari bo\'lgan odamlarga ilovaning muhim elementlarini osonroq ko\'rib chiqish, o\'qish va ularga e\'tibor qaratishga yordam berish uchun chalg\'itishlarni sezilarli darajada kamaytiradi.';

  @override
  String get the_settings_have_been_reset => 'Sozlamalar qayta tiklandi.';

  @override
  String get toggle_dark_mode => 'Qorong\'i rejimni almashtirish';

  @override
  String get toggle_effects_mode => 'Effektlar rejimini almashtirish';

  @override
  String get toggle_font_weight => 'Shrift qalinligini almashtirish';

  @override
  String get toggle_theme_profile => 'Mavzu profilini almashtirish';

  @override
  String get word_spacing => 'So\'zlar orasidagi masofa';
}
