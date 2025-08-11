// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AccessibilityLocalizationsLo extends AccessibilityLocalizations {
  AccessibilityLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get accessibility => 'ການເຂົ້າເຖິງໄດ້';

  @override
  String get accessibility_settings => 'ການຕັ້ງຄ່າການເຂົ້າເຖິງໄດ້';

  @override
  String get adjust_background_colors => 'ປັບປ່ຽນສີພື້ນຫລັງ';

  @override
  String get adjust_text_colors => 'ປັບປ່ຽນສີຂໍ້ຄວາມ';

  @override
  String get align_center => 'ຈັດໃຫ້ຢູ່ກາງ';

  @override
  String get align_left => 'ຈັດໃຫ້ຢູ່ຊ້າຍ';

  @override
  String get align_right => 'ຈັດໃຫ້ຢູ່ຂວາ';

  @override
  String get bold_text => 'ຂໍ້ຄວາມໜາ';

  @override
  String get change_bold_text => 'ປ່ຽນຂໍ້ຄວາມໜາ';

  @override
  String get change_pages_background_color => 'ປ່ຽນສີພື້ນຫລັງຂອງໜ້າເປັນ: ';

  @override
  String get change_text_color => 'ປ່ຽນສີຂໍ້ຄວາມເປັນ: ';

  @override
  String get change_text_color_shade => 'ປ່ຽນເຉດຂອງສີເປັນ: ';

  @override
  String get color_adjustment => 'ການປັບປ່ຽນສີ';

  @override
  String color_profile(String profile) {
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
  String get color_profile_changed_to => 'ໂປຣໄຟລສີປະຈຸບັນແມ່ນ: ';

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
  String get decrement_word_spacing => 'ຫລຸດໄລຍະຫ່າງຄຳ';

  @override
  String get decrement_letter_spacing => 'ຫລຸດໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get decrement_line_height => 'ຫລຸດຄວາມສູງຂອງແຖວ';

  @override
  String get decrement_text_scale_factor => 'ຫລຸດຕົວປະກອບສ່ວນຂະຫຍາຍຂໍ້ຄວາມ';

  @override
  String get effects => 'ເອຟເຟັກ';

  @override
  String get expand_text => 'ຂະຫຍາຍຂໍ້ຄວາມ';

  @override
  String get font_size => 'ຂະຫນາດຕົວອັກສອນ';

  @override
  String get increase_or_decrease_word_spacing => 'ເພີ່ມຫລືຫລຸດໄລຍະຫ່າງຄຳ';

  @override
  String get increase_or_decrease_letter_spacing =>
      'ເພີ່ມຫລືຫລຸດໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get increase_or_decrease_line_height => 'ເພີ່ມຫລືຫລຸດຄວາມສູງຂອງແຖວ';

  @override
  String get increase_or_decrease_text_size => 'ເພີ່ມຫລືຫລຸດຂະຫນາດຂໍ້ຄວາມ';

  @override
  String get increment_word_spacing => 'ເພີ່ມໄລຍະຫ່າງຄຳ';

  @override
  String get increment_letter_spacing => 'ເພີ່ມໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get increment_line_height => 'ເພີ່ມຄວາມສູງຂອງແຖວ';

  @override
  String get increment_text_scale_factor => 'ເພີ່ມຕົວປະກອບສ່ວນຂະຫຍາຍຂໍ້ຄວາມ';

  @override
  String get less_info => 'ເຊື່ອງຂໍ້ມູນ';

  @override
  String get letter_spacing => 'ໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get line_height => 'ຄວາມສູງຂອງແຖວ';

  @override
  String get more_info => 'ສະແດງຂໍ້ມູນ';

  @override
  String get read_less => 'ອ່ານໜ້ອຍລົງ';

  @override
  String get read_more => 'ອ່ານເພີ່ມເຕີມ';

  @override
  String get reduce_effects => 'ຫລຸດເອຟເຟັກຕ່ໍໜ້າຈໍ';

  @override
  String get reduce_text => 'ຫລຸດຂໍ້ຄວາມ';

  @override
  String get restore_settings => 'ຄືນຄ່າການຕັ້ງຄ່າ';

  @override
  String get restore_main_color => 'ຄືນສີຫລັກ';

  @override
  String get return_to_main_colors => 'ກັບໄປສີຫລັກ';

  @override
  String get settings => 'ການຕັ້ງຄ່າ';

  @override
  String get size_and_text_display => 'ຂະຫນາດແລະການສະແດງຂໍ້ຄວາມ';

  @override
  String get slider_word_spacing => 'ຕົວເລື່ອນໄລຍະຫ່າງຄຳ';

  @override
  String get slider_letter_spacing => 'ຕົວເລື່ອນໄລຍະຫ່າງຕົວອັກສອນ';

  @override
  String get slider_line_height => 'ຕົວເລື່ອນຄວາມສູງຂອງແຖວ';

  @override
  String get theme_mode => 'ຊຸດຕົກແຕ່ງ';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(themeProfileName, {
      'other': 'ບໍ່ຮູ້ຈັກຊຸດຕົກແຕ່ງ',
      'seizureSafe': 'ປອດໄພຈາກອາການຊັກ',
      'visionImpaired': 'ຊ່ວຍການເບິ່ງເຫັນບົກຜ່ອງ',
      'adhdFriendly': 'ເໝາະສົມສຳລັບຜູ້ທີ່ມີ ADHD',
      'none': 'ຄ່າເລີ່ມຕົ້ນ',
    });
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title => 'ຊຸດຕົກແຕ່ງປອດໄພຈາກອາການຊັກ';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'ຂະຈັດການສະທ້ອນແສງແລະຫລຸດຄວາມເຂັ້ມຂອງສີ';

  @override
  String get theme_profile_seizure_safe_description =>
      'ຊຸດຕົກແຕ່ງນີ້ຊ່ວຍໃຫ້ຜູ້ໃຊ້ທີ່ເປັນໂຣກລົມບ້າຫມູແລະມີຄວາມສ່ຽງຕໍ່ການຊັກ ສາມາດເບິ່ງໄດ້ຢ່າງປອດໄພໂດຍການຂະຈັດຄວາມສ່ຽງທີ່ຈະເກີດອາການຊັກທີ່ເກີດຈາກການເຄື່ອນໄຫວແບບເປັ່ງແວບແລະການຜະສົມສີທີ່ເປັນອັນຕະລາຍ.';

  @override
  String get theme_profile_vision_impaired_title =>
      'ຊຸດຕົກແຕ່ງສຳລັບຜູ້ບົກຜ່ອງທາງການເບິ່ງເຫັນ';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'ປັບປຸງການເບິ່ງເຫັນຂອງແອັພພລິເຄຊັ່ນ';

  @override
  String get theme_profile_vision_impaired_description =>
      'ຊຸດຕົກແຕ່ງນີ້ປັບໃຫ້ແອັພພລິເຄຊັ່ນສາມາດເຂົ້າເຖິງໄດ້ສຳລັບຄວາມບົກຜ່ອງທາງການເບິ່ງເຫັນສ່ວນຫລາຍ ເຊັ່ນ: ບັນຫາການເບິ່ງເຫັນ, ການເບິ່ງເຫັນແບບອຸໂມງ, ຕ້ອງຟາງຕາ, ຕ້ອນີ້ລວມຕາ ແລະອື່ນໆ.';

  @override
  String get theme_profile_adhd_friendly_title =>
      'ຊຸດຕົກແຕ່ງສຳລັບຜູ້ທີ່ມີ ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'ເພີ່ມສະມາທິແລະຫລຸດສິ່ງລົບກວນ';

  @override
  String get theme_profile_adhd_friendly_description =>
      'ຊຸດຕົກແຕ່ງນີ້ຊ່ວຍຫລຸດສິ່ງລົບກວນຢ່າງມີປະສິດທິພາບ ເພື່ອຊ່ວຍໃຫ້ຜູ້ທີ່ມີ ADHD ແລະຜູ້ທີ່ມີບັນຫາທາງພັດທະນາການທາງປະສາດສາມາດເນັ້ນໃຈໃສ່, ອ່ານ ແລະເນັ້ນສ່ວນປະກອບທີ່ສຳຄັນຂອງແອັພພລິເຄຊັ່ນໄດ້ງ່າຍຂຶ້ນ.';

  @override
  String get the_settings_have_been_reset => 'ການຕັ້ງຄ່າໄດ້ຖືກຄືນຄ່າແລ້ວ.';

  @override
  String get toggle_dark_mode => 'ສັບປ່ຽນໂຫມດທີ່ມືດ';

  @override
  String get toggle_effects_mode => 'ສັບປ່ຽນໂຫມດເອຟເຟັກ';

  @override
  String get toggle_font_weight => 'ສັບປ່ຽນຄວາມໜາຂອງຕົວອັກສອນ';

  @override
  String get toggle_theme_profile => 'ສັບປ່ຽນຊຸດຕົກແຕ່ງ';

  @override
  String get word_spacing => 'ໄລຍະຫ່າງຄຳ';
}
