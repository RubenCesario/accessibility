# accessibility 2.0: monorepo and package split

Date: 2026-09-04
Status: approved in design review, pending written-spec review

## 1. Summary

`accessibility` 1.4 is a single Flutter package that couples Material,
shared_preferences, 80+ languages and a 2.6 MB font into one all-or-nothing
dependency, and requires replacing `MaterialApp` with `AccessibleMaterialApp`.
Version 2.0 splits it into a family of eight packages released together, in
the shape of bloc (`bloc` / `flutter_bloc` / `hydrated_bloc` / `bloc_test`),
structured with MVVM as described in the official Flutter architecture guide
(docs.flutter.dev/app-architecture).

Goals:

- `accessibility` keeps its name and becomes the pure Dart core. Every other
  package depends on it, so it is the most downloaded package by construction.
- Anyone can use the logic without UI and build their own settings screen.
- Material and Cupertino UIs are separate, opt-in packages built on the
  standalone `material_ui` and `cupertino_ui` packages shipped with Flutter
  3.47, with full feature parity between the two.
- Persistence, translations and the accessible font are plug-in packages.
- The app keeps its own `MaterialApp` / `CupertinoApp`; the package provides
  a builder above it.
- The app honours the OS accessibility signals that Flutter does not apply on
  its own (reduce motion, increase contrast), and composes with those it does.
- 100% coverage stays a hard gate where the logic lives; UI packages get
  rendering and accessibility-guideline tests only.

Non-goals for 2.0:

- A non-blocking initialisation path (settings loaded after the first frame).
  Rejected because it produces a visible flash of unstyled content, which is
  the worst possible defect for an accessibility package.
- A one-line integration inside `MaterialApp.builder`. Rejected because it
  cannot switch the theme mode.
- Font subsetting. The font is opt-in now; a subset variant can follow later.
- Data-driven `dart fix` migrations. Renames cross package boundaries, which
  the tool cannot express, and the current user base does not justify it.
- Widget-test helpers in `accessibility_testing` (fakes and fixtures only).

## 2. Verified context

Facts checked against sources on 2026-09-04. They constrain the design.

- Flutter 3.47 (stable, August 2026) ships `material_ui` 1.1.x and
  `cupertino_ui` 1.0 as standalone packages. `material_ui` requires Flutter
  >= 3.44 and depends on `cupertino_ui`, `flutter_localizations` and
  `intl ^0.20.2`. The core-SDK Material and Cupertino libraries are scheduled
  for deprecation in the November 2026 stable. Official guidance for package
  authors: migrate and bump the major version.
- `material_ui` is a copy of the code, so `ThemeData`, `Theme`, `MaterialApp`
  and `ThemeMode` are different Dart types from those in
  `package:flutter/material.dart`. A package on `material_ui` cannot accept a
  legacy `ThemeData`. `ThemeMode` is defined in `material_ui`, not in
  `widgets.dart`.
- `MaterialApp` calls `builder` under its `AnimatedTheme`, so `Theme.of`
  works inside it, but it picks light/dark before the builder runs.
- `package:listen` 1.0.1 (publisher flutter.dev, pure Dart, SDK ^3.10,
  depends only on `meta`) exports `Listenable`, `ChangeNotifier`,
  `ValueNotifier`, `ValueListenable`. Flutter master re-exports them from
  `foundation.dart` as identical types since PR flutter/flutter#189111
  (merged 2026-08-31). Beta and stable 3.47 still define their own, so on
  stable a `listen` notifier is a different type from Flutter's.
- `MediaQuery` exists above `MaterialApp` because `View` inserts
  `MediaQuery.fromView` in `runApp`.
- `Text` applies `MediaQuery.boldTextOf` and `MediaQuery.textScalerOf` on its
  own. Flutter exposes `MediaQuery.disableAnimationsOf` but does not stop page
  transitions itself. `MaterialApp` selects `highContrastTheme` /
  `highContrastDarkTheme` only when the app provides them.
- The 1.x codebase: 79 source files (10,391 lines, generated l10n excluded),
  63 of which import `material.dart`; 146 test files (33,431 lines), 78 of
  which are one-per-language localisation tests; 19 panel widgets write to
  storage directly in addition to updating the view model; the `Andika` font is
  four TTFs totalling 2.6 MB.

## 3. Package structure

```
accessibility/                          repo root: family README, pubspec.yaml (workspace list and melos config)
  packages/
    accessibility/                      pure Dart: domain models, repository, service interface
    flutter_accessibility/              widgets.dart: ViewModel, scope, builders, neutral widgets
    accessibility_localizations/        ARB files, generated class, delegate
    accessibility_shared_preferences/   AccessibilityStorageService on shared_preferences
    accessibility_material/             material_ui: theme builder, theme data, settings panel
    accessibility_cupertino/            cupertino_ui: theme builder, theme data, settings panel, routes
    accessibility_font_andika/          asset-only font package
    accessibility_testing/              fake service and fixtures
  examples/
    material/  cupertino/  custom_ui/  multiple_languages/
  docs/
    architecture.md  migration/1.x-to-2.0.md  superpowers/specs/
```

### 3.1 Dependency graph

| Package | Depends on | Re-exports |
|---|---|---|
| `accessibility` | `listen`, `meta` | nothing |
| `flutter_accessibility` | `flutter`, `accessibility` | `accessibility` |
| `accessibility_localizations` | `flutter`, `intl` | nothing |
| `accessibility_shared_preferences` | `accessibility`, `flutter`, `shared_preferences` | nothing |
| `accessibility_material` | `material_ui`, `flutter_accessibility`, `accessibility_localizations` | `flutter_accessibility`, `AccessibilityLocalizations` |
| `accessibility_cupertino` | `cupertino_ui`, `flutter_accessibility`, `accessibility_localizations` | `flutter_accessibility`, `AccessibilityLocalizations` |
| `accessibility_font_andika` | `flutter`, `accessibility` | nothing |
| `accessibility_testing` | `accessibility` | nothing |

Rules:

- The core never imports `package:flutter` or `dart:ui`. An architecture test
  in the core reads every file under `lib/` and fails on either import.
- The storage adapter knows nothing about widgets. It implements the core
  service interface only.
- One import is enough for panel users: `accessibility_material` and
  `accessibility_cupertino` re-export everything below them.
- The core does not re-export `listen` types. Re-exporting `ValueListenable`
  would create an ambiguous name for anyone who also imports Flutter until
  stable unifies the types. Code that must name the type imports
  `package:listen/listen.dart` itself.

### 3.2 Constraints and versions

- Dart `^3.12.0` everywhere; Flutter `>=3.44.0` on Flutter packages, the
  minimum required by `material_ui`. Development happens on Flutter 3.47.
- `material_ui: ^1.1.0`, `cupertino_ui: ^1.0.0`, `listen: ^1.0.1`.
- All eight packages are published together at 2.0.0. Afterwards they are
  versioned independently under semver, managed by melos.
- Each package's `repository:` field points to its subdirectory, e.g.
  `https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_material`,
  which pub.dev verifies and links.
- The 2.0 UI packages require an app already on `material_ui` /
  `cupertino_ui`. Apps on the legacy libraries stay on the 1.x line.

## 4. Architecture: MVVM on packages

The layering follows the Flutter architecture guide: a UI layer of Views and
ViewModels, a Data layer of Repositories and Services, and domain models in
between. The 1.x code already used this vocabulary (`models`, `services`,
`view_models`); 2.0 makes it rigorous.

| Layer | Package | Classes |
|---|---|---|
| Domain models | `accessibility` | `AccessibilitySettings`, `TextSettings`, `ColorSettings`, enums, profiles, `AccessibleFont` |
| Data: Service | `accessibility` (interface), `accessibility_shared_preferences` (implementation) | `AccessibilityStorageService` |
| Data: Repository | `accessibility` | `AccessibilitySettingsRepository` |
| UI: ViewModel | `flutter_accessibility` | `AccessibilitySettingsViewModel` |
| UI: neutral Views | `flutter_accessibility` | `AccessibilityScope`, builders, `AccessibleText` and other widgets |
| UI: Material Views | `accessibility_material` | theme builder, settings panel |
| UI: Cupertino Views | `accessibility_cupertino` | theme builder, settings panel, routes |

Dependency rule: View -> ViewModel -> Repository -> Service. Views never touch
the repository or a service. Views may read `MediaQuery` (the guide allows
"layout logic based on device information" in views). Pure data
transformations live on the models. No use-case classes: there is one
ViewModel and the shared logic fits on the models.

Folder layout inside each package, from the guide:

```
lib/src/domain/models/
lib/src/data/repositories/
lib/src/data/services/
lib/src/ui/core/
lib/src/ui/<feature>/view_model/
lib/src/ui/<feature>/widgets/
```

A package only creates the folders it needs (the core has no `ui/`, the UI
packages have no `data/`). `lib/src/ui/core/` holds cross-feature UI
helpers, the Flutter guide's own convention. A feature's non-widget,
non-ViewModel helpers (for example `AccessibleHeight`, the panel
configuration and style) live at the feature root.

## 5. `accessibility` (core)

Pure Dart. Public API through `package:accessibility/accessibility.dart`.

### 5.1 Enums

```dart
enum AccessibilityThemeMode { system, light, dark }

enum EffectsMode {
  system, enabled, disabled;
  bool resolve({required bool systemReducesMotion}) => switch (this) {
    system => !systemReducesMotion,
    enabled => true,
    disabled => false,
  };
}

enum TextAlignMode { none, start, end, left, right, center, justify }

enum ColorProfileLevel { normal, lowSaturation, highSaturation, monochrome, highContrast }

enum ThemeProfileLevel { none, seizureSafe, visionImpaired, adhdFriendly }
```

`AccessibilityThemeMode` carries a prefix because panel users also import
`material_ui`'s `ThemeMode`; an identical name would be ambiguous.
`EffectsMode` is the tri-state that lets the effects setting follow the OS
reduce-motion signal by default.

### 5.2 Models

All models are `@immutable final class`es with `const` constructors,
`copyWith`, `==`, `hashCode` and `toString`. Sentinel values from 1.x (`-1.0`
for "not set", `0` for "no colour", `''` for "system font") become `null`:
`null` always means "do not override". `copyWith` parameters for nullable
fields are typed `Object?` because of the sentinel; a wrongly typed argument
fails at runtime with a `TypeError`, which is accepted.

```dart
final class TextSettings {
  const TextSettings({
    this.lineHeight,            // double?
    this.wordSpacing,           // double?
    this.letterSpacing,         // double?
    this.textScaleFactor = 1.0, // double
    this.isBold = false,        // bool
    this.textAlign = TextAlignMode.none,
    this.color,                 // int? ARGB
    this.fontFamily,            // String?
  });
  bool get isDefault;
}

final class ColorSettings {
  const ColorSettings({
    this.backgroundColor,       // int? ARGB
    this.colorProfile = ColorProfileLevel.normal,
  });
  bool get isDefault;
}

final class ColorProfile {
  final ColorProfileLevel level;
  final double? saturationMultiplier;
  final double? lightnessFactor;
  static ColorProfile fromLevel(ColorProfileLevel level);
  static const List<ColorProfile> values;
}
```

`ColorProfile` loses the 1.x `icon` field (it was a Material `IconData`).
The five profiles keep their 1.x saturation and lightness values.

```dart
final class ThemeProfile {
  final TextSettings textSettings;
  final ColorSettings colorSettings;
  final EffectsMode effectsMode;
  static ThemeProfile fromLevel(ThemeProfileLevel level);
}
```

The three presets keep their 1.x values, with `effectsAllowed: false`
becoming `EffectsMode.disabled` (seizureSafe, adhdFriendly) and the default
becoming `EffectsMode.system` (visionImpaired, none).

```dart
final class AccessibleFont {
  const AccessibleFont({required this.family, this.package});
  final String family;
  final String? package;
  /// 'packages/<package>/<family>' when [package] is set, else [family].
  String get qualifiedFamily;
}
```

```dart
final class AccessibilitySettings {
  const AccessibilitySettings({
    this.themeMode = AccessibilityThemeMode.system,
    this.effectsMode = EffectsMode.system,
    this.textSettings = const TextSettings(),
    this.colorSettings = const ColorSettings(),
  });
  static const defaults = AccessibilitySettings();

  bool get isDefault;
  /// The preset whose text, colour and effects values equal this instance,
  /// or [ThemeProfileLevel.none]. Derived, never stored.
  ThemeProfileLevel get matchingThemeProfile;

  AccessibilitySettings copyWith({...});
  /// Replaces text, colour and effects with the preset; keeps [themeMode].
  AccessibilitySettings withThemeProfile(ThemeProfileLevel level);
  /// Cycles to the next [ColorProfileLevel], wrapping around.
  AccessibilitySettings withNextColorProfile();

  Map<String, Object?> toJson();
  factory AccessibilitySettings.fromJson(Map<String, Object?> json);
}
```

JSON shape: field names as keys, enums by `name`, nested maps for
`textSettings` and `colorSettings`, `null` for unset values. `fromJson`
tolerates missing keys (falls back to defaults) and unknown enum names
(falls back to the default value of that field). The JSON exists for
third-party storage adapters (Hive, secure storage, remote sync); the
shared_preferences adapter does not use it because it must stay
key-compatible with 1.x.

### 5.3 Service interface

```dart
abstract interface class AccessibilityStorageService {
  /// Stored settings, or null when nothing has been stored yet.
  Future<AccessibilitySettings?> read();
  Future<void> write(AccessibilitySettings settings);
  Future<void> clear();
}
```

Typed on the domain model, like the typed API models returned by services in
the official case study. Services hold no state. There is no in-memory
implementation in the core: a repository without a service simply does not
persist, and the fake lives in `accessibility_testing`.

### 5.4 Repository

```dart
sealed class AccessibilitySettingsStatus { const AccessibilitySettingsStatus(); }
final class AccessibilitySettingsIdle extends AccessibilitySettingsStatus {}
final class AccessibilitySettingsLoading extends AccessibilitySettingsStatus {}
final class AccessibilitySettingsLoaded extends AccessibilitySettingsStatus {}
final class AccessibilitySettingsLoadFailed extends AccessibilitySettingsStatus {
  final Exception error;
  final StackTrace stackTrace;
}

final class AccessibilitySettingsRepository {
  AccessibilitySettingsRepository({
    AccessibilityStorageService? service,
    AccessibilitySettings initial = AccessibilitySettings.defaults,
  });

  ValueListenable<AccessibilitySettings> get settings;   // built on package:listen
  ValueListenable<AccessibilitySettingsStatus> get status;

  Future<void> load();
  Future<void> save(AccessibilitySettings settings);
  Future<void> clear();
  void dispose();
}
```

Semantics:

- `load()` never throws. It sets `status` to `Loading`, calls `read()`,
  then: a value sets `settings` and `Loaded`; `null` keeps the current
  settings and sets `Loaded`; an `Exception` keeps the current settings and
  sets `LoadFailed(error, stackTrace)`. `Error`s are not caught: they are
  programming errors and the lint set forbids catching them. Without a
  service `load()` sets `Loaded` immediately. If `save()` or `clear()` ran
  while a `load()` was in flight, the loaded value is discarded so the
  user's newer choice wins.
- `save()` sets `settings` and notifies synchronously, then awaits
  `service.write()`. Write errors propagate to the caller; the in-memory
  value stays updated.
- `clear()` sets `settings` to `defaults`, notifies, then awaits
  `service.clear()`. Errors propagate.
- The repository is the single app-wide source of truth and the home of the
  load status, as the guide recommends for shared lifecycle state.
- `dispose()` disposes the notifiers. The owner (the app) calls it.

### 5.5 Architecture test

`test/architecture_test.dart` walks `lib/` and asserts that no file imports
`package:flutter` or `dart:ui`. It is part of the 100% coverage suite.

## 6. `flutter_accessibility`

Everything in `package:flutter/widgets.dart` and `foundation.dart`. Nothing
from Material or Cupertino. Re-exports `accessibility`.

### 6.1 ViewModel

```dart
final class AccessibilitySettingsViewModel extends ChangeNotifier {
  AccessibilitySettingsViewModel({
    required AccessibilitySettingsRepository repository,
    List<AccessibleFont> accessibleFonts = const [],
  });

  AccessibilitySettings get settings;
  AccessibilitySettingsStatus get status;
  List<AccessibleFont> get accessibleFonts;
  /// The registered font whose family equals settings.textSettings.fontFamily.
  AccessibleFont? get activeFont;

  Future<void> load();                       // retry after LoadFailed
  Future<void> setThemeMode(AccessibilityThemeMode mode);
  Future<void> setEffectsMode(EffectsMode mode);
  Future<void> setTextScaleFactor(double value);
  Future<void> setLineHeight(double? value);
  Future<void> setLetterSpacing(double? value);
  Future<void> setWordSpacing(double? value);
  Future<void> setBold({required bool value});
  Future<void> setTextAlign(TextAlignMode mode);
  Future<void> setTextColor(int? argb);
  Future<void> setFontFamily(String? family);
  /// true selects the first registered font, false selects null.
  Future<void> setAccessibleFontEnabled({required bool enabled});
  Future<void> setBackgroundColor(int? argb);
  Future<void> setColorProfile(ColorProfileLevel level);
  Future<void> nextColorProfile();
  Future<void> applyThemeProfile(ThemeProfileLevel level);
  Future<void> restoreDefaults();
}
```

- Boolean parameters are named because the lint set forbids positional
  booleans.
- Extends Flutter's `ChangeNotifier`, not `listen`'s. It subscribes to the
  repository's two listenables and forwards notifications. Consequently
  `ListenableBuilder`, `AnimatedBuilder` and `InheritedNotifier` from Flutter
  work on stable 3.47; the `listen` type gap stays inside the repository.
  A test asserts that no `listen` type appears in the package's public API.
- Commands are plain methods returning the repository's `Future`. The
  guide's `Command` objects (running/error state) are used only where that
  state is shown: `load`, whose state is the repository status.
- `dispose()` removes its repository listeners and does not dispose the
  repository.

### 6.2 Scope

```dart
final class AccessibilityScope extends InheritedNotifier<AccessibilitySettingsViewModel> {
  const AccessibilityScope({required AccessibilitySettingsViewModel viewModel, required Widget child});

  /// The view model, without registering a dependency. Use for commands.
  static AccessibilitySettingsViewModel of(BuildContext context);
  static AccessibilitySettingsViewModel? maybeOf(BuildContext context);
  /// Current settings, registering a dependency: the caller rebuilds on change.
  static AccessibilitySettings settingsOf(BuildContext context);
  /// Current load status, registering a dependency: the caller rebuilds on change.
  static AccessibilitySettingsStatus statusOf(BuildContext context);
  /// settings.effectsMode resolved against MediaQuery.disableAnimationsOf.
  static bool effectsEnabledOf(BuildContext context);
}
```

Initialisation is the app's job and happens before the first frame so that
saved settings never flash in after the defaults. The native splash covers
the wait on mobile and desktop:

```dart
void main() async {
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
      child: const MyApp(),
    ),
  );
}
```

There is no `AccessibilityScope.async`, no `loadingBuilder` and no
scope-owned lifecycle.

### 6.3 Builders

```dart
AccessibilitySettingsBuilder({
  required Widget Function(BuildContext, AccessibilitySettings, Widget?) builder,
  Widget? child,
})

EffectsBuilder({
  required Widget Function(BuildContext, {required bool effectsEnabled, Widget? child}) builder,
  Widget? child,
})
```

`EffectsBuilder` resolves `settings.effectsMode` with
`MediaQuery.disableAnimationsOf(context)`. When the user toggles reduce
motion in the OS, `MediaQuery` updates on its own and the builder rebuilds;
no `WidgetsBindingObserver` is needed. No selector builders: settings change
only while the user is in the panel.

### 6.4 Shared UI configuration

Used by both panels, therefore defined here:

```dart
enum AccessibilitySettingsStyle { standard, cards }

final class AccessibilitySettingsConfiguration {
  // group and item visibility flags, all default true:
  // showThemeSettingsGroup, showThemeProfileSeizureSafe, showThemeProfileVisionImpaired,
  // showThemeProfileAdhdFriendly, showThemeModeSetting, showEffectsSetting,
  // showColorSettingsGroup, showColorProfileSetting, showBackgroundColorSetting,
  // showTextColorSetting, showTextSettingsGroup, showTextAlignSetting, showBoldSetting,
  // showFontSetting, showLetterSpacingSetting, showLineHeightSetting,
  // showTextScaleFactorSetting, showWordSpacingSetting
  final Iterable<ColorSwatch<int>>? textColorCandidates;     // null: the panel's default palette
  final bool textColorAllowPickingShades;
  final Iterable<ColorSwatch<int>>? backgroundColorCandidates;
  final bool backgroundColorAllowPickingShades;
  final FutureOr<void> Function()? onRestoreSettings;
}
```

The font toggle is shown only when `showFontSetting` is true and the
ViewModel has at least one registered font.

### 6.5 Widgets

Moved from 1.x with `widgets.dart` imports, reading
`AccessibilityScope.settingsOf`:

- `extension AccessibleTextStyle on TextStyle { TextStyle applyTextSettings(TextSettings settings, {AccessibleFont? font}); }`:
  the single application point of the text settings (scale, line height,
  spacing, weight, colour, family via `font` with the style's own family as
  the fallback chain). The theme layers apply it to every text theme style
  (section 11.2); a custom design system applies it once on its root
  `DefaultTextStyle`. It composes with `MediaQuery.textScaler`; it does not
  replace it.
- `AccessibleText`: a `Text` that, as in 1.x, applies only the settings
  alignment and an optional `textColor` over the ambient `DefaultTextStyle`
  merged with `style`. It never applies scale, spacing, weight or family
  itself, because the ambient style already carries them and applying them
  again would scale text twice (ruling of 2026-09-07).
- `AccessibleWidgetBuilder`, `AccessibleSizedBox`, the `AccessibleHeight`
  extension on `double`, `TextRawMagnifier` (uses `RawMagnifier`, which is a
  widgets-layer class), with an optional `borderColor` defaulting to the
  ambient text colour, since there is no theme here.
- `CollapsibleText`: the measure-and-truncate logic of 1.x `ReadMoreText`
  with a required `toggleBuilder(BuildContext, {required bool expanded, required VoidCallback onToggle})`.
  The design-system packages wrap it with their own button.
- `extension AccessibleColor on Color { Color withColorProfile(ColorProfile profile); }`:
  the saturation and lightness adjustment from 1.x `ColorTransformation`,
  shared by both theme transformations. Other members of
  `ColorTransformation` are kept only if a panel uses them, as private code.
  `ColorProfile.normal` keeps the 1.x lightness factor of 0; theme layers
  apply a profile only when it is not `normal`.

Removed from the public API: `BuildContextControls` (`colorScheme`,
`textTheme`, `isDarkMode`, `orientation`, `l10na`, `a11yConfig`,
`a11yStyle`). They are generic conveniences unrelated to accessibility and
would not even have Material's `Theme` in this layer.

## 7. `accessibility_shared_preferences`

```dart
final class SharedPreferencesAccessibilityStorageService implements AccessibilityStorageService {
  /// Backed by SharedPreferencesWithCache, created lazily on first use with an
  /// allowList limited to this package's keys.
  SharedPreferencesAccessibilityStorageService({SharedPreferencesOptions options = const SharedPreferencesOptions()});
  /// Backed by the legacy SharedPreferences API. Only for apps whose 1.x
  /// settings were written through SharedPreferencesServiceLegacy.
  SharedPreferencesAccessibilityStorageService.legacy();
}
```

- Synchronous constructors; the backend future is memoised on first call.
  Both backends exist because on Android they store data in different
  places, and 1.x users must find their settings after upgrading. The allow
  list belongs to the service, so callers pass platform
  `SharedPreferencesOptions` (for example the Android backend) rather than
  cache options.
- Keys are the 1.x keys, unchanged: `isDarkMode` (theme mode name),
  `textAccessibilitySettingWordSpacing`, `...LineHeight`, `...LetterSpacing`,
  `...ScaleFactor`, `...FontWeight`, `...Alignment`, `...FontFamily`,
  `colorProfileSetting`, `textColorSetting`, `pagesBackgroundColorSetting`.
- `effectsMode` is a new string key. On read, when it is absent and the 1.x
  boolean key `hasNoEffects` is present, the boolean is mapped `true` ->
  `system` (the 1.x default, written by every 1.x restore, so an upgraded
  install follows the OS reduce-motion signal like a fresh one),
  `false` -> `disabled` (verified on 2026-09-04: 1.x stores the
  `effectsAllowed` boolean under that key as-is, default `true`); when both
  are absent the value is `system`.
- Sentinels are translated on read (any negative spacing or height ->
  `null`, `0` colour -> `null`, `''` family -> `null`). The codec goes
  through `AccessibilitySettings.fromJson`/`toJson` (renaming keys and
  translating sentinels only), so type tolerance is the core's. On write a
  `null` field removes its key.
- `themeProfileSetting` and `isFirstTimeOpened` are ignored on read and
  removed by `clear()`.
- `read()` returns `null` when none of the known keys exist.
- `clear()` removes only this package's keys.

Tests (100%): round trip of every field, fresh install, 1.x value migration
including the effects boolean and sentinels, both backends, using the
in-memory implementations from `shared_preferences_platform_interface`.

## 8. `accessibility_localizations`

- ARB files live in `lib/l10n/` with the 1.x names (`app_<locale>.arb`); the
  keys are renamed to lowerCamelCase so the generated getters are idiomatic
  Dart (`read_more` -> `readMore`). `flutter gen-l10n` writes
  `AccessibilityLocalizations` to `lib/src/generated/` with deferred loading
  kept for web, and `tool/strip_l10n_delegates.dart` removes the
  `flutter_localizations` import, the `localizationsDelegates` list and
  the generator's usage dartdoc from the output (melos script
  `gen-l10n`). Generated files are committed. The package deliberately
  has no `l10n.yaml`: the generation options are passed as flags by the
  melos `gen-l10n` script, because `flutter pub get`
  runs the localizations build target for every workspace member that has
  `generate: true` and an `l10n.yaml`, which would rewrite the file without
  the strip. `generate: true` is still set in `pubspec.yaml`, as required by
  `flutter gen-l10n` on Flutter 3.44.
- Public API: `AccessibilityLocalizations.of(context)`,
  `AccessibilityLocalizations.delegate`,
  `AccessibilityLocalizations.supportedLocales`.
- Three new keys for the status card: `settingsLoading`,
  `settingsLoadFailed`, `retry`. The three keys are translated in every
  locale; `untranslated_messages.json` must stay `{}`, enforced by a test.
- Six new keys for the theme mode and effects mode segment labels:
  `themeModeSystem`, `themeModeLight`, `themeModeDark`,
  `effectsModeSystem`, `effectsModeEnabled`, `effectsModeDisabled`, added
  by plan 4. The count of keys becomes 79 (73 + 6 mode labels).
- The generated `localizationsDelegates` convenience list imports
  `flutter_localizations`, which after the decoupling carries the legacy
  Material delegates. Flutter 3.44's generator still emits it (verified
  2026-09-07); the melos `gen-l10n` script strips it after generation. The
  package exposes only its own delegate.
- Tests, no coverage gate: one parameterised test loading every supported
  locale through the delegate; one test asserting every ARB has every key of
  the English template.

## 9. `accessibility_font_andika`

- Asset-only package: the four unmodified Andika TTFs (Regular, Bold,
  Italic, BoldItalic) declared under `flutter: fonts:` with family `Andika`,
  plus `OFL.txt`.
- One Dart file:

```dart
abstract final class AndikaFont {
  static const font = AccessibleFont(family: 'Andika', package: 'accessibility_font_andika');
}
```

- Shipped unmodified. Subsetting would require renaming the font's internal
  name (OFL reserves the font name for unmodified versions) and is deferred.
- Test, no gate: the font asset resolves through `rootBundle` and the
  constant's `qualifiedFamily` is `packages/accessibility_font_andika/Andika`.

## 10. `accessibility_testing`

Pure Dart, depends on `accessibility` only.

```dart
final class FakeAccessibilityStorageService implements AccessibilityStorageService {
  FakeAccessibilityStorageService({AccessibilitySettings? initial, Object? readError, Object? writeError, Object? clearError});
  AccessibilitySettings? get stored;
  List<String> get calls;   // 'read', 'write', 'clear' in order
}

abstract final class AccessibilitySettingsSamples {
  /// The three presets as const literals, equal to
  /// AccessibilitySettings.defaults.withThemeProfile(level) for each level.
  static const AccessibilitySettings seizureSafe;
  static const AccessibilitySettings visionImpaired;
  static const AccessibilitySettings adhdFriendly;
  /// Every nullable field non-null, every enum at a non-default value.
  static const AccessibilitySettings everythingSet;
}
```

A test in `accessibility_testing` asserts that each preset sample equals the
corresponding `withThemeProfile` result, so the literals cannot drift from
the core.

Used as a dev dependency by every other package's tests and by apps testing
a custom UI. No fake repository: the real repository with the fake service is
simpler and more faithful. Coverage gate 100%.

The name `accessibility_test` is already taken on pub.dev by an unrelated
package, hence `accessibility_testing`.

## 11. `accessibility_material`

Built on `material_ui`. Views only. Re-exports `flutter_accessibility` and
`AccessibilityLocalizations`.

### 11.1 Theme builder

```dart
final class AccessibleThemes {
  final ThemeData light, dark, highContrastLight, highContrastDark;
  final ThemeMode mode;   // material_ui's ThemeMode, mapped from AccessibilityThemeMode
}

AccessibleThemeBuilder({
  ThemeData? theme,        // default ThemeData.light()
  ThemeData? darkTheme,    // default ThemeData.dark()
  required Widget Function(BuildContext, AccessibleThemes) builder,
})
```

Usage:

```dart
AccessibleThemeBuilder(
  theme: lightTheme,
  darkTheme: darkTheme,
  builder: (context, themes) => MaterialApp(
    theme: themes.light,
    darkTheme: themes.dark,
    highContrastTheme: themes.highContrastLight,
    highContrastDarkTheme: themes.highContrastDark,
    themeMode: themes.mode,
    localizationsDelegates: [
      ...GlobalMaterialLocalizations.delegates,
      AccessibilityLocalizations.delegate,
    ],
    supportedLocales: AccessibilityLocalizations.supportedLocales,
    home: const HomePage(),
  ),
)
```

The `localizationsDelegates` list uses `material_ui`'s own
`GlobalMaterialLocalizations.delegates`, which already include the widgets
and Cupertino delegates.

The high-contrast variants are the app's themes with the user's settings
plus `ColorProfileLevel.highContrast` forced. `MaterialApp` selects them on
its own when `MediaQuery.highContrast` is true, so the OS "increase
contrast" signal is honoured without app code.

### 11.2 Theme data

```dart
extension type AccessibleThemeData._(ThemeData _) implements ThemeData {
  factory AccessibleThemeData.from({
    required ThemeData themeData,
    required AccessibilitySettings settings,
    AccessibleFont? font,
    bool forceHighContrast = false,
  });
}
```

The 1.x transformation (text theme, primary text theme, button styles,
app bar, component themes, colour scheme adjustment, page transitions)
moves as is, with these changes: nullable fields replace sentinel
comparisons; the font family comes from `font?.qualifiedFamily` with the
1.x per-script fallback chain preserved; colour adjustment uses
`withColorProfile`; the input decoration theme, left unapplied in 1.x, is
applied (`errorStyle` keeps its colour); the app's own page-transition
builders are kept; the high-contrast themes are derived by the builder
from the app's `theme` and `darkTheme` with the profile forced, not taken
as inputs. The text settings reach every `TextTheme` and
`primaryTextTheme` style through
`AccessibleTextStyle.applyTextSettings` (section 6.5), which is why
`AccessibleText` does not apply them again.

`AccessiblePageTransitionsTheme` replaces
`DependsOnEffectsSettingPageTransitionsTheme` and resolves through
`AccessibilityScope.effectsEnabledOf(context)` at transition time.

### 11.3 Settings panel

```dart
AccessibilitySettingsPanel({
  AccessibilitySettingsStyle style = AccessibilitySettingsStyle.standard,
  AccessibilitySettingsConfiguration configuration = const AccessibilitySettingsConfiguration(),
})
```

- Renamed from 1.x `AccessibilitySettings`, which is now the model.
- Reads `AccessibilityScope.of(context)` for commands and
  `settingsOf` for state.
- Top of the panel: the status card. `Idle` and `Loaded` render nothing;
  `Loading` renders a `CircularProgressIndicator` with the localised
  `settingsLoading` text; `LoadFailed` renders the localised
  `settingsLoadFailed` text and a retry button calling `viewModel.load()`.
  The status card reads `AccessibilityScope.statusOf`, added to
  `flutter_accessibility` by plan 4.
- Theme mode and effects are tri-state and render as a three-segment
  `SegmentedButton` in both styles ("system / light / dark", "system /
  enabled / disabled"). Their segment labels are the keys
  `themeModeSystem`, `themeModeLight`, `themeModeDark`,
  `effectsModeSystem`, `effectsModeEnabled`, `effectsModeDisabled`, added
  to `accessibility_localizations` by plan 4.
- The active theme profile is highlighted using
  `settings.matchingThemeProfile`.
- The colour-profile icon map (`ColorProfileLevel` -> `Icons.*`) lives here.
- `RestoreSettingsButton` calls `restoreDefaults()` then
  `configuration.onRestoreSettings`.
- `ReadMoreText` wraps `CollapsibleText` with a `TextButton`.
- Text alignment offers left, centre and right in both styles; the
  accessible font setting is shown only when the ViewModel has at least
  one registered font; the background colour picker is labelled with
  `changePagesBackgroundColor` (1.x reused the text-colour label).

Everything else in the 1.x panel (groups, cards, list tiles, sliders,
colour picker, semantics) moves with `material_ui` imports.

### 11.4 Removed public API

- `AccessibleMaterialApp` and `.router`: 713 lines mirroring every
  `MaterialApp` parameter, to be realigned on every `material_ui` release;
  the builder costs six lines in the app.
- `AppThemes` and `AppThemes.fromColorSchemes`: the text-theme
  normalisation it guaranteed is done inside `AccessibleThemeData`.
- `kMaterialColors`, `kMaterialAccentColors`, `kMaterialFullColors`,
  `kTextThemeMergableEnglishLike2021`, `IconSize`, `PaddingSize`: become
  private.
- `SettingsGroup` as a public widget: private.

## 12. `accessibility_cupertino`

Built on `cupertino_ui`. Views only. Re-exports `flutter_accessibility` and
`AccessibilityLocalizations`. Full parity with the Material package.

### 12.1 Theme builder

`CupertinoApp` has no `themeMode` or `darkTheme`; brightness lives in
`CupertinoThemeData.brightness`, where `null` follows the platform. The
builder therefore yields a single theme:

```dart
AccessibleCupertinoThemeBuilder({
  CupertinoThemeData? theme,   // default const CupertinoThemeData()
  required Widget Function(BuildContext, CupertinoThemeData) builder,
})
```

```dart
AccessibleCupertinoThemeBuilder(
  theme: cupertinoTheme,
  builder: (context, theme) => CupertinoApp(
    theme: theme,
    localizationsDelegates: [
      ...GlobalCupertinoLocalizations.delegates,
      AccessibilityLocalizations.delegate,
    ],
    supportedLocales: AccessibilityLocalizations.supportedLocales,
    home: const HomePage(),
  ),
)
```

- `brightness` is set from `settings.themeMode`: `system` -> `null`,
  `light` -> `Brightness.light`, `dark` -> `Brightness.dark`.
- `CupertinoApp` does not select high-contrast variants, so the builder
  reads `MediaQuery.highContrastOf(context)` itself (available above
  `CupertinoApp`) and applies the high-contrast profile when true. System
  `CupertinoDynamicColor`s already carry native high-contrast variants; the
  profile covers custom colours.

### 12.2 Theme data

```dart
extension type AccessibleCupertinoThemeData._(CupertinoThemeData _) implements CupertinoThemeData {
  factory AccessibleCupertinoThemeData.from({
    required CupertinoThemeData themeData,
    required AccessibilitySettings settings,
    AccessibleFont? font,
    bool highContrast = false,
  });
}
```

Transforms the eight styles of `CupertinoTextThemeData` (`textStyle`,
`actionTextStyle`, `tabLabelTextStyle`, `navTitleTextStyle`,
`navLargeTitleTextStyle`, `navActionTextStyle`, `pickerTextStyle`,
`dateTimePickerTextStyle`) with scale, spacing, weight, family and colour,
and the four theme colours (`primaryColor`, `primaryContrastingColor`,
`scaffoldBackgroundColor`, `barBackgroundColor`) with the colour profile and
the background override. The same per-script font fallback chain as Material.

### 12.3 Transitions

Cupertino has no `PageTransitionsTheme`. Parity is achieved with:

- `AccessibleCupertinoPageRoute<T>`: a `CupertinoPageRoute` subclass that,
  when `AccessibilityScope.effectsEnabledOf(context)` is false, returns the
  page without transition and with `transitionDuration` zero.
- `AccessibleCupertinoPage<T>`: the `Page` counterpart for Navigator 2.0 and
  go_router.

Apps use them in place of the originals; one line per route.

### 12.4 Settings panel

```dart
CupertinoAccessibilitySettingsPanel({
  AccessibilitySettingsStyle style = AccessibilitySettingsStyle.standard,
  AccessibilitySettingsConfiguration configuration = const AccessibilitySettingsConfiguration(),
})
```

- Same configuration and styles as Material, mapped to the native idiom:
  `standard` is a plain `CupertinoListSection`, `cards` is
  `CupertinoListSection.insetGrouped`.
- Widgets: `CupertinoListTile`, `CupertinoSwitch`, `CupertinoSlider`,
  `CupertinoSlidingSegmentedControl` for the tri-states and text alignment,
  paired `CupertinoButton`s where Material used steppers, a Cupertino-styled
  colour picker, `CupertinoActivityIndicator` in the status card.
- `CupertinoRestoreSettingsButton` and `CupertinoReadMoreText` (wrapping
  `CollapsibleText` with a `CupertinoButton`).
- The colour-profile icon map uses `CupertinoIcons`.

## 13. OS accessibility signals

| OS signal | Applied by Flutter already? | 2.0 behaviour |
|---|---|---|
| Text size (`textScaler`) | Yes, by `Text` | Nothing; settings compose with it |
| Bold text (`boldText`) | Yes, by `Text` | Nothing |
| Dark mode (`platformBrightness`) | Yes, with `system` mode | `AccessibilityThemeMode.system` |
| Increase contrast (`highContrast`) | Only if the app provides high-contrast themes | Material: generated variants; Cupertino: builder applies the profile |
| Reduce motion (`disableAnimations`) | No | `EffectsMode.system` default, resolved in `EffectsBuilder`, page transitions, Cupertino routes |
| Invert colours (`invertColors`) | The OS inverts the screen | Nothing |

Settings are never copied from the OS into storage: copying would double-apply
text size and bold, and a snapshot goes stale when the OS setting changes.

## 14. Testing strategy

| Package | Gate | What is tested |
|---|---|---|
| `accessibility` | 100% | models, JSON round trip and tolerance, profiles, repository semantics of section 5.4 with the fake service, architecture test |
| `flutter_accessibility` | 100% | every ViewModel command produces the right `save` and one notification; scope accessors and assertions; builders with a fake `MediaQuery`; widgets with and without active settings; no `listen` type in the public API |
| `accessibility_shared_preferences` | 100% | section 7 |
| `accessibility_testing` | 100% | the fake's recording and error injection |
| `accessibility_localizations` | none | section 8 |
| `accessibility_font_andika` | none | section 9 |
| `accessibility_material` | none | accessibility-guideline tests (labelled tap targets, tap-target size, text contrast) on the panel in both styles; one rendering test per settings item asserting the command invoked, with the real repository and the fake service; status card in its three visible states; theme builder yields four themes reflecting scale, colour, font and forced contrast; page transitions with effects on and off |
| `accessibility_cupertino` | none | same as Material for its panel, theme and routes |
| examples | as today | analyze everywhere; tests where the 1.x examples had them |

Superfluous tests removed by construction: the 78 per-language files become
two tests; per-widget storage tests disappear because widgets no longer
write to storage.

## 15. Tooling and CI

- Dart pub workspaces: root `pubspec.yaml` with an explicit `workspace:`
  list of package paths (globs need Dart 3.11+ and are adopted once every
  package exists), `resolution: workspace` in every package.
  Intra-workspace dependencies are declared with version constraints
  (`accessibility: ^2.0.0`) and resolve locally.
- melos 7 on top: the configuration lives under `melos:` in the root
  `pubspec.yaml` (melos 7 convention), with scripts `analyze`, `format`,
  `test` (per package, with coverage where gated); `melos version` and
  `melos publish` driven by conventional commits. The `pana` script is
  added in plan 6; the `gen-l10n` script is added in plan 3.
- One `analysis_options.yaml` at the root with the 1.x strict lints,
  included by every package.
- GitHub Actions: one workflow with a package matrix running format,
  `dart analyze --fatal-infos --fatal-warnings`, tests, coverage upload with
  per-package Codecov flags, `very_good_coverage` at 100 only for the four
  gated packages, pana at 160 for every publishable package. Examples:
  analyze, and test where tests exist. Flutter `stable` channel.
- Deploy workflow: builds `examples/material` and `examples/cupertino` for
  web and publishes both to GitHub Pages under `/material` and `/cupertino`.

## 16. Migration from 1.x

### 16.1 Branching and release

- `release/2.0` is the integration branch, created from
  `docs/accessibility-2-0-design`. Each plan is developed on its own
  `feat/...` branch and lands in `release/2.0` through a pull request with a
  Conventional Commits title, merged with a merge commit or a rebase (never a
  squash, so the conventional history survives for melos). When plan 6 is
  merged, `release/2.0` is merged into `master` through a pull request
  titled `feat!: split into the 2.0 package family`.
- Branch `1.x` is created from the last 1.4.x commit: bug fixes only, README
  banner stating it is the line for apps on the legacy Material library.
- Publish order follows dependencies: `accessibility`, `accessibility_testing`,
  `flutter_accessibility`, `accessibility_localizations`,
  `accessibility_shared_preferences`, `accessibility_font_andika`,
  `accessibility_material`, `accessibility_cupertino`. `melos publish`
  computes it.
- The `accessibility` 2.0.0 CHANGELOG explains the split with a "where did it
  go" table.

### 16.2 Renames

| 1.x | 2.0 |
|---|---|
| `import 'package:accessibility/accessibility.dart'` (Material app) | `import 'package:accessibility_material/accessibility_material.dart'` |
| `AccessibilityInitializer`, `AccessibilityInitializer.async` | `AccessibilityScope` + explicit `await repository.load()` |
| `AccessibilitySettingsInherited.of(context)` | `AccessibilityScope.of(context)` / `settingsOf(context)` |
| `SharedPreferencesInherited` | removed; persistence is inside the repository |
| `AccessibilitySettingsViewModel` | `AccessibilitySettingsViewModel` (in `flutter_accessibility`, new API) |
| `SharedPreferencesService` | `AccessibilityStorageService` |
| `SharedPreferencesServiceWithCache`, `createSharedPreferencesWithCache` | `SharedPreferencesAccessibilityStorageService()` |
| `SharedPreferencesServiceLegacy` | `SharedPreferencesAccessibilityStorageService.legacy()` |
| `AccessibleMaterialApp`, `.router` | `AccessibleThemeBuilder` + the app's own `MaterialApp` |
| `AccessibleThemeData.from(themeData:, settings:, colorSettings:, effectsEnabled:)` | `AccessibleThemeData.from(themeData:, settings:, font:, forceHighContrast:)` |
| `ThemeSettingsBuilder` | `AccessibilitySettingsBuilder` / `AccessibleThemeBuilder` |
| `EffectsSettingListenableBuilder` | `EffectsBuilder` |
| `AccessibilitySettings` (widget) | `AccessibilitySettingsPanel` |
| `AccessibilitySettingsCollection` (record) | `AccessibilitySettings` (class) |
| `ThemeMode` in settings | `AccessibilityThemeMode` |
| `effectsAllowed: bool` | `effectsMode: EffectsMode` |
| `TextSettings.textAlignMode: String` | `TextSettings.textAlign: TextAlignMode` |
| `TextSettings.isFontWeightBold` | `TextSettings.isBold` |
| `ColorSettings.pagesBackgroundColorValue` | `ColorSettings.backgroundColor` |
| `ColorSettings.colorProfileLevel` | `ColorSettings.colorProfile` |
| `ColorProfile.icon` | removed (icon maps live in the panels) |
| `DependsOnEffectsSettingPageTransitionsTheme` | `AccessiblePageTransitionsTheme` |
| `AccessibilityLocalizations.localizationsDelegates` | `AccessibilityLocalizations.delegate` added to the app's own list |
| `context.l10na` | `AccessibilityLocalizations.of(context)` |
| `l10na.read_more` and the other snake_case keys | `AccessibilityLocalizations.of(context).readMore`, lowerCamelCase |
| `LocalStorageKeys`, `LocalStorageDefaultValues` | private to the storage adapter; model defaults |
| `AppThemes`, `BuildContextControls`, colour constants, `SettingsGroup` | removed |

Stored user settings survive the upgrade through the key mapping in
section 7. The guide `docs/migration/1.x-to-2.0.md` carries this table and
before/after snippets for the three entry points.

## 17. Documentation and examples

- Root `README.md`: the family landing page. Its opening lines answer the
  objection "the OS already has these settings": the package makes the app
  honour the OS signals Flutter ignores (reduce motion, increase contrast),
  composes with the ones Flutter applies, and adds what the OS does not
  offer (spacing, line height, fonts, colours), including on Flutter Web
  where OS signals only partly arrive. Then a package table with pub badges,
  the three entry points (Material, Cupertino, custom UI) each with a short
  snippet, links to the live demo and the examples.
- `packages/<name>/README.md`: what pub.dev shows. Installation, usage,
  screenshots for the two panels.
- `docs/architecture.md`: the MVVM-to-packages map of section 4 with a
  layer diagram and the dependency rule.
- `docs/migration/1.x-to-2.0.md`: section 16.
- Dartdoc stays at 100%; `dartdoc_options.yaml` per package.
- `examples/material`: the 1.x `basic` example migrated. `examples/cupertino`:
  the same app on Cupertino. `examples/custom_ui`: depends only on
  `flutter_accessibility` and `accessibility_shared_preferences` and shows a
  hand-made settings screen. `examples/multiple_languages`: migrated.
  Each package also ships a minimal `example/main.dart` for the pub.dev tab.

## 18. Work order

Bottom-up, each package green on its own CI before the next starts:

1. Workspace scaffolding, melos, root lints, CI matrix skeleton.
2. `accessibility`.
3. `accessibility_testing`.
4. `flutter_accessibility`.
5. `accessibility_localizations`.
6. `accessibility_shared_preferences`.
7. `accessibility_material`.
8. `accessibility_cupertino`.
9. `accessibility_font_andika`.
10. Examples, deploy workflow.
11. Documentation, migration guide, changelogs.
12. Release.

Cupertino parity is the largest new block; keeping it after Material means
everything else is publishable even if it slips.

## 19. Risks

1. `gen-l10n` emitting the `flutter_localizations` convenience list: handled
   by the post-generation strip in the melos script.
2. pana inside a pub workspace: to be verified on the first CI run; fallback
   is running pana on a temporary copy of each package.
3. `listen` types leaking into `flutter_accessibility`'s public API: guarded
   by a test.
4. `material_ui` and `cupertino_ui` release weekly: caret constraints and CI
   on stable catch breakage early.
5. `AccessibleCupertinoPageRoute` depends on being able to override
   `buildTransitions` on `CupertinoRouteTransitionMixin` in `cupertino_ui`.
6. The November deprecation window: mitigated by the work order.

## 20. Items to verify during planning

These are not open design questions; they are facts to check against source
before the corresponding task is written:

- Whether `cupertino_ui`'s `CupertinoRouteTransitionMixin.buildTransitions`
  can be overridden by a subclass (risk 5).
- Whether Flutter 3.47's `gen-l10n` still emits `localizationsDelegates`
  (risk 1).
- Which members of 1.x `ColorTransformation` the panels actually use.
- Whether pana runs cleanly inside a workspace package directory (risk 2).

## 21. Git conventions

- Commit messages and PR titles follow Conventional Commits (`feat:`,
  `fix:`, `docs:`, `refactor:`, `test:`, `chore:`, `ci:`), optionally scoped
  by package (`feat(material): ...`).
- Branch names use the same types in kebab-case
  (`feat/core-repository`, `docs/accessibility-2-0-design`).
- No AI attribution anywhere: no `Co-Authored-By` trailers, no session
  links, no "generated with" lines in commits, branch names or PR bodies.
