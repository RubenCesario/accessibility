// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AccessibilityLocalizationsAz extends AccessibilityLocalizations {
  AccessibilityLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get accessibility => 'Əlçatanlıq';

  @override
  String get accessibilitySettings => 'Əlçatanlıq ayarları';

  @override
  String get adjustBackgroundColors => 'Arxa fon rənglərini tənzimləyin';

  @override
  String get adjustTextColors => 'Mətn rənglərini tənzimləyin';

  @override
  String get alignCenter => 'Ortaya düzlə';

  @override
  String get alignLeft => 'Sola düzlə';

  @override
  String get alignRight => 'Sağa düzlə';

  @override
  String get textAlignment => 'Mətn düzülüşü';

  @override
  String get boldText => 'Qalın mətn';

  @override
  String get changeBoldText => 'Qalın mətni dəyiş';

  @override
  String get changePagesBackgroundColor =>
      'Səhifələrin arxa fon rəngini dəyişin: ';

  @override
  String get changeTextColor => 'Mətnin rəngini dəyişin: ';

  @override
  String get changeTextColorShade => 'Rəngin çalarını dəyişin: ';

  @override
  String get colorAdjustment => 'Rəng tənzimləməsi';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Aşağı doymuşluq',
      'normal': 'Normal',
      'highSaturation': 'Yüksək doymuşluq',
      'monochrome': 'Monoxrom',
      'highContrast': 'Yüksək kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Cari rəng profili: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'Söz aralığını azalt';

  @override
  String get decrementLetterSpacing => 'Hərf aralığını azalt';

  @override
  String get decrementLineHeight => 'Sətir hündürlüyünü azalt';

  @override
  String get decrementTextScaleFactor => 'Mətn ölçüsünü azalt';

  @override
  String get effects => 'Effektlər';

  @override
  String get expandText => 'Mətni genişləndir';

  @override
  String get fontSize => 'Şrift ölçüsü';

  @override
  String get increaseOrDecreaseWordSpacing => 'Söz aralığını artır və ya azalt';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Hərf aralığını artır və ya azalt';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Sətir hündürlüyünü artır və ya azalt';

  @override
  String get increaseOrDecreaseTextSize => 'Mətn ölçüsünü artır və ya azalt';

  @override
  String get incrementWordSpacing => 'Söz aralığını artırın';

  @override
  String get incrementLetterSpacing => 'Hərf aralığını artırın';

  @override
  String get incrementLineHeight => 'Sətir hündürlüyünü artırın';

  @override
  String get incrementTextScaleFactor => 'Mətn ölçüsünü artırın';

  @override
  String get lessInfo => 'Məlumatı gizlət';

  @override
  String get letterSpacing => 'Hərf aralığı';

  @override
  String get lineHeight => 'Sətir hündürlüyü';

  @override
  String get moreInfo => 'Daha çox məlumat göstər';

  @override
  String get readLess => 'Daha az oxu';

  @override
  String get readMore => 'Daha çox oxu';

  @override
  String get reduceEffects => 'Ekran effektlərini azalt';

  @override
  String get reduceText => 'Mətni azalt';

  @override
  String get restoreSettings => 'Ayarları bərpa edin';

  @override
  String get restoreMainColor => 'Əsas rəngi bərpa edin';

  @override
  String get returnToMainColors => 'Əsas rənglərə qayıdın';

  @override
  String get settings => 'Ayarlar';

  @override
  String get sizeAndTextDisplay => 'Ölçü və mətn görüntüləmə';

  @override
  String get sliderWordSpacing => 'Söz aralığı sürgüsü';

  @override
  String get sliderLetterSpacing => 'Hərf aralığı sürgüsü';

  @override
  String get sliderLineHeight => 'Sətir hündürlüyü sürgüsü';

  @override
  String get themeMode => 'Tema';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Tema profili tanınmadı',
      'seizureSafe': 'Tutma təhlükəsiz',
      'visionImpaired': 'Görmə məhdudiyyətli',
      'adhdFriendly': 'ADHD dostu',
      'none': 'Defolt profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Tutma təhlükəsiz profili';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Parıltıları aradan qaldırın və rəngi azaldın';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Bu profil epilepsiyası və tutma riski olan istifadəçilər üçün təhlükəli animasiyaları və riskli rəng birləşmələrini aradan qaldıraraq təhlükəsiz istifadəni təmin edir.';

  @override
  String get themeProfileVisionImpairedTitle => 'Görmə məhdudiyyətli profil';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Tətbiqin görünüşünü yaxşılaşdırın';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Bu profil görmə məhdudiyyətləri, tunel görməsi, katarakta, qlaukoma və digər görmə problemləri olan istifadəçilər üçün tətbiqi əlçatan edir.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD dostu profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Daha çox diqqət, az yayındırıcı';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Bu profil ADHD və nevroinkişaf pozuntuları olan istifadəçilər üçün yayındırıcıları azaldır, əsas məqamları oxumaq və diqqət etmək üçün kömək edir.';

  @override
  String get theSettingsHaveBeenReset => 'Ayarlar sıfırlandı.';

  @override
  String get toggleDarkMode => 'Qaranlıq rejimi dəyiş';

  @override
  String get toggleEffectsMode => 'Effekt rejimini dəyiş';

  @override
  String get toggleFontWeight => 'Şrift qalınlığını dəyiş';

  @override
  String get toggleThemeProfile => 'Tema profilini dəyiş';

  @override
  String get wordSpacing => 'Söz aralığı';

  @override
  String get accessibleFont => 'Əlçatan şrift';

  @override
  String get accessibleFontSubtitle =>
      'Daha yaxşı oxunaqlılıq üçün əlçatan şriftdən istifadə edin';

  @override
  String get accessibleFontEnabled => 'Əlçatan şrift aktivdir';

  @override
  String get accessibleFontDisabled => 'Əlçatan şrift deaktivdir';

  @override
  String get toggleAccessibleFont => 'Əlçatan şrifti dəyiş';

  @override
  String get settingsLoading => 'Əlçatanlıq ayarları yüklənir…';

  @override
  String get settingsLoadFailed => 'Əlçatanlıq ayarları yüklənə bilmədi.';

  @override
  String get retry => 'Yenidən cəhd edin';

  @override
  String get themeModeSystem => 'Sistem';

  @override
  String get themeModeLight => 'İşıqlı';

  @override
  String get themeModeDark => 'Qaranlıq';

  @override
  String get effectsModeSystem => 'Sistem';

  @override
  String get effectsModeEnabled => 'Aktiv';

  @override
  String get effectsModeDisabled => 'Deaktiv';
}
