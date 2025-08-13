import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart' show SemanticsBinding;

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
        debugShowCheckedModeBanner: false,
        onGenerateTitle:
            (context) => AccessibilityLocalizations.of(context).accessibility,
        // mandatory to make localizations work
        localizationsDelegates:
            AccessibilityLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
        // mandatory to make theme updates work
        themeMode: themeMode,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const HomePage(),
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
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        children: const [
          Text('First text'),
          _CustomThemeModeButton(),
          Text('Second text'),
          _CustomIncrementTextScaleFactorButton(),
          Text('Third text'),
          _CustomChangeFontWeightButton(),
          Text('Fourth text'),
          _CustomChangePagesBackgroundColorButton(),
          Text('Fifth text'),
          _CustomChangeTextColorButton(),
          Text('Sixth text'),
          _CustomRestoreSettingsButton(),
        ],
      ),
    ),
  );
}

class _CustomThemeModeButton extends StatelessWidget {
  const _CustomThemeModeButton();

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
    valueListenable: AccessibilitySettingsInherited.of(context).themeMode,
    builder:
        (_, themeMode, __) => ElevatedButton.icon(
          icon: Icon(
            themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          ),
          label: Text(
            themeMode == ThemeMode.dark
                ? 'Toggle light mode'
                : 'Toggle dark mode',
          ),
          onPressed: () async {
            final newThemeMode =
                themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            final settingsInherited = AccessibilitySettingsInherited.of(
              context,
            );
            settingsInherited.themeMode.value = newThemeMode;
            // You can store this setting using the SharedPreferences instance
            // the package provides, or your own data storage.
            await SharedPreferencesInherited.of(
              context,
            ).storeThemeModeSetting(newSetting: newThemeMode.name);
          },
        ),
  );
}

class _CustomRestoreSettingsButton extends StatelessWidget {
  const _CustomRestoreSettingsButton();

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.restore),
    label: const Text('Restore default settings'),
    onPressed: () async {
      AccessibilitySettingsInherited.of(context).restoreDefaultSettings();
      // If you use SharedPreferencesInherited to store the settings,
      // you can restore the default settings using the SharedPreferences
      // instance the package provides, or your own data storage.
      await SharedPreferencesInherited.of(context).restoreDefaultSettings();
    },
  );
}

class _CustomIncrementTextScaleFactorButton extends StatelessWidget {
  const _CustomIncrementTextScaleFactorButton();

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_size),
    label: const Text('Increment font size'),
    onPressed: () async {
      const newScaleFactor = 1.5;
      AccessibilitySettingsInherited.of(
        context,
      ).updateScaleFactorSetting(newScaleFactor);
      await SharedPreferencesInherited.of(
        context,
      ).storeTextScaleFactorSetting(newSetting: newScaleFactor);
    },
  );
}

class _CustomChangeFontWeightButton extends StatelessWidget {
  const _CustomChangeFontWeightButton();

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
    valueListenable: AccessibilitySettingsInherited.of(context).textSettings,
    builder:
        (_, textSettings, __) => ElevatedButton.icon(
          icon: Icon(
            textSettings.isFontWeightBold
                ? Icons.format_bold
                : Icons.format_bold_outlined,
          ),
          label: const Text('Change font weight'),
          onPressed: () async {
            final newFontWeight = !textSettings.isFontWeightBold;
            AccessibilitySettingsInherited.of(
              context,
            ).updateFontWeightSetting(newSetting: newFontWeight);
            await SharedPreferencesInherited.of(
              context,
            ).storeTextFontWeightSetting(newSetting: newFontWeight);
          },
        ),
  );
}

class _CustomChangePagesBackgroundColorButton extends StatelessWidget {
  const _CustomChangePagesBackgroundColorButton();

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_color_fill),
    label: Text(
      'Change pages background color',
      style: context.textTheme.titleMedium,
    ),
    onPressed: () async {
      const newColor = Colors.orange;
      AccessibilitySettingsInherited.of(
        context,
      ).updatePagesBackgroundColorSettings(newColor);
      await SharedPreferencesInherited.of(
        context,
      ).storePagesBackgroundColorSetting(newSetting: newColor.toARGB32());
    },
  );
}

class _CustomChangeTextColorButton extends StatelessWidget {
  const _CustomChangeTextColorButton();

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_color_text),
    label: Text('Change text color', style: context.textTheme.titleMedium),
    onPressed: () async {
      const newColor = Colors.red;
      AccessibilitySettingsInherited.of(
        context,
      ).updateTextColorSettings(newColor);
      await SharedPreferencesInherited.of(
        context,
      ).storeTextColorSetting(newSetting: newColor.toARGB32());
    },
  );
}
