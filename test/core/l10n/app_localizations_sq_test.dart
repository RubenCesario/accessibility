import 'package:accessibility/src/core/l10n/generated/app_localizations_sq.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsSq', () {
    late AccessibilityLocalizationsSq loc;

    setUp(() {
      loc = AccessibilityLocalizationsSq();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('sq'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Aksesueshmëria'));
      expect(
        loc.accessibility_settings,
        equals('Cilësimet e aksesueshmërisë'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Rregullo ngjyrat e sfondit'),
      );
      expect(loc.adjust_text_colors, equals('Rregullo ngjyrat e tekstit'));
      expect(loc.align_center, equals('Qendërzo'));
      expect(loc.align_left, equals('Vendos majtas'));
      expect(loc.align_right, equals('Vendos djathtas'));
      expect(loc.bold_text, equals('Tekst i trashë'));
    });

    test('should return the correct change-related string values', () {
      expect(
        loc.change_bold_text,
        equals('Ndrysho trashësinë e tekstit'),
      );
      expect(
        loc.change_pages_background_color,
        equals('Ndrysho ngjyrën e sfondit të faqeve në: '),
      );
      expect(
        loc.change_text_color,
        equals('Ndrysho ngjyrën e tekstit në: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Ndrysho nuancën e ngjyrës në: '),
      );
      expect(loc.color_adjustment, equals('Rregullimi i ngjyrave'));
      expect(
        loc.color_profile_changed_to,
        equals('Profili aktual i ngjyrave është: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(
        loc.decrement_word_spacing,
        equals('Zvogëlo hapësirën mes fjalëve'),
      );
      expect(
        loc.decrement_letter_spacing,
        equals('Zvogëlo hapësirën mes shkronjave'),
      );
      expect(
        loc.decrement_line_height,
        equals('Zvogëlo lartësinë e rreshtit'),
      );
      expect(
        loc.decrement_text_scale_factor,
        equals('Zvogëlo faktorin e shkallëzimit të tekstit'),
      );
      expect(
        loc.increment_word_spacing,
        equals('Rrit hapësirën mes fjalëve'),
      );
      expect(
        loc.increment_letter_spacing,
        equals('Rrit hapësirën mes shkronjave'),
      );
      expect(loc.increment_line_height, equals('Rrit lartësinë e rreshtit'));
      expect(
        loc.increment_text_scale_factor,
        equals('Rrit faktorin e shkallëzimit të tekstit'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Rrit ose zvogëlo hapësirën mes fjalëve'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Rrit ose zvogëlo hapësirën mes shkronjave'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Rrit ose zvogëlo lartësinë e rreshtit'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Rrit ose zvogëlo madhësinë e tekstit'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Efektet'));
      expect(loc.expand_text, equals('Zgjero tekstin'));
      expect(loc.font_size, equals('Madhësia e shkrimit'));
      expect(loc.less_info, equals('Fshih informacionin'));
      expect(loc.letter_spacing, equals('Hapësira mes shkronjave'));
      expect(loc.line_height, equals('Lartësia e rreshtit'));
      expect(loc.more_info, equals('Shfaq informacionin'));
      expect(loc.word_spacing, equals('Hapësira mes fjalëve'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Lexo më pak'));
      expect(loc.read_more, equals('Lexo më shumë'));
      expect(
        loc.reduce_effects,
        equals('Redukto efektet në ekran'),
      );
      expect(loc.reduce_text, equals('Zvogëlo tekstin'));
      expect(loc.restore_settings, equals('Rikthe cilësimet'));
      expect(loc.restore_main_color, equals('Rikthe ngjyrën kryesore'));
      expect(
        loc.return_to_main_colors,
        equals('Kthehu te ngjyrat kryesore'),
      );
      expect(loc.settings, equals('Cilësimet'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Madhësia dhe shfaqja e tekstit'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Rrëshqitësi i hapësirës mes fjalëve'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Rrëshqitësi i hapësirës mes shkronjave'),
      );
      expect(
        loc.slider_line_height,
        equals('Rrëshqitësi i lartësisë së rreshtit'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Tema'));
      expect(
        loc.theme_profile('other'),
        equals('Profili i temës nuk njihet'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('I sigurt për epilepsi'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Për shikim të dëmtuar'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Miqsor për ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Parazgjedhur'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Profil i sigurt për epilepsi'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Hiq reflektimet dhe redukto ngjyrat'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals(
          'Ky profil u mundeson përdoruesve që kanë epilepsi '
          'dhe janë në rrezik për kriza të shfletojnë në '
          'mënyrë të sigurt duke eliminuar rrezikun e '
          'krizave që vijnë nga animacionet vezulluese dhe '
          'kombinimet e rrezikshme të ngjyrave.',
        ),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Profil për shikim të dëmtuar'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Përmirso dukshmerinë e aplikacionit'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals(
          'Ky profil përshtat aplikacionin që të jetë i '
          'aksesueshëm për shumë dëmtime të shikimit, si '
          'dëmtimi i shikimit, shikimi tunel, katarakti, '
          'glaukoma dhe më shumë.',
        ),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Profil miqsor për ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Më shumë përqendrim dhe më pak shpërqendrime'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals(
          'Ky profil redukton në mënyrë të konsiderueshme '
          'shpërqendrimet, për të ndihmuar njerëzit me ADHD '
          'dhe çrregullime neurozhvillimore të navigojnë, '
          'lexojnë dhe të përqendrohen më lehtë në '
          'elementet thelbsore të aplikacionit.',
        ),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Cilësimet janë rivendosur.'),
      );
      expect(
        loc.toggle_dark_mode,
        equals('Ndryshoni modalitetin e errët'),
      );
      expect(
        loc.toggle_effects_mode,
        equals('Ndryshoni modalitetin e efekteve'),
      );
      expect(
        loc.toggle_font_weight,
        equals('Ndryshoni trashësinë e shkrimit'),
      );
      expect(
        loc.toggle_theme_profile,
        equals('Ndryshoni profilin e temës'),
      );
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Normal'));
      expect(loc.color_profile('lowSaturation'), equals('Ngopje e ulët'));
      expect(loc.color_profile('normal'), equals('Normal'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Ngopje e lartë'),
      );
      expect(loc.color_profile('monochrome'), equals('Monokromatike'));
      expect(loc.color_profile('highContrast'), equals('Kontrast i lartë'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Ngjyra nuk njihet'));
      expect(loc.color('cF44336'), equals('E kuqe'));
      expect(loc.color('cE91E63'), equals('Rozë'));
      expect(loc.color('c9C27B0'), equals('Vjollcë'));
      expect(loc.color('c673AB7'), equals('Vjollcë e errët'));
      expect(loc.color('c3F51B5'), equals('Indigo'));
      expect(loc.color('c2196F3'), equals('Blu'));
      expect(loc.color('c03A9F4'), equals('Blu e çelët'));
      expect(loc.color('c00BCD4'), equals('Cian'));
      expect(loc.color('c009688'), equals('Blu e gjelbër'));
      expect(loc.color('c4CAF50'), equals('E gjelbrë'));
      expect(loc.color('c8BC34A'), equals('E gjelbrë e çelët'));
      expect(loc.color('cCDDC39'), equals('Limë'));
      expect(loc.color('cFFEB3B'), equals('E verdhë'));
      expect(loc.color('cFFC107'), equals('Qelibar'));
      expect(loc.color('cFF9800'), equals('Portokalli'));
      expect(loc.color('cFF5722'), equals('Portokalli e errët'));
      expect(loc.color('c795548'), equals('Kafe'));
      expect(loc.color('c9E9E9E'), equals('Gri'));
      expect(loc.color('c607D8B'), equals('Blu gri'));
    });
  });
}
