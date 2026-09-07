import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

import 'accessibility_localizations_af.dart'
    deferred as accessibility_localizations_af;
import 'accessibility_localizations_am.dart'
    deferred as accessibility_localizations_am;
import 'accessibility_localizations_ar.dart'
    deferred as accessibility_localizations_ar;
import 'accessibility_localizations_as.dart'
    deferred as accessibility_localizations_as;
import 'accessibility_localizations_az.dart'
    deferred as accessibility_localizations_az;
import 'accessibility_localizations_be.dart'
    deferred as accessibility_localizations_be;
import 'accessibility_localizations_bg.dart'
    deferred as accessibility_localizations_bg;
import 'accessibility_localizations_bn.dart'
    deferred as accessibility_localizations_bn;
import 'accessibility_localizations_bo.dart'
    deferred as accessibility_localizations_bo;
import 'accessibility_localizations_bs.dart'
    deferred as accessibility_localizations_bs;
import 'accessibility_localizations_ca.dart'
    deferred as accessibility_localizations_ca;
import 'accessibility_localizations_cs.dart'
    deferred as accessibility_localizations_cs;
import 'accessibility_localizations_cy.dart'
    deferred as accessibility_localizations_cy;
import 'accessibility_localizations_da.dart'
    deferred as accessibility_localizations_da;
import 'accessibility_localizations_de.dart'
    deferred as accessibility_localizations_de;
import 'accessibility_localizations_el.dart'
    deferred as accessibility_localizations_el;
import 'accessibility_localizations_en.dart'
    deferred as accessibility_localizations_en;
import 'accessibility_localizations_es.dart'
    deferred as accessibility_localizations_es;
import 'accessibility_localizations_et.dart'
    deferred as accessibility_localizations_et;
import 'accessibility_localizations_eu.dart'
    deferred as accessibility_localizations_eu;
import 'accessibility_localizations_fa.dart'
    deferred as accessibility_localizations_fa;
import 'accessibility_localizations_fi.dart'
    deferred as accessibility_localizations_fi;
import 'accessibility_localizations_fil.dart'
    deferred as accessibility_localizations_fil;
import 'accessibility_localizations_fr.dart'
    deferred as accessibility_localizations_fr;
import 'accessibility_localizations_gl.dart'
    deferred as accessibility_localizations_gl;
import 'accessibility_localizations_gsw.dart'
    deferred as accessibility_localizations_gsw;
import 'accessibility_localizations_gu.dart'
    deferred as accessibility_localizations_gu;
import 'accessibility_localizations_he.dart'
    deferred as accessibility_localizations_he;
import 'accessibility_localizations_hi.dart'
    deferred as accessibility_localizations_hi;
import 'accessibility_localizations_hr.dart'
    deferred as accessibility_localizations_hr;
import 'accessibility_localizations_hu.dart'
    deferred as accessibility_localizations_hu;
import 'accessibility_localizations_hy.dart'
    deferred as accessibility_localizations_hy;
import 'accessibility_localizations_id.dart'
    deferred as accessibility_localizations_id;
import 'accessibility_localizations_is.dart'
    deferred as accessibility_localizations_is;
import 'accessibility_localizations_it.dart'
    deferred as accessibility_localizations_it;
import 'accessibility_localizations_ja.dart'
    deferred as accessibility_localizations_ja;
import 'accessibility_localizations_ka.dart'
    deferred as accessibility_localizations_ka;
import 'accessibility_localizations_kk.dart'
    deferred as accessibility_localizations_kk;
import 'accessibility_localizations_km.dart'
    deferred as accessibility_localizations_km;
import 'accessibility_localizations_kn.dart'
    deferred as accessibility_localizations_kn;
import 'accessibility_localizations_ko.dart'
    deferred as accessibility_localizations_ko;
import 'accessibility_localizations_ky.dart'
    deferred as accessibility_localizations_ky;
import 'accessibility_localizations_lo.dart'
    deferred as accessibility_localizations_lo;
import 'accessibility_localizations_lt.dart'
    deferred as accessibility_localizations_lt;
import 'accessibility_localizations_lv.dart'
    deferred as accessibility_localizations_lv;
import 'accessibility_localizations_mk.dart'
    deferred as accessibility_localizations_mk;
import 'accessibility_localizations_ml.dart'
    deferred as accessibility_localizations_ml;
import 'accessibility_localizations_mn.dart'
    deferred as accessibility_localizations_mn;
import 'accessibility_localizations_mr.dart'
    deferred as accessibility_localizations_mr;
import 'accessibility_localizations_ms.dart'
    deferred as accessibility_localizations_ms;
import 'accessibility_localizations_my.dart'
    deferred as accessibility_localizations_my;
import 'accessibility_localizations_nb.dart'
    deferred as accessibility_localizations_nb;
import 'accessibility_localizations_ne.dart'
    deferred as accessibility_localizations_ne;
import 'accessibility_localizations_nl.dart'
    deferred as accessibility_localizations_nl;
import 'accessibility_localizations_no.dart'
    deferred as accessibility_localizations_no;
import 'accessibility_localizations_or.dart'
    deferred as accessibility_localizations_or;
import 'accessibility_localizations_pa.dart'
    deferred as accessibility_localizations_pa;
import 'accessibility_localizations_pl.dart'
    deferred as accessibility_localizations_pl;
import 'accessibility_localizations_ps.dart'
    deferred as accessibility_localizations_ps;
import 'accessibility_localizations_pt.dart'
    deferred as accessibility_localizations_pt;
import 'accessibility_localizations_ro.dart'
    deferred as accessibility_localizations_ro;
import 'accessibility_localizations_ru.dart'
    deferred as accessibility_localizations_ru;
import 'accessibility_localizations_si.dart'
    deferred as accessibility_localizations_si;
import 'accessibility_localizations_sk.dart'
    deferred as accessibility_localizations_sk;
import 'accessibility_localizations_sl.dart'
    deferred as accessibility_localizations_sl;
import 'accessibility_localizations_sq.dart'
    deferred as accessibility_localizations_sq;
import 'accessibility_localizations_sr.dart'
    deferred as accessibility_localizations_sr;
import 'accessibility_localizations_sv.dart'
    deferred as accessibility_localizations_sv;
import 'accessibility_localizations_sw.dart'
    deferred as accessibility_localizations_sw;
import 'accessibility_localizations_ta.dart'
    deferred as accessibility_localizations_ta;
import 'accessibility_localizations_te.dart'
    deferred as accessibility_localizations_te;
import 'accessibility_localizations_th.dart'
    deferred as accessibility_localizations_th;
import 'accessibility_localizations_tl.dart'
    deferred as accessibility_localizations_tl;
import 'accessibility_localizations_tr.dart'
    deferred as accessibility_localizations_tr;
import 'accessibility_localizations_ug.dart'
    deferred as accessibility_localizations_ug;
import 'accessibility_localizations_uk.dart'
    deferred as accessibility_localizations_uk;
import 'accessibility_localizations_ur.dart'
    deferred as accessibility_localizations_ur;
import 'accessibility_localizations_uz.dart'
    deferred as accessibility_localizations_uz;
import 'accessibility_localizations_vi.dart'
    deferred as accessibility_localizations_vi;
import 'accessibility_localizations_zh.dart'
    deferred as accessibility_localizations_zh;
import 'accessibility_localizations_zu.dart'
    deferred as accessibility_localizations_zu;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AccessibilityLocalizations
/// returned by `AccessibilityLocalizations.of(context)`.
///
/// Applications need to include `AccessibilityLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/accessibility_localizations.dart';
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
  String get accessibilitySettings;

  /// The label adjust background colors
  ///
  /// In en, this message translates to:
  /// **'Adjust background colors'**
  String get adjustBackgroundColors;

  /// The label adjust text colors
  ///
  /// In en, this message translates to:
  /// **'Adjust text colors'**
  String get adjustTextColors;

  /// The label align center
  ///
  /// In en, this message translates to:
  /// **'Align center'**
  String get alignCenter;

  /// The label align left
  ///
  /// In en, this message translates to:
  /// **'Align left'**
  String get alignLeft;

  /// The label align right
  ///
  /// In en, this message translates to:
  /// **'Align right'**
  String get alignRight;

  /// The title of the text alignment setting
  ///
  /// In en, this message translates to:
  /// **'Text alignment'**
  String get textAlignment;

  /// The label bold text
  ///
  /// In en, this message translates to:
  /// **'Bold text'**
  String get boldText;

  /// The label change bold text
  ///
  /// In en, this message translates to:
  /// **'Change bold text'**
  String get changeBoldText;

  /// The label change pages background color
  ///
  /// In en, this message translates to:
  /// **'Change the background color of the pages to: '**
  String get changePagesBackgroundColor;

  /// The label change text color
  ///
  /// In en, this message translates to:
  /// **'Change the color of the text to: '**
  String get changeTextColor;

  /// The label change text color shade
  ///
  /// In en, this message translates to:
  /// **'Change the shade of the color to: '**
  String get changeTextColorShade;

  /// The label color adjustment
  ///
  /// In en, this message translates to:
  /// **'Color adjustment'**
  String get colorAdjustment;

  /// A set of color profile names
  ///
  /// In en, this message translates to:
  /// **'{profile, select, other{Normal} lowSaturation{Low saturation} normal{Normal} highSaturation{High saturation} monochrome{Monochrome} highContrast{High contrast}}'**
  String colorProfile(String profile);

  /// The label color profile changed to
  ///
  /// In en, this message translates to:
  /// **'The current color profile is: '**
  String get colorProfileChangedTo;

  /// A set of color names
  ///
  /// In en, this message translates to:
  /// **'{color, select, other{Color not recognized} cF44336{Red} cE91E63{Pink} c9C27B0{Purple} c673AB7{Deep Purple} c3F51B5{Indigo} c2196F3{Blue} c03A9F4{Light Blue} c00BCD4{Cyan} c009688{Teal} c4CAF50{Green} c8BC34A{Light Green} cCDDC39{Lime} cFFEB3B{Yellow} cFFC107{Amber} cFF9800{Orange} cFF5722{Deep Orange} c795548{Brown} c9E9E9E{Grey} c607D8B{Blue Grey}}'**
  String color(String color);

  /// The label decrement word spacing
  ///
  /// In en, this message translates to:
  /// **'Decrement word spacing'**
  String get decrementWordSpacing;

  /// The label decrement letter spacing
  ///
  /// In en, this message translates to:
  /// **'Decrement letter spacing'**
  String get decrementLetterSpacing;

  /// The label decrement line height
  ///
  /// In en, this message translates to:
  /// **'Decrement line height'**
  String get decrementLineHeight;

  /// The label decrement text scale factor
  ///
  /// In en, this message translates to:
  /// **'Decrement text scale factor'**
  String get decrementTextScaleFactor;

  /// The label effects
  ///
  /// In en, this message translates to:
  /// **'Effects'**
  String get effects;

  /// The label expand text
  ///
  /// In en, this message translates to:
  /// **'Expand text'**
  String get expandText;

  /// The label font size
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get fontSize;

  /// The label increase or decrease word spacing
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease word spacing'**
  String get increaseOrDecreaseWordSpacing;

  /// The label increase or decrease letter spacing
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease letter spacing'**
  String get increaseOrDecreaseLetterSpacing;

  /// The label increase or decrease line height
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease line height'**
  String get increaseOrDecreaseLineHeight;

  /// The label increase or decrease text size
  ///
  /// In en, this message translates to:
  /// **'Increase or decrease text size'**
  String get increaseOrDecreaseTextSize;

  /// The label increment word spacing
  ///
  /// In en, this message translates to:
  /// **'Increment word spacing'**
  String get incrementWordSpacing;

  /// The label increment letter spacing
  ///
  /// In en, this message translates to:
  /// **'Increment letter spacing'**
  String get incrementLetterSpacing;

  /// The label increment line height
  ///
  /// In en, this message translates to:
  /// **'Increment line height'**
  String get incrementLineHeight;

  /// The label increment text scale factor
  ///
  /// In en, this message translates to:
  /// **'Increment text scale factor'**
  String get incrementTextScaleFactor;

  /// The label less info
  ///
  /// In en, this message translates to:
  /// **'Hide info'**
  String get lessInfo;

  /// The label letter spacing
  ///
  /// In en, this message translates to:
  /// **'Letter spacing'**
  String get letterSpacing;

  /// The label line height
  ///
  /// In en, this message translates to:
  /// **'Line height'**
  String get lineHeight;

  /// The label more info
  ///
  /// In en, this message translates to:
  /// **'Show info'**
  String get moreInfo;

  /// The label read less
  ///
  /// In en, this message translates to:
  /// **'Read less'**
  String get readLess;

  /// The label read more
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMore;

  /// The label reduce effects
  ///
  /// In en, this message translates to:
  /// **'Reduce effects to screen'**
  String get reduceEffects;

  /// The label reduce text
  ///
  /// In en, this message translates to:
  /// **'Reduce text'**
  String get reduceText;

  /// The label restore settings
  ///
  /// In en, this message translates to:
  /// **'Restore settings'**
  String get restoreSettings;

  /// The label restore main color
  ///
  /// In en, this message translates to:
  /// **'Restore main color'**
  String get restoreMainColor;

  /// The label return to main colors
  ///
  /// In en, this message translates to:
  /// **'Return to main colors'**
  String get returnToMainColors;

  /// The label settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// The label size and text display
  ///
  /// In en, this message translates to:
  /// **'Size and text display'**
  String get sizeAndTextDisplay;

  /// The label slider word spacing
  ///
  /// In en, this message translates to:
  /// **'Slider Word spacing'**
  String get sliderWordSpacing;

  /// The label slider letter spacing
  ///
  /// In en, this message translates to:
  /// **'Slider Letter spacing'**
  String get sliderLetterSpacing;

  /// The label slider line height
  ///
  /// In en, this message translates to:
  /// **'Slider Line height'**
  String get sliderLineHeight;

  /// The label theme mode
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeMode;

  /// A set of theme profile names
  ///
  /// In en, this message translates to:
  /// **'{themeProfileName, select, other{Theme profile not recognized} seizureSafe{Seizure safe} visionImpaired{Vision impaired} adhdFriendly{ADHD friendly} none{Default profile}}'**
  String themeProfile(String themeProfileName);

  /// The label Seizure safe profile
  ///
  /// In en, this message translates to:
  /// **'Seizure safe profile'**
  String get themeProfileSeizureSafeTitle;

  /// The description of the Seizure safe profile
  ///
  /// In en, this message translates to:
  /// **'Remove reflections and reduce color'**
  String get themeProfileSeizureSafeSubtitle;

  /// The description of the Seizure safe profile
  ///
  /// In en, this message translates to:
  /// **'This profile enables users who have epilepsy and are at risk of seizures to browse safely by eliminating the risk of seizures that result from flashing animations and risky color combinations.'**
  String get themeProfileSeizureSafeDescription;

  /// The label Vision-impaired profile
  ///
  /// In en, this message translates to:
  /// **'Vision-impaired profile'**
  String get themeProfileVisionImpairedTitle;

  /// The description of the Vision-impaired profile
  ///
  /// In en, this message translates to:
  /// **'Improve visibility of application'**
  String get themeProfileVisionImpairedSubtitle;

  /// The description of the Vision-impaired profile
  ///
  /// In en, this message translates to:
  /// **'This profile adapts the application to be accessible to most visual impairments, such as vision impairment, tunnel vision, cataracts, glaucoma and more.'**
  String get themeProfileVisionImpairedDescription;

  /// The label ADHD-friendly profile
  ///
  /// In en, this message translates to:
  /// **'ADHD-friendly profile'**
  String get themeProfileAdhdFriendlyTitle;

  /// The description of the ADHD-friendly profile
  ///
  /// In en, this message translates to:
  /// **'More concentration and less distractions'**
  String get themeProfileAdhdFriendlySubtitle;

  /// The description of the ADHD-friendly profile
  ///
  /// In en, this message translates to:
  /// **'This profile significantly reduces distractions, to help people with ADHD and neurodevelopmental disorders navigate, read, and focus on the essential elements of the application more easily.'**
  String get themeProfileAdhdFriendlyDescription;

  /// The label The settings have been reset
  ///
  /// In en, this message translates to:
  /// **'The settings have been reset.'**
  String get theSettingsHaveBeenReset;

  /// The label Toggle dark mode
  ///
  /// In en, this message translates to:
  /// **'Toggle dark mode'**
  String get toggleDarkMode;

  /// The label toggle effects mode
  ///
  /// In en, this message translates to:
  /// **'Toggle effects mode'**
  String get toggleEffectsMode;

  /// The label toggle font weight
  ///
  /// In en, this message translates to:
  /// **'Toggle font weight'**
  String get toggleFontWeight;

  /// The label toggle theme profile
  ///
  /// In en, this message translates to:
  /// **'Toggle theme profile'**
  String get toggleThemeProfile;

  /// The label word spacing
  ///
  /// In en, this message translates to:
  /// **'Word spacing'**
  String get wordSpacing;

  /// The label accessible font
  ///
  /// In en, this message translates to:
  /// **'Accessible font'**
  String get accessibleFont;

  /// The subtitle for the accessible font setting
  ///
  /// In en, this message translates to:
  /// **'Use an accessible font for better readability'**
  String get accessibleFontSubtitle;

  /// The label when accessible font is enabled
  ///
  /// In en, this message translates to:
  /// **'Accessible font enabled'**
  String get accessibleFontEnabled;

  /// The label when accessible font is disabled
  ///
  /// In en, this message translates to:
  /// **'Accessible font disabled'**
  String get accessibleFontDisabled;

  /// The label to toggle accessible font
  ///
  /// In en, this message translates to:
  /// **'Toggle accessible font'**
  String get toggleAccessibleFont;

  /// Shown in the settings panel while the stored settings are being loaded
  ///
  /// In en, this message translates to:
  /// **'Loading the accessibility settings…'**
  String get settingsLoading;

  /// Shown in the settings panel when loading the stored settings failed; a retry button follows
  ///
  /// In en, this message translates to:
  /// **'The accessibility settings could not be loaded.'**
  String get settingsLoadFailed;

  /// Label of the button that loads the stored settings again
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;
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
      return accessibility_localizations_af.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_af.AccessibilityLocalizationsAf(),
      );
    case 'am':
      return accessibility_localizations_am.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_am.AccessibilityLocalizationsAm(),
      );
    case 'ar':
      return accessibility_localizations_ar.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ar.AccessibilityLocalizationsAr(),
      );
    case 'as':
      return accessibility_localizations_as.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_as.AccessibilityLocalizationsAs(),
      );
    case 'az':
      return accessibility_localizations_az.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_az.AccessibilityLocalizationsAz(),
      );
    case 'be':
      return accessibility_localizations_be.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_be.AccessibilityLocalizationsBe(),
      );
    case 'bg':
      return accessibility_localizations_bg.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_bg.AccessibilityLocalizationsBg(),
      );
    case 'bn':
      return accessibility_localizations_bn.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_bn.AccessibilityLocalizationsBn(),
      );
    case 'bo':
      return accessibility_localizations_bo.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_bo.AccessibilityLocalizationsBo(),
      );
    case 'bs':
      return accessibility_localizations_bs.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_bs.AccessibilityLocalizationsBs(),
      );
    case 'ca':
      return accessibility_localizations_ca.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ca.AccessibilityLocalizationsCa(),
      );
    case 'cs':
      return accessibility_localizations_cs.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_cs.AccessibilityLocalizationsCs(),
      );
    case 'cy':
      return accessibility_localizations_cy.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_cy.AccessibilityLocalizationsCy(),
      );
    case 'da':
      return accessibility_localizations_da.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_da.AccessibilityLocalizationsDa(),
      );
    case 'de':
      return accessibility_localizations_de.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_de.AccessibilityLocalizationsDe(),
      );
    case 'el':
      return accessibility_localizations_el.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_el.AccessibilityLocalizationsEl(),
      );
    case 'en':
      return accessibility_localizations_en.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_en.AccessibilityLocalizationsEn(),
      );
    case 'es':
      return accessibility_localizations_es.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_es.AccessibilityLocalizationsEs(),
      );
    case 'et':
      return accessibility_localizations_et.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_et.AccessibilityLocalizationsEt(),
      );
    case 'eu':
      return accessibility_localizations_eu.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_eu.AccessibilityLocalizationsEu(),
      );
    case 'fa':
      return accessibility_localizations_fa.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_fa.AccessibilityLocalizationsFa(),
      );
    case 'fi':
      return accessibility_localizations_fi.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_fi.AccessibilityLocalizationsFi(),
      );
    case 'fil':
      return accessibility_localizations_fil.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_fil.AccessibilityLocalizationsFil(),
      );
    case 'fr':
      return accessibility_localizations_fr.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_fr.AccessibilityLocalizationsFr(),
      );
    case 'gl':
      return accessibility_localizations_gl.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_gl.AccessibilityLocalizationsGl(),
      );
    case 'gsw':
      return accessibility_localizations_gsw.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_gsw.AccessibilityLocalizationsGsw(),
      );
    case 'gu':
      return accessibility_localizations_gu.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_gu.AccessibilityLocalizationsGu(),
      );
    case 'he':
      return accessibility_localizations_he.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_he.AccessibilityLocalizationsHe(),
      );
    case 'hi':
      return accessibility_localizations_hi.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_hi.AccessibilityLocalizationsHi(),
      );
    case 'hr':
      return accessibility_localizations_hr.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_hr.AccessibilityLocalizationsHr(),
      );
    case 'hu':
      return accessibility_localizations_hu.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_hu.AccessibilityLocalizationsHu(),
      );
    case 'hy':
      return accessibility_localizations_hy.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_hy.AccessibilityLocalizationsHy(),
      );
    case 'id':
      return accessibility_localizations_id.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_id.AccessibilityLocalizationsId(),
      );
    case 'is':
      return accessibility_localizations_is.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_is.AccessibilityLocalizationsIs(),
      );
    case 'it':
      return accessibility_localizations_it.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_it.AccessibilityLocalizationsIt(),
      );
    case 'ja':
      return accessibility_localizations_ja.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ja.AccessibilityLocalizationsJa(),
      );
    case 'ka':
      return accessibility_localizations_ka.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ka.AccessibilityLocalizationsKa(),
      );
    case 'kk':
      return accessibility_localizations_kk.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_kk.AccessibilityLocalizationsKk(),
      );
    case 'km':
      return accessibility_localizations_km.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_km.AccessibilityLocalizationsKm(),
      );
    case 'kn':
      return accessibility_localizations_kn.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_kn.AccessibilityLocalizationsKn(),
      );
    case 'ko':
      return accessibility_localizations_ko.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ko.AccessibilityLocalizationsKo(),
      );
    case 'ky':
      return accessibility_localizations_ky.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ky.AccessibilityLocalizationsKy(),
      );
    case 'lo':
      return accessibility_localizations_lo.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_lo.AccessibilityLocalizationsLo(),
      );
    case 'lt':
      return accessibility_localizations_lt.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_lt.AccessibilityLocalizationsLt(),
      );
    case 'lv':
      return accessibility_localizations_lv.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_lv.AccessibilityLocalizationsLv(),
      );
    case 'mk':
      return accessibility_localizations_mk.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_mk.AccessibilityLocalizationsMk(),
      );
    case 'ml':
      return accessibility_localizations_ml.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ml.AccessibilityLocalizationsMl(),
      );
    case 'mn':
      return accessibility_localizations_mn.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_mn.AccessibilityLocalizationsMn(),
      );
    case 'mr':
      return accessibility_localizations_mr.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_mr.AccessibilityLocalizationsMr(),
      );
    case 'ms':
      return accessibility_localizations_ms.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ms.AccessibilityLocalizationsMs(),
      );
    case 'my':
      return accessibility_localizations_my.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_my.AccessibilityLocalizationsMy(),
      );
    case 'nb':
      return accessibility_localizations_nb.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_nb.AccessibilityLocalizationsNb(),
      );
    case 'ne':
      return accessibility_localizations_ne.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ne.AccessibilityLocalizationsNe(),
      );
    case 'nl':
      return accessibility_localizations_nl.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_nl.AccessibilityLocalizationsNl(),
      );
    case 'no':
      return accessibility_localizations_no.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_no.AccessibilityLocalizationsNo(),
      );
    case 'or':
      return accessibility_localizations_or.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_or.AccessibilityLocalizationsOr(),
      );
    case 'pa':
      return accessibility_localizations_pa.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_pa.AccessibilityLocalizationsPa(),
      );
    case 'pl':
      return accessibility_localizations_pl.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_pl.AccessibilityLocalizationsPl(),
      );
    case 'ps':
      return accessibility_localizations_ps.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ps.AccessibilityLocalizationsPs(),
      );
    case 'pt':
      return accessibility_localizations_pt.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_pt.AccessibilityLocalizationsPt(),
      );
    case 'ro':
      return accessibility_localizations_ro.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ro.AccessibilityLocalizationsRo(),
      );
    case 'ru':
      return accessibility_localizations_ru.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ru.AccessibilityLocalizationsRu(),
      );
    case 'si':
      return accessibility_localizations_si.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_si.AccessibilityLocalizationsSi(),
      );
    case 'sk':
      return accessibility_localizations_sk.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_sk.AccessibilityLocalizationsSk(),
      );
    case 'sl':
      return accessibility_localizations_sl.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_sl.AccessibilityLocalizationsSl(),
      );
    case 'sq':
      return accessibility_localizations_sq.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_sq.AccessibilityLocalizationsSq(),
      );
    case 'sr':
      return accessibility_localizations_sr.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_sr.AccessibilityLocalizationsSr(),
      );
    case 'sv':
      return accessibility_localizations_sv.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_sv.AccessibilityLocalizationsSv(),
      );
    case 'sw':
      return accessibility_localizations_sw.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_sw.AccessibilityLocalizationsSw(),
      );
    case 'ta':
      return accessibility_localizations_ta.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ta.AccessibilityLocalizationsTa(),
      );
    case 'te':
      return accessibility_localizations_te.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_te.AccessibilityLocalizationsTe(),
      );
    case 'th':
      return accessibility_localizations_th.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_th.AccessibilityLocalizationsTh(),
      );
    case 'tl':
      return accessibility_localizations_tl.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_tl.AccessibilityLocalizationsTl(),
      );
    case 'tr':
      return accessibility_localizations_tr.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_tr.AccessibilityLocalizationsTr(),
      );
    case 'ug':
      return accessibility_localizations_ug.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ug.AccessibilityLocalizationsUg(),
      );
    case 'uk':
      return accessibility_localizations_uk.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_uk.AccessibilityLocalizationsUk(),
      );
    case 'ur':
      return accessibility_localizations_ur.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_ur.AccessibilityLocalizationsUr(),
      );
    case 'uz':
      return accessibility_localizations_uz.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_uz.AccessibilityLocalizationsUz(),
      );
    case 'vi':
      return accessibility_localizations_vi.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_vi.AccessibilityLocalizationsVi(),
      );
    case 'zh':
      return accessibility_localizations_zh.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_zh.AccessibilityLocalizationsZh(),
      );
    case 'zu':
      return accessibility_localizations_zu.loadLibrary().then(
        (dynamic _) =>
            accessibility_localizations_zu.AccessibilityLocalizationsZu(),
      );
  }

  throw FlutterError(
    'AccessibilityLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
