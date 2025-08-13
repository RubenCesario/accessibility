import 'package:accessibility/src/core/l10n/generated/app_localizations_zu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizationsZu', () {
    late AccessibilityLocalizationsZu loc;

    setUp(() {
      loc = AccessibilityLocalizationsZu();
    });

    test('should have the correct locale name', () {
      expect(loc.localeName, equals('zu'));
    });

    test('should return the correct basic string values', () {
      expect(loc.accessibility, equals('Ukufinyelela'));
      expect(
        loc.accessibility_settings,
        equals('Izilungiselelo zokufinyelela'),
      );
      expect(
        loc.adjust_background_colors,
        equals('Lungisa imibala yangemuva'),
      );
      expect(loc.adjust_text_colors, equals('Lungisa imibala yombhalo'));
      expect(loc.align_center, equals('Qondanisa maphakathi'));
      expect(loc.align_left, equals('Qondanisa kwesokunxele'));
      expect(loc.align_right, equals('Qondanisa kwesokudla'));
      expect(loc.bold_text, equals('Umbhalo oqinile'));
    });

    test('should return the correct change-related string values', () {
      expect(loc.change_bold_text, equals('Shintsha umbhalo oqinile'));
      expect(
        loc.change_pages_background_color,
        equals('Shintsha umbala wangemuva wamakhasi ku: '),
      );
      expect(
        loc.change_text_color,
        equals('Shintsha umbala wombhalo ku: '),
      );
      expect(
        loc.change_text_color_shade,
        equals('Shintsha umthunzi wombala ku: '),
      );
      expect(loc.color_adjustment, equals('Ukulungisa kombala'));
      expect(
        loc.color_profile_changed_to,
        equals('Iphrofayela yombala yamanje ithi: '),
      );
    });

    test('should return the correct increment/decrement string values', () {
      expect(loc.decrement_word_spacing, equals('Nciphisa isikhala samagama'));
      expect(
        loc.decrement_letter_spacing,
        equals('Nciphisa isikhala sezinhlamvu'),
      );
      expect(loc.decrement_line_height, equals('Nciphisa ukuphakama komugqa'));
      expect(
        loc.decrement_text_scale_factor,
        equals('Nciphisa isikali sombhalo'),
      );
      expect(loc.increment_word_spacing, equals('Khuphula isikhala samagama'));
      expect(
        loc.increment_letter_spacing,
        equals('Khuphula isikhala sezinhlamvu'),
      );
      expect(loc.increment_line_height, equals('Khuphula ukuphakama komugqa'));
      expect(
        loc.increment_text_scale_factor,
        equals('Khuphula isikali sombhalo'),
      );
    });

    test('should return the correct increase/decrease string values', () {
      expect(
        loc.increase_or_decrease_word_spacing,
        equals('Khuphula noma unciphise isikhala samagama'),
      );
      expect(
        loc.increase_or_decrease_letter_spacing,
        equals('Khuphula noma unciphise isikhala sezinhlamvu'),
      );
      expect(
        loc.increase_or_decrease_line_height,
        equals('Khuphula noma unciphise ukuphakama komugqa'),
      );
      expect(
        loc.increase_or_decrease_text_size,
        equals('Khuphula noma unciphise usayizi wombhalo'),
      );
    });

    test('should return the correct feature string values', () {
      expect(loc.effects, equals('Imiphumela'));
      expect(loc.expand_text, equals('Nweba umbhalo'));
      expect(loc.font_size, equals('Usayizi wombhalo'));
      expect(loc.less_info, equals('Fihla ulwazi'));
      expect(loc.letter_spacing, equals('Isikhala sezinhlamvu'));
      expect(loc.line_height, equals('Ukuphakama komugqa'));
      expect(loc.more_info, equals('Bonisa ulwazi'));
      expect(loc.word_spacing, equals('Isikhala samagama'));
    });

    test('should return the correct action string values', () {
      expect(loc.read_less, equals('Funda kancane'));
      expect(loc.read_more, equals('Funda kabanzi'));
      expect(
        loc.reduce_effects,
        equals('Nciphisa imiphumela esikrini'),
      );
      expect(loc.reduce_text, equals('Nciphisa umbhalo'));
      expect(loc.restore_settings, equals('Buyisela izilungiselelo'));
      expect(loc.restore_main_color, equals('Buyisela umbala omkhulu'));
      expect(
        loc.return_to_main_colors,
        equals('Buyela emibala eyinhloko'),
      );
      expect(loc.settings, equals('Izilungiselelo'));
    });

    test('should return the correct settings string values', () {
      expect(
        loc.size_and_text_display,
        equals('Usayizi nokuboniswa kombhalo'),
      );
      expect(
        loc.slider_word_spacing,
        equals('Isilayi sesikhala samagama'),
      );
      expect(
        loc.slider_letter_spacing,
        equals('Isilayi sesikhala sezinhlamvu'),
      );
      expect(
        loc.slider_line_height,
        equals('Isilayi sokuphakama komugqa'),
      );
    });

    test('should return the correct theme string values', () {
      expect(loc.theme_mode, equals('Itimu'));
      expect(
        loc.theme_profile('other'),
        equals('Iphrofayela yetimu engaziwa'),
      );
      expect(
        loc.theme_profile('seizureSafe'),
        equals('Ukuphepha kwesifo sokuwa'),
      );
      expect(
        loc.theme_profile('visionImpaired'),
        equals('Ukungaboni kahle'),
      );
      expect(
        loc.theme_profile('adhdFriendly'),
        equals('Kulungele i-ADHD'),
      );
      expect(loc.theme_profile('none'), equals('Okuzenzakalelayo'));
      expect(
        loc.theme_profile_seizure_safe_title,
        equals('Iphrofayela yokuphepha kwesifo sokuwa'),
      );
      expect(
        loc.theme_profile_seizure_safe_subtitle,
        equals('Susa ukuphazima futhi unciphise umbala'),
      );
      expect(
        loc.theme_profile_seizure_safe_description,
        equals('Le phrofayela ivumela abasebenzisi abanesifo sokuwa '
            'futhi abasengozini yokuwa ukuthi babhekise '
            'ngokuphepha ngokususa ingozi yokuwa okubangelwa '
            'ukuphazima kwezithombe ezinyakazayo kanye '
            'nezinhlanganisela zemibala eziyingozi.'),
      );
      expect(
        loc.theme_profile_vision_impaired_title,
        equals('Iphrofayela yabanenkinga yokubona'),
      );
      expect(
        loc.theme_profile_vision_impaired_subtitle,
        equals('Thuthukisa ukubonakala kohlelo lokusebenza'),
      );
      expect(
        loc.theme_profile_vision_impaired_description,
        equals('Le phrofayela ilungisa uhlelo lokusebenza ukuze '
            'lufinyelele ezinkingeni eziningi zokubona, '
            'njengokungaboni kahle, ukubona okuncane, isifo '
            'samehlo esiluhlaza, isifo samehlo esingokwehla '
            'kwengcindezi kanye nokunye.'),
      );
      expect(
        loc.theme_profile_adhd_friendly_title,
        equals('Iphrofayela elungele i-ADHD'),
      );
      expect(
        loc.theme_profile_adhd_friendly_subtitle,
        equals('Ukugxila okuningi nokudideka okuncane'),
      );
      expect(
        loc.theme_profile_adhd_friendly_description,
        equals('Le phrofayela inciphisa kakhulu ukuphazamiseka, '
            'ukusiza abantu abane-ADHD kanye nezifo '
            'zokuthuthuka kwemizwa ukuthi bahambe, '
            'bafunde, futhi bagxile ezintweni ezibalulekile '
            'zohlelo lokusebenza kalula.'),
      );
      expect(
        loc.the_settings_have_been_reset,
        equals('Izilungiselelo zisethwe kabusha.'),
      );
      expect(loc.toggle_dark_mode, equals('Guqula imodi emnyama'));
      expect(loc.toggle_effects_mode, equals('Guqula imodi yemiphumela'));
      expect(loc.toggle_font_weight, equals('Guqula ubunzima bombhalo'));
      expect(loc.toggle_theme_profile, equals('Guqula iphrofayela yetimu'));
    });

    test('should return the correct color_profile select values', () {
      expect(loc.color_profile('other'), equals('Okujwayelekile'));
      expect(
        loc.color_profile('lowSaturation'),
        equals('Ukuqiniseka okuphansi'),
      );
      expect(loc.color_profile('normal'), equals('Okujwayelekile'));
      expect(
        loc.color_profile('highSaturation'),
        equals('Ukuqiniseka okuphezulu'),
      );
      expect(loc.color_profile('monochrome'), equals('Umbala owodwa'));
      expect(loc.color_profile('highContrast'), equals('Umehluko ophezulu'));
    });

    test('should return the correct color select values', () {
      expect(loc.color('other'), equals('Umbala ongaziwa'));
      expect(loc.color('cF44336'), equals('Obomvu'));
      expect(loc.color('cE91E63'), equals('Opinki'));
      expect(loc.color('c9C27B0'), equals('Okunsomi'));
      expect(loc.color('c673AB7'), equals('Okunsomi okujulile'));
      expect(loc.color('c3F51B5'), equals('I-indigo'));
      expect(loc.color('c2196F3'), equals('Okuluhlaza okwesibhakabhaka'));
      expect(
        loc.color('c03A9F4'),
        equals('Okuluhlaza okwesibhakabhaka okukhanyayo'),
      );
      expect(loc.color('c00BCD4'), equals('I-cyan'));
      expect(loc.color('c009688'), equals('I-teal'));
      expect(loc.color('c4CAF50'), equals('Okuluhlaza okotshani'));
      expect(
        loc.color('c8BC34A'),
        equals('Okuluhlaza okotshani okukhanyayo'),
      );
      expect(loc.color('cCDDC39'), equals('I-layimu'));
      expect(loc.color('cFFEB3B'), equals('Okuphuzi'));
      expect(loc.color('cFFC107'), equals('I-amber'));
      expect(loc.color('cFF9800'), equals('Iwolintshi'));
      expect(loc.color('cFF5722'), equals('Iwolintshi ejulile'));
      expect(loc.color('c795548'), equals('Onsundu'));
      expect(loc.color('c9E9E9E'), equals('Ompunga'));
      expect(
        loc.color('c607D8B'),
        equals('Ompunga oluhlaza okwesibhakabhaka'),
      );
    });
  });
}
