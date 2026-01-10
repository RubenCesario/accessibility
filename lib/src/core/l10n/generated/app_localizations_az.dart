// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AccessibilityLocalizationsAz extends AccessibilityLocalizations {
  AccessibilityLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get accessibility => 'Əlçatanlıq';

  @override
  String get accessibility_settings => 'Əlçatanlıq ayarları';

  @override
  String get adjust_background_colors => 'Arxa fon rənglərini tənzimləyin';

  @override
  String get adjust_text_colors => 'Mətn rənglərini tənzimləyin';

  @override
  String get align_center => 'Ortaya düzlə';

  @override
  String get align_left => 'Sola düzlə';

  @override
  String get align_right => 'Sağa düzlə';

  @override
  String get bold_text => 'Qalın mətn';

  @override
  String get change_bold_text => 'Qalın mətni dəyiş';

  @override
  String get change_pages_background_color =>
      'Səhifələrin arxa fon rəngini dəyişin: ';

  @override
  String get change_text_color => 'Mətnin rəngini dəyişin: ';

  @override
  String get change_text_color_shade => 'Rəngin çalarını dəyişin: ';

  @override
  String get color_adjustment => 'Rəng tənzimləməsi';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Aşağı doymuşluq',
        'normal': 'Normal',
        'highSaturation': 'Yüksək doymuşluq',
        'monochrome': 'Monoxrom',
        'highContrast': 'Yüksək kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Cari rəng profili: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Rəng tanınmadı',
        'cF44336': 'Qırmızı',
        'cE91E63': 'Çəhrayı',
        'c9C27B0': 'Bənövşəyi',
        'c673AB7': 'Tünd bənövşəyi',
        'c3F51B5': 'İndiqo',
        'c2196F3': 'Mavi',
        'c03A9F4': 'Açıq mavi',
        'c00BCD4': 'Siyan',
        'c009688': 'Tünd yaşıl',
        'c4CAF50': 'Yaşıl',
        'c8BC34A': 'Açıq yaşıl',
        'cCDDC39': 'Limon',
        'cFFEB3B': 'Sarı',
        'cFFC107': 'Kəhrəba',
        'cFF9800': 'Narıncı',
        'cFF5722': 'Tünd narıncı',
        'c795548': 'Qəhvəyi',
        'c9E9E9E': 'Boz',
        'c607D8B': 'Mavi-boz',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Söz aralığını azalt';

  @override
  String get decrement_letter_spacing => 'Hərf aralığını azalt';

  @override
  String get decrement_line_height => 'Sətir hündürlüyünü azalt';

  @override
  String get decrement_text_scale_factor => 'Mətn ölçüsünü azalt';

  @override
  String get effects => 'Effektlər';

  @override
  String get expand_text => 'Mətni genişləndir';

  @override
  String get font_size => 'Şrift ölçüsü';

  @override
  String get increase_or_decrease_word_spacing =>
      'Söz aralığını artır və ya azalt';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Hərf aralığını artır və ya azalt';

  @override
  String get increase_or_decrease_line_height =>
      'Sətir hündürlüyünü artır və ya azalt';

  @override
  String get increase_or_decrease_text_size =>
      'Mətn ölçüsünü artır və ya azalt';

  @override
  String get increment_word_spacing => 'Söz aralığını artırın';

  @override
  String get increment_letter_spacing => 'Hərf aralığını artırın';

  @override
  String get increment_line_height => 'Sətir hündürlüyünü artırın';

  @override
  String get increment_text_scale_factor => 'Mətn ölçüsünü artırın';

  @override
  String get less_info => 'Məlumatı gizlət';

  @override
  String get letter_spacing => 'Hərf aralığı';

  @override
  String get line_height => 'Sətir hündürlüyü';

  @override
  String get more_info => 'Daha çox məlumat göstər';

  @override
  String get read_less => 'Daha az oxu';

  @override
  String get read_more => 'Daha çox oxu';

  @override
  String get reduce_effects => 'Ekran effektlərini azalt';

  @override
  String get reduce_text => 'Mətni azalt';

  @override
  String get restore_settings => 'Ayarları bərpa edin';

  @override
  String get restore_main_color => 'Əsas rəngi bərpa edin';

  @override
  String get return_to_main_colors => 'Əsas rənglərə qayıdın';

  @override
  String get settings => 'Ayarlar';

  @override
  String get size_and_text_display => 'Ölçü və mətn görüntüləmə';

  @override
  String get slider_word_spacing => 'Söz aralığı sürgüsü';

  @override
  String get slider_letter_spacing => 'Hərf aralığı sürgüsü';

  @override
  String get slider_line_height => 'Sətir hündürlüyü sürgüsü';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Tema profili tanınmadı',
        'seizureSafe': 'Tutma təhlükəsiz',
        'visionImpaired': 'Görmə məhdudiyyətli',
        'adhdFriendly': 'ADHD dostu',
        'none': 'Standart',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Tutma təhlükəsiz profili';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Parıltıları aradan qaldırın və rəngi azaldın';

  @override
  String get theme_profile_seizure_safe_description =>
      'Bu profil epilepsiyası və tutma riski olan istifadəçilər üçün təhlükəli animasiyaları və riskli rəng birləşmələrini aradan qaldıraraq təhlükəsiz istifadəni təmin edir.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Görmə məhdudiyyətli profil';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Tətbiqin görünüşünü yaxşılaşdırın';

  @override
  String get theme_profile_vision_impaired_description =>
      'Bu profil görmə məhdudiyyətləri, tunel görməsi, katarakta, qlaukoma və digər görmə problemləri olan istifadəçilər üçün tətbiqi əlçatan edir.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD dostu profil';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Daha çox diqqət, az yayındırıcı';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Bu profil ADHD və nevroinkişaf pozuntuları olan istifadəçilər üçün yayındırıcıları azaldır, əsas məqamları oxumaq və diqqət etmək üçün kömək edir.';

  @override
  String get the_settings_have_been_reset => 'Ayarlar sıfırlandı.';

  @override
  String get toggle_dark_mode => 'Qaranlıq rejimi dəyiş';

  @override
  String get toggle_effects_mode => 'Effekt rejimini dəyiş';

  @override
  String get toggle_font_weight => 'Şrift qalınlığını dəyiş';

  @override
  String get toggle_theme_profile => 'Tema profilini dəyiş';

  @override
  String get word_spacing => 'Söz aralığı';

  @override
  String get accessible_font => 'Əlçatan şrift';

  @override
  String get accessible_font_subtitle =>
      'Daha yaxşı oxunuşluluq üçün Verdana şriftindən istifadə edin';

  @override
  String get accessible_font_enabled => 'Əlçatan şrift aktivdir';

  @override
  String get accessible_font_disabled => 'Əlçatan şrift deaktivdir';

  @override
  String get toggle_accessible_font => 'Əlçatan şrifti dəyiş';
}
