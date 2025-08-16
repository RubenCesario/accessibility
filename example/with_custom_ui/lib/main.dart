import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart' show SemanticsBinding;

import 'package:with_custom_ui/widgets/showcase/navigation/showcase_navigation_bar.dart';
import 'package:with_custom_ui/widgets/showcase/tabs/components_tab.dart';
import 'package:with_custom_ui/widgets/showcase/tabs/controls_tab.dart';
import 'package:with_custom_ui/widgets/showcase/tabs/navigation_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferencesWithCache = await createSharedPreferencesWithCache();
  final sharedPreferencesService = SharedPreferencesServiceWithCache(
    sharedPreferencesWithCache,
  );
  final accessibilitySettings =
      await sharedPreferencesService.getLocalStorageAccessibilitySettings();
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
  runApp(
    AccessibilityInitializer(
      sharedPreferencesService: sharedPreferencesService,
      accessibilitySettingsCollection: accessibilitySettings,
      child: MyApp(appThemes: appThemes),
    ),
  );
  SemanticsBinding.instance.ensureSemantics();
}

/// {@template MyApp}
/// A widget that is the root of your application.
/// {@endtemplate}
class MyApp extends StatefulWidget {
  /// The configuration of the app themes.
  final AppThemes appThemes;

  /// {@macro MyApp}
  const MyApp({required this.appThemes, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AccessibilitySettingsInherited _settingsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
  }

  @override
  void dispose() {
    _settingsInherited.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ThemeSettingsBuilder(
    builder: (
      context,
      themeMode,
      colorSettings,
      textSettings, {
      required effectsEnabled,
    }) {
      // This is the default behavior inside AccessibleMaterialApp
      // to create an AccessibleThemeData. It is used here to show
      // you how you can use directly MaterialApp, CupertinoApp or
      // WidgetsApp instead of a premade AccessibleMaterialApp.
      final lightTheme = AccessibleThemeData.from(
        themeData: widget.appThemes.lightTheme,
        settings: textSettings,
        colorSettings: colorSettings,
        effectsEnabled: effectsEnabled,
      );
      final darkTheme = AccessibleThemeData.from(
        themeData: widget.appThemes.darkTheme,
        settings: textSettings,
        colorSettings: colorSettings,
        effectsEnabled: effectsEnabled,
      );
      return MaterialApp(
        home: const HomePage(),
        onGenerateTitle:
            (context) => AccessibilityLocalizations.of(context).accessibility,
        // below are mandatory fields to make package works
        localizationsDelegates:
            AccessibilityLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
        themeMode: themeMode,
        theme: lightTheme,
        darkTheme: darkTheme,
      );
    },
  );
}

/// {@template HomePage}
/// A widget that is the home page of your application.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro HomePage}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Showcase'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Controls'),
            Tab(text: 'Components'),
            Tab(text: 'Navigation'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [ControlsTab(), ComponentsTab(), NavigationTab()],
      ),
      bottomNavigationBar: const ShowcaseNavigationBar(),
    ),
  );
}
