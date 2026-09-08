// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AccessibilityLocalizationsUz extends AccessibilityLocalizations {
  AccessibilityLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get accessibility => 'Qulayliklar';

  @override
  String get accessibilitySettings => 'Qulayliklar sozlamalari';

  @override
  String get adjustBackgroundColors => 'Fon ranglarini sozlash';

  @override
  String get adjustTextColors => 'Matn ranglarini sozlash';

  @override
  String get alignCenter => 'Markazga tekislash';

  @override
  String get alignLeft => 'Chapga tekislash';

  @override
  String get alignRight => 'O\'ngga tekislash';

  @override
  String get textAlignment => 'Matn tekislash';

  @override
  String get boldText => 'Qalin matn';

  @override
  String get changeBoldText => 'Qalin matnni o\'zgartirish';

  @override
  String get changePagesBackgroundColor =>
      'Sahifalar fon rangini o\'zgartirish: ';

  @override
  String get changeTextColor => 'Matn rangini o\'zgartirish: ';

  @override
  String get changeTextColorShade => 'Rang tusini o\'zgartirish: ';

  @override
  String get colorAdjustment => 'Rang sozlamasi';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'Normal',
      'lowSaturation': 'Past to\'yinganlik',
      'normal': 'Normal',
      'highSaturation': 'Yuqori to\'yinganlik',
      'monochrome': 'Monoxrom',
      'highContrast': 'Yuqori kontrast',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'Joriy rang profili: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
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
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'So\'zlar orasidagi masofani kamaytirish';

  @override
  String get decrementLetterSpacing => 'Harflar orasidagi masofani kamaytirish';

  @override
  String get decrementLineHeight => 'Qator balandligini kamaytirish';

  @override
  String get decrementTextScaleFactor =>
      'Matn masshtab koeffitsientini kamaytirish';

  @override
  String get effects => 'Effektlar';

  @override
  String get expandText => 'Matnni kengaytirish';

  @override
  String get fontSize => 'Shrift o\'lchami';

  @override
  String get increaseOrDecreaseWordSpacing =>
      'So\'zlar orasidagi masofani oshirish yoki kamaytirish';

  @override
  String get increaseOrDecreaseLetterSpacing =>
      'Harflar orasidagi masofani oshirish yoki kamaytirish';

  @override
  String get increaseOrDecreaseLineHeight =>
      'Qator balandligini oshirish yoki kamaytirish';

  @override
  String get increaseOrDecreaseTextSize =>
      'Matn o\'lchamini oshirish yoki kamaytirish';

  @override
  String get incrementWordSpacing => 'So\'zlar orasidagi masofani oshirish';

  @override
  String get incrementLetterSpacing => 'Harflar orasidagi masofani oshirish';

  @override
  String get incrementLineHeight => 'Qator balandligini oshirish';

  @override
  String get incrementTextScaleFactor =>
      'Matn masshtab koeffitsientini oshirish';

  @override
  String get lessInfo => 'Ma\'lumotni yashirish';

  @override
  String get letterSpacing => 'Harflar orasidagi masofa';

  @override
  String get lineHeight => 'Qator balandligi';

  @override
  String get moreInfo => 'Ma\'lumotni ko\'rsatish';

  @override
  String get readLess => 'Kamroq o\'qish';

  @override
  String get readMore => 'Ko\'proq o\'qish';

  @override
  String get reduceEffects => 'Ekrandagi effektlarni kamaytirish';

  @override
  String get reduceText => 'Matnni kamaytirish';

  @override
  String get restoreSettings => 'Sozlamalarni tiklash';

  @override
  String get restoreMainColor => 'Asosiy rangni tiklash';

  @override
  String get returnToMainColors => 'Asosiy ranglarga qaytish';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get sizeAndTextDisplay => 'O\'lcham va matn ko\'rinishi';

  @override
  String get sliderWordSpacing => 'So\'zlar orasidagi masofa slayderi';

  @override
  String get sliderLetterSpacing => 'Harflar orasidagi masofa slayderi';

  @override
  String get sliderLineHeight => 'Qator balandligi slayderi';

  @override
  String get themeMode => 'Mavzu';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'Mavzu profili aniqlanmadi',
      'seizureSafe': 'Tutqanoqdan himoyalangan',
      'visionImpaired': 'Ko\'rish qobiliyati cheklangan',
      'adhdFriendly': 'ADHD uchun qulay',
      'none': 'Standart profil',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'Tutqanoqdan himoyalangan profil';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'Akslarni olib tashlash va ranglarni kamaytirish';

  @override
  String get themeProfileSeizureSafeDescription =>
      'Bu profil epilepsiya va tutqanoq xavfi bo\'lgan foydalanuvchilarga miltillovchi animatsiyalar va xavfli rang kombinatsiyalaridan kelib chiqadigan tutqanoq xavfini bartaraf etish orqali xavfsiz ko\'rib chiqish imkoniyatini beradi.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'Ko\'rish qobiliyati cheklangan profil';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'Ilova ko\'rinishini yaxshilash';

  @override
  String get themeProfileVisionImpairedDescription =>
      'Bu profil ilovani ko\'rish qobiliyati cheklangan, tunnel ko\'rish, katarakta, glaukoma va boshqa ko\'p ko\'rish buzilishlari uchun qulay qilib moslaydi.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ADHD uchun qulay profil';

  @override
  String get themeProfileAdhdFriendlySubtitle =>
      'Ko\'proq diqqat va kamroq chalg\'itishlar';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'Bu profil ADHD va neyrorivoj buzilishlari bo\'lgan odamlarga ilovaning muhim elementlarini osonroq ko\'rib chiqish, o\'qish va ularga e\'tibor qaratishga yordam berish uchun chalg\'itishlarni sezilarli darajada kamaytiradi.';

  @override
  String get theSettingsHaveBeenReset => 'Sozlamalar qayta tiklandi.';

  @override
  String get toggleDarkMode => 'Qorong\'i rejimni almashtirish';

  @override
  String get toggleEffectsMode => 'Effektlar rejimini almashtirish';

  @override
  String get toggleFontWeight => 'Shrift qalinligini almashtirish';

  @override
  String get toggleThemeProfile => 'Mavzu profilini almashtirish';

  @override
  String get wordSpacing => 'So\'zlar orasidagi masofa';

  @override
  String get accessibleFont => 'Qulay shrift';

  @override
  String get accessibleFontSubtitle =>
      'Yaxshiroq o\'qilishi uchun foydalanish oson shriftdan foydalaning';

  @override
  String get accessibleFontEnabled => 'Qulay shrift yoqildi';

  @override
  String get accessibleFontDisabled => 'Qulay shrift o\'chirildi';

  @override
  String get toggleAccessibleFont => 'Qulay shriftni almashtirish';

  @override
  String get settingsLoading => 'Qulayliklar sozlamalari yuklanmoqda…';

  @override
  String get settingsLoadFailed =>
      'Qulayliklar sozlamalarini yuklab bo\'lmadi.';

  @override
  String get retry => 'Qayta urinish';
}
