// ignore_for_file: missing_whitespace_between_adjacent_strings

import 'package:accessibility/src/core/l10n/generated/app_localizations_lo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsLo', () {
    late AccessibilityLocalizationsLo loc;

    setUp(() {
      loc = AccessibilityLocalizationsLo();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('lo'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('ການເຂົ້າເຖິງໄດ້'));
      expect(
        loc.accessibility_settings,
        equals('ການຕັ້ງຄ່າການເຂົ້າເຖິງໄດ້'),
      );
      expect(
        loc.adjust_background_colors,
        equals('ປັບປ່ຽນສີພື້ນຫລັງ'),
      );
      expect(loc.adjust_text_colors, equals('ປັບປ່ຽນສີຂໍ້ຄວາມ'));
      expect(loc.align_center, equals('ຈັດໃຫ້ຢູ່ກາງ'));
      expect(loc.align_left, equals('ຈັດໃຫ້ຢູ່ຊ້າຍ'));
      expect(loc.align_right, equals('ຈັດໃຫ້ຢູ່ຂວາ'));
      expect(loc.bold_text, equals('ຂໍ້ຄວາມໜາ'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('ປ່ຽນຂໍ້ຄວາມໜາ'));
      expect(
        loc.change_pages_background_color,
        equals('ປ່ຽນສີພື້ນຫລັງຂອງໜ້າເປັນ: '),
      );
      expect(
        loc.change_text_color,
        equals('ປ່ຽນສີຂໍ້ຄວາມເປັນ: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('ປ່ຽນເຉດຂອງສີເປັນ: '),
      );
      expect(loc.color_adjustment, equals('ການປັບປ່ຽນສີ'));
      expect(
        loc.color_profile_changed_to,
        equals('ໂປຣໄຟລສີປະຈຸບັນແມ່ນ: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('ຫລຸດໄລຍະຫ່າງຄຳ'));
      expect(
        loc.decrement_letter_spacing,
        equals('ຫລຸດໄລຍະຫ່າງຕົວອັກສອນ'),
      );
      expect(loc.decrement_line_height, equals('ຫລຸດຄວາມສູງຂອງແຖວ'));
      expect(
        loc.decrement_text_scale_factor,
        equals('ຫລຸດຕົວປະກອບສ່ວນຂະຫຍາຍຂໍ້ຄວາມ'),
      );
      expect(loc.increment_word_spacing, equals('ເພີ່ມໄລຍະຫ່າງຄຳ'));
      expect(
        loc.increment_letter_spacing,
        equals('ເພີ່ມໄລຍະຫ່າງຕົວອັກສອນ'),
      );
      expect(loc.increment_line_height, equals('ເພີ່ມຄວາມສູງຂອງແຖວ'));
      expect(
        loc.increment_text_scale_factor,
        equals('ເພີ່ມຕົວປະກອບສ່ວນຂະຫຍາຍຂໍ້ຄວາມ'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('ເພີ່ມຫລືຫລຸດໄລຍະຫ່າງຄຳ'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals(
          'ເພີ່ມຫລືຫລຸດໄລຍະຫ່າງຕົວອັກສອນ',
        ),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('ເພີ່ມຫລືຫລຸດຄວາມສູງຂອງແຖວ'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('ເພີ່ມຫລືຫລຸດຂະຫນາດຂໍ້ຄວາມ'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('ເອຟເຟັກ'));
      expect(loc.expand_text, equals('ຂະຫຍາຍຂໍ້ຄວາມ'));
      expect(loc.font_size, equals('ຂະຫນາດຕົວອັກສອນ'));
      expect(loc.less_info, equals('ເຊື່ອງຂໍ້ມູນ'));
      expect(loc.letter_spacing, equals('ໄລຍະຫ່າງຕົວອັກສອນ'));
      expect(loc.line_height, equals('ຄວາມສູງຂອງແຖວ'));
      expect(loc.more_info, equals('ສະແດງຂໍ້ມູນ'));
      expect(loc.word_spacing, equals('ໄລຍະຫ່າງຄຳ'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('ອ່ານໜ້ອຍລົງ'));
      expect(loc.read_more, equals('ອ່ານເພີ່ມເຕີມ'));
      expect(
        loc.reduce_effects,
        equals('ຫລຸດເອຟເຟັກຕ່ໍໜ້າຈໍ'),
      );
      expect(loc.reduce_text, equals('ຫລຸດຂໍ້ຄວາມ'));
      expect(loc.restore_settings, equals('ຄືນຄ່າການຕັ້ງຄ່າ'));
      expect(loc.restore_main_color, equals('ຄືນສີຫລັກ'));
      expect(loc.return_to_main_colors, equals('ກັບໄປສີຫລັກ'));
      expect(loc.settings, equals('ການຕັ້ງຄ່າ'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('ຂະຫນາດແລະການສະແດງຂໍ້ຄວາມ'),
      );
      expect(loc.slider_word_spacing, equals('ຕົວເລື່ອນໄລຍະຫ່າງຄຳ'));
      expect(
        loc.slider_letter_spacing,
        equals('ຕົວເລື່ອນໄລຍະຫ່າງຕົວອັກສອນ'),
      );
      expect(loc.slider_line_height, equals('ຕົວເລື່ອນຄວາມສູງຂອງແຖວ'));
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('ຊຸດຕົກແຕ່ງ'));
      expect(
        loc.theme_profile('other'),
        equals('ບໍ່ຮູ້ຈັກຊຸດຕົກແຕ່ງ'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('ປອດໄພຈາກອາການຊັກ'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('ຊ່ວຍການເບິ່ງເຫັນບົກຜ່ອງ'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('ເໝາະສົມສຳລັບຜູ້ທີ່ມີ ADHD'),
      );
      expect(loc.theme_profile('none'), equals('ຄ່າເລີ່ມຕົ້ນ'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('ຊຸດຕົກແຕ່ງປອດໄພຈາກອາການຊັກ'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('ຂະຈັດການສະທ້ອນແສງແລະຫລຸດຄວາມເຂັ້ມຂອງສີ'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'ຊຸດຕົກແຕ່ງນີ້ຊ່ວຍໃຫ້ຜູ້ໃຊ້ທີ່ເປັນໂຣກລົມບ້າຫມູແລະ'
          'ມີຄວາມສ່ຽງຕໍ່ການຊັກ ສາມາດເບິ່ງໄດ້ຢ່າງປອດໄພໂດຍ'
          'ການຂະຈັດຄວາມສ່ຽງທີ່ຈະເກີດອາການຊັກທີ່ເກີດຈາກ'
          'ການເຄື່ອນໄຫວແບບເປັ່ງແວບແລະການຜະສົມສີທີ່ເປັນ'
          'ອັນຕະລາຍ.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('ຊຸດຕົກແຕ່ງສຳລັບຜູ້ບົກຜ່ອງທາງການເບິ່ງເຫັນ'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('ປັບປຸງການເບິ່ງເຫັນຂອງແອັພພລິເຄຊັ່ນ'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'ຊຸດຕົກແຕ່ງນີ້ປັບໃຫ້ແອັພພລິເຄຊັ່ນສາມາດເຂົ້າເຖິງ'
          'ໄດ້ສຳລັບຄວາມບົກຜ່ອງທາງການເບິ່ງເຫັນສ່ວນຫລາຍ '
          'ເຊັ່ນ: ບັນຫາການເບິ່ງເຫັນ, ການເບິ່ງເຫັນແບບ'
          'ອຸໂມງ, ຕ້ອງຟາງຕາ, ຕ້ອນີ້ລວມຕາ ແລະອື່ນໆ.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('ຊຸດຕົກແຕ່ງສຳລັບຜູ້ທີ່ມີ ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('ເພີ່ມສະມາທິແລະຫລຸດສິ່ງລົບກວນ'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'ຊຸດຕົກແຕ່ງນີ້ຊ່ວຍຫລຸດສິ່ງລົບກວນຢ່າງມີປະສິດ'
          'ທິພາບ ເພື່ອຊ່ວຍໃຫ້ຜູ້ທີ່ມີ ADHD ແລະຜູ້ທີ່ມີ'
          'ບັນຫາທາງພັດທະນາການທາງປະສາດສາມາດເນັ້ນໃຈໃສ່, '
          'ອ່ານ ແລະເນັ້ນສ່ວນປະກອບທີ່ສຳຄັນຂອງແອັພພລິ'
          'ເຄຊັ່ນໄດ້ງ່າຍຂຶ້ນ.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('ການຕັ້ງຄ່າໄດ້ຖືກຄືນຄ່າແລ້ວ.'),
      );
      expect(loc.toggle_dark_mode, equals('ສັບປ່ຽນໂຫມດທີ່ມືດ'));
      expect(loc.toggle_effects_mode, equals('ສັບປ່ຽນໂຫມດເອຟເຟັກ'));
      expect(
        loc.toggle_font_weight,
        equals('ສັບປ່ຽນຄວາມໜາຂອງຕົວອັກສອນ'),
      );
      expect(loc.toggle_theme_profile, equals('ສັບປ່ຽນຊຸດຕົກແຕ່ງ'));
    });

    test('should return the correct color profile select values', () {
      expect(loc.color_profile('other'), equals('ປົກກະຕິ'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('ຄວາມເຂັ້ມຕ່ໍາ'),
      );
      expect(loc.color_profile('normal'), equals('ປົກກະຕິ'));
      expect(
        loc.color_profile('highSaturation'),
        equals('ຄວາມເຂັ້ມສູງ'),
      );
      expect(loc.color_profile('monochrome'), equals('ຂາວ-ດໍາ'));
      expect(
        loc.color_profile('highContrast'),
        equals('ຄວາມຄມຊັດສູງ'),
      );
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('ບໍ່ຮູ້ຈັກສີ'));
      expect(loc.color('cF44336'), equals('ສີແດງ'));
      expect(loc.color('cE91E63'), equals('ສີບົວ'));
      expect(loc.color('c9C27B0'), equals('ສີມ່ວງ'));
      expect(loc.color('c673AB7'), equals('ສີມ່ວງເຂັ້ມ'));
      expect(loc.color('c3F51B5'), equals('ສີຄາມ'));
      expect(loc.color('c2196F3'), equals('ສີຟ້າ'));
      expect(loc.color('c03A9F4'), equals('ສີຟ້າອ່ອນ'));
      expect(loc.color('c00BCD4'), equals('ສີຟ້ານ້ຳເງິນ'));
      expect(loc.color('c009688'), equals('ສີຟ້າຂຽວ'));
      expect(loc.color('c4CAF50'), equals('ສີຂຽວ'));
      expect(loc.color('c8BC34A'), equals('ສີຂຽວອ່ອນ'));
      expect(loc.color('cCDDC39'), equals('ສີຂຽວໄລມ໌'));
      expect(loc.color('cFFEB3B'), equals('ສີເຫຼືອງ'));
      expect(loc.color('cFFC107'), equals('ສີເຫຼືອງອຳເບີ້'));
      expect(loc.color('cFF9800'), equals('ສີສົ້ມ'));
      expect(loc.color('cFF5722'), equals('ສີສົ້ມແກ່'));
      expect(loc.color('c795548'), equals('ສີນ້ຳຕານ'));
      expect(loc.color('c9E9E9E'), equals('ສີເທົາ'));
      expect(loc.color('c607D8B'), equals('ສີເທົາຟ້າ'));
    });
  });
}
