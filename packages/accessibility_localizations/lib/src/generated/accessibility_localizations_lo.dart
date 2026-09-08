// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'accessibility_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AccessibilityLocalizationsLo extends AccessibilityLocalizations {
  AccessibilityLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get accessibility => 'ການເຂົ້າເຖິງໄດ້';

  @override
  String get accessibilitySettings => 'ການຕັ້ງຄ່າການເຂົ້າເຖິງໄດ້';

  @override
  String get adjustBackgroundColors => 'ປັບປ່ຽນສີພື້ນຫລັງ';

  @override
  String get adjustTextColors => 'ປັບປ່ຽນສີຂໍ້ຄວາມ';

  @override
  String get alignCenter => 'ຈັດໃຫ້ຢູ່ກາງ';

  @override
  String get alignLeft => 'ຈັດໃຫ້ຢູ່ຊ້າຍ';

  @override
  String get alignRight => 'ຈັດໃຫ້ຢູ່ຂວາ';

  @override
  String get textAlignment => 'ການຈັດແນວຂໍ້ຄວາມ';

  @override
  String get boldText => 'ຂໍ້ຄວາມໜາ';

  @override
  String get changeBoldText => 'ປ່ຽນຂໍ້ຄວາມໜາ';

  @override
  String get changePagesBackgroundColor => 'ປ່ຽນສີພື້ນຫລັງຂອງໜ້າເປັນ: ';

  @override
  String get changeTextColor => 'ປ່ຽນສີຂໍ້ຄວາມເປັນ: ';

  @override
  String get changeTextColorShade => 'ປ່ຽນເຉດຂອງສີເປັນ: ';

  @override
  String get colorAdjustment => 'ການປັບປ່ຽນສີ';

  @override
  String colorProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'other': 'ປົກກະຕິ',
      'lowSaturation': 'ຄວາມເຂັ້ມຕ່ໍາ',
      'normal': 'ປົກກະຕິ',
      'highSaturation': 'ຄວາມເຂັ້ມສູງ',
      'monochrome': 'ຂາວ-ດໍາ',
      'highContrast': 'ຄວາມຄມຊັດສູງ',
    });
    return '$_temp0';
  }

  @override
  String get colorProfileChangedTo => 'ໂປຣໄຟລສີປະຈຸບັນແມ່ນ: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(color, {
      'other': 'ບໍ່ຮູ້ຈັກສີ',
      'cF44336': 'ສີແດງ',
      'cE91E63': 'ສີບົວ',
      'c9C27B0': 'ສີມ່ວງ',
      'c673AB7': 'ສີມ່ວງເຂັ້ມ',
      'c3F51B5': 'ສີຄາມ',
      'c2196F3': 'ສີຟ້າ',
      'c03A9F4': 'ສີຟ້າອ່ອນ',
      'c00BCD4': 'ສີຟ້ານ້ຳເງິນ',
      'c009688': 'ສີຟ້າຂຽວ',
      'c4CAF50': 'ສີຂຽວ',
      'c8BC34A': 'ສີຂຽວອ່ອນ',
      'cCDDC39': 'ສີຂຽວໄລມ໌',
      'cFFEB3B': 'ສີເຫຼືອງ',
      'cFFC107': 'ສີເຫຼືອງອຳເບີ້',
      'cFF9800': 'ສີສົ້ມ',
      'cFF5722': 'ສີສົ້ມແກ່',
      'c795548': 'ສີນ້ຳຕານ',
      'c9E9E9E': 'ສີເທົາ',
      'c607D8B': 'ສີເທົາຟ້າ',
    });
    return '$_temp0';
  }

  @override
  String get decrementWordSpacing => 'ຫລຸດໄລຍະຫ່າງຄຳ';

  @override
  String get decrementLetterSpacing => 'ຫລຸດໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get decrementLineHeight => 'ຫລຸດຄວາມສູງຂອງແຖວ';

  @override
  String get decrementTextScaleFactor => 'ຫລຸດຕົວປະກອບສ່ວນຂະຫຍາຍຂໍ້ຄວາມ';

  @override
  String get effects => 'ເອຟເຟັກ';

  @override
  String get expandText => 'ຂະຫຍາຍຂໍ້ຄວາມ';

  @override
  String get fontSize => 'ຂະຫນາດຕົວອັກສອນ';

  @override
  String get increaseOrDecreaseWordSpacing => 'ເພີ່ມຫລືຫລຸດໄລຍະຫ່າງຄຳ';

  @override
  String get increaseOrDecreaseLetterSpacing => 'ເພີ່ມຫລືຫລຸດໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get increaseOrDecreaseLineHeight => 'ເພີ່ມຫລືຫລຸດຄວາມສູງຂອງແຖວ';

  @override
  String get increaseOrDecreaseTextSize => 'ເພີ່ມຫລືຫລຸດຂະຫນາດຂໍ້ຄວາມ';

  @override
  String get incrementWordSpacing => 'ເພີ່ມໄລຍະຫ່າງຄຳ';

  @override
  String get incrementLetterSpacing => 'ເພີ່ມໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get incrementLineHeight => 'ເພີ່ມຄວາມສູງຂອງແຖວ';

  @override
  String get incrementTextScaleFactor => 'ເພີ່ມຕົວປະກອບສ່ວນຂະຫຍາຍຂໍ້ຄວາມ';

  @override
  String get lessInfo => 'ເຊື່ອງຂໍ້ມູນ';

  @override
  String get letterSpacing => 'ໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get lineHeight => 'ຄວາມສູງຂອງແຖວ';

  @override
  String get moreInfo => 'ສະແດງຂໍ້ມູນ';

  @override
  String get readLess => 'ອ່ານໜ້ອຍລົງ';

  @override
  String get readMore => 'ອ່ານເພີ່ມເຕີມ';

  @override
  String get reduceEffects => 'ຫລຸດເອຟເຟັກຕ່ໍໜ້າຈໍ';

  @override
  String get reduceText => 'ຫລຸດຂໍ້ຄວາມ';

  @override
  String get restoreSettings => 'ຄືນຄ່າການຕັ້ງຄ່າ';

  @override
  String get restoreMainColor => 'ຄືນສີຫລັກ';

  @override
  String get returnToMainColors => 'ກັບໄປສີຫລັກ';

  @override
  String get settings => 'ການຕັ້ງຄ່າ';

  @override
  String get sizeAndTextDisplay => 'ຂະຫນາດແລະການສະແດງຂໍ້ຄວາມ';

  @override
  String get sliderWordSpacing => 'ຕົວເລື່ອນໄລຍະຫ່າງຄຳ';

  @override
  String get sliderLetterSpacing => 'ຕົວເລື່ອນໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get sliderLineHeight => 'ຕົວເລື່ອນຄວາມສູງຂອງແຖວ';

  @override
  String get themeMode => 'ຊຸດຕົກແຕ່ງ';

  @override
  String themeProfile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ບໍ່ຮູ້ຈັກຊຸດຕົກແຕ່ງ',
      'seizureSafe': 'ປອດໄພຈາກອາການຊັກ',
      'visionImpaired': 'ຊ່ວຍການເບິ່ງເຫັນບົກຜ່ອງ',
      'adhdFriendly': 'ເໝາະສົມສຳລັບຜູ້ທີ່ມີ ADHD',
      'none': 'ໂປຣໄຟລ໌ເລີ່ມຕົ້ນ',
    });
    return '$_temp0';
  }

  @override
  String get themeProfileSeizureSafeTitle => 'ຊຸດຕົກແຕ່ງປອດໄພຈາກອາການຊັກ';

  @override
  String get themeProfileSeizureSafeSubtitle =>
      'ຂະຈັດການສະທ້ອນແສງແລະຫລຸດຄວາມເຂັ້ມຂອງສີ';

  @override
  String get themeProfileSeizureSafeDescription =>
      'ຊຸດຕົກແຕ່ງນີ້ຊ່ວຍໃຫ້ຜູ້ໃຊ້ທີ່ເປັນໂຣກລົມບ້າຫມູແລະມີຄວາມສ່ຽງຕໍ່ການຊັກ ສາມາດເບິ່ງໄດ້ຢ່າງປອດໄພໂດຍການຂະຈັດຄວາມສ່ຽງທີ່ຈະເກີດອາການຊັກທີ່ເກີດຈາກການເຄື່ອນໄຫວແບບເປັ່ງແວບແລະການຜະສົມສີທີ່ເປັນອັນຕະລາຍ.';

  @override
  String get themeProfileVisionImpairedTitle =>
      'ຊຸດຕົກແຕ່ງສຳລັບຜູ້ບົກຜ່ອງທາງການເບິ່ງເຫັນ';

  @override
  String get themeProfileVisionImpairedSubtitle =>
      'ປັບປຸງການເບິ່ງເຫັນຂອງແອັພພລິເຄຊັ່ນ';

  @override
  String get themeProfileVisionImpairedDescription =>
      'ຊຸດຕົກແຕ່ງນີ້ປັບໃຫ້ແອັພພລິເຄຊັ່ນສາມາດເຂົ້າເຖິງໄດ້ສຳລັບຄວາມບົກຜ່ອງທາງການເບິ່ງເຫັນສ່ວນຫລາຍ ເຊັ່ນ: ບັນຫາການເບິ່ງເຫັນ, ການເບິ່ງເຫັນແບບອຸໂມງ, ຕ້ອງຟາງຕາ, ຕ້ອນີ້ລວມຕາ ແລະອື່ນໆ.';

  @override
  String get themeProfileAdhdFriendlyTitle => 'ຊຸດຕົກແຕ່ງສຳລັບຜູ້ທີ່ມີ ADHD';

  @override
  String get themeProfileAdhdFriendlySubtitle => 'ເພີ່ມສະມາທິແລະຫລຸດສິ່ງລົບກວນ';

  @override
  String get themeProfileAdhdFriendlyDescription =>
      'ຊຸດຕົກແຕ່ງນີ້ຊ່ວຍຫລຸດສິ່ງລົບກວນຢ່າງມີປະສິດທິພາບ ເພື່ອຊ່ວຍໃຫ້ຜູ້ທີ່ມີ ADHD ແລະຜູ້ທີ່ມີບັນຫາທາງພັດທະນາການທາງປະສາດສາມາດເນັ້ນໃຈໃສ່, ອ່ານ ແລະເນັ້ນສ່ວນປະກອບທີ່ສຳຄັນຂອງແອັພພລິເຄຊັ່ນໄດ້ງ່າຍຂຶ້ນ.';

  @override
  String get theSettingsHaveBeenReset => 'ການຕັ້ງຄ່າໄດ້ຖືກຄືນຄ່າແລ້ວ.';

  @override
  String get toggleDarkMode => 'ສັບປ່ຽນໂຫມດທີ່ມືດ';

  @override
  String get toggleEffectsMode => 'ສັບປ່ຽນໂຫມດເອຟເຟັກ';

  @override
  String get toggleFontWeight => 'ສັບປ່ຽນຄວາມໜາຂອງຕົວອັກສອນ';

  @override
  String get toggleThemeProfile => 'ສັບປ່ຽນຊຸດຕົກແຕ່ງ';

  @override
  String get wordSpacing => 'ໄລຍະຫ່າງຄຳ';

  @override
  String get accessibleFont => 'ຕົວອັກສອນທີ່ເຂົ້າເຖິງໄດ້';

  @override
  String get accessibleFontSubtitle =>
      'ໃຊ້ຕົວອັກສອນທີ່ເຂົ້າເຖິງໄດ້ ເພື່ອການອ່ານທີ່ດີຂຶ້ນ';

  @override
  String get accessibleFontEnabled => 'ຕົວອັກສອນທີ່ເຂົ້າເຖິງໄດ້ເປີດໃຊ້ງານ';

  @override
  String get accessibleFontDisabled => 'ຕົວອັກສອນທີ່ເຂົ້າເຖິງໄດ້ປິດການໃຊ້ງານ';

  @override
  String get toggleAccessibleFont => 'ສັບປ່ຽນຕົວອັກສອນທີ່ເຂົ້າເຖິງໄດ້';

  @override
  String get settingsLoading => 'ກຳລັງໂຫລດການຕັ້ງຄ່າການເຂົ້າເຖິງໄດ້…';

  @override
  String get settingsLoadFailed => 'ບໍ່ສາມາດໂຫລດການຕັ້ງຄ່າການເຂົ້າເຖິງໄດ້.';

  @override
  String get retry => 'ລອງໃໝ່ອີກຄັ້ງ';
}
