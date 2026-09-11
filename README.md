<p align="center">
<img src="https://raw.githubusercontent.com/RubenCesario/accessibility/master/screenshots/logo.webp" height="100" alt="Flutter Accessibility Package" />
</p>

<p align="center">

[![build](https://github.com/RubenCesario/accessibility/actions/workflows/build.yml/badge.svg)](https://github.com/RubenCesario/accessibility/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/RubenCesario/accessibility/graph/badge.svg?token=45AFWZ3YYS)](https://codecov.io/gh/RubenCesario/accessibility)
[![CodeFactor](https://www.codefactor.io/repository/github/rubencesario/accessibility/badge)](https://www.codefactor.io/repository/github/rubencesario/accessibility)
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

# accessibility for Flutter

A family of packages that lets an app honour the accessibility needs of the
person using it, on Material, on Cupertino or on a custom UI.

## Why, if the OS already has these settings?

Flutter applies some of the OS accessibility signals on its own: `Text`
reads the system text scale and the bold-text setting, so those arrive in
the app without any help. Others it exposes but never acts on: reduce
motion does not stop page transitions, and increase contrast does nothing
unless the app provides high-contrast themes.

This family makes the app honour the ignored signals, composes with the
ones Flutter already applies, and adds the settings the OS does not offer
at all: letter and word spacing, line height, an accessible font, a text
colour, a background colour and colour profiles. It does the same on
Flutter Web, where only part of the OS signals reaches the engine.

Everything is stored per app, so one person's choices do not leak into
other apps, and every setting can be restored to its default in one tap.

## Packages

| Package | pub.dev | What it is |
|---|---|---|
| `accessibility` | [![pub](https://img.shields.io/pub/v/accessibility.svg)](https://pub.dev/packages/accessibility) | Pure Dart: domain models, repository, service interface |
| `flutter_accessibility` | [![pub](https://img.shields.io/pub/v/flutter_accessibility.svg)](https://pub.dev/packages/flutter_accessibility) | `widgets.dart`: ViewModel, scope, builders, neutral widgets |
| `accessibility_localizations` | [![pub](https://img.shields.io/pub/v/accessibility_localizations.svg)](https://pub.dev/packages/accessibility_localizations) | ARB files, generated class, delegate |
| `accessibility_shared_preferences` | [![pub](https://img.shields.io/pub/v/accessibility_shared_preferences.svg)](https://pub.dev/packages/accessibility_shared_preferences) | `AccessibilityStorageService` on `shared_preferences` |
| `accessibility_material` | [![pub](https://img.shields.io/pub/v/accessibility_material.svg)](https://pub.dev/packages/accessibility_material) | `material_ui`: theme builder, theme data, settings panel |
| `accessibility_cupertino` | [![pub](https://img.shields.io/pub/v/accessibility_cupertino.svg)](https://pub.dev/packages/accessibility_cupertino) | `cupertino_ui`: theme builder, theme data, settings panel, routes |
| `accessibility_font_andika` | [![pub](https://img.shields.io/pub/v/accessibility_font_andika.svg)](https://pub.dev/packages/accessibility_font_andika) | Asset-only font package |
| `accessibility_testing` | [![pub](https://img.shields.io/pub/v/accessibility_testing.svg)](https://pub.dev/packages/accessibility_testing) | Fake service and fixtures |

`accessibility_material` and `accessibility_cupertino` re-export
`flutter_accessibility` (which re-exports `accessibility`) and
`AccessibilityLocalizations`, so a Material or Cupertino app needs one
import for everything except persistence and the font.

## Three ways in

### Material

```bash
flutter pub add accessibility_material accessibility_shared_preferences
```

```dart
import 'package:accessibility_material/accessibility_material.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:material_ui/material_ui.dart';

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

### Cupertino

```bash
flutter pub add accessibility_cupertino accessibility_shared_preferences
```

```dart
import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

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
  Widget build(BuildContext context) => AccessibleCupertinoThemeBuilder(
    builder: (context, theme) => CupertinoApp(
      theme: theme,
      localizationsDelegates: const [
        ...GlobalCupertinoLocalizations.delegates,
        AccessibilityLocalizations.delegate,
      ],
      supportedLocales: AccessibilityLocalizations.supportedLocales,
      onGenerateRoute: (settings) => AccessibleCupertinoPageRoute<void>(
        settings: settings,
        builder: (_) => const CupertinoPageScaffold(
          child: CupertinoAccessibilitySettingsPanel(),
        ),
      ),
    ),
  );
}
```

### A custom UI

```bash
flutter pub add flutter_accessibility accessibility_shared_preferences
```

`flutter_accessibility` depends on `package:flutter/widgets.dart` only.
There is no ready-made panel: the app builds its own screen on the
ViewModel commands, and applies the text settings once, on its root
`DefaultTextStyle`.

```dart
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

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
  Widget build(BuildContext context) => WidgetsApp(
    title: 'Accessible custom UI',
    color: const Color(0xFF5B3FA0),
    builder: (context, child) => AccessibilitySettingsBuilder(
      builder: (context, settings, child) => DefaultTextStyle(
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1B1B1F),
        ).applyTextSettings(settings.textSettings),
        child: child!,
      ),
      child: const SettingsScreen(),
    ),
  );
}
```

Below the scope, `AccessibilityScope.settingsOf(context)` reads the current
settings and rebuilds on change, and `AccessibilityScope.of(context)`
returns the ViewModel to invoke a command such as
`setTextScaleFactor(1.5)`. Persistence is the repository's job; the app
never calls the storage service.

## Live demo and examples

The Material and the Cupertino panels run in the browser:

- <https://rubencesario.github.io/accessibility/material/>
- <https://rubencesario.github.io/accessibility/cupertino/>

The index at <https://rubencesario.github.io/accessibility/> links to both.
Their sources, and two more apps, are in this repository:

- [`examples/material`](examples/material): `MaterialApp.router` with
  `AccessibleThemeBuilder`, `AccessibilitySettingsPanel` in both styles and
  its own high-contrast colour schemes.
- [`examples/cupertino`](examples/cupertino): the same app on `CupertinoApp`,
  with `AccessibleCupertinoThemeBuilder` and
  `AccessibleCupertinoPageRoute`.
- [`examples/custom_ui`](examples/custom_ui): a design-system-free app on
  `package:flutter/widgets.dart`, with a hand-made settings screen.
- [`examples/multiple_languages`](examples/multiple_languages): the Material
  example with a picker over the bundled translations.

## Migrating from 1.x

Version 2.0 splits the single `accessibility` package into this family and
drops `AccessibleMaterialApp` in favour of the app's own `MaterialApp`
under a theme builder. Stored settings survive the upgrade: the storage
adapter reads the 1.x keys unchanged.

The step-by-step guide, with the renames table and before/after snippets
for the three entry points, is
[`docs/migration/1.x-to-2.0.md`](docs/migration/1.x-to-2.0.md). Apps still
on the legacy Material library of the Flutter SDK stay on branch
[`1.x`](https://github.com/RubenCesario/accessibility/tree/1.x), which
receives bug fixes only.

## Architecture

The family follows the MVVM layering of the official Flutter architecture
guide, one layer per package, with a strict View -> ViewModel -> Repository
-> Service dependency rule; see
[`docs/architecture.md`](docs/architecture.md).

## WCAG

The settings target these success criteria of
[WCAG 2.1 AA](https://www.w3.org/TR/WCAG21/):

- [1.4.3 Contrast (Minimum)](https://www.w3.org/TR/WCAG21/#contrast-minimum)
- [1.4.4 Resize Text](https://www.w3.org/TR/WCAG21/#resize-text)
- [1.4.11 Non-text Contrast](https://www.w3.org/TR/WCAG21/#non-text-contrast)
- [1.4.12 Text Spacing](https://www.w3.org/TR/WCAG21/#text-spacing)
- [2.3.3 Animation from Interactions](https://www.w3.org/TR/WCAG21/#animation-from-interactions)

1.4.3, 1.4.4 and 1.4.12 are what the text and colour settings give the
user. 2.3.3 is the effects mode, which also follows the OS reduce-motion
signal. 1.4.11 is the panels' own controls: their accents, fills and
outlines come from the theme, so the colour profile — the high-contrast
one included — reaches them as it reaches the rest of the app.

Both panels are tested against Flutter's accessibility guidelines, in both
styles, with the defaults and with every setting active: the Material
panel against `labeledTapTargetGuideline`, `androidTapTargetGuideline` and
`textContrastGuideline`; the Cupertino panel against
`labeledTapTargetGuideline`, `iOSTapTargetGuideline` and
`textContrastGuideline`, in both brightnesses.

## A note on app size

The accessible font setting is powered by the
[Andika](https://software.sil.org/andika/) typeface (SIL Open Font
License), shipped by `accessibility_font_andika`. Its four faces add
around 2.5 MB to the application, which is why the font is a separate,
opt-in package in 2.0: an app that does not depend on it pays nothing.

Andika covers the Latin, Cyrillic and Greek scripts. When the accessible
font is enabled, text in scripts it does not cover (Arabic, Hebrew, CJK,
Indic) falls back to the app or system font, so nothing is left
unrendered.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) and the
[code of conduct](CODE_OF_CONDUCT.md). The repository is a pub workspace:
`flutter pub get` at the root resolves every package and example, and the
melos scripts in `pubspec.yaml` run the analyzer, the formatter, the tests
and the coverage gate across them.
