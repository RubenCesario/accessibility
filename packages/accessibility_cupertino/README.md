# accessibility_cupertino

The Cupertino layer of the accessibility package family, built on
`cupertino_ui`. It re-exports `flutter_accessibility` and
`AccessibilityLocalizations`, so it is the only accessibility import a
Cupertino app needs next to `cupertino_ui` itself.

## Installation

```bash
flutter pub add accessibility_cupertino accessibility_shared_preferences
```

Persistence is a separate package: `accessibility_shared_preferences`
brings `SharedPreferencesAccessibilityStorageService`, and without it (or
an `AccessibilityStorageService` of your own) nothing is stored.

## Usage

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

## What it does

* `AccessibleCupertinoThemeBuilder` rebuilds the app's `CupertinoThemeData`
  whenever the settings change: the theme mode sets the brightness, the
  colour profile adjusts every theme colour (variant by variant for
  dynamic colours, so dark mode and elevation still resolve), the page
  background is applied, and every text style of the text theme gets the
  text settings. When the OS asks for more contrast, the high-contrast
  profile is composed on top.
* `AccessibleCupertinoPageRoute` and `AccessibleCupertinoPage` replace
  `CupertinoPageRoute` and `CupertinoPage`. When effects are off, pages
  appear in place without motion and the route durations are zero; the
  edge-swipe back gesture keeps working.
* `CupertinoAccessibilitySettingsPanel` offers the settings in two
  styles: `standard` (plain list sections) and `cards` (inset grouped
  sections with notched tiles and stepper rows). Every item is a labelled
  44 dp tap target, and the panel passes Flutter's text-contrast, labelled
  tap-target and iOS tap-target guidelines in both styles.
* `CupertinoRestoreSettingsButton` and `CupertinoReadMoreText` are the
  building blocks of the panel that apps can reuse.

The panel offers Material's 19 primary swatches as colour candidates by
default (`kDefaultColorCandidates`, from `flutter_accessibility`); pass
your own `ColorSwatch<int>`s through `AccessibilitySettingsConfiguration`.

## Known limitation

`AccessibleCupertinoThemeData.from` applies a user-chosen text colour to
every text style, but the background colour override reaches only the
page scaffold. Both directions of that mismatch can leave a pair
unreadable, and both are the user's own choice to revert:

- A text colour that clashes with another surface of the theme, which the
  override never reconciled.
- A background override alone, picked under the opposite brightness: the
  theme keeps its own foreground, which is then unreadable on the page
  background — inside the standard-style panel too, not only on the app's
  own content.

A follow-up will derive the foreground from a chosen background and
extend the override to the other surfaces. See the guideline tests in
`examples/cupertino` for the scenario this excludes.

## Parity with accessibility_material

Every setting, style and configuration flag of `accessibility_material`
is available here with the same ViewModel commands; only the widgets
differ. Apps that ship both design systems share the
`AccessibilityScope`, the repository and the storage service.

## Screenshots

See the live demo: <https://rubencesario.github.io/accessibility/cupertino/>

## See also

- The family: <https://github.com/RubenCesario/accessibility#readme>
- Live demo: <https://rubencesario.github.io/accessibility/cupertino/>
- Migrating from 1.x: <https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md>
