// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AccessibilityLocalizationsTr extends AccessibilityLocalizations {
  AccessibilityLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get accessibility => 'Erişilebilirlik';

  @override
  String get accessibility_settings => 'Erişilebilirlik ayarları';

  @override
  String get adjust_background_colors => 'Arka plan renklerini ayarla';

  @override
  String get adjust_text_colors => 'Metin renklerini ayarla';

  @override
  String get align_center => 'Ortaya hizala';

  @override
  String get align_left => 'Sola hizala';

  @override
  String get align_right => 'Sağa hizala';

  @override
  String get bold_text => 'Kalın metin';

  @override
  String get change_bold_text => 'Kalın metni değiştir';

  @override
  String get change_pages_background_color =>
      'Sayfaların arka plan rengini şuna değiştir: ';

  @override
  String get change_text_color => 'Metnin rengini şuna değiştir: ';

  @override
  String get change_text_color_shade => 'Rengin tonunu şuna değiştir: ';

  @override
  String get color_adjustment => 'Renk ayarı';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Normal',
        'lowSaturation': 'Düşük doygunluk',
        'normal': 'Normal',
        'highSaturation': 'Yüksek doygunluk',
        'monochrome': 'Siyah beyaz',
        'highContrast': 'Yüksek kontrast',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Mevcut renk profili: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Renk tanınmadı',
        'cF44336': 'Kırmızı',
        'cE91E63': 'Pembe',
        'c9C27B0': 'Mor',
        'c673AB7': 'Koyu mor',
        'c3F51B5': 'Çivit',
        'c2196F3': 'Mavi',
        'c03A9F4': 'Açık mavi',
        'c00BCD4': 'Camgöbeği',
        'c009688': 'Deniz mavisi',
        'c4CAF50': 'Yeşil',
        'c8BC34A': 'Açık yeşil',
        'cCDDC39': 'Limon yeşili',
        'cFFEB3B': 'Sarı',
        'cFFC107': 'Kehribar',
        'cFF9800': 'Turuncu',
        'cFF5722': 'Koyu turuncu',
        'c795548': 'Kahverengi',
        'c9E9E9E': 'Gri',
        'c607D8B': 'Mavi gri',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Kelime aralığını azalt';

  @override
  String get decrement_letter_spacing => 'Harf aralığını azalt';

  @override
  String get decrement_line_height => 'Satır yüksekliğini azalt';

  @override
  String get decrement_text_scale_factor => 'Metin ölçek faktörünü azalt';

  @override
  String get effects => 'Efektler';

  @override
  String get expand_text => 'Metni genişlet';

  @override
  String get font_size => 'Yazı tipi boyutu';

  @override
  String get increase_or_decrease_word_spacing =>
      'Kelime aralığını artır veya azalt';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Harf aralığını artır veya azalt';

  @override
  String get increase_or_decrease_line_height =>
      'Satır yüksekliğini artır veya azalt';

  @override
  String get increase_or_decrease_text_size =>
      'Metin boyutunu artır veya azalt';

  @override
  String get increment_word_spacing => 'Kelime aralığını artır';

  @override
  String get increment_letter_spacing => 'Harf aralığını artır';

  @override
  String get increment_line_height => 'Satır yüksekliğini artır';

  @override
  String get increment_text_scale_factor => 'Metin ölçek faktörünü artır';

  @override
  String get less_info => 'Bilgiyi gizle';

  @override
  String get letter_spacing => 'Harf aralığı';

  @override
  String get line_height => 'Satır yüksekliği';

  @override
  String get more_info => 'Bilgiyi göster';

  @override
  String get read_less => 'Daha az oku';

  @override
  String get read_more => 'Daha fazla oku';

  @override
  String get reduce_effects => 'Ekrandaki efektleri azalt';

  @override
  String get reduce_text => 'Metni küçült';

  @override
  String get restore_settings => 'Ayarları geri yükle';

  @override
  String get restore_main_color => 'Ana rengi geri yükle';

  @override
  String get return_to_main_colors => 'Ana renklere dön';

  @override
  String get settings => 'Ayarlar';

  @override
  String get size_and_text_display => 'Boyut ve metin görünümü';

  @override
  String get slider_word_spacing => 'Kelime aralığı kaydırıcısı';

  @override
  String get slider_letter_spacing => 'Harf aralığı kaydırıcısı';

  @override
  String get slider_line_height => 'Satır yüksekliği kaydırıcısı';

  @override
  String get theme_mode => 'Tema';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Tema profili tanınmadı',
        'seizureSafe': 'Nöbet güvenli',
        'visionImpaired': 'Görme engelli',
        'adhdFriendly': 'ADHD dostu',
        'none': 'Varsayılan',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'Nöbet güvenli profili';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Yansımaları kaldır ve renkleri azalt';

  @override
  String get theme_profile_seizure_safe_description =>
      'Bu profil, epilepsi hastası olan ve nöbet riski taşıyan kullanıcıların, yanıp sönen animasyonlar ve riskli renk kombinasyonlarından kaynaklanan nöbet riskini ortadan kaldırarak güvenle gezinmelerini sağlar.';

  @override
  String get theme_profile_vision_impaired_title => 'Görme engelli profili';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Uygulamanın görünürlüğünü iyileştir';

  @override
  String get theme_profile_vision_impaired_description =>
      'Bu profil, görme bozukluğu, tünel görüşü, katarakt, glokom ve daha fazlası gibi çoğu görme bozukluğuna erişilebilir olması için uygulamayı uyarlar.';

  @override
  String get theme_profile_adhd_friendly_title => 'ADHD dostu profili';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Daha fazla konsantrasyon ve daha az dikkat dağıtıcı';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Bu profil, ADHD ve nörogelişimsel bozuklukları olan kişilerin gezinmesine, okumasına ve uygulamanın temel unsurlarına daha kolay odaklanmasına yardımcı olmak için dikkat dağıtıcıları önemli ölçüde azaltır.';

  @override
  String get the_settings_have_been_reset => 'Ayarlar sıfırlandı.';

  @override
  String get toggle_dark_mode => 'Karanlık modu değiştir';

  @override
  String get toggle_effects_mode => 'Efekt modunu değiştir';

  @override
  String get toggle_font_weight => 'Yazı tipi kalınlığını değiştir';

  @override
  String get toggle_theme_profile => 'Tema profilini değiştir';

  @override
  String get word_spacing => 'Kelime aralığı';

  @override
  String get accessible_font => 'Erişilebilir yazı tipi';

  @override
  String get accessible_font_subtitle =>
      'Daha iyi okunabilirlik için Verdana yazı tipini kullanın';

  @override
  String get accessible_font_enabled =>
      'Erişilebilir yazı tipi etkinleştirildi';

  @override
  String get accessible_font_disabled =>
      'Erişilebilir yazı tipi devre dışı bırakıldı';

  @override
  String get toggle_accessible_font => 'Erişilebilir yazı tipini değiştir';
}
