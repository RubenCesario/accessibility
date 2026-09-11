import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:accessibility_material/accessibility_material.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:material_example/pages/home_page.dart';
import 'package:material_example/pages/settings_page.dart';
import 'package:material_example/theme/color_schemes.dart';
import 'package:material_ui/material_ui.dart';

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

/// The example app: a `MaterialApp.router` whose themes follow the
/// accessibility settings.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => AccessibleThemeBuilder(
    theme: ThemeData(colorScheme: kLightColorScheme),
    darkTheme: ThemeData(colorScheme: kDarkColorScheme),
    builder: (context, themes) => MaterialApp.router(
      title: 'Accessible Material app',
      theme: themes.light,
      darkTheme: themes.dark,
      highContrastTheme: AccessibleThemeData.from(
        themeData: ThemeData(colorScheme: kHighContrastLightColorScheme),
        settings: AccessibilityScope.settingsOf(context),
        font: AccessibilityScope.of(context).activeFont,
      ),
      highContrastDarkTheme: AccessibleThemeData.from(
        themeData: ThemeData(colorScheme: kHighContrastDarkColorScheme),
        settings: AccessibilityScope.settingsOf(context),
        font: AccessibilityScope.of(context).activeFont,
      ),
      themeMode: themes.mode,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        AccessibilityLocalizations.delegate,
      ],
      supportedLocales: AccessibilityLocalizations.supportedLocales,
      routerConfig: router,
    ),
  );
}
