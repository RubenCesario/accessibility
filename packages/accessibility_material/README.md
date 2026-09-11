# accessibility_material

The Material layer of the accessibility package family, built on
`material_ui`. It re-exports `flutter_accessibility` and
`AccessibilityLocalizations`, so this is the only import a Material app
needs.

## Installation

```bash
flutter pub add accessibility_material
```

## Usage

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => AccessibleThemeBuilder(
    builder: (context, themes) => MaterialApp(
      theme: themes.light,
      darkTheme: themes.dark,
      highContrastTheme: themes.highContrastLight,
      highContrastDarkTheme: themes.highContrastDark,
      themeMode: themes.mode,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        AccessibilityLocalizations.delegate,
      ],
      supportedLocales: AccessibilityLocalizations.supportedLocales,
      home: const Scaffold(body: AccessibilitySettingsPanel()),
    ),
  );
}
```

## What you get

- `AccessibleThemeBuilder`: the four themes (`light`, `dark`,
  `highContrastLight`, `highContrastDark`) and the `ThemeMode` for your
  `MaterialApp`, rebuilt whenever the settings change. The high-contrast
  variants are picked by `MaterialApp` when the OS asks for more contrast.
- `AccessibleThemeData.from`: the transformation itself, for apps that
  build their `ThemeData` elsewhere.
- `AccessiblePageTransitionsTheme`: installed by the theme; route
  transitions are skipped when effects are off or the OS reduces motion.
- `AccessibilitySettingsPanel`: the settings screen in the `standard` (list)
  or `cards` style, configured with `AccessibilitySettingsConfiguration`.
  Register fonts through `AccessibilitySettingsViewModel(accessibleFonts:)`
  (for example `AndikaFont.font` from `accessibility_font_andika`) to offer
  the accessible font setting.
- `RestoreSettingsButton` and `ReadMoreText`, the panel's building blocks,
  for custom screens.

Known limitation: `AccessibleThemeData.from` applies a user-chosen text
colour to every component foreground, but the background colour override
reaches only the scaffold and dialogs, so a text colour that clashes with
another surface of the theme (a card, an app bar, ...) is the user's own
choice to revert; see the guideline tests in `examples/material` for the
scenario this excludes.

## Localizations

The panel's strings come from `accessibility_localizations`; add
`AccessibilityLocalizations.delegate` next to
`GlobalMaterialLocalizations.delegates` (from `material_ui`) as in the
example above.

## Screenshots

See the live demo: <https://rubencesario.github.io/accessibility/material/>

## See also

- The family: <https://github.com/RubenCesario/accessibility#readme>
- Live demo: <https://rubencesario.github.io/accessibility/material/>
- Migrating from 1.x: <https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md>
