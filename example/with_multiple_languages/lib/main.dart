import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart' show SemanticsBinding;
import 'package:go_router/go_router.dart';
import 'package:with_multiple_languages/constants/data/country.dart';
import 'package:with_multiple_languages/constants/theme/color_schemes.dart';
import 'package:with_multiple_languages/view/pages/home_page.dart';
import 'package:with_multiple_languages/view/providers/locale_inherited.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferencesWithCache = await createSharedPreferencesWithCache();
  final sharedPreferencesService = SharedPreferencesServiceWithCache(
    sharedPreferencesWithCache,
  );
  // or else if you use legacy SharedPreferences
  // const sharedPreferencesService = SharedPreferencesServiceLegacy();
  final accessibilitySettings =
      await sharedPreferencesService.getLocalStorageAccessibilitySettings();
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: kLightColorScheme, // your light color scheme
    darkColorScheme: kDarkColorScheme, // your dark color scheme
    highContrastLightColorScheme:
        kHighConstrastLightColorScheme, // your high contrast light color scheme
    highContrastDarkColorScheme:
        kHighConstrastDarkColorScheme, // your high contrast dark color scheme
    textTheme: kTextThemeMergableEnglishLike2021, // your text theme
  ); // or use AppThemes() default constructor for finer control
  runApp(
    AccessibilityInitializer(
      sharedPreferencesService: sharedPreferencesService,
      accessibilitySettingsCollection: accessibilitySettings,
      child: LocaleInherited(child: MyApp(appThemes: appThemes)),
    ),
  );
  SemanticsBinding.instance.ensureSemantics();
}

/// {@template MyApp}
/// A widget that is the root of your application.
/// {@endtemplate}
class MyApp extends StatelessWidget {
  /// The configuration of the app themes.
  final AppThemes appThemes;

  /// {@macro MyApp}
  const MyApp({required this.appThemes, super.key});

  static final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => const HomePage(title: 'Accessibility Page'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Locale?>(
    valueListenable: LocaleInherited.of(context).locale,
    builder:
        (context, selectedLocale, child) => AccessibleMaterialApp.router(
          onGenerateTitle:
              (context) => AccessibilityLocalizations.of(context).accessibility,
          routerConfig: _router,
          theme: appThemes.lightTheme,
          highContrastTheme: appThemes.lightHighContrastTheme,
          darkTheme: appThemes.darkTheme,
          highContrastDarkTheme: appThemes.darkHighContrastTheme,
          debugShowCheckedModeBanner: false,
          locale: selectedLocale,
          localeListResolutionCallback: (deviceLocales, supportedLocales) {
            final candidateLocale =
                selectedLocale ?? deviceLocales?.firstOrNull;
            if (candidateLocale == null) {
              return defaultLocale;
            }
            final supportedLocaleLength = supportedLocales.length;
            for (var i = 0; i < supportedLocaleLength; i++) {
              final supportedLocale = supportedLocales.elementAt(i);
              if (supportedLocale.languageCode ==
                  candidateLocale.languageCode) {
                return candidateLocale;
              }
            }
            return defaultLocale;
          },
        ),
  );
}
