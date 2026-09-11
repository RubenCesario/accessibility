import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:accessibility_material/accessibility_material.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:multiple_languages_example/locale/country.dart';
import 'package:multiple_languages_example/locale/locale_scope.dart';
import 'package:multiple_languages_example/pages/home_page.dart';
import 'package:multiple_languages_example/pages/settings_page.dart';
import 'package:multiple_languages_example/theme/color_schemes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(
        repository: repository,
        accessibleFonts: const [AndikaFont.font],
      ),
      child: const ExampleApp(),
    ),
  );
}

/// The routes of the app.
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        for (final variant in SettingsVariant.values)
          GoRoute(
            path: 'settings/${variant.name}',
            builder: (context, state) => SettingsPage(variant: variant),
          ),
      ],
    ),
  ],
);

/// The example app: the Material app with a language switcher.
final class ExampleApp extends StatefulWidget {
  /// Creates the app.
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final ValueNotifier<Locale?> _locale = ValueNotifier(null);

  @override
  void dispose() {
    _locale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LocaleScope(
    notifier: _locale,
    child: ValueListenableBuilder<Locale?>(
      valueListenable: _locale,
      builder: (context, locale, _) => AccessibleThemeBuilder(
        theme: ThemeData(colorScheme: kLightColorScheme),
        darkTheme: ThemeData(colorScheme: kDarkColorScheme),
        builder: (context, themes) => MaterialApp.router(
          title: 'Accessible app in 80+ languages',
          theme: themes.light,
          darkTheme: themes.dark,
          highContrastTheme: themes.highContrastLight,
          highContrastDarkTheme: themes.highContrastDark,
          themeMode: themes.mode,
          locale: locale,
          localeListResolutionCallback: (locales, supported) {
            for (final candidate in locales ?? const <Locale>[]) {
              if (supported.contains(candidate)) {
                return candidate;
              }
              final byLanguage = supported.where(
                (l) => l.languageCode == candidate.languageCode,
              );
              if (byLanguage.isNotEmpty) {
                return byLanguage.first;
              }
            }
            return defaultLocale;
          },
          localizationsDelegates: const [
            ...GlobalMaterialLocalizations.delegates,
            AccessibilityLocalizations.delegate,
          ],
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    ),
  );
}
