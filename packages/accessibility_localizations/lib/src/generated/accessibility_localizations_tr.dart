// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AccessibilityLocalizationsTr extends AccessibilityLocalizations {
  AccessibilityLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get accessibility => 'Erişilebilirlik';

  @override
  String get accessibilitySettings => 'Erişilebilirlik ayarları';

  @override
  String get adjustBackgroundColors => 'Arka plan renklerini ayarla';

  @override
  String get adjustTextColors => 'Metin renklerini ayarla';

  @override
  String get alignCenter => 'Ortaya hizala';

  @override
  String get alignLeft => 'Sola hizala';

  @override
  String get alignRight => 'Sağa hizala';

  @override
  String get textAlignment => 'Metin hizalama';

  @override
  String get boldText => 'Kalın metin';

  @override
  String get changeBoldText => 'Kalın metni değiştir';

  @override
  String get changePagesBackgroundColor =>
      'Sayfaların arka plan rengini şuna değiştir: ';

  @override
  String get changeTextColor => 'Metnin rengini şuna değiştir: ';

  @override
  String get changeTextColorShade => 'Rengin tonunu şuna değiştir: ';

  @override
  String get colorAdjustment => 'Renk ayarı';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Düşük doygunluk',
      'normal': 'Normal',
      'highSaturation': 'Yüksek doygunluk',
      'monochrome': 'Siyah beyaz',
      'highContrast': 'Yüksek kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Mevcut renk profili: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Kelime aralığını azalt';

  @override
  String get decrementLetterSpacing => 'Harf aralığını azalt';

  @override
  String get decrementLineHeight => 'Satır yüksekliğini azalt';

  @override
  String get decrementTextScaleFactor => 'Metin ölçek faktörünü azalt';

  @override
  String get effects => 'Efektler';

  @override
  String get expandText => 'Metni genişlet';

  @override
  String get fontSize => 'Yazı tipi boyutu';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'Kelime aralığını artır veya azalt';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Harf aralığını artır veya azalt';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Satır yüksekliğini artır veya azalt';

  @override
  String get increaseOrDecreaseTextSize => 'Metin boyutunu artır veya azalt';

  @override
  String get incrementWordSpacing => 'Kelime aralığını artır';

  @override
  String get incrementLetterSpacing => 'Harf aralığını artır';

  @override
  String get incrementLineHeight => 'Satır yüksekliğini artır';

  @override
  String get incrementTextScaleFactor => 'Metin ölçek faktörünü artır';

  @override
  String get lessInfo => 'Bilgiyi gizle';

  @override
  String get letterSpacing => 'Harf aralığı';

  @override
  String get lineHeight => 'Satır yüksekliği';

  @override
  String get moreInfo => 'Bilgiyi göster';

  @override
  String get readLess => 'Daha az oku';

  @override
  String get readMore => 'Daha fazla oku';

  @override
  String get reduceEffects => 'Ekrandaki efektleri azalt';

  @override
  String get reduceText => 'Metni küçült';

  @override
  String get restoreSettings => 'Ayarları geri yükle';

  @override
  String get restoreMainColor => 'Ana rengi geri yükle';

  @override
  String get returnToMainColors => 'Ana renklere dön';

  @override
  String get settings => 'Ayarlar';

  @override
  String get sizeAndTextDisplay => 'Boyut ve metin görünümü';

  @override
  String get sliderWordSpacing => 'Kelime aralığı kaydırıcısı';

  @override
  String get sliderLetterSpacing => 'Harf aralığı kaydırıcısı';

  @override
  String get sliderLineHeight => 'Satır yüksekliği kaydırıcısı';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Tema profili tanınmadı',
      'seizureSafe': 'Nöbet güvenli',
      'visionImpaired': 'Görme engelli',
      'adhdFriendly': 'ADHD dostu',
      'none': 'Varsayılan profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Nöbet güvenli profili';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Yansımaları kaldır ve renkleri azalt';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Bu profil, epilepsi hastası olan ve nöbet riski taşıyan kullanıcıların, yanıp sönen animasyonlar ve riskli renk kombinasyonlarından kaynaklanan nöbet riskini ortadan kaldırarak güvenle gezinmelerini sağlar.';

  @override
  String get themeProfileVisionImpairedTitle => 'Görme engelli profili';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Uygulamanın görünürlüğünü iyileştir';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Bu profil, görme bozukluğu, tünel görüşü, katarakt, glokom ve daha fazlası gibi çoğu görme bozukluğuna erişilebilir olması için uygulamayı uyarlar.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD dostu profili';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Daha fazla konsantrasyon ve daha az dikkat dağıtıcı';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Bu profil, ADHD ve nörogelişimsel bozuklukları olan kişilerin gezinmesine, okumasına ve uygulamanın temel unsurlarına daha kolay odaklanmasına yardımcı olmak için dikkat dağıtıcıları önemli ölçüde azaltır.';

  @override
  String get theSettingsHaveBeenReset => 'Ayarlar sıfırlandı.';

  @override
  String get toggleDarkMode => 'Karanlık modu değiştir';

  @override
  String get toggleEffectsMode => 'Efekt modunu değiştir';

  @override
  String get toggleFontWeight => 'Yazı tipi kalınlığını değiştir';

  @override
  String get toggleThemeProfile => 'Tema profilini değiştir';

  @override
  String get wordSpacing => 'Kelime aralığı';

  @override
  String get accessibleFont => 'Erişilebilir yazı tipi';

  @override
  String get accessibleFontSubtitle =>
      'Daha iyi okunabilirlik için erişilebilir bir yazı tipi kullanın';

  @override
  String get accessibleFontEnabled => 'Erişilebilir yazı tipi etkinleştirildi';

  @override
  String get accessibleFontDisabled =>
      'Erişilebilir yazı tipi devre dışı bırakıldı';

  @override
  String get toggleAccessibleFont => 'Erişilebilir yazı tipini değiştir';

  @override
  String get settingsLoading => 'Erişilebilirlik ayarları yükleniyor…';

  @override
  String get settingsLoadFailed => 'Erişilebilirlik ayarları yüklenemedi.';

  @override
  String get retry => 'Tekrar dene';
}
