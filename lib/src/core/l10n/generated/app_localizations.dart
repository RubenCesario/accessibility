import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart' deferred as app_localizations_af;
import 'app_localizations_am.dart' deferred as app_localizations_am;
import 'app_localizations_ar.dart' deferred as app_localizations_ar;
import 'app_localizations_as.dart' deferred as app_localizations_as;
import 'app_localizations_az.dart' deferred as app_localizations_az;
import 'app_localizations_be.dart' deferred as app_localizations_be;
import 'app_localizations_bg.dart' deferred as app_localizations_bg;
import 'app_localizations_bn.dart' deferred as app_localizations_bn;
import 'app_localizations_bo.dart' deferred as app_localizations_bo;
import 'app_localizations_bs.dart' deferred as app_localizations_bs;
import 'app_localizations_ca.dart' deferred as app_localizations_ca;
import 'app_localizations_cs.dart' deferred as app_localizations_cs;
import 'app_localizations_cy.dart' deferred as app_localizations_cy;
import 'app_localizations_da.dart' deferred as app_localizations_da;
import 'app_localizations_de.dart' deferred as app_localizations_de;
import 'app_localizations_el.dart' deferred as app_localizations_el;
import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_es.dart' deferred as app_localizations_es;
import 'app_localizations_et.dart' deferred as app_localizations_et;
import 'app_localizations_eu.dart' deferred as app_localizations_eu;
import 'app_localizations_fa.dart' deferred as app_localizations_fa;
import 'app_localizations_fi.dart' deferred as app_localizations_fi;
import 'app_localizations_fil.dart' deferred as app_localizations_fil;
import 'app_localizations_fr.dart' deferred as app_localizations_fr;
import 'app_localizations_gl.dart' deferred as app_localizations_gl;
import 'app_localizations_gsw.dart' deferred as app_localizations_gsw;
import 'app_localizations_gu.dart' deferred as app_localizations_gu;
import 'app_localizations_he.dart' deferred as app_localizations_he;
import 'app_localizations_hi.dart' deferred as app_localizations_hi;
import 'app_localizations_hr.dart' deferred as app_localizations_hr;
import 'app_localizations_hu.dart' deferred as app_localizations_hu;
import 'app_localizations_hy.dart' deferred as app_localizations_hy;
import 'app_localizations_id.dart' deferred as app_localizations_id;
import 'app_localizations_is.dart' deferred as app_localizations_is;
import 'app_localizations_it.dart' deferred as app_localizations_it;
import 'app_localizations_ja.dart' deferred as app_localizations_ja;
import 'app_localizations_ka.dart' deferred as app_localizations_ka;
import 'app_localizations_kk.dart' deferred as app_localizations_kk;
import 'app_localizations_km.dart' deferred as app_localizations_km;
import 'app_localizations_kn.dart' deferred as app_localizations_kn;
import 'app_localizations_ko.dart' deferred as app_localizations_ko;
import 'app_localizations_ky.dart' deferred as app_localizations_ky;
import 'app_localizations_lo.dart' deferred as app_localizations_lo;
import 'app_localizations_lt.dart' deferred as app_localizations_lt;
import 'app_localizations_lv.dart' deferred as app_localizations_lv;
import 'app_localizations_mk.dart' deferred as app_localizations_mk;
import 'app_localizations_ml.dart' deferred as app_localizations_ml;
import 'app_localizations_mn.dart' deferred as app_localizations_mn;
import 'app_localizations_mr.dart' deferred as app_localizations_mr;
import 'app_localizations_ms.dart' deferred as app_localizations_ms;
import 'app_localizations_my.dart' deferred as app_localizations_my;
import 'app_localizations_nb.dart' deferred as app_localizations_nb;
import 'app_localizations_ne.dart' deferred as app_localizations_ne;
import 'app_localizations_nl.dart' deferred as app_localizations_nl;
import 'app_localizations_no.dart' deferred as app_localizations_no;
import 'app_localizations_or.dart' deferred as app_localizations_or;
import 'app_localizations_pa.dart' deferred as app_localizations_pa;
import 'app_localizations_pl.dart' deferred as app_localizations_pl;
import 'app_localizations_ps.dart' deferred as app_localizations_ps;
import 'app_localizations_pt.dart' deferred as app_localizations_pt;
import 'app_localizations_ro.dart' deferred as app_localizations_ro;
import 'app_localizations_ru.dart' deferred as app_localizations_ru;
import 'app_localizations_si.dart' deferred as app_localizations_si;
import 'app_localizations_sk.dart' deferred as app_localizations_sk;
import 'app_localizations_sl.dart' deferred as app_localizations_sl;
import 'app_localizations_sq.dart' deferred as app_localizations_sq;
import 'app_localizations_sr.dart' deferred as app_localizations_sr;
import 'app_localizations_sv.dart' deferred as app_localizations_sv;
import 'app_localizations_sw.dart' deferred as app_localizations_sw;
import 'app_localizations_ta.dart' deferred as app_localizations_ta;
import 'app_localizations_te.dart' deferred as app_localizations_te;
import 'app_localizations_th.dart' deferred as app_localizations_th;
import 'app_localizations_tl.dart' deferred as app_localizations_tl;
import 'app_localizations_tr.dart' deferred as app_localizations_tr;
import 'app_localizations_ug.dart' deferred as app_localizations_ug;
import 'app_localizations_uk.dart' deferred as app_localizations_uk;
import 'app_localizations_ur.dart' deferred as app_localizations_ur;
import 'app_localizations_uz.dart' deferred as app_localizations_uz;
import 'app_localizations_vi.dart' deferred as app_localizations_vi;
import 'app_localizations_zh.dart' deferred as app_localizations_zh;
import 'app_localizations_zu.dart' deferred as app_localizations_zu;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AccessibilityLocalizations
/// returned by `AccessibilityLocalizations.of(context)`.
///
/// Applications need to include `AccessibilityLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AccessibilityLocalizations.localizationsDelegates,
///   supportedLocales: AccessibilityLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AccessibilityLocalizations.supportedLocales
/// property.
abstract class AccessibilityLocalizations {
  AccessibilityLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AccessibilityLocalizations of(BuildContext context) {
    return Localizations.of<AccessibilityLocalizations>(
      context,
      AccessibilityLocalizations,
    )!;
  }

  static const LocalizationsDelegate<AccessibilityLocalizations> delegate =
      _AccessibilityLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('am'),
    Locale('ar'),
    Locale('as'),
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bo'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('gl'),
    Locale('gsw'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ky'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('my'),
    Locale('nb'),
    Locale('ne'),
    Locale('nl'),
    Locale('no'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh'),
    Locale('zu'),
  ];

  /// The label accessibility
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get accessibility;

  /// The label accessibility settings
  ///
  /// In en, this message translates to:
  /// **'Accessibility settings'**
  String get accessibility_settings;

  /// The label adjust background colors
  ///
  /// In en, this message translates to:
  /// **'Adjust background colors'**
  String get adjust_background_colors;

  /// The label adjust text colors
  ///
  /// In en, this message translates to:
  /// **'Adjust text colors'**
  String get adjust_text_colors;

  /// The label align center
  ///
  /// In en, this message translates to:
  /// **'Align center'**
  String get align_center;

  /// The label align left
  ///
  /// In en, this message translates to:
  /// **'Align left'**
  String get align_left;

  /// The label align right
  ///
  /// In en, this message translates to:
  /// **'Align right'**
  String get align_right;

  /// The label bold text
  ///
  /// In en, this message translates to:
  /// **'Bold text'**
  String get bold_text;

  /// The label change bold text
  ///
  /// In en, this message translates to:
  /// **'Change bold text'**
  String get change_bold_text;

  /// The label change pages background color
  ///
  /// In en, this message translates to:
  /// **'Change the background color of the pages to: '**
  String get change_pages_background_color;

  /// The label change text color
  ///
  /// In en, this message translates to:
  /// **'Change the color of the text to: '**
  String get change_text_color;

  /// The label change text color shade
  ///
  /// In en, this message translates to:
  /// **'Change the shade of the color to: '**
  String get change_text_color_shade;

  /// The label color adjustment
  ///
  /// In en, this message translates to:
  /// **'Color adjustment'**
  String get color_adjustment;

  /// A set of color profile names
  ///
  /// In en, this message translates to:
  /// **'{profile, select, other{Normal} lowSaturation{Low saturation} normal{Normal} highSaturation{High saturation} monochrome{Monochrome} highContrast{High contrast}}'**
  String color_profile(String profile);

  /// The label color profile changed to
  ///
  /// In en, this message translates to:
  /// **'The current color profile is: '**
  String get color_profile_changed_to;

  /// A set of color names
  ///
  /// In en, this message translates to:
  /// **'{color, select, other{Color not recognized} cF44336{Red} cE91E63{Pink} c9C27B0{Purple} c673AB7{Deep Purple} c3F51B5{Indigo} c2196F3{Blue} c03A9F4{Light Blue} c00BCD4{Cyan} c009688{Teal} c4CAF50{Green} c8BC34A{Light Green} cCDDC39{Lime} cFFEB3B{Yellow} cFFC107{Amber} cFF9800{Orange} cFF5722{Deep Orange} c795548{Brown} c9E9E9E{Grey} c607D8B{Blue Grey}}'**
  String color(String color);

  /// The label decrement word spacing
  ///
  /// In en, this message translates to:
  /// **'Decrement word spacing'**
  String get decrement_word_spacing;

  /// The label decrement letter spacing
  ///
  /// In en, this message translates to:
  /// **'Decrement letter spacing'**
  String get decrement_letter_spacing;

  /// The label decrement line height
  ///
  /// In en, this message translates to:
  /// **'Decrement line height'**
  String get decrement_line_height;

  /// The label decrement text scale factor
  ///
  /// In en, this message translates to:
  /// **'Decrement text scale factor'**
  String get decrement_text_scale_factor;

  /// The label effects
  ///
  /// In en, this message translates to:
  /// **'Effects'**
  String get effects;

  /// The label expand text
  ///
  /// In en, this message translates to:
  /// **'Expand text'**
  String get expand_text;

  /// The label font size
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get font_size;

  /// The label increase or decrease word spacing
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease word spacing'**
  String get increase_or_decrease_word_spacing;

  /// The label increase or decrease letter spacing
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease letter spacing'**
  String get increase_or_decrease_letter_spacing;

  /// The label increase or decrease line height
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease line height'**
  String get increase_or_decrease_line_height;

  /// The label increase or decrease text size
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease text size'**
  String get increase_or_decrease_text_size;

  /// The label increment word spacing
  ///
  /// In en, this message translates to:
  /// **'Increment word spacing'**
  String get increment_word_spacing;

  /// The label increment letter spacing
  ///
  /// In en, this message translates to:
  /// **'Increment letter spacing'**
  String get increment_letter_spacing;

  /// The label increment line height
  ///
  /// In en, this message translates to:
  /// **'Increment line height'**
  String get increment_line_height;

  /// The label increment text scale factor
  ///
  /// In en, this message translates to:
  /// **'Increment text scale factor'**
  String get increment_text_scale_factor;

  /// The label less info
  ///
  /// In en, this message translates to:
  /// **'Hide info'**
  String get less_info;

  /// The label letter spacing
  ///
  /// In en, this message translates to:
  /// **'Letter spacing'**
  String get letter_spacing;

  /// The label line height
  ///
  /// In en, this message translates to:
  /// **'Line height'**
  String get line_height;

  /// The label more info
  ///
  /// In en, this message translates to:
  /// **'Show info'**
  String get more_info;

  /// The label read less
  ///
  /// In en, this message translates to:
  /// **'Read less'**
  String get read_less;

  /// The label read more
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get read_more;

  /// The label reduce effects
  ///
  /// In en, this message translates to:
  /// **'Reduce effects to screen'**
  String get reduce_effects;

  /// The label reduce text
  ///
  /// In en, this message translates to:
  /// **'Reduce text'**
  String get reduce_text;

  /// The label restore settings
  ///
  /// In en, this message translates to:
  /// **'Restore settings'**
  String get restore_settings;

  /// The label restore main color
  ///
  /// In en, this message translates to:
  /// **'Restore main color'**
  String get restore_main_color;

  /// The label return to main colors
  ///
  /// In en, this message translates to:
  /// **'Return to main colors'**
  String get return_to_main_colors;

  /// The label settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// The label size and text display
  ///
  /// In en, this message translates to:
  /// **'Size and text display'**
  String get size_and_text_display;

  /// The label slider word spacing
  ///
  /// In en, this message translates to:
  /// **'Slider Word spacing'**
  String get slider_word_spacing;

  /// The label slider letter spacing
  ///
  /// In en, this message translates to:
  /// **'Slider Letter spacing'**
  String get slider_letter_spacing;

  /// The label slider line height
  ///
  /// In en, this message translates to:
  /// **'Slider Line height'**
  String get slider_line_height;

  /// The label theme mode
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme_mode;

  /// A set of theme profile names
  ///
  /// In en, this message translates to:
  /// **'{themeProfileName, select, other{Theme profile not recognized} seizureSafe{Seizure safe} visionImpaired{Vision impaired} adhdFriendly{ADHD friendly} none{Default}}'**
  String theme_profile(String themeProfileName);

  /// The label Seizure safe profile
  ///
  /// In en, this message translates to:
  /// **'Seizure safe profile'**
  String get theme_profile_seizure_safe_title;

  /// The description of the Seizure safe profile
  ///
  /// In en, this message translates to:
  /// **'Remove reflections and reduce color'**
  String get theme_profile_seizure_safe_subtitle;

  /// The description of the Seizure safe profile
  ///
  /// In en, this message translates to:
  /// **'This profile enables users who have epilepsy and are at risk of seizures to browse safely by eliminating the risk of seizures that result from flashing animations and risky color combinations.'**
  String get theme_profile_seizure_safe_description;

  /// The label Vision-impaired profile
  ///
  /// In en, this message translates to:
  /// **'Vision-impaired profile'**
  String get theme_profile_vision_impaired_title;

  /// The description of the Vision-impaired profile
  ///
  /// In en, this message translates to:
  /// **'Improve visibility of application'**
  String get theme_profile_vision_impaired_subtitle;

  /// The description of the Vision-impaired profile
  ///
  /// In en, this message translates to:
  /// **'This profile adapts the application to be accessible to most visual impairments, such as vision impairment, tunnel vision, cataracts, glaucoma and more.'**
  String get theme_profile_vision_impaired_description;

  /// The label ADHD-friendly profile
  ///
  /// In en, this message translates to:
  /// **'ADHD-friendly profile'**
  String get theme_profile_adhd_friendly_title;

  /// The description of the ADHD-friendly profile
  ///
  /// In en, this message translates to:
  /// **'More concentration and less distractions'**
  String get theme_profile_adhd_friendly_subtitle;

  /// The description of the ADHD-friendly profile
  ///
  /// In en, this message translates to:
  /// **'This profile significantly reduces distractions, to help people with ADHD and neurodevelopmental disorders navigate, read, and focus on the essential elements of the application more easily.'**
  String get theme_profile_adhd_friendly_description;

  /// The label The settings have been reset
  ///
  /// In en, this message translates to:
  /// **'The settings have been reset.'**
  String get the_settings_have_been_reset;

  /// The label Toggle dark mode
  ///
  /// In en, this message translates to:
  /// **'Toggle dark mode'**
  String get toggle_dark_mode;

  /// The label toggle effects mode
  ///
  /// In en, this message translates to:
  /// **'Toggle effects mode'**
  String get toggle_effects_mode;

  /// The label toggle font weight
  ///
  /// In en, this message translates to:
  /// **'Toggle font weight'**
  String get toggle_font_weight;

  /// The label toggle theme profile
  ///
  /// In en, this message translates to:
  /// **'Toggle theme profile'**
  String get toggle_theme_profile;

  /// The label word spacing
  ///
  /// In en, this message translates to:
  /// **'Word spacing'**
  String get word_spacing;
}

class _AccessibilityLocalizationsDelegate
    extends LocalizationsDelegate<AccessibilityLocalizations> {
  const _AccessibilityLocalizationsDelegate();

  @override
  Future<AccessibilityLocalizations> load(Locale locale) {
    return lookupAccessibilityLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'am',
    'ar',
    'as',
    'az',
    'be',
    'bg',
    'bn',
    'bo',
    'bs',
    'ca',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'es',
    'et',
    'eu',
    'fa',
    'fi',
    'fil',
    'fr',
    'gl',
    'gsw',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'hy',
    'id',
    'is',
    'it',
    'ja',
    'ka',
    'kk',
    'km',
    'kn',
    'ko',
    'ky',
    'lo',
    'lt',
    'lv',
    'mk',
    'ml',
    'mn',
    'mr',
    'ms',
    'my',
    'nb',
    'ne',
    'nl',
    'no',
    'or',
    'pa',
    'pl',
    'ps',
    'pt',
    'ro',
    'ru',
    'si',
    'sk',
    'sl',
    'sq',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tl',
    'tr',
    'ug',
    'uk',
    'ur',
    'uz',
    'vi',
    'zh',
    'zu',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AccessibilityLocalizationsDelegate old) => false;
}

Future<AccessibilityLocalizations> lookupAccessibilityLocalizations(
  Locale locale,
) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return app_localizations_af.loadLibrary().then(
        (dynamic _) => app_localizations_af.AccessibilityLocalizationsAf(),
      );
    case 'am':
      return app_localizations_am.loadLibrary().then(
        (dynamic _) => app_localizations_am.AccessibilityLocalizationsAm(),
      );
    case 'ar':
      return app_localizations_ar.loadLibrary().then(
        (dynamic _) => app_localizations_ar.AccessibilityLocalizationsAr(),
      );
    case 'as':
      return app_localizations_as.loadLibrary().then(
        (dynamic _) => app_localizations_as.AccessibilityLocalizationsAs(),
      );
    case 'az':
      return app_localizations_az.loadLibrary().then(
        (dynamic _) => app_localizations_az.AccessibilityLocalizationsAz(),
      );
    case 'be':
      return app_localizations_be.loadLibrary().then(
        (dynamic _) => app_localizations_be.AccessibilityLocalizationsBe(),
      );
    case 'bg':
      return app_localizations_bg.loadLibrary().then(
        (dynamic _) => app_localizations_bg.AccessibilityLocalizationsBg(),
      );
    case 'bn':
      return app_localizations_bn.loadLibrary().then(
        (dynamic _) => app_localizations_bn.AccessibilityLocalizationsBn(),
      );
    case 'bo':
      return app_localizations_bo.loadLibrary().then(
        (dynamic _) => app_localizations_bo.AccessibilityLocalizationsBo(),
      );
    case 'bs':
      return app_localizations_bs.loadLibrary().then(
        (dynamic _) => app_localizations_bs.AccessibilityLocalizationsBs(),
      );
    case 'ca':
      return app_localizations_ca.loadLibrary().then(
        (dynamic _) => app_localizations_ca.AccessibilityLocalizationsCa(),
      );
    case 'cs':
      return app_localizations_cs.loadLibrary().then(
        (dynamic _) => app_localizations_cs.AccessibilityLocalizationsCs(),
      );
    case 'cy':
      return app_localizations_cy.loadLibrary().then(
        (dynamic _) => app_localizations_cy.AccessibilityLocalizationsCy(),
      );
    case 'da':
      return app_localizations_da.loadLibrary().then(
        (dynamic _) => app_localizations_da.AccessibilityLocalizationsDa(),
      );
    case 'de':
      return app_localizations_de.loadLibrary().then(
        (dynamic _) => app_localizations_de.AccessibilityLocalizationsDe(),
      );
    case 'el':
      return app_localizations_el.loadLibrary().then(
        (dynamic _) => app_localizations_el.AccessibilityLocalizationsEl(),
      );
    case 'en':
      return app_localizations_en.loadLibrary().then(
        (dynamic _) => app_localizations_en.AccessibilityLocalizationsEn(),
      );
    case 'es':
      return app_localizations_es.loadLibrary().then(
        (dynamic _) => app_localizations_es.AccessibilityLocalizationsEs(),
      );
    case 'et':
      return app_localizations_et.loadLibrary().then(
        (dynamic _) => app_localizations_et.AccessibilityLocalizationsEt(),
      );
    case 'eu':
      return app_localizations_eu.loadLibrary().then(
        (dynamic _) => app_localizations_eu.AccessibilityLocalizationsEu(),
      );
    case 'fa':
      return app_localizations_fa.loadLibrary().then(
        (dynamic _) => app_localizations_fa.AccessibilityLocalizationsFa(),
      );
    case 'fi':
      return app_localizations_fi.loadLibrary().then(
        (dynamic _) => app_localizations_fi.AccessibilityLocalizationsFi(),
      );
    case 'fil':
      return app_localizations_fil.loadLibrary().then(
        (dynamic _) => app_localizations_fil.AccessibilityLocalizationsFil(),
      );
    case 'fr':
      return app_localizations_fr.loadLibrary().then(
        (dynamic _) => app_localizations_fr.AccessibilityLocalizationsFr(),
      );
    case 'gl':
      return app_localizations_gl.loadLibrary().then(
        (dynamic _) => app_localizations_gl.AccessibilityLocalizationsGl(),
      );
    case 'gsw':
      return app_localizations_gsw.loadLibrary().then(
        (dynamic _) => app_localizations_gsw.AccessibilityLocalizationsGsw(),
      );
    case 'gu':
      return app_localizations_gu.loadLibrary().then(
        (dynamic _) => app_localizations_gu.AccessibilityLocalizationsGu(),
      );
    case 'he':
      return app_localizations_he.loadLibrary().then(
        (dynamic _) => app_localizations_he.AccessibilityLocalizationsHe(),
      );
    case 'hi':
      return app_localizations_hi.loadLibrary().then(
        (dynamic _) => app_localizations_hi.AccessibilityLocalizationsHi(),
      );
    case 'hr':
      return app_localizations_hr.loadLibrary().then(
        (dynamic _) => app_localizations_hr.AccessibilityLocalizationsHr(),
      );
    case 'hu':
      return app_localizations_hu.loadLibrary().then(
        (dynamic _) => app_localizations_hu.AccessibilityLocalizationsHu(),
      );
    case 'hy':
      return app_localizations_hy.loadLibrary().then(
        (dynamic _) => app_localizations_hy.AccessibilityLocalizationsHy(),
      );
    case 'id':
      return app_localizations_id.loadLibrary().then(
        (dynamic _) => app_localizations_id.AccessibilityLocalizationsId(),
      );
    case 'is':
      return app_localizations_is.loadLibrary().then(
        (dynamic _) => app_localizations_is.AccessibilityLocalizationsIs(),
      );
    case 'it':
      return app_localizations_it.loadLibrary().then(
        (dynamic _) => app_localizations_it.AccessibilityLocalizationsIt(),
      );
    case 'ja':
      return app_localizations_ja.loadLibrary().then(
        (dynamic _) => app_localizations_ja.AccessibilityLocalizationsJa(),
      );
    case 'ka':
      return app_localizations_ka.loadLibrary().then(
        (dynamic _) => app_localizations_ka.AccessibilityLocalizationsKa(),
      );
    case 'kk':
      return app_localizations_kk.loadLibrary().then(
        (dynamic _) => app_localizations_kk.AccessibilityLocalizationsKk(),
      );
    case 'km':
      return app_localizations_km.loadLibrary().then(
        (dynamic _) => app_localizations_km.AccessibilityLocalizationsKm(),
      );
    case 'kn':
      return app_localizations_kn.loadLibrary().then(
        (dynamic _) => app_localizations_kn.AccessibilityLocalizationsKn(),
      );
    case 'ko':
      return app_localizations_ko.loadLibrary().then(
        (dynamic _) => app_localizations_ko.AccessibilityLocalizationsKo(),
      );
    case 'ky':
      return app_localizations_ky.loadLibrary().then(
        (dynamic _) => app_localizations_ky.AccessibilityLocalizationsKy(),
      );
    case 'lo':
      return app_localizations_lo.loadLibrary().then(
        (dynamic _) => app_localizations_lo.AccessibilityLocalizationsLo(),
      );
    case 'lt':
      return app_localizations_lt.loadLibrary().then(
        (dynamic _) => app_localizations_lt.AccessibilityLocalizationsLt(),
      );
    case 'lv':
      return app_localizations_lv.loadLibrary().then(
        (dynamic _) => app_localizations_lv.AccessibilityLocalizationsLv(),
      );
    case 'mk':
      return app_localizations_mk.loadLibrary().then(
        (dynamic _) => app_localizations_mk.AccessibilityLocalizationsMk(),
      );
    case 'ml':
      return app_localizations_ml.loadLibrary().then(
        (dynamic _) => app_localizations_ml.AccessibilityLocalizationsMl(),
      );
    case 'mn':
      return app_localizations_mn.loadLibrary().then(
        (dynamic _) => app_localizations_mn.AccessibilityLocalizationsMn(),
      );
    case 'mr':
      return app_localizations_mr.loadLibrary().then(
        (dynamic _) => app_localizations_mr.AccessibilityLocalizationsMr(),
      );
    case 'ms':
      return app_localizations_ms.loadLibrary().then(
        (dynamic _) => app_localizations_ms.AccessibilityLocalizationsMs(),
      );
    case 'my':
      return app_localizations_my.loadLibrary().then(
        (dynamic _) => app_localizations_my.AccessibilityLocalizationsMy(),
      );
    case 'nb':
      return app_localizations_nb.loadLibrary().then(
        (dynamic _) => app_localizations_nb.AccessibilityLocalizationsNb(),
      );
    case 'ne':
      return app_localizations_ne.loadLibrary().then(
        (dynamic _) => app_localizations_ne.AccessibilityLocalizationsNe(),
      );
    case 'nl':
      return app_localizations_nl.loadLibrary().then(
        (dynamic _) => app_localizations_nl.AccessibilityLocalizationsNl(),
      );
    case 'no':
      return app_localizations_no.loadLibrary().then(
        (dynamic _) => app_localizations_no.AccessibilityLocalizationsNo(),
      );
    case 'or':
      return app_localizations_or.loadLibrary().then(
        (dynamic _) => app_localizations_or.AccessibilityLocalizationsOr(),
      );
    case 'pa':
      return app_localizations_pa.loadLibrary().then(
        (dynamic _) => app_localizations_pa.AccessibilityLocalizationsPa(),
      );
    case 'pl':
      return app_localizations_pl.loadLibrary().then(
        (dynamic _) => app_localizations_pl.AccessibilityLocalizationsPl(),
      );
    case 'ps':
      return app_localizations_ps.loadLibrary().then(
        (dynamic _) => app_localizations_ps.AccessibilityLocalizationsPs(),
      );
    case 'pt':
      return app_localizations_pt.loadLibrary().then(
        (dynamic _) => app_localizations_pt.AccessibilityLocalizationsPt(),
      );
    case 'ro':
      return app_localizations_ro.loadLibrary().then(
        (dynamic _) => app_localizations_ro.AccessibilityLocalizationsRo(),
      );
    case 'ru':
      return app_localizations_ru.loadLibrary().then(
        (dynamic _) => app_localizations_ru.AccessibilityLocalizationsRu(),
      );
    case 'si':
      return app_localizations_si.loadLibrary().then(
        (dynamic _) => app_localizations_si.AccessibilityLocalizationsSi(),
      );
    case 'sk':
      return app_localizations_sk.loadLibrary().then(
        (dynamic _) => app_localizations_sk.AccessibilityLocalizationsSk(),
      );
    case 'sl':
      return app_localizations_sl.loadLibrary().then(
        (dynamic _) => app_localizations_sl.AccessibilityLocalizationsSl(),
      );
    case 'sq':
      return app_localizations_sq.loadLibrary().then(
        (dynamic _) => app_localizations_sq.AccessibilityLocalizationsSq(),
      );
    case 'sr':
      return app_localizations_sr.loadLibrary().then(
        (dynamic _) => app_localizations_sr.AccessibilityLocalizationsSr(),
      );
    case 'sv':
      return app_localizations_sv.loadLibrary().then(
        (dynamic _) => app_localizations_sv.AccessibilityLocalizationsSv(),
      );
    case 'sw':
      return app_localizations_sw.loadLibrary().then(
        (dynamic _) => app_localizations_sw.AccessibilityLocalizationsSw(),
      );
    case 'ta':
      return app_localizations_ta.loadLibrary().then(
        (dynamic _) => app_localizations_ta.AccessibilityLocalizationsTa(),
      );
    case 'te':
      return app_localizations_te.loadLibrary().then(
        (dynamic _) => app_localizations_te.AccessibilityLocalizationsTe(),
      );
    case 'th':
      return app_localizations_th.loadLibrary().then(
        (dynamic _) => app_localizations_th.AccessibilityLocalizationsTh(),
      );
    case 'tl':
      return app_localizations_tl.loadLibrary().then(
        (dynamic _) => app_localizations_tl.AccessibilityLocalizationsTl(),
      );
    case 'tr':
      return app_localizations_tr.loadLibrary().then(
        (dynamic _) => app_localizations_tr.AccessibilityLocalizationsTr(),
      );
    case 'ug':
      return app_localizations_ug.loadLibrary().then(
        (dynamic _) => app_localizations_ug.AccessibilityLocalizationsUg(),
      );
    case 'uk':
      return app_localizations_uk.loadLibrary().then(
        (dynamic _) => app_localizations_uk.AccessibilityLocalizationsUk(),
      );
    case 'ur':
      return app_localizations_ur.loadLibrary().then(
        (dynamic _) => app_localizations_ur.AccessibilityLocalizationsUr(),
      );
    case 'uz':
      return app_localizations_uz.loadLibrary().then(
        (dynamic _) => app_localizations_uz.AccessibilityLocalizationsUz(),
      );
    case 'vi':
      return app_localizations_vi.loadLibrary().then(
        (dynamic _) => app_localizations_vi.AccessibilityLocalizationsVi(),
      );
    case 'zh':
      return app_localizations_zh.loadLibrary().then(
        (dynamic _) => app_localizations_zh.AccessibilityLocalizationsZh(),
      );
    case 'zu':
      return app_localizations_zu.loadLibrary().then(
        (dynamic _) => app_localizations_zu.AccessibilityLocalizationsZu(),
      );
  }

  throw FlutterError(
    'AccessibilityLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
