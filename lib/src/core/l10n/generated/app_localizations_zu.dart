// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AccessibilityLocalizationsZu extends AccessibilityLocalizations {
  AccessibilityLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get accessibility => 'Ukufinyelela';

  @override
  String get accessibility_settings => 'Izilungiselelo zokufinyelela';

  @override
  String get adjust_background_colors => 'Lungisa imibala yangemuva';

  @override
  String get adjust_text_colors => 'Lungisa imibala yombhalo';

  @override
  String get align_center => 'Qondanisa maphakathi';

  @override
  String get align_left => 'Qondanisa kwesokunxele';

  @override
  String get align_right => 'Qondanisa kwesokudla';

  @override
  String get bold_text => 'Umbhalo oqinile';

  @override
  String get change_bold_text => 'Shintsha umbhalo oqinile';

  @override
  String get change_pages_background_color =>
      'Shintsha umbala wangemuva wamakhasi ku: ';

  @override
  String get change_text_color => 'Shintsha umbala wombhalo ku: ';

  @override
  String get change_text_color_shade => 'Shintsha umthunzi wombala ku: ';

  @override
  String get color_adjustment => 'Ukulungisa kombala';

  @override
  String color_profile(String profile) {
    String _temp0 = intl.Intl.selectLogic(
      profile,
      {
        'other': 'Okujwayelekile',
        'lowSaturation': 'Ukuqiniseka okuphansi',
        'normal': 'Okujwayelekile',
        'highSaturation': 'Ukuqiniseka okuphezulu',
        'monochrome': 'Umbala owodwa',
        'highContrast': 'Umehluko ophezulu',
      },
    );
    return '$_temp0';
  }

  @override
  String get color_profile_changed_to => 'Iphrofayela yombala yamanje ithi: ';

  @override
  String color(String color) {
    String _temp0 = intl.Intl.selectLogic(
      color,
      {
        'other': 'Umbala ongaziwa',
        'cF44336': 'Obomvu',
        'cE91E63': 'Opinki',
        'c9C27B0': 'Okunsomi',
        'c673AB7': 'Okunsomi okujulile',
        'c3F51B5': 'I-indigo',
        'c2196F3': 'Okuluhlaza okwesibhakabhaka',
        'c03A9F4': 'Okuluhlaza okwesibhakabhaka okukhanyayo',
        'c00BCD4': 'I-cyan',
        'c009688': 'I-teal',
        'c4CAF50': 'Okuluhlaza okotshani',
        'c8BC34A': 'Okuluhlaza okotshani okukhanyayo',
        'cCDDC39': 'I-layimu',
        'cFFEB3B': 'Okuphuzi',
        'cFFC107': 'I-amber',
        'cFF9800': 'Iwolintshi',
        'cFF5722': 'Iwolintshi ejulile',
        'c795548': 'Onsundu',
        'c9E9E9E': 'Ompunga',
        'c607D8B': 'Ompunga oluhlaza okwesibhakabhaka',
      },
    );
    return '$_temp0';
  }

  @override
  String get decrement_word_spacing => 'Nciphisa isikhala samagama';

  @override
  String get decrement_letter_spacing => 'Nciphisa isikhala sezinhlamvu';

  @override
  String get decrement_line_height => 'Nciphisa ukuphakama komugqa';

  @override
  String get decrement_text_scale_factor => 'Nciphisa isikali sombhalo';

  @override
  String get effects => 'Imiphumela';

  @override
  String get expand_text => 'Nweba umbhalo';

  @override
  String get font_size => 'Usayizi wombhalo';

  @override
  String get increase_or_decrease_word_spacing =>
      'Khuphula noma unciphise isikhala samagama';

  @override
  String get increase_or_decrease_letter_spacing =>
      'Khuphula noma unciphise isikhala sezinhlamvu';

  @override
  String get increase_or_decrease_line_height =>
      'Khuphula noma unciphise ukuphakama komugqa';

  @override
  String get increase_or_decrease_text_size =>
      'Khuphula noma unciphise usayizi wombhalo';

  @override
  String get increment_word_spacing => 'Khuphula isikhala samagama';

  @override
  String get increment_letter_spacing => 'Khuphula isikhala sezinhlamvu';

  @override
  String get increment_line_height => 'Khuphula ukuphakama komugqa';

  @override
  String get increment_text_scale_factor => 'Khuphula isikali sombhalo';

  @override
  String get less_info => 'Fihla ulwazi';

  @override
  String get letter_spacing => 'Isikhala sezinhlamvu';

  @override
  String get line_height => 'Ukuphakama komugqa';

  @override
  String get more_info => 'Bonisa ulwazi';

  @override
  String get read_less => 'Funda kancane';

  @override
  String get read_more => 'Funda kabanzi';

  @override
  String get reduce_effects => 'Nciphisa imiphumela esikrini';

  @override
  String get reduce_text => 'Nciphisa umbhalo';

  @override
  String get restore_settings => 'Buyisela izilungiselelo';

  @override
  String get restore_main_color => 'Buyisela umbala omkhulu';

  @override
  String get return_to_main_colors => 'Buyela emibala eyinhloko';

  @override
  String get settings => 'Izilungiselelo';

  @override
  String get size_and_text_display => 'Usayizi nokuboniswa kombhalo';

  @override
  String get slider_word_spacing => 'Isilayi sesikhala samagama';

  @override
  String get slider_letter_spacing => 'Isilayi sesikhala sezinhlamvu';

  @override
  String get slider_line_height => 'Isilayi sokuphakama komugqa';

  @override
  String get theme_mode => 'Itimu';

  @override
  String theme_profile(String themeProfileName) {
    String _temp0 = intl.Intl.selectLogic(
      themeProfileName,
      {
        'other': 'Iphrofayela yetimu engaziwa',
        'seizureSafe': 'Ukuphepha kwesifo sokuwa',
        'visionImpaired': 'Ukungaboni kahle',
        'adhdFriendly': 'Kulungele i-ADHD',
        'none': 'Okuzenzakalelayo',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme_profile_seizure_safe_title =>
      'Iphrofayela yokuphepha kwesifo sokuwa';

  @override
  String get theme_profile_seizure_safe_subtitle =>
      'Susa ukuphazima futhi unciphise umbala';

  @override
  String get theme_profile_seizure_safe_description =>
      'Le phrofayela ivumela abasebenzisi abanesifo sokuwa futhi abasengozini yokuwa ukuthi babhekise ngokuphepha ngokususa ingozi yokuwa okubangelwa ukuphazima kwezithombe ezinyakazayo kanye nezinhlanganisela zemibala eziyingozi.';

  @override
  String get theme_profile_vision_impaired_title =>
      'Iphrofayela yabanenkinga yokubona';

  @override
  String get theme_profile_vision_impaired_subtitle =>
      'Thuthukisa ukubonakala kohlelo lokusebenza';

  @override
  String get theme_profile_vision_impaired_description =>
      'Le phrofayela ilungisa uhlelo lokusebenza ukuze lufinyelele ezinkingeni eziningi zokubona, njengokungaboni kahle, ukubona okuncane, isifo samehlo esiluhlaza, isifo samehlo esingokwehla kwengcindezi kanye nokunye.';

  @override
  String get theme_profile_adhd_friendly_title => 'Iphrofayela elungele i-ADHD';

  @override
  String get theme_profile_adhd_friendly_subtitle =>
      'Ukugxila okuningi nokudideka okuncane';

  @override
  String get theme_profile_adhd_friendly_description =>
      'Le phrofayela inciphisa kakhulu ukuphazamiseka, ukusiza abantu abane-ADHD kanye nezifo zokuthuthuka kwemizwa ukuthi bahambe, bafunde, futhi bagxile ezintweni ezibalulekile zohlelo lokusebenza kalula.';

  @override
  String get the_settings_have_been_reset => 'Izilungiselelo zisethwe kabusha.';

  @override
  String get toggle_dark_mode => 'Guqula imodi emnyama';

  @override
  String get toggle_effects_mode => 'Guqula imodi yemiphumela';

  @override
  String get toggle_font_weight => 'Guqula ubunzima bombhalo';

  @override
  String get toggle_theme_profile => 'Guqula iphrofayela yetimu';

  @override
  String get word_spacing => 'Isikhala samagama';

  @override
  String get accessible_font => 'Ifonti efinyelelekayo';

  @override
  String get accessible_font_subtitle =>
      'Sebenzisa ifonti ye-Verdana ukuze kufundeke kangcono';

  @override
  String get accessible_font_enabled => 'Ifonti efinyelelekayo ivuliwe';

  @override
  String get accessible_font_disabled => 'Ifonti efinyelelekayo ivaliwe';

  @override
  String get toggle_accessible_font => 'Guqula ifonti efinyelelekayo';
}
