# accessibility 2.0, Plan 4 of 6: `accessibility_material`

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver `packages/accessibility_material` 2.0.0 on `material_ui`: the
theme builder and theme data that apply the settings to a Material app, the
page transitions that honour the effects mode, and the settings panel in its
two styles, ported from 1.x and driven by the `flutter_accessibility`
ViewModel.

**Architecture:** MVVM per the Flutter architecture guide. This package is the
Material part of the UI layer: Views only. They read state with
`AccessibilityScope.settingsOf`/`statusOf`, invoke ViewModel commands with
`AccessibilityScope.of`, and never touch the repository or a storage service.
The theme layer is a pure transformation `ThemeData -> ThemeData` driven by
`AccessibilitySettings`; the text settings go through
`AccessibleTextStyle.applyTextSettings` from `flutter_accessibility`, the
colour profile through `AccessibleColor.withColorProfile`.

**Tech Stack:** Flutter >= 3.44, `material_ui` ^1.1.0 (which re-exports
`package:flutter/widgets.dart` and ships its own `GlobalMaterialLocalizations`),
`flutter_accessibility` 2.0.0, `accessibility_localizations` 2.0.0,
`accessibility_testing` 2.0.0, `flutter_test` (including the accessibility
guidelines), melos 7, GitHub Actions.

**Spec:** `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
(sections 3, 4, 6.4, 11, 13, 14, 15 drive this plan).

**Plan series:** 1 foundation and core (merged, PR #13) · 2 `flutter_accessibility`
(merged, PRs #14, #15) · 3 localizations, shared_preferences, font (merged,
PRs #16, #17) · 4 `accessibility_material` (this) · 5 `accessibility_cupertino`
· 6 examples, deploy, docs, release.

**1.x sources:** the Material code being ported lives on branch `master`
(the 1.4.0 line). Files are read with `git show master:<path>` and, when a
file is ported nearly verbatim, restored with `git checkout master -- <path>`
and moved. The 1.x facts this plan relies on were verified on 2026-09-08 and
are quoted where they matter.

## Global Constraints

- Dart SDK `^3.12.0`; Flutter `>=3.44.0`. Dependencies of the package:
  `accessibility_localizations: ^2.0.0`, `flutter` (sdk),
  `flutter_accessibility: ^2.0.0`, `material_ui: ^1.1.0`; dev dependencies
  `accessibility_testing: ^2.0.0`, `flutter_test` (sdk).
- No file under `lib/` imports `package:flutter/material.dart`,
  `package:flutter/cupertino.dart`, `package:cupertino_ui`, `package:listen`
  or `package:flutter_localizations` (enforced by a test). Material widgets
  come from `package:material_ui/material_ui.dart` only.
- The package re-exports `package:flutter_accessibility/flutter_accessibility.dart`
  and `AccessibilityLocalizations`; its own public API is exactly:
  `AccessibleThemeData`, `AccessibleThemes`, `AccessibleThemeBuilder`,
  `AccessibleThemesWidgetBuilder`, `AccessiblePageTransitionsTheme`,
  `AccessibilitySettingsPanel`, `RestoreSettingsButton`, `ReadMoreText`.
- Views hold no business logic: state from `AccessibilityScope.settingsOf`
  (and `statusOf`), commands through `AccessibilityScope.of(context)`;
  persistence is the ViewModel's concern.
- `ColorProfile.normal` keeps a lightness factor of 0 in the core; the theme
  layer applies a colour profile only when the effective level is not
  `normal`.
- The text settings are applied to every text style of the theme through
  `applyTextSettings(settings.textSettings, font: font)`; `AccessibleText`
  (in `flutter_accessibility`) applies only alignment and colour, so text is
  never scaled twice.
- Tests: no coverage gate (`coverage_gate: 0` in CI); required tests are
  the accessibility-guideline tests on the panel in both styles, one
  rendering test per settings item asserting the ViewModel command through
  the real repository and the fake service, the status card in its three
  visible states, the theme builder yielding four themes, and the page
  transitions with effects on and off.
- Every public member documented; `package:` imports only under `lib/`;
  80-column lines (import URIs exempt); trailing commas;
  `prefer_expression_function_bodies`; `avoid_positional_boolean_parameters`;
  `use_named_constants`, `prefer_const_constructors`,
  `avoid_redundant_argument_values`; `dart analyze --fatal-infos --fatal-warnings`
  clean including `example/` and `test/`. Infos are fatal: implementers add
  `const` where the analyzer asks and report such edits as formatting.
- Localised strings come from `AccessibilityLocalizations` with lowerCamelCase
  keys (for example `restoreSettings`, `themeProfileSeizureSafeTitle`,
  `changeTextColor`); six new keys are added by Task 3 and translated in all
  81 locales.
- Commits follow Conventional Commits with the scopes `material`, `flutter`
  and `l10n`; branch names use conventional types. No `Co-Authored-By`
  trailer, no session link, no "generated with" line.
- Work happens on branch `feat/accessibility-material` (from `release/2.0`)
  in the worktree `.claude/worktrees/feat-flutter-accessibility`; the branch
  lands in `release/2.0` through a pull request.
- Git commands in this worktree are refused by the tooling when combined
  with other commands: every `git` invocation is its own plain Bash call
  (no `&&`, `;`, `|`, `$(...)`, heredocs or awk/sed on the same line).
  Never `git stash`.
- melos runs as `dart run melos run <script>` from the workspace root;
  dependency resolution is `flutter pub get` at the root. Regenerating the
  localizations is `dart run melos run gen-l10n` only.

---

### Task 1: `AccessibilityScope.statusOf` in `flutter_accessibility`

**Files:**
- Modify: `packages/flutter_accessibility/lib/src/ui/settings/widgets/accessibility_scope.dart`,
  `packages/flutter_accessibility/CHANGELOG.md`
- Test: `packages/flutter_accessibility/test/ui/settings/widgets/accessibility_scope_test.dart`

**Interfaces:**
- Consumes: `AccessibilitySettingsViewModel.status` (an
  `AccessibilitySettingsStatus`, sealed: `AccessibilitySettingsIdle`,
  `AccessibilitySettingsLoading`, `AccessibilitySettingsLoaded`,
  `AccessibilitySettingsLoadFailed(error, stackTrace)`).
- Produces: `static AccessibilitySettingsStatus AccessibilityScope.statusOf(BuildContext context)`,
  registering a dependency like `settingsOf`. The status card of Task 6
  reads it.

- [ ] **Step 1: Write the failing test**

Append to the `AccessibilityScope` group in
`packages/flutter_accessibility/test/ui/settings/widgets/accessibility_scope_test.dart`:

```dart
    testWidgets('statusOf rebuilds the caller when the status changes', (
      tester,
    ) async {
      var builds = 0;
      late AccessibilitySettingsStatus seen;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            builds++;
            seen = AccessibilityScope.statusOf(context);
            return const SizedBox();
          },
        ),
      );
      expect(seen, isA<AccessibilitySettingsLoaded>());
      final load = viewModel.load();
      await tester.pump();
      expect(seen, isA<AccessibilitySettingsLoading>());
      await load;
      await tester.pump();
      expect(seen, isA<AccessibilitySettingsLoaded>());
      expect(builds, 3);
    });
```

Also extend the existing test `accessors assert without a scope` with one
more assertion in the same shape as the others:

```dart
      expect(() => AccessibilityScope.statusOf(captured), throwsAssertionError);
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `cd packages/flutter_accessibility && flutter test test/ui/settings/widgets/accessibility_scope_test.dart`
Expected: compilation error, `statusOf` is not defined.

- [ ] **Step 3: Add the accessor**

In `accessibility_scope.dart`, after `settingsOf`:

```dart
  /// The current load status, registering a dependency so the caller
  /// rebuilds whenever it changes. Asserts when no scope is found.
  static AccessibilitySettingsStatus statusOf(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AccessibilityScope>();
    assert(scope != null, 'No AccessibilityScope found above this widget');
    return scope!.notifier!.status;
  }
```

Update the class doc's second paragraph to: "Widgets read the ViewModel with
[of] (to invoke commands), the settings with [settingsOf] and the load
status with [statusOf] (to rebuild on changes)."

Add to `packages/flutter_accessibility/CHANGELOG.md` under `## 2.0.0`, as a
second bullet:

```markdown
* `AccessibilityScope.statusOf` exposes the load status with a dependency,
  for the status card of the settings panels.
```

- [ ] **Step 4: Run the tests, coverage and analysis**

Run: `cd packages/flutter_accessibility && flutter test --coverage && dart ../../tool/check_coverage.dart coverage/lcov.info 100 && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass (73), `Line coverage: 100.00%`, clean.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
```

```bash
git commit -m "feat(flutter): add AccessibilityScope.statusOf for the settings panels"
```

---

### Task 2: Package skeleton, workspace, CI and the test pump helper

**Files:**
- Create: `packages/accessibility_material/pubspec.yaml`,
  `packages/accessibility_material/analysis_options.yaml`,
  `packages/accessibility_material/.pubignore`,
  `packages/accessibility_material/LICENSE`,
  `packages/accessibility_material/CHANGELOG.md`,
  `packages/accessibility_material/README.md`,
  `packages/accessibility_material/lib/accessibility_material.dart`,
  `packages/accessibility_material/lib/src/ui/core/panel_localizations.dart`,
  `packages/accessibility_material/test/architecture_test.dart`,
  `packages/accessibility_material/test/helpers/pump_material.dart`,
  `packages/accessibility_material/test/helpers/pump_material_test.dart`
- Modify: `pubspec.yaml` (root), `.github/workflows/build.yml`

**Interfaces:**
- Produces: a resolvable workspace member `accessibility_material` whose
  `dart analyze` is clean; the test helper
  `Future<AccessibilitySettingsViewModel> pumpMaterial(WidgetTester tester, Widget child, {AccessibilitySettings initial, List<AccessibleFont> fonts, bool disableAnimations, bool highContrast, ThemeData? theme, AccessibilityStorageService? service})`
  used by every later test; the internal extension
  `BuildContext.l10n` returning `AccessibilityLocalizations`.

- [ ] **Step 1: Create the package files**

`packages/accessibility_material/pubspec.yaml`:

```yaml
name: accessibility_material
description: Material theme builder and settings panel of the accessibility package family, built on material_ui.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_material
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - wcag
  - material
  - theme
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  accessibility_localizations: ^2.0.0
  flutter:
    sdk: flutter
  flutter_accessibility: ^2.0.0
  material_ui: ^1.1.0

dev_dependencies:
  accessibility_testing: ^2.0.0
  flutter_test:
    sdk: flutter
```

`packages/accessibility_material/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

`packages/accessibility_material/.pubignore`:

```
analysis_options.yaml
coverage/
```

Copy the licence: `cp LICENSE packages/accessibility_material/LICENSE`.

`packages/accessibility_material/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release, extracted from `accessibility` 1.x and rebuilt on
  `material_ui`: `AccessibleThemeBuilder` and `AccessibleThemeData` apply
  the settings to the app's themes (with high-contrast variants),
  `AccessiblePageTransitionsTheme` honours the effects mode, and
  `AccessibilitySettingsPanel` offers the settings in the standard and the
  cards style, driven by the `flutter_accessibility` ViewModel.
```

`packages/accessibility_material/README.md` (extended in Task 11):

```markdown
# accessibility_material

The Material layer of the accessibility package family, built on
`material_ui`. It re-exports `flutter_accessibility` and
`AccessibilityLocalizations`, so this is the only import a Material app
needs.

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
```

`packages/accessibility_material/lib/accessibility_material.dart`:

```dart
/// Material theme builder and settings panel of the accessibility package
/// family, built on `material_ui`.
///
/// Re-exports `package:flutter_accessibility` and
/// `AccessibilityLocalizations`.
library;

export 'package:accessibility_localizations/accessibility_localizations.dart'
    show AccessibilityLocalizations;
export 'package:flutter_accessibility/flutter_accessibility.dart';
```

The package's own exports are appended by the tasks that create them.

`packages/accessibility_material/lib/src/ui/core/panel_localizations.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// Shorthand for the package's localised strings.
extension PanelLocalizations on BuildContext {
  /// The translations above this context.
  AccessibilityLocalizations get l10n => AccessibilityLocalizations.of(this);
}
```

- [ ] **Step 2: Register the package and the CI entry**

In the root `pubspec.yaml`, add `- packages/accessibility_material` at the
end of the `workspace:` list.

In `.github/workflows/build.yml`, append to `matrix.include`:

```yaml
          - package: accessibility_material
            coverage_gate: 0
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
            test_command: flutter test --coverage
```

Run: `flutter pub get`
Expected: resolves with `material_ui` 1.1.x and `cupertino_ui` 1.0.x in
`pubspec.lock`.

- [ ] **Step 3: Write the architecture test**

`packages/accessibility_material/test/architecture_test.dart`:

```dart
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const forbidden = [
  'package:flutter/material.dart',
  'package:flutter/cupertino.dart',
  'package:cupertino_ui',
  'package:listen',
  'package:flutter_localizations',
];

void main() {
  test('lib builds on material_ui only', () {
    final offenders = <String>[];
    final files = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    for (final file in files) {
      for (final line in file.readAsLinesSync()) {
        final trimmed = line.trim();
        final isDirective =
            trimmed.startsWith('import ') || trimmed.startsWith('export ');
        if (isDirective && forbidden.any(trimmed.contains)) {
          offenders.add('${file.path}: $trimmed');
        }
      }
    }
    expect(offenders, isEmpty);
  });
}
```

- [ ] **Step 4: Write the pump helper and its smoke test**

`packages/accessibility_material/test/helpers/pump_material.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

/// Pumps [child] inside a `Scaffold` of a `MaterialApp` under an
/// [AccessibilityScope], with the Material and accessibility translations
/// loaded, and returns the ViewModel so tests can invoke commands.
///
/// The repository is backed by [service] (a
/// [FakeAccessibilityStorageService] holding [initial] by default) and is
/// loaded before the first frame. [theme] replaces the default light theme.
/// [disableAnimations] and [highContrast] set the media query flags.
Future<AccessibilitySettingsViewModel> pumpMaterial(
  WidgetTester tester,
  Widget child, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  List<AccessibleFont> fonts = const [],
  bool disableAnimations = false,
  bool highContrast = false,
  ThemeData? theme,
  AccessibilityStorageService? service,
}) async {
  final repository = AccessibilitySettingsRepository(
    service: service ?? FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(
    repository: repository,
    accessibleFonts: fonts,
  );
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  await tester.pumpWidget(
    AccessibilityScope(
      viewModel: viewModel,
      child: MediaQuery(
        data: MediaQueryData(
          size: tester.view.physicalSize / tester.view.devicePixelRatio,
          disableAnimations: disableAnimations,
          highContrast: highContrast,
        ),
        child: MaterialApp(
          theme: theme,
          localizationsDelegates: const [
            ...GlobalMaterialLocalizations.delegates,
            AccessibilityLocalizations.delegate,
          ],
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          home: Scaffold(body: child),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return viewModel;
}
```

Tests assert commands through `viewModel.settings` (the value the real
repository saved through the fake service) rather than through widget
state.

Note: `pumpAndSettle` waits for the deferred locale library of
`AccessibilityLocalizations` to load. If the `MediaQuery` above `MaterialApp`
is ignored by `material_ui`'s app on this version (the media query flags
never reach the widgets), replace it with `tester.platformDispatcher`
overrides (`accessibilityFeaturesTestValue`) and report it.

`packages/accessibility_material/test/helpers/pump_material_test.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'pump_material.dart';

void main() {
  testWidgets('pumpMaterial provides the scope, Material and the strings', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return Text(AccessibilityLocalizations.of(context).accessibility);
        },
      ),
    );
    expect(find.text('Accessibility'), findsOneWidget);
    expect(Theme.of(captured).useMaterial3, isTrue);
    expect(MaterialLocalizations.of(captured).okButtonLabel, 'OK');
  });

  testWidgets('pumpMaterial forwards the media query flags', (tester) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return const SizedBox();
        },
      ),
      disableAnimations: true,
      highContrast: true,
    );
    expect(MediaQuery.disableAnimationsOf(captured), isTrue);
    expect(MediaQuery.highContrastOf(captured), isTrue);
  });
}
```

- [ ] **Step 5: Verify and commit**

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: 3 tests pass, clean.

```bash
git add pubspec.yaml pubspec.lock .github/workflows/build.yml packages/accessibility_material
```

```bash
git commit -m "feat(material): add the accessibility_material package skeleton and wire it into melos and CI"
```

---

### Task 3: Theme mode and effects mode labels in `accessibility_localizations`

**Files:**
- Modify: `packages/accessibility_localizations/lib/l10n/app_<locale>.arb` (81 files),
  `packages/accessibility_localizations/lib/src/generated/*` (regenerated),
  `packages/accessibility_localizations/CHANGELOG.md`
- Test: `packages/accessibility_localizations/test/arb_consistency_test.dart`,
  `packages/accessibility_localizations/test/accessibility_localizations_test.dart`

**Interfaces:**
- Produces: the getters `themeModeSystem`, `themeModeLight`, `themeModeDark`,
  `effectsModeSystem`, `effectsModeEnabled`, `effectsModeDisabled` on
  `AccessibilityLocalizations`, used by the tri-state controls of Task 7.

- [ ] **Step 1: Add the keys to the template**

Append to `packages/accessibility_localizations/lib/l10n/app_en.arb`, before
the closing brace (keep valid JSON, two-space indentation):

```json
  "themeModeSystem": "System",
  "@themeModeSystem": {
    "description": "Theme mode segment: follow the system light or dark setting"
  },
  "themeModeLight": "Light",
  "@themeModeLight": {
    "description": "Theme mode segment: always the light theme"
  },
  "themeModeDark": "Dark",
  "@themeModeDark": {
    "description": "Theme mode segment: always the dark theme"
  },
  "effectsModeSystem": "System",
  "@effectsModeSystem": {
    "description": "Effects mode segment: follow the system reduce-motion setting"
  },
  "effectsModeEnabled": "On",
  "@effectsModeEnabled": {
    "description": "Effects mode segment: animations always on"
  },
  "effectsModeDisabled": "Off",
  "@effectsModeDisabled": {
    "description": "Effects mode segment: animations always off"
  }
```

Italian (`app_it.arb`), the reference for the other translations:

```json
  "themeModeSystem": "Sistema",
  "themeModeLight": "Chiaro",
  "themeModeDark": "Scuro",
  "effectsModeSystem": "Sistema",
  "effectsModeEnabled": "Attivi",
  "effectsModeDisabled": "Disattivi"
```

Add the six keys, translated into each locale's language, to the other 79
ARB files, reusing the register and terminology already present in that file
(the existing `themeMode`, `effects` and `toggleDarkMode` values are the
reference). Every locale gets all six keys.

- [ ] **Step 2: Regenerate and update the tests**

Run: `dart run melos run gen-l10n`
Expected: the generated files change, `untranslated_messages.json` stays
`{}`.

In `test/arb_consistency_test.dart` change the template count from 73 to
79 (test name and expectation: "the template has 79 messages").

In `test/accessibility_localizations_test.dart` add, inside the group:

```dart
    test('exposes the theme and effects mode labels in English', () async {
      final l10n = await AccessibilityLocalizations.delegate.load(
        const Locale('en'),
      );
      expect(l10n.themeModeSystem, 'System');
      expect(l10n.themeModeLight, 'Light');
      expect(l10n.themeModeDark, 'Dark');
      expect(l10n.effectsModeSystem, 'System');
      expect(l10n.effectsModeEnabled, 'On');
      expect(l10n.effectsModeDisabled, 'Off');
    });
```

Add to the package CHANGELOG's 2.0.0 entry a second bullet:

```markdown
* Six keys for the tri-state theme and effects controls: `themeModeSystem`,
  `themeModeLight`, `themeModeDark`, `effectsModeSystem`,
  `effectsModeEnabled`, `effectsModeDisabled`.
```

- [ ] **Step 3: Verify and commit**

Run: `cd packages/accessibility_localizations && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: 12 tests pass, clean. From the workspace root, run
`dart run melos run gen-l10n` a second time and confirm `git status --porcelain`
lists no generated file with a content change (`git diff --stat` empty for
`lib/src/generated`).

```bash
git add packages/accessibility_localizations
```

```bash
git commit -m "feat(l10n): add the theme and effects mode labels"
```

---

### Task 4: `AccessibleThemeData` and `AccessiblePageTransitionsTheme`

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/theme/text_theme_normalization.dart`,
  `packages/accessibility_material/lib/src/ui/theme/accessible_page_transitions_theme.dart`,
  `packages/accessibility_material/lib/src/ui/theme/accessible_theme_data.dart`
- Modify: `packages/accessibility_material/lib/accessibility_material.dart`
- Test: `packages/accessibility_material/test/ui/theme/accessible_theme_data_test.dart`,
  `packages/accessibility_material/test/ui/theme/accessible_page_transitions_theme_test.dart`

**Interfaces:**
- Consumes: `TextStyle.applyTextSettings(TextSettings, {AccessibleFont? font})`
  and `Color.withColorProfile(ColorProfile)` from `flutter_accessibility`;
  `TextSettings.copyWith(color: null)` (the core's sentinel `copyWith` clears
  a field when `null` is passed explicitly); `ColorProfile.fromLevel`;
  `AccessibilityScope.maybeOf` and `effectsEnabledOf`.
- Produces: `AccessibleThemeData.from({required ThemeData themeData, required AccessibilitySettings settings, AccessibleFont? font, bool forceHighContrast = false})`
  (an extension type implementing `ThemeData`),
  `AccessiblePageTransitionsTheme({Map<TargetPlatform, PageTransitionsBuilder>? builders})`,
  and the internal constant `kMergeableEnglishLike2021`. Task 5 builds the
  four themes with `from`.

The 1.x transformation (`master:lib/src/core/extensions/accessible_theme_data.dart`)
is reproduced with three changes: nullable fields replace the sentinel
comparisons, every text style goes through `applyTextSettings`, and the
colour adjustment goes through `withColorProfile`. Two 1.x details are
deliberately changed: the app's own page-transition builders are kept
(1.x replaced them with Material's defaults), and the input decoration
theme, which 1.x left commented out pending `InputDecorationThemeData`, is
now applied because `material_ui` 1.1 types `ThemeData.inputDecorationTheme`
as `InputDecorationThemeData` (its `errorStyle` keeps its own colour).

- [ ] **Step 1: Write the normalisation constant**

`packages/accessibility_material/lib/src/ui/theme/text_theme_normalization.dart`
(the values are `Typography.englishLike2021`, the Material 3 type scale,
with `inherit: true` so `copyWith`/`merge` compose; copied from
`master:lib/src/core/constants/text_theme_config.dart`):

```dart
import 'package:material_ui/material_ui.dart';

/// `Typography.englishLike2021` with `inherit: true` and explicit sizes.
///
/// `ThemeData.light()` and `.dark()` build their text themes with
/// `inherit: false`, which stops `TextStyle.copyWith` and `merge` from
/// composing in descendants. Merging a theme's text theme over this constant
/// first makes the accessibility overrides apply reliably.
const kMergeableEnglishLike2021 = TextTheme(
  displayLarge: TextStyle(
    debugLabel: 'englishLike displayLarge 2021',
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  displayMedium: TextStyle(
    debugLabel: 'englishLike displayMedium 2021',
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  displaySmall: TextStyle(
    debugLabel: 'englishLike displaySmall 2021',
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  headlineLarge: TextStyle(
    debugLabel: 'englishLike headlineLarge 2021',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  headlineMedium: TextStyle(
    debugLabel: 'englishLike headlineMedium 2021',
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  headlineSmall: TextStyle(
    debugLabel: 'englishLike headlineSmall 2021',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  titleLarge: TextStyle(
    debugLabel: 'englishLike titleLarge 2021',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.27,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  titleMedium: TextStyle(
    debugLabel: 'englishLike titleMedium 2021',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  titleSmall: TextStyle(
    debugLabel: 'englishLike titleSmall 2021',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  labelLarge: TextStyle(
    debugLabel: 'englishLike labelLarge 2021',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  labelMedium: TextStyle(
    debugLabel: 'englishLike labelMedium 2021',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  labelSmall: TextStyle(
    debugLabel: 'englishLike labelSmall 2021',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  bodyLarge: TextStyle(
    debugLabel: 'englishLike bodyLarge 2021',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  bodyMedium: TextStyle(
    debugLabel: 'englishLike bodyMedium 2021',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  bodySmall: TextStyle(
    debugLabel: 'englishLike bodySmall 2021',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
);
```

- [ ] **Step 2: Write the page transitions theme**

`packages/accessibility_material/lib/src/ui/theme/accessible_page_transitions_theme.dart`:

```dart
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A [PageTransitionsTheme] that skips the transition when effects are off.
///
/// Effects are resolved with [AccessibilityScope.effectsEnabledOf] when the
/// route is built, so both the user's choice and the OS reduce-motion
/// signal are honoured. Without an [AccessibilityScope] above the route the
/// transition plays normally. The app's own [builders] are kept.
final class AccessiblePageTransitionsTheme extends PageTransitionsTheme {
  /// Creates the theme over [builders], Material's defaults when omitted.
  const AccessiblePageTransitionsTheme({super.builders});

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final hasScope = AccessibilityScope.maybeOf(context) != null;
    if (hasScope && !AccessibilityScope.effectsEnabledOf(context)) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
```

The base constructor declares its parameter as a private field-formal
(`this._builders`) whose public name is `builders`, so `super.builders`
should forward it. If it does not compile on the installed `material_ui`,
declare the constructor as
`const AccessiblePageTransitionsTheme({required Map<TargetPlatform, PageTransitionsBuilder> builders}) : super(builders: builders)`,
have `AccessibleThemeData.from` (Step 5) always pass
`transitions.builders`, use `const PageTransitionsTheme().builders` in the
tests that construct the theme directly, and report it.

- [ ] **Step 3: Write the failing theme data tests**

`packages/accessibility_material/test/ui/theme/accessible_theme_data_test.dart`:

```dart
import 'package:accessibility_material/src/ui/theme/accessible_page_transitions_theme.dart';
import 'package:accessibility_material/src/ui/theme/accessible_theme_data.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

ThemeData base() => ThemeData(fontFamily: 'AppFont');

AccessibleThemeData themed(
  AccessibilitySettings settings, {
  ThemeData? theme,
  AccessibleFont? font,
  bool forceHighContrast = false,
}) => AccessibleThemeData.from(
  themeData: theme ?? base(),
  settings: settings,
  font: font,
  forceHighContrast: forceHighContrast,
);

void main() {
  group('AccessibleThemeData.from', () {
    test('normalises the text theme and installs the transitions only', () {
      final theme = themed(AccessibilitySettings.defaults);
      expect(theme.textTheme.bodyMedium?.fontSize, 14);
      expect(theme.textTheme.bodyMedium?.inherit, isTrue);
      expect(theme.primaryTextTheme.bodyMedium?.inherit, isTrue);
      expect(
        theme.pageTransitionsTheme,
        isA<AccessiblePageTransitionsTheme>(),
      );
      expect(theme.colorScheme.primary, base().colorScheme.primary);
      expect(theme.scaffoldBackgroundColor, base().scaffoldBackgroundColor);
    });

    test('keeps the app page transition builders', () {
      final custom = base().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()},
        ),
      );
      final theme = themed(AccessibilitySettings.defaults, theme: custom);
      expect(
        theme.pageTransitionsTheme.builders[TargetPlatform.android],
        isA<ZoomPageTransitionsBuilder>(),
      );
      final again = themed(AccessibilitySettings.defaults, theme: theme);
      expect(again.pageTransitionsTheme, same(theme.pageTransitionsTheme));
    });

    test('scales every text theme style', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      expect(theme.textTheme.bodyMedium?.fontSize, 28);
      expect(theme.textTheme.displayLarge?.fontSize, 114);
      expect(theme.primaryTextTheme.labelSmall?.fontSize, 22);
    });

    test('applies spacing, height, weight and colour', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(
            lineHeight: 1.8,
            letterSpacing: 1,
            wordSpacing: 2,
            isBold: true,
            color: 0xFF112233,
          ),
        ),
      );
      final style = theme.textTheme.bodyMedium!;
      expect(style.height, 1.8);
      expect(style.letterSpacing, 1);
      expect(style.wordSpacing, 2);
      expect(style.fontWeight, FontWeight.bold);
      expect(style.color, const Color(0xFF112233));
      expect(theme.appBarTheme.foregroundColor, const Color(0xFF112233));
      expect(theme.listTileTheme.textColor, const Color(0xFF112233));
      expect(
        theme.elevatedButtonTheme.style?.foregroundColor?.resolve({}),
        const Color(0xFF112233),
      );
    });

    test('qualifies the accessible font and keeps the app font as fallback', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(fontFamily: 'Andika'),
        ),
        font: andika,
      );
      final style = theme.textTheme.bodyMedium!;
      expect(style.fontFamily, 'packages/accessibility_font_andika/Andika');
      expect(style.fontFamilyFallback, contains('AppFont'));
    });

    test('scales component text styles that the app defines', () {
      final app = base();
      final custom = app.copyWith(
        appBarTheme: app.appBarTheme.copyWith(
          titleTextStyle: const TextStyle(fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 10),
          ),
        ),
        inputDecorationTheme: app.inputDecorationTheme.copyWith(
          labelStyle: const TextStyle(fontSize: 12),
          errorStyle: const TextStyle(fontSize: 12, color: Color(0xFFFF0000)),
        ),
      );
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2, color: 0xFF0000FF),
        ),
        theme: custom,
      );
      expect(theme.appBarTheme.titleTextStyle?.fontSize, 40);
      expect(
        theme.elevatedButtonTheme.style?.textStyle?.resolve({})?.fontSize,
        20,
      );
      expect(theme.inputDecorationTheme.labelStyle?.fontSize, 24);
      expect(
        theme.inputDecorationTheme.labelStyle?.color,
        const Color(0xFF0000FF),
      );
      expect(theme.inputDecorationTheme.errorStyle?.fontSize, 24);
      expect(
        theme.inputDecorationTheme.errorStyle?.color,
        const Color(0xFFFF0000),
      );
    });

    test('leaves the colour scheme alone for the normal profile', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(backgroundColor: 0xFFFFFFF0),
        ),
      );
      expect(theme.colorScheme.primary, base().colorScheme.primary);
      expect(theme.scaffoldBackgroundColor, const Color(0xFFFFFFF0));
      expect(theme.dialogTheme.backgroundColor, const Color(0xFFFFFFF0));
    });

    test('applies the colour profile to the whole scheme', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      for (final color in [
        theme.colorScheme.primary,
        theme.colorScheme.secondary,
        theme.colorScheme.tertiary,
        theme.colorScheme.error,
        theme.colorScheme.surfaceTint,
      ]) {
        expect(HSLColor.fromColor(color).saturation, 0, reason: '$color');
      }
    });

    test('forces the high-contrast profile on request', () {
      final normal = themed(AccessibilitySettings.defaults);
      final forced = themed(
        AccessibilitySettings.defaults,
        forceHighContrast: true,
      );
      final expected = normal.colorScheme.primary.withColorProfile(
        ColorProfile.fromLevel(ColorProfileLevel.highContrast),
      );
      expect(forced.colorScheme.primary, expected);
      expect(forced.colorScheme.primary, isNot(normal.colorScheme.primary));
    });

    test('is a ThemeData', () {
      final ThemeData theme = themed(
        AccessibilitySettingsSamples.everythingSet,
      );
      expect(theme.useMaterial3, isTrue);
    });
  });
}
```

- [ ] **Step 4: Run the tests to verify they fail**

Run: `cd packages/accessibility_material && flutter test test/ui/theme/accessible_theme_data_test.dart`
Expected: compilation error, `accessible_theme_data.dart` not found.

- [ ] **Step 5: Write the theme data**

`packages/accessibility_material/lib/src/ui/theme/accessible_theme_data.dart`:

```dart
import 'package:accessibility_material/src/ui/theme/accessible_page_transitions_theme.dart';
import 'package:accessibility_material/src/ui/theme/text_theme_normalization.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A [ThemeData] with the accessibility settings applied.
///
/// The transformation, moved from 1.x: the text theme is normalised over
/// [kMergeableEnglishLike2021]; the page transitions become an
/// [AccessiblePageTransitionsTheme] over the app's builders; the colour
/// settings set the page background and adjust every colour of the scheme
/// with the colour profile (never for [ColorProfileLevel.normal]); the text
/// settings are applied through [AccessibleTextStyle.applyTextSettings] to
/// every text style of the theme and of its component themes, and the text
/// colour to the component foregrounds. [AccessibleText] therefore applies
/// only alignment and colour.
extension type AccessibleThemeData._(ThemeData _themeData)
    implements ThemeData {
  /// Applies [settings] to [themeData].
  ///
  /// [font] is the registered font matching the settings' family, used to
  /// qualify the family with its package. [forceHighContrast] applies the
  /// high-contrast colour profile regardless of the settings, for the themes
  /// `MaterialApp` selects when the OS asks for more contrast.
  factory AccessibleThemeData.from({
    required ThemeData themeData,
    required AccessibilitySettings settings,
    AccessibleFont? font,
    bool forceHighContrast = false,
  }) {
    final normalized = themeData.copyWith(
      textTheme: kMergeableEnglishLike2021.merge(themeData.textTheme),
      primaryTextTheme: kMergeableEnglishLike2021.merge(
        themeData.primaryTextTheme,
      ),
    );
    final transitions = normalized.pageTransitionsTheme;
    final withTransitions = transitions is AccessiblePageTransitionsTheme
        ? normalized
        : normalized.copyWith(
            pageTransitionsTheme: AccessiblePageTransitionsTheme(
              builders: transitions.builders,
            ),
          );
    final colored = _applyColorSettings(
      withTransitions,
      settings.colorSettings,
      forceHighContrast: forceHighContrast,
    );
    return AccessibleThemeData._(
      _applyTextSettings(colored, settings.textSettings, font),
    );
  }
}

ThemeData _applyColorSettings(
  ThemeData theme,
  ColorSettings settings, {
  required bool forceHighContrast,
}) {
  final background = settings.backgroundColor;
  var result = theme;
  if (background != null) {
    final color = Color(background);
    result = result.copyWith(
      scaffoldBackgroundColor: color,
      dialogTheme: result.dialogTheme.copyWith(backgroundColor: color),
    );
  }
  final level = forceHighContrast
      ? ColorProfileLevel.highContrast
      : settings.colorProfile;
  if (level == ColorProfileLevel.normal) {
    return result;
  }
  final profile = ColorProfile.fromLevel(level);
  Color adjust(Color color) => color.withColorProfile(profile);
  final scheme = result.colorScheme;
  return result.copyWith(
    colorScheme: scheme.copyWith(
      primary: adjust(scheme.primary),
      onPrimary: adjust(scheme.onPrimary),
      primaryContainer: adjust(scheme.primaryContainer),
      onPrimaryContainer: adjust(scheme.onPrimaryContainer),
      primaryFixed: adjust(scheme.primaryFixed),
      primaryFixedDim: adjust(scheme.primaryFixedDim),
      onPrimaryFixed: adjust(scheme.onPrimaryFixed),
      onPrimaryFixedVariant: adjust(scheme.onPrimaryFixedVariant),
      secondary: adjust(scheme.secondary),
      onSecondary: adjust(scheme.onSecondary),
      secondaryContainer: adjust(scheme.secondaryContainer),
      onSecondaryContainer: adjust(scheme.onSecondaryContainer),
      secondaryFixed: adjust(scheme.secondaryFixed),
      secondaryFixedDim: adjust(scheme.secondaryFixedDim),
      onSecondaryFixed: adjust(scheme.onSecondaryFixed),
      onSecondaryFixedVariant: adjust(scheme.onSecondaryFixedVariant),
      tertiary: adjust(scheme.tertiary),
      onTertiary: adjust(scheme.onTertiary),
      tertiaryContainer: adjust(scheme.tertiaryContainer),
      onTertiaryContainer: adjust(scheme.onTertiaryContainer),
      tertiaryFixed: adjust(scheme.tertiaryFixed),
      tertiaryFixedDim: adjust(scheme.tertiaryFixedDim),
      onTertiaryFixed: adjust(scheme.onTertiaryFixed),
      onTertiaryFixedVariant: adjust(scheme.onTertiaryFixedVariant),
      error: adjust(scheme.error),
      onError: adjust(scheme.onError),
      errorContainer: adjust(scheme.errorContainer),
      onErrorContainer: adjust(scheme.onErrorContainer),
      surface: adjust(scheme.surface),
      onSurface: adjust(scheme.onSurface),
      surfaceDim: adjust(scheme.surfaceDim),
      surfaceBright: adjust(scheme.surfaceBright),
      surfaceContainerLowest: adjust(scheme.surfaceContainerLowest),
      surfaceContainerLow: adjust(scheme.surfaceContainerLow),
      surfaceContainer: adjust(scheme.surfaceContainer),
      surfaceContainerHigh: adjust(scheme.surfaceContainerHigh),
      surfaceContainerHighest: adjust(scheme.surfaceContainerHighest),
      onSurfaceVariant: adjust(scheme.onSurfaceVariant),
      outline: adjust(scheme.outline),
      outlineVariant: adjust(scheme.outlineVariant),
      shadow: adjust(scheme.shadow),
      scrim: adjust(scheme.scrim),
      inverseSurface: adjust(scheme.inverseSurface),
      onInverseSurface: adjust(scheme.onInverseSurface),
      inversePrimary: adjust(scheme.inversePrimary),
      surfaceTint: adjust(scheme.surfaceTint),
    ),
  );
}

ThemeData _applyTextSettings(
  ThemeData theme,
  TextSettings text,
  AccessibleFont? font,
) {
  if (text.isDefault) {
    return theme;
  }
  final textKeepingColor = text.copyWith(color: null);
  final color = text.color == null ? null : Color(text.color!);
  final colorProperty = color == null ? null : WidgetStatePropertyAll(color);

  TextStyle? style(TextStyle? source) =>
      source?.applyTextSettings(text, font: font);
  TextStyle? styleKeepingColor(TextStyle? source) =>
      source?.applyTextSettings(textKeepingColor, font: font);
  WidgetStateProperty<TextStyle?> stateStyle(
    WidgetStateProperty<TextStyle?>? source,
  ) => WidgetStatePropertyAll(
    (source?.resolve({}) ?? const TextStyle()).applyTextSettings(
      text,
      font: font,
    ),
  );
  TextTheme? textTheme(TextTheme? source) => source?.copyWith(
    displayLarge: style(source.displayLarge),
    displayMedium: style(source.displayMedium),
    displaySmall: style(source.displaySmall),
    headlineLarge: style(source.headlineLarge),
    headlineMedium: style(source.headlineMedium),
    headlineSmall: style(source.headlineSmall),
    titleLarge: style(source.titleLarge),
    titleMedium: style(source.titleMedium),
    titleSmall: style(source.titleSmall),
    labelLarge: style(source.labelLarge),
    labelMedium: style(source.labelMedium),
    labelSmall: style(source.labelSmall),
    bodyLarge: style(source.bodyLarge),
    bodyMedium: style(source.bodyMedium),
    bodySmall: style(source.bodySmall),
  );
  // Buttons take the colour through foregroundColor, never through the
  // text style, which would be shadowed by it.
  ButtonStyle button(ButtonStyle? source) {
    final existing = source?.textStyle?.resolve({});
    return (source ?? const ButtonStyle()).copyWith(
      foregroundColor: colorProperty,
      textStyle: existing == null
          ? null
          : WidgetStatePropertyAll(
              existing.applyTextSettings(textKeepingColor, font: font),
            ),
    );
  }

  final input = theme.inputDecorationTheme;
  final cupertino = theme.cupertinoOverrideTheme;
  return theme.copyWith(
    textTheme: textTheme(theme.textTheme),
    primaryTextTheme: textTheme(theme.primaryTextTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: button(theme.elevatedButtonTheme.style),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: button(theme.outlinedButtonTheme.style),
    ),
    textButtonTheme: TextButtonThemeData(
      style: button(theme.textButtonTheme.style),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: button(theme.filledButtonTheme.style),
    ),
    segmentedButtonTheme: theme.segmentedButtonTheme.copyWith(
      style: button(theme.segmentedButtonTheme.style),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: button(theme.menuButtonTheme.style),
    ),
    toggleButtonsTheme: theme.toggleButtonsTheme.copyWith(
      textStyle: style(theme.toggleButtonsTheme.textStyle),
    ),
    appBarTheme: theme.appBarTheme.copyWith(
      titleTextStyle: style(theme.appBarTheme.titleTextStyle),
      toolbarTextStyle: style(theme.appBarTheme.toolbarTextStyle),
      foregroundColor: color,
    ),
    tabBarTheme: theme.tabBarTheme.copyWith(
      labelStyle: style(theme.tabBarTheme.labelStyle),
      unselectedLabelStyle: styleKeepingColor(
        theme.tabBarTheme.unselectedLabelStyle,
      ),
      labelColor: color,
      indicatorColor: color,
    ),
    inputDecorationTheme: input.copyWith(
      labelStyle: style(input.labelStyle),
      floatingLabelStyle: style(input.floatingLabelStyle),
      helperStyle: style(input.helperStyle),
      hintStyle: style(input.hintStyle),
      errorStyle: styleKeepingColor(input.errorStyle),
      prefixStyle: style(input.prefixStyle),
      suffixStyle: style(input.suffixStyle),
      counterStyle: style(input.counterStyle),
    ),
    listTileTheme: theme.listTileTheme.copyWith(
      titleTextStyle: style(theme.listTileTheme.titleTextStyle),
      subtitleTextStyle: style(theme.listTileTheme.subtitleTextStyle),
      leadingAndTrailingTextStyle: styleKeepingColor(
        theme.listTileTheme.leadingAndTrailingTextStyle,
      ),
      textColor: color,
    ),
    chipTheme: theme.chipTheme.copyWith(
      labelStyle: style(theme.chipTheme.labelStyle),
    ),
    dialogTheme: theme.dialogTheme.copyWith(
      titleTextStyle: style(theme.dialogTheme.titleTextStyle),
      contentTextStyle: style(theme.dialogTheme.contentTextStyle),
    ),
    snackBarTheme: theme.snackBarTheme.copyWith(
      contentTextStyle: style(theme.snackBarTheme.contentTextStyle),
    ),
    tooltipTheme: theme.tooltipTheme.copyWith(
      textStyle: style(theme.tooltipTheme.textStyle),
    ),
    bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
      selectedLabelStyle: style(
        theme.bottomNavigationBarTheme.selectedLabelStyle,
      ),
      unselectedLabelStyle: styleKeepingColor(
        theme.bottomNavigationBarTheme.unselectedLabelStyle,
      ),
      selectedItemColor: color,
    ),
    navigationBarTheme: theme.navigationBarTheme.copyWith(
      labelTextStyle: stateStyle(theme.navigationBarTheme.labelTextStyle),
    ),
    navigationDrawerTheme: theme.navigationDrawerTheme.copyWith(
      labelTextStyle: stateStyle(theme.navigationDrawerTheme.labelTextStyle),
    ),
    navigationRailTheme: theme.navigationRailTheme.copyWith(
      selectedLabelTextStyle: style(
        theme.navigationRailTheme.selectedLabelTextStyle,
      ),
      unselectedLabelTextStyle: styleKeepingColor(
        theme.navigationRailTheme.unselectedLabelTextStyle,
      ),
    ),
    dataTableTheme: theme.dataTableTheme.copyWith(
      dataTextStyle: style(theme.dataTableTheme.dataTextStyle),
      headingTextStyle: style(theme.dataTableTheme.headingTextStyle),
    ),
    datePickerTheme: theme.datePickerTheme.copyWith(
      headerHelpStyle: style(theme.datePickerTheme.headerHelpStyle),
      headerHeadlineStyle: style(theme.datePickerTheme.headerHeadlineStyle),
      weekdayStyle: style(theme.datePickerTheme.weekdayStyle),
      dayStyle: style(theme.datePickerTheme.dayStyle),
      yearStyle: style(theme.datePickerTheme.yearStyle),
      rangePickerHeaderHeadlineStyle: style(
        theme.datePickerTheme.rangePickerHeaderHeadlineStyle,
      ),
      rangePickerHeaderHelpStyle: style(
        theme.datePickerTheme.rangePickerHeaderHelpStyle,
      ),
      cancelButtonStyle: button(theme.datePickerTheme.cancelButtonStyle),
      confirmButtonStyle: button(theme.datePickerTheme.confirmButtonStyle),
      dayForegroundColor: colorProperty,
      yearForegroundColor: colorProperty,
      todayForegroundColor: colorProperty,
      headerForegroundColor: color,
      rangePickerHeaderForegroundColor: color,
    ),
    timePickerTheme: theme.timePickerTheme.copyWith(
      dialTextStyle: style(theme.timePickerTheme.dialTextStyle),
      helpTextStyle: style(theme.timePickerTheme.helpTextStyle),
      dayPeriodTextStyle: style(theme.timePickerTheme.dayPeriodTextStyle),
      hourMinuteTextStyle: style(theme.timePickerTheme.hourMinuteTextStyle),
      timeSelectorSeparatorTextStyle: stateStyle(
        theme.timePickerTheme.timeSelectorSeparatorTextStyle,
      ),
      cancelButtonStyle: button(theme.timePickerTheme.cancelButtonStyle),
      confirmButtonStyle: button(theme.timePickerTheme.confirmButtonStyle),
      dialTextColor: color,
      dayPeriodTextColor: color,
      hourMinuteTextColor: color,
    ),
    cupertinoOverrideTheme: cupertino?.copyWith(
      textTheme: cupertino.textTheme?.copyWith(
        textStyle: style(cupertino.textTheme?.textStyle),
        actionTextStyle: style(cupertino.textTheme?.actionTextStyle),
        actionSmallTextStyle: style(cupertino.textTheme?.actionSmallTextStyle),
        tabLabelTextStyle: style(cupertino.textTheme?.tabLabelTextStyle),
        navTitleTextStyle: style(cupertino.textTheme?.navTitleTextStyle),
        navLargeTitleTextStyle: style(
          cupertino.textTheme?.navLargeTitleTextStyle,
        ),
        navActionTextStyle: style(cupertino.textTheme?.navActionTextStyle),
        pickerTextStyle: style(cupertino.textTheme?.pickerTextStyle),
        dateTimePickerTextStyle: style(
          cupertino.textTheme?.dateTimePickerTextStyle,
        ),
      ),
    ),
    badgeTheme: theme.badgeTheme.copyWith(
      textStyle: style(theme.badgeTheme.textStyle),
      textColor: color,
    ),
    bannerTheme: theme.bannerTheme.copyWith(
      contentTextStyle: style(theme.bannerTheme.contentTextStyle),
    ),
    dropdownMenuTheme: theme.dropdownMenuTheme.copyWith(
      textStyle: style(theme.dropdownMenuTheme.textStyle),
    ),
    floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
      extendedTextStyle: style(
        theme.floatingActionButtonTheme.extendedTextStyle,
      ),
      foregroundColor: color,
    ),
    expansionTileTheme: theme.expansionTileTheme.copyWith(
      collapsedTextColor: color,
      textColor: color,
    ),
    searchViewTheme: theme.searchViewTheme.copyWith(
      headerTextStyle: style(theme.searchViewTheme.headerTextStyle),
      headerHintStyle: style(theme.searchViewTheme.headerHintStyle),
    ),
    searchBarTheme: theme.searchBarTheme.copyWith(
      textStyle: stateStyle(theme.searchBarTheme.textStyle),
      hintStyle: stateStyle(theme.searchBarTheme.hintStyle),
    ),
    popupMenuTheme: theme.popupMenuTheme.copyWith(
      textStyle: style(theme.popupMenuTheme.textStyle),
      labelTextStyle: stateStyle(theme.popupMenuTheme.labelTextStyle),
    ),
  );
}
```

Notes for the implementer:
- `cupertinoOverrideTheme` is typed with `cupertino_ui` classes; the code
  above never names them, so no `cupertino_ui` import is needed. If the
  analyzer still requires the import, drop the `cupertinoOverrideTheme`
  block entirely and report it (the Cupertino package of plan 5 handles
  Cupertino apps).
- If a `copyWith` parameter above does not exist on the installed
  `material_ui` (for example a text style that became a
  `WidgetStateProperty`), adapt to the real signature with `style` or
  `stateStyle` and report each adaptation.
- The 1.x `rangeSelectionOverlayColor` override is not reproduced: an
  overlay in the text colour is not a text setting.

- [ ] **Step 6: Run the tests to verify they pass**

Run: `cd packages/accessibility_material && flutter test test/ui/theme/accessible_theme_data_test.dart`
Expected: all pass.

- [ ] **Step 7: Write the page transitions test**

`packages/accessibility_material/test/ui/theme/accessible_page_transitions_theme_test.dart`:

```dart
import 'package:accessibility_material/src/ui/theme/accessible_page_transitions_theme.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/pump_material.dart';

void main() {
  const child = SizedBox(key: Key('page'));

  Widget transition(BuildContext context) =>
      const AccessiblePageTransitionsTheme().buildTransitions(
        MaterialPageRoute<void>(builder: (_) => child),
        context,
        const AlwaysStoppedAnimation(0.5),
        const AlwaysStoppedAnimation(0),
        child,
      );

  Widget capture(void Function(BuildContext context) onBuild) => Builder(
    builder: (context) {
      onBuild(context);
      return const SizedBox();
    },
  );

  testWidgets('plays the transition when effects are enabled', (tester) async {
    late BuildContext captured;
    await pumpMaterial(tester, capture((context) => captured = context));
    expect(transition(captured), isNot(same(child)));
  });

  testWidgets('returns the page itself when effects are disabled', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      capture((context) => captured = context),
      initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
    );
    expect(transition(captured), same(child));
  });

  testWidgets('follows the OS reduce-motion signal in system mode', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      capture((context) => captured = context),
      disableAnimations: true,
    );
    expect(transition(captured), same(child));
  });

  testWidgets('plays the transition without a scope', (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(home: capture((context) => captured = context)),
    );
    expect(transition(captured), isNot(same(child)));
  });

  test('keeps the given builders', () {
    const theme = AccessiblePageTransitionsTheme(
      builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()},
    );
    expect(
      theme.builders[TargetPlatform.android],
      isA<ZoomPageTransitionsBuilder>(),
    );
  });
}
```

- [ ] **Step 8: Export, verify and commit**

Append to `lib/accessibility_material.dart`:

```dart
export 'src/ui/theme/accessible_page_transitions_theme.dart'
    show AccessiblePageTransitionsTheme;
export 'src/ui/theme/accessible_theme_data.dart' show AccessibleThemeData;
```

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

Stage `packages/accessibility_material` and commit with the message
`feat(material): add AccessibleThemeData and AccessiblePageTransitionsTheme`.

---

### Task 5: `AccessibleThemeBuilder` and `AccessibleThemes`

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/theme/accessible_theme_builder.dart`
- Modify: `packages/accessibility_material/lib/accessibility_material.dart`
- Test: `packages/accessibility_material/test/ui/theme/accessible_theme_builder_test.dart`

**Interfaces:**
- Consumes: `AccessibleThemeData.from` (Task 4), `AccessibilityScope.settingsOf`
  and `of(context).activeFont`.
- Produces: `AccessibleThemes({required ThemeData light, required ThemeData dark, required ThemeData highContrastLight, required ThemeData highContrastDark, required ThemeMode mode})`,
  `typedef AccessibleThemesWidgetBuilder = Widget Function(BuildContext context, AccessibleThemes themes)`,
  `AccessibleThemeBuilder({required AccessibleThemesWidgetBuilder builder, ThemeData? theme, ThemeData? darkTheme})`.

- [ ] **Step 1: Write the failing tests**

`packages/accessibility_material/test/ui/theme/accessible_theme_builder_test.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_material/src/ui/theme/accessible_theme_builder.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Future<(AccessibilitySettingsViewModel, List<AccessibleThemes>)> pumpBuilder(
  WidgetTester tester, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  ThemeData? theme,
  ThemeData? darkTheme,
  Widget home = const Scaffold(body: Text('home')),
}) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(
    repository: repository,
    accessibleFonts: const [andika],
  );
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  final seen = <AccessibleThemes>[];
  await tester.pumpWidget(
    AccessibilityScope(
      viewModel: viewModel,
      child: AccessibleThemeBuilder(
        theme: theme,
        darkTheme: darkTheme,
        builder: (context, themes) {
          seen.add(themes);
          return MaterialApp(
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
            home: home,
          );
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return (viewModel, seen);
}

void main() {
  group('AccessibleThemeBuilder', () {
    testWidgets('yields four themes reflecting the settings', (tester) async {
      final (_, seen) = await pumpBuilder(
        tester,
        initial: const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2, fontFamily: 'Andika'),
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final themes = seen.last;
      for (final theme in [
        themes.light,
        themes.dark,
        themes.highContrastLight,
        themes.highContrastDark,
      ]) {
        expect(theme.textTheme.bodyMedium?.fontSize, 28);
        expect(
          theme.textTheme.bodyMedium?.fontFamily,
          'packages/accessibility_font_andika/Andika',
        );
        expect(HSLColor.fromColor(theme.colorScheme.primary).saturation, 0);
      }
      expect(themes.light.brightness, Brightness.light);
      expect(themes.dark.brightness, Brightness.dark);
    });

    testWidgets('forces high contrast on the two high-contrast themes', (
      tester,
    ) async {
      final (_, seen) = await pumpBuilder(tester);
      final themes = seen.last;
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(
        themes.highContrastLight.colorScheme.primary,
        themes.light.colorScheme.primary.withColorProfile(profile),
      );
      expect(
        themes.highContrastDark.colorScheme.primary,
        themes.dark.colorScheme.primary.withColorProfile(profile),
      );
      expect(
        themes.light.colorScheme.primary,
        ThemeData.light().colorScheme.primary,
      );
    });

    testWidgets('maps the theme mode', (tester) async {
      final (viewModel, seen) = await pumpBuilder(tester);
      expect(seen.last.mode, ThemeMode.system);
      await viewModel.setThemeMode(AccessibilityThemeMode.dark);
      await tester.pumpAndSettle();
      expect(seen.last.mode, ThemeMode.dark);
      await viewModel.setThemeMode(AccessibilityThemeMode.light);
      await tester.pumpAndSettle();
      expect(seen.last.mode, ThemeMode.light);
    });

    testWidgets('uses the given themes and rebuilds on settings changes', (
      tester,
    ) async {
      final seed = ThemeData(colorSchemeSeed: const Color(0xFF00FF00));
      final (viewModel, seen) = await pumpBuilder(
        tester,
        theme: seed,
        darkTheme: ThemeData(
          colorSchemeSeed: const Color(0xFF00FF00),
          brightness: Brightness.dark,
        ),
      );
      final before = seen.length;
      expect(seen.last.light.colorScheme.primary, seed.colorScheme.primary);
      await viewModel.setTextScaleFactor(1.5);
      await tester.pumpAndSettle();
      expect(seen.length, greaterThan(before));
      expect(seen.last.light.textTheme.bodyMedium?.fontSize, 21);
      expect(seen.last.dark.textTheme.bodyMedium?.fontSize, 21);
    });

    testWidgets('navigates without a transition when effects are off', (
      tester,
    ) async {
      await pumpBuilder(
        tester,
        initial: const AccessibilitySettings(
          effectsMode: EffectsMode.disabled,
        ),
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const Text('second')),
            ),
            child: const Text('go'),
          ),
        ),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.pump();
      expect(find.text('second'), findsOneWidget);
      expect(
        find.ancestor(
          of: find.text('second'),
          matching: find.byWidgetPredicate(
            (widget) => widget is FadeTransition || widget is SlideTransition,
          ),
        ),
        findsNothing,
      );
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `cd packages/accessibility_material && flutter test test/ui/theme/accessible_theme_builder_test.dart`
Expected: compilation error, the builder file does not exist.

- [ ] **Step 3: Write the builder**

`packages/accessibility_material/lib/src/ui/theme/accessible_theme_builder.dart`:

```dart
import 'package:accessibility_material/src/ui/theme/accessible_theme_data.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The four themes and the mode to hand to `MaterialApp`.
final class AccessibleThemes {
  /// Creates the bundle.
  const AccessibleThemes({
    required this.light,
    required this.dark,
    required this.highContrastLight,
    required this.highContrastDark,
    required this.mode,
  });

  /// The light theme with the settings applied.
  final ThemeData light;

  /// The dark theme with the settings applied.
  final ThemeData dark;

  /// [light] with the high-contrast colour profile forced, for
  /// `MaterialApp.highContrastTheme`.
  final ThemeData highContrastLight;

  /// [dark] with the high-contrast colour profile forced, for
  /// `MaterialApp.highContrastDarkTheme`.
  final ThemeData highContrastDark;

  /// The settings' theme mode as `material_ui`'s [ThemeMode].
  final ThemeMode mode;
}

/// Builds the app from the [AccessibleThemes] of the current settings.
typedef AccessibleThemesWidgetBuilder =
    Widget Function(BuildContext context, AccessibleThemes themes);

/// Applies the accessibility settings to the app's themes.
///
/// Place it under an [AccessibilityScope] and above `MaterialApp`; the
/// [builder] receives the four themes and the mode and passes them on. It
/// rebuilds whenever the settings change.
final class AccessibleThemeBuilder extends StatelessWidget {
  /// Creates the builder over [theme] and [darkTheme], which default to
  /// `ThemeData.light()` and `ThemeData.dark()`.
  const AccessibleThemeBuilder({
    required this.builder,
    this.theme,
    this.darkTheme,
    super.key,
  });

  /// Builds the app from the themes.
  final AccessibleThemesWidgetBuilder builder;

  /// The app's light theme, before the settings.
  final ThemeData? theme;

  /// The app's dark theme, before the settings.
  final ThemeData? darkTheme;

  static final ThemeData _defaultLight = ThemeData.light();
  static final ThemeData _defaultDark = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    final settings = AccessibilityScope.settingsOf(context);
    final font = AccessibilityScope.of(context).activeFont;
    final light = theme ?? _defaultLight;
    final dark = darkTheme ?? _defaultDark;
    ThemeData apply(ThemeData base, {required bool forceHighContrast}) =>
        AccessibleThemeData.from(
          themeData: base,
          settings: settings,
          font: font,
          forceHighContrast: forceHighContrast,
        );
    return builder(
      context,
      AccessibleThemes(
        light: apply(light, forceHighContrast: false),
        dark: apply(dark, forceHighContrast: false),
        highContrastLight: apply(light, forceHighContrast: true),
        highContrastDark: apply(dark, forceHighContrast: true),
        mode: switch (settings.themeMode) {
          AccessibilityThemeMode.system => ThemeMode.system,
          AccessibilityThemeMode.light => ThemeMode.light,
          AccessibilityThemeMode.dark => ThemeMode.dark,
        },
      ),
    );
  }
}
```

- [ ] **Step 4: Run the tests to verify they pass**

Run: `cd packages/accessibility_material && flutter test test/ui/theme/accessible_theme_builder_test.dart`
Expected: all pass.

- [ ] **Step 5: Export, verify and commit**

Append to `lib/accessibility_material.dart`:

```dart
export 'src/ui/theme/accessible_theme_builder.dart'
    show AccessibleThemeBuilder, AccessibleThemes, AccessibleThemesWidgetBuilder;
```

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

Stage `packages/accessibility_material` and commit with the message
`feat(material): add AccessibleThemeBuilder yielding the four themes and the mode`.

---

### Task 6: Panel root, status card, groups scaffolding, restore button and read-more text

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/core/panel_metrics.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/panel_scope.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/status_card.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/accessibility_settings_panel.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_group.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_container.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/restore_settings_button.dart`,
  `packages/accessibility_material/lib/src/ui/text/widgets/read_more_text.dart`
- Modify: `packages/accessibility_material/lib/accessibility_material.dart`
- Test: `packages/accessibility_material/test/ui/settings/widgets/status_card_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/accessibility_settings_panel_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/components/restore_settings_button_test.dart`,
  `packages/accessibility_material/test/ui/text/widgets/read_more_text_test.dart`

**Interfaces:**
- Consumes: `AccessibilityScope.statusOf` (Task 1), `of`, `settingsOf`;
  `AccessibilitySettingsConfiguration` and `AccessibilitySettingsStyle`
  from `flutter_accessibility`; `CollapsibleText`; `BuildContext.l10n`
  (Task 2).
- Produces: `AccessibilitySettingsPanel({AccessibilitySettingsStyle style = AccessibilitySettingsStyle.standard, AccessibilitySettingsConfiguration configuration = const AccessibilitySettingsConfiguration()})`;
  internal `PanelScope.of(context)` / `PanelScope.maybeOf(context)` with
  `configuration` and `style`; `StatusCard()`;
  `SettingsGroup({required List<Widget> settings, String? title, Widget separator = const Divider()})`
  (a sliver); `SettingsItemContainer({required Widget child, String? title, double? widthFactor})`;
  `RestoreSettingsButton({ButtonStyle? style})` (public);
  `ReadMoreText({required String text, int maxLines = 3, TextStyle? style})`
  (public); `kSettingsCardMinHeight`, `kPanelPadding`, `kPanelRadius`.
  Tasks 7 to 10 add their group slivers to the panel body where the
  comments mark it.

- [ ] **Step 1: Write the metrics, the scope and the status card**

`packages/accessibility_material/lib/src/ui/core/panel_metrics.dart`:

```dart
/// The minimum height of a settings card.
const double kSettingsCardMinHeight = 120;

/// The padding around panel content.
const double kPanelPadding = 16;

/// The corner radius of groups and cards.
const double kPanelRadius = 15;
```

`packages/accessibility_material/lib/src/ui/settings/widgets/panel_scope.dart`:

```dart
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Provides the panel's configuration and style to its items.
final class PanelScope extends InheritedWidget {
  /// Creates the scope.
  const PanelScope({
    required this.configuration,
    required this.style,
    required super.child,
    super.key,
  });

  /// Which settings the panel shows and the colours it offers.
  final AccessibilitySettingsConfiguration configuration;

  /// The visual style of the panel.
  final AccessibilitySettingsStyle style;

  /// The scope above [context]; asserts when there is none.
  static PanelScope of(BuildContext context) {
    final scope = maybeOf(context);
    assert(scope != null, 'No AccessibilitySettingsPanel above this widget');
    return scope!;
  }

  /// The scope above [context], or `null` outside a panel.
  static PanelScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PanelScope>();

  @override
  bool updateShouldNotify(PanelScope oldWidget) =>
      configuration != oldWidget.configuration || style != oldWidget.style;
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/status_card.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Shows the settings load status at the top of the panel.
///
/// Renders nothing while idle or loaded, a progress indicator while
/// loading, and the failure message with a retry button that calls
/// [AccessibilitySettingsViewModel.load] again.
final class StatusCard extends StatelessWidget {
  /// Creates the card.
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (AccessibilityScope.statusOf(context)) {
      AccessibilitySettingsIdle() ||
      AccessibilitySettingsLoaded() => const SizedBox.shrink(),
      AccessibilitySettingsLoading() => Padding(
        padding: const EdgeInsets.all(kPanelPadding),
        child: Card(
          child: ListTile(
            leading: const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
            title: Text(l10n.settingsLoading),
          ),
        ),
      ),
      AccessibilitySettingsLoadFailed() => Padding(
        padding: const EdgeInsets.all(kPanelPadding),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.error_outline),
            title: Text(l10n.settingsLoadFailed),
            trailing: TextButton(
              onPressed: AccessibilityScope.of(context).load,
              child: Text(l10n.retry),
            ),
          ),
        ),
      ),
    };
  }
}
```

- [ ] **Step 2: Write the group, container, restore button and read-more text**

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_group.dart`
(from `master:lib/src/view/widgets/components/settings_group.dart`):

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// A titled, rounded group of settings, as a sliver.
final class SettingsGroup extends StatelessWidget {
  /// Creates a group of [settings], optionally titled.
  const SettingsGroup({
    required this.settings,
    this.title,
    this.separator = const Divider(height: 1),
    super.key,
  });

  /// The settings, in order.
  final List<Widget> settings;

  /// The header shown above the group.
  final String? title;

  /// The widget between two settings.
  final Widget separator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: kPanelPadding),
      sliver: SliverMainAxisGroup(
        slivers: [
          if (title != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Semantics(
                  header: true,
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(kPanelRadius),
            ),
            sliver: SliverList.separated(
              itemCount: settings.length,
              itemBuilder: (context, index) => settings[index],
              separatorBuilder: (context, index) => separator,
            ),
          ),
        ],
      ),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_container.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// Frames one setting, with an optional title tile above it.
final class SettingsItemContainer extends StatelessWidget {
  /// Creates the container around [child].
  const SettingsItemContainer({
    required this.child,
    this.title,
    this.widthFactor,
    super.key,
  });

  /// The setting.
  final Widget child;

  /// The title shown in a tile above the setting.
  final String? title;

  /// The fraction of the available width the setting takes.
  final double? widthFactor;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(kPanelRadius),
    child: Column(
      children: [
        if (title != null) ListTile(title: Text(title!)),
        Center(
          child: FractionallySizedBox(widthFactor: widthFactor, child: child),
        ),
      ],
    ),
  );
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/restore_settings_button.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A full-width button that restores the default settings.
///
/// Calls [AccessibilitySettingsViewModel.restoreDefaults], then the panel
/// configuration's `onRestoreSettings` when the button is inside an
/// [AccessibilitySettingsPanel].
final class RestoreSettingsButton extends StatelessWidget {
  /// Creates the button.
  const RestoreSettingsButton({this.style, super.key});

  /// Overrides the default filled style.
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(kPanelPadding),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: style,
        onPressed: () => _restore(context),
        child: Text(context.l10n.restoreSettings),
      ),
    ),
  );

  Future<void> _restore(BuildContext context) async {
    final viewModel = AccessibilityScope.of(context);
    final onRestore = PanelScope.maybeOf(context)?.configuration.onRestoreSettings;
    await viewModel.restoreDefaults();
    await onRestore?.call();
  }
}
```

(The doc comment references `AccessibilitySettingsPanel`, defined in this
task in another file; import it with a `show` if `comment_references`
requires it.)

`packages/accessibility_material/lib/src/ui/text/widgets/read_more_text.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A [CollapsibleText] with a Material "more info" / "less info" button.
final class ReadMoreText extends StatelessWidget {
  /// Creates the text, collapsed to [maxLines].
  const ReadMoreText({
    required this.text,
    this.maxLines = 3,
    this.style,
    super.key,
  });

  /// The text to display.
  final String text;

  /// The number of lines shown while collapsed.
  final int maxLines;

  /// The style merged over the ambient text style.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => CollapsibleText(
    text: text,
    maxLines: maxLines,
    style: style,
    toggleBuilder: (context, {required expanded, required onToggle}) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: TextButton.icon(
        onPressed: onToggle,
        icon: Icon(
          expanded ? Icons.remove_circle_outline : Icons.add_circle_outline,
        ),
        label: Text(expanded ? context.l10n.lessInfo : context.l10n.moreInfo),
      ),
    ),
  );
}
```

- [ ] **Step 3: Write the panel**

`packages/accessibility_material/lib/src/ui/settings/widgets/accessibility_settings_panel.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The accessibility settings panel.
///
/// A scrollable list of the settings groups (theme, colours, text) in the
/// requested [style], with the load status at the top and the restore
/// button at the bottom. Reads state through [AccessibilityScope] and
/// invokes the ViewModel commands; place it under an [AccessibilityScope]
/// and inside a `Scaffold` (or any box with bounded height).
final class AccessibilitySettingsPanel extends StatelessWidget {
  /// Creates the panel.
  const AccessibilitySettingsPanel({
    this.style = AccessibilitySettingsStyle.standard,
    this.configuration = const AccessibilitySettingsConfiguration(),
    super.key,
  });

  /// The visual style.
  final AccessibilitySettingsStyle style;

  /// Which settings are shown and the colours offered.
  final AccessibilitySettingsConfiguration configuration;

  @override
  Widget build(BuildContext context) => PanelScope(
    configuration: configuration,
    style: style,
    child: const _PanelBody(),
  );
}

class _PanelBody extends StatelessWidget {
  const _PanelBody();

  @override
  Widget build(BuildContext context) => const SafeArea(
    child: CustomScrollView(
      restorationId: 'accessibility_settings_panel',
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: StatusCard()),
        // Task 7 adds the theme group here, gated by
        // configuration.showThemeSettingsGroup and switched on the style.
        // Task 8 adds the colour group here, gated by
        // configuration.showColorSettingsGroup.
        // Tasks 9 and 10 add the text group here, gated by
        // configuration.showTextSettingsGroup and switched on the style.
        SliverToBoxAdapter(child: RestoreSettingsButton()),
      ],
    ),
  );
}
```

Task 7 turns `build` into a block body that reads
`final scope = PanelScope.of(context);` and
`final configuration = scope.configuration;` before the slivers.

- [ ] **Step 4: Write the tests**

`packages/accessibility_material/test/ui/settings/widgets/status_card_test.dart`:

```dart
import 'dart:async';

import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/pump_material.dart';

/// A service whose read completes only when the test says so.
final class SlowService implements AccessibilityStorageService {
  final Completer<AccessibilitySettings?> reads = Completer();

  @override
  Future<AccessibilitySettings?> read() => reads.future;

  @override
  Future<void> write(AccessibilitySettings settings) async {}

  @override
  Future<void> clear() async {}
}

void main() {
  group('StatusCard', () {
    testWidgets('renders nothing once loaded', (tester) async {
      await pumpMaterial(tester, const StatusCard());
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('shows the progress while loading', (tester) async {
      final service = SlowService();
      final repository = AccessibilitySettingsRepository(service: service);
      final viewModel = AccessibilitySettingsViewModel(repository: repository);
      addTearDown(() {
        viewModel.dispose();
        repository.dispose();
      });
      await tester.pumpWidget(
        AccessibilityScope(
          viewModel: viewModel,
          child: MaterialApp(
            localizationsDelegates: const [
              ...GlobalMaterialLocalizations.delegates,
              AccessibilityLocalizations.delegate,
            ],
            supportedLocales: AccessibilityLocalizations.supportedLocales,
            home: const Scaffold(body: StatusCard()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Card), findsNothing);
      final load = viewModel.load();
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading the accessibility settings…'), findsOneWidget);
      service.reads.complete(null);
      await load;
      await tester.pump();
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('shows the failure and retries on request', (tester) async {
      final service = FakeAccessibilityStorageService(
        readError: Exception('disk'),
      );
      final viewModel = await pumpMaterial(
        tester,
        const StatusCard(),
        service: service,
      );
      expect(viewModel.status, isA<AccessibilitySettingsLoadFailed>());
      expect(
        find.text('The accessibility settings could not be loaded.'),
        findsOneWidget,
      );
      expect(service.calls.where((call) => call == 'read'), hasLength(1));
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(service.calls.where((call) => call == 'read'), hasLength(2));
      expect(viewModel.status, isA<AccessibilitySettingsLoadFailed>());
    });
  });
}
```

Add the import `package:accessibility_localizations/accessibility_localizations.dart`
to the test for `AccessibilityLocalizations`. Note `pumpMaterial` loads the
repository before pumping, which is why the failed state is already
visible.

`packages/accessibility_material/test/ui/settings/widgets/components/restore_settings_button_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  group('RestoreSettingsButton', () {
    testWidgets('restores the defaults', (tester) async {
      final service = FakeAccessibilityStorageService(
        initial: AccessibilitySettingsSamples.everythingSet,
      );
      final viewModel = await pumpMaterial(
        tester,
        const RestoreSettingsButton(),
        service: service,
      );
      expect(viewModel.settings, AccessibilitySettingsSamples.everythingSet);
      await tester.tap(find.text('Restore settings'));
      await tester.pumpAndSettle();
      expect(viewModel.settings, AccessibilitySettings.defaults);
      expect(service.stored, isNull);
    });

    testWidgets('then calls the panel callback', (tester) async {
      var called = 0;
      await pumpMaterial(
        tester,
        PanelScope(
          configuration: AccessibilitySettingsConfiguration(
            onRestoreSettings: () => called++,
          ),
          style: AccessibilitySettingsStyle.standard,
          child: const RestoreSettingsButton(),
        ),
      );
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();
      expect(called, 1);
    });
  });
}
```

The English value of `restoreSettings` must be read from
`packages/accessibility_localizations/lib/l10n/app_en.arb` (key
`restoreSettings`); use that exact string in the finder.

`packages/accessibility_material/test/ui/text/widgets/read_more_text_test.dart`:

```dart
import 'package:accessibility_material/src/ui/text/widgets/read_more_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/pump_material.dart';

const longText =
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word';

void main() {
  testWidgets('ReadMoreText toggles between more and less', (tester) async {
    await pumpMaterial(
      tester,
      const SizedBox(width: 200, child: ReadMoreText(text: longText)),
    );
    expect(find.text('More info'), findsOneWidget);
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    expect(find.text('Less info'), findsOneWidget);
    expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
  });

  testWidgets('ReadMoreText shows short text without a button', (tester) async {
    await pumpMaterial(tester, const ReadMoreText(text: 'short'));
    expect(find.byType(TextButton), findsNothing);
  });
}
```

Read the English values of `moreInfo` and `lessInfo` from `app_en.arb` and
use them in the finders.

`packages/accessibility_material/test/ui/settings/widgets/accessibility_settings_panel_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/accessibility_settings_panel.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_material.dart';

void main() {
  group('AccessibilitySettingsPanel', () {
    testWidgets('renders the status card and the restore button', (
      tester,
    ) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      expect(find.byType(StatusCard), findsOneWidget);
      expect(find.byType(RestoreSettingsButton), findsOneWidget);
    });
  });
}
```

Tasks 7 to 10 extend this file with the groups.

- [ ] **Step 5: Export, verify and commit**

Append to `lib/accessibility_material.dart`:

```dart
export 'src/ui/settings/widgets/accessibility_settings_panel.dart'
    show AccessibilitySettingsPanel;
export 'src/ui/settings/widgets/components/restore_settings_button.dart'
    show RestoreSettingsButton;
export 'src/ui/text/widgets/read_more_text.dart' show ReadMoreText;
```

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_material
```

```bash
git commit -m "feat(material): add the settings panel root with the status card and the restore button"
```

---

### Task 7: Theme group, standard and cards

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/core/theme_profile_strings.dart`,
  `packages/accessibility_material/lib/src/ui/core/theme_profile_icons.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_card.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_row.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_switch.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_expansion_switch.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/tri_state_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_mode_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/theme/effects_mode_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_profile_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_profile_card.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_settings_standard_group.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_settings_card_group.dart`
- Modify: `packages/accessibility_material/lib/src/ui/settings/widgets/accessibility_settings_panel.dart`
- Test: `packages/accessibility_material/test/ui/settings/widgets/theme/theme_mode_setting_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/theme/effects_mode_setting_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/theme/theme_profile_setting_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/theme/theme_profile_card_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/theme/theme_settings_groups_test.dart`

**Interfaces:**
- Consumes: `setThemeMode`, `setEffectsMode`, `applyThemeProfile`,
  `settings.matchingThemeProfile`, the l10n keys `themeMode`, `effects`,
  `themeModeSystem/Light/Dark`, `effectsModeSystem/Enabled/Disabled`,
  `themeProfile(String)`, `themeProfileSeizureSafeTitle/Subtitle/Description`
  (and the visionImpaired, adhdFriendly triplets), `toggleThemeProfile`;
  `PanelScope`, `SettingsGroup`, `ReadMoreText` (Task 6).
- Produces: `SettingsItemCard({required String title, VoidCallback? onTap, IconData? icon, bool isHighlighted = false, double? minHeight})`,
  `SettingsItemRow({required List<Widget> items, double spacing = 10})`,
  `SettingsItemSwitch({required String title, required String subtitle, required bool value, required ValueChanged<bool> onChanged, IconData? icon})`,
  `SettingsItemExpansionSwitch({required String title, required String subtitle, required String description, required bool value, required ValueChanged<bool> onChanged})`,
  `TriStateSetting<T>({required String title, required List<ButtonSegment<T>> segments, required T selected, required ValueChanged<T> onSelected, IconData? icon})`,
  the four theme items, the two groups, `themeProfileStrings(l10n, level)`
  and `themeProfileIcon(level)`. Tasks 8 to 10 reuse the components.

- [ ] **Step 1: Write the shared components**

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_card.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A tappable card with an icon and a title, highlighted when selected.
///
/// The whole card is one labelled, selectable tap target.
final class SettingsItemCard extends StatelessWidget {
  /// Creates the card.
  const SettingsItemCard({
    required this.title,
    this.onTap,
    this.icon,
    this.isHighlighted = false,
    this.minHeight,
    super.key,
  });

  /// The label.
  final String title;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// The icon above the label.
  final IconData? icon;

  /// Whether the card shows as selected.
  final bool isHighlighted;

  /// The minimum height, [kSettingsCardMinHeight] by default.
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final foreground = isHighlighted ? scheme.onPrimaryContainer : null;
    return Semantics(
      label: title,
      button: true,
      selected: isHighlighted,
      onTap: onTap,
      excludeSemantics: true,
      child: Card(
        color: isHighlighted
            ? scheme.primaryContainer
            : scheme.surfaceContainerHigh,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kPanelRadius),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: minHeight ?? kSettingsCardMinHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon, size: 28, color: foreground),
                  if (icon != null) const SizedBox(height: 8),
                  AccessibleText(
                    title,
                    textAlign: TextAlign.center,
                    textColor: foreground,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_row.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// Lays out settings side by side with equal widths and heights.
final class SettingsItemRow extends StatelessWidget {
  /// Creates a row of [items].
  const SettingsItemRow({required this.items, this.spacing = 10, super.key});

  /// The settings, left to right.
  final List<Widget> items;

  /// The gap between two items.
  final double spacing;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: kPanelPadding,
      vertical: kPanelPadding / 2,
    ),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: spacing,
        children: [for (final item in items) Expanded(child: item)],
      ),
    ),
  );
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_switch.dart`:

```dart
import 'package:material_ui/material_ui.dart';

/// A switch setting as a list tile.
final class SettingsItemSwitch extends StatelessWidget {
  /// Creates the switch tile.
  const SettingsItemSwitch({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.icon,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String subtitle;

  /// Whether the switch is on.
  final bool value;

  /// Called with the new value.
  final ValueChanged<bool> onChanged;

  /// The icon before the name.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => SwitchListTile.adaptive(
    secondary: icon == null ? null : Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    value: value,
    onChanged: onChanged,
  );
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_expansion_switch.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_switch.dart';
import 'package:accessibility_material/src/ui/text/widgets/read_more_text.dart';
import 'package:material_ui/material_ui.dart';

/// A switch setting followed by a collapsible description.
final class SettingsItemExpansionSwitch extends StatelessWidget {
  /// Creates the switch with its description.
  const SettingsItemExpansionSwitch({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String subtitle;

  /// The long description, collapsed by default.
  final String description;

  /// Whether the switch is on.
  final bool value;

  /// Called with the new value.
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SettingsItemSwitch(
        title: title,
        subtitle: subtitle,
        value: value,
        onChanged: onChanged,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPanelPadding),
        child: ReadMoreText(text: description),
      ),
    ],
  );
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/tri_state_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// A setting with three exclusive values as a segmented button.
final class TriStateSetting<T> extends StatelessWidget {
  /// Creates the setting.
  const TriStateSetting({
    required this.title,
    required this.segments,
    required this.selected,
    required this.onSelected,
    this.icon,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The three segments, each with a label and a tooltip.
  final List<ButtonSegment<T>> segments;

  /// The current value.
  final T selected;

  /// Called with the tapped value.
  final ValueChanged<T> onSelected;

  /// The icon before the name.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ListTile(leading: icon == null ? null : Icon(icon), title: Text(title)),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          kPanelPadding,
          0,
          kPanelPadding,
          kPanelPadding / 2,
        ),
        child: SegmentedButton<T>(
          segments: segments,
          selected: {selected},
          showSelectedIcon: false,
          onSelectionChanged: (selection) => onSelected(selection.single),
        ),
      ),
    ],
  );
}
```

- [ ] **Step 2: Write the strings, icons and items**

`packages/accessibility_material/lib/src/ui/core/theme_profile_strings.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The title, subtitle and description of a theme profile.
typedef ThemeProfileStrings = ({
  String title,
  String subtitle,
  String description,
});

/// The localised strings of [level]; the `none` level has only a title.
ThemeProfileStrings themeProfileStrings(
  AccessibilityLocalizations l10n,
  ThemeProfileLevel level,
) => switch (level) {
  ThemeProfileLevel.none => (
    title: l10n.themeProfile(level.name),
    subtitle: '',
    description: '',
  ),
  ThemeProfileLevel.seizureSafe => (
    title: l10n.themeProfileSeizureSafeTitle,
    subtitle: l10n.themeProfileSeizureSafeSubtitle,
    description: l10n.themeProfileSeizureSafeDescription,
  ),
  ThemeProfileLevel.visionImpaired => (
    title: l10n.themeProfileVisionImpairedTitle,
    subtitle: l10n.themeProfileVisionImpairedSubtitle,
    description: l10n.themeProfileVisionImpairedDescription,
  ),
  ThemeProfileLevel.adhdFriendly => (
    title: l10n.themeProfileAdhdFriendlyTitle,
    subtitle: l10n.themeProfileAdhdFriendlySubtitle,
    description: l10n.themeProfileAdhdFriendlyDescription,
  ),
};
```

`packages/accessibility_material/lib/src/ui/core/theme_profile_icons.dart`:

```dart
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The icon of a theme profile, as in 1.x.
IconData themeProfileIcon(ThemeProfileLevel level) => switch (level) {
  ThemeProfileLevel.none => Icons.restart_alt,
  ThemeProfileLevel.seizureSafe => Icons.flash_off,
  ThemeProfileLevel.visionImpaired => Icons.visibility,
  ThemeProfileLevel.adhdFriendly => Icons.center_focus_strong,
};
```

`packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_mode_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/tri_state_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// System, light or dark theme.
final class ThemeModeSetting extends StatelessWidget {
  /// Creates the setting.
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TriStateSetting<AccessibilityThemeMode>(
      title: l10n.themeMode,
      icon: Icons.dark_mode_rounded,
      segments: [
        ButtonSegment(
          value: AccessibilityThemeMode.system,
          icon: const Icon(Icons.brightness_auto),
          label: Text(l10n.themeModeSystem),
          tooltip: l10n.themeModeSystem,
        ),
        ButtonSegment(
          value: AccessibilityThemeMode.light,
          icon: const Icon(Icons.light_mode),
          label: Text(l10n.themeModeLight),
          tooltip: l10n.themeModeLight,
        ),
        ButtonSegment(
          value: AccessibilityThemeMode.dark,
          icon: const Icon(Icons.dark_mode),
          label: Text(l10n.themeModeDark),
          tooltip: l10n.themeModeDark,
        ),
      ],
      selected: AccessibilityScope.settingsOf(context).themeMode,
      onSelected: AccessibilityScope.of(context).setThemeMode,
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/theme/effects_mode_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/tri_state_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Effects following the system, always on or always off.
final class EffectsModeSetting extends StatelessWidget {
  /// Creates the setting.
  const EffectsModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TriStateSetting<EffectsMode>(
      title: l10n.effects,
      icon: Icons.remove_red_eye,
      segments: [
        ButtonSegment(
          value: EffectsMode.system,
          icon: const Icon(Icons.motion_photos_auto),
          label: Text(l10n.effectsModeSystem),
          tooltip: l10n.effectsModeSystem,
        ),
        ButtonSegment(
          value: EffectsMode.enabled,
          icon: const Icon(Icons.motion_photos_on),
          label: Text(l10n.effectsModeEnabled),
          tooltip: l10n.effectsModeEnabled,
        ),
        ButtonSegment(
          value: EffectsMode.disabled,
          icon: const Icon(Icons.motion_photos_off),
          label: Text(l10n.effectsModeDisabled),
          tooltip: l10n.effectsModeDisabled,
        ),
      ],
      selected: AccessibilityScope.settingsOf(context).effectsMode,
      onSelected: AccessibilityScope.of(context).setEffectsMode,
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_profile_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/theme_profile_strings.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_expansion_switch.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A theme profile as a switch with its description (standard style).
final class ThemeProfileSetting extends StatelessWidget {
  /// Creates the switch for [level].
  const ThemeProfileSetting({required this.level, super.key});

  /// The profile this switch applies.
  final ThemeProfileLevel level;

  @override
  Widget build(BuildContext context) {
    final strings = themeProfileStrings(context.l10n, level);
    final active = AccessibilityScope.settingsOf(context).matchingThemeProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemExpansionSwitch(
      title: strings.title,
      subtitle: strings.subtitle,
      description: strings.description,
      value: active == level,
      onChanged: (on) =>
          viewModel.applyThemeProfile(on ? level : ThemeProfileLevel.none),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_profile_card.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/theme_profile_icons.dart';
import 'package:accessibility_material/src/ui/core/theme_profile_strings.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A theme profile as a card (cards style); the `none` card restores the
/// default profile.
final class ThemeProfileCard extends StatelessWidget {
  /// Creates the card for [level].
  const ThemeProfileCard({required this.level, super.key});

  /// The profile this card applies.
  final ThemeProfileLevel level;

  @override
  Widget build(BuildContext context) {
    final active = AccessibilityScope.settingsOf(context).matchingThemeProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemCard(
      title: themeProfileStrings(context.l10n, level).title,
      icon: themeProfileIcon(level),
      isHighlighted: active == level,
      onTap: () => viewModel.applyThemeProfile(level),
    );
  }
}
```

- [ ] **Step 3: Write the groups and wire them into the panel**

`packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_settings_standard_group.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The theme group in the standard style: profile switches, then the
/// theme and effects modes.
final class ThemeSettingsStandardGroup extends StatelessWidget {
  /// Creates the group.
  const ThemeSettingsStandardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    return SettingsGroup(
      settings: [
        if (configuration.showThemeProfileSeizureSafe)
          const ThemeProfileSetting(level: ThemeProfileLevel.seizureSafe),
        if (configuration.showThemeProfileVisionImpaired)
          const ThemeProfileSetting(level: ThemeProfileLevel.visionImpaired),
        if (configuration.showThemeProfileAdhdFriendly)
          const ThemeProfileSetting(level: ThemeProfileLevel.adhdFriendly),
        if (configuration.showThemeModeSetting) const ThemeModeSetting(),
        if (configuration.showEffectsSetting) const EffectsModeSetting(),
      ],
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/theme/theme_settings_card_group.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The theme group in the cards style: profile cards two per row, then
/// the theme and effects modes.
final class ThemeSettingsCardGroup extends StatelessWidget {
  /// Creates the group.
  const ThemeSettingsCardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final cards = [
      const ThemeProfileCard(level: ThemeProfileLevel.none),
      if (configuration.showThemeProfileSeizureSafe)
        const ThemeProfileCard(level: ThemeProfileLevel.seizureSafe),
      if (configuration.showThemeProfileVisionImpaired)
        const ThemeProfileCard(level: ThemeProfileLevel.visionImpaired),
      if (configuration.showThemeProfileAdhdFriendly)
        const ThemeProfileCard(level: ThemeProfileLevel.adhdFriendly),
    ];
    return SettingsGroup(
      separator: const SizedBox.shrink(),
      settings: [
        for (var i = 0; i < cards.length; i += 2)
          SettingsItemRow(items: cards.sublist(i, (i + 2).clamp(0, cards.length))),
        if (configuration.showThemeModeSetting) const ThemeModeSetting(),
        if (configuration.showEffectsSetting) const EffectsModeSetting(),
      ],
    );
  }
}
```

In `accessibility_settings_panel.dart`, replace the Task 7 comment with:

```dart
          if (configuration.showThemeSettingsGroup)
            switch (scope.style) {
              AccessibilitySettingsStyle.standard =>
                const ThemeSettingsStandardGroup(),
              AccessibilitySettingsStyle.cards => const ThemeSettingsCardGroup(),
            },
```

and reintroduce `final configuration = scope.configuration;` plus the two
imports.

- [ ] **Step 4: Write the tests**

Each item test follows the same shape: pump the item with `pumpMaterial`,
act on the Material control, and assert the ViewModel's settings (which the
real repository saved through the fake service). Read the English strings
from `app_en.arb` for the finders.

`test/ui/settings/widgets/theme/theme_mode_setting_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ThemeModeSetting sets the theme mode', (tester) async {
    final viewModel = await pumpMaterial(tester, const ThemeModeSetting());
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.system);
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.dark);
    await tester.tap(find.text('Light'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.light);
    await tester.tap(find.text('System'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.system);
  });
}
```

`effects_mode_setting_test.dart`: the same with `EffectsModeSetting`,
`EffectsMode`, the finders `'On'`, `'Off'`, `'System'` and the initial
`system`.

`theme_profile_setting_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ThemeProfileSetting applies and clears the profile', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      const ThemeProfileSetting(level: ThemeProfileLevel.seizureSafe),
    );
    expect(find.text('Seizure safe'), findsOneWidget);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings, AccessibilitySettingsSamples.seizureSafe);
    expect(
      viewModel.settings.matchingThemeProfile,
      ThemeProfileLevel.seizureSafe,
    );
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
  });

  testWidgets('ThemeProfileSetting reflects a profile set elsewhere', (
    tester,
  ) async {
    await pumpMaterial(
      tester,
      const ThemeProfileSetting(level: ThemeProfileLevel.visionImpaired),
      initial: AccessibilitySettingsSamples.visionImpaired,
    );
    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
  });
}
```

`Switch.adaptive` renders a `Switch` on the test platform (Android); if the
finder fails, use `find.byType(SwitchListTile)` for the tap and read the
value from `tester.widget<SwitchListTile>(...)`.

`theme_profile_card_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_card.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ThemeProfileCard applies its profile and highlights it', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      const ThemeProfileCard(level: ThemeProfileLevel.adhdFriendly),
    );
    expect(
      tester.getSemantics(find.bySemanticsLabel('ADHD friendly')).flagsCollection.isSelected,
      isFalse,
    );
    await tester.tap(find.bySemanticsLabel('ADHD friendly'));
    await tester.pumpAndSettle();
    expect(viewModel.settings, AccessibilitySettingsSamples.adhdFriendly);
    expect(
      tester.getSemantics(find.bySemanticsLabel('ADHD friendly')).flagsCollection.isSelected,
      isTrue,
    );
  });

  testWidgets('the none card restores the default profile', (tester) async {
    final viewModel = await pumpMaterial(
      tester,
      const ThemeProfileCard(level: ThemeProfileLevel.none),
      initial: AccessibilitySettingsSamples.seizureSafe,
    );
    await tester.tap(find.bySemanticsLabel('Default profile'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
  });
}
```

If `flagsCollection` does not exist on the installed `SemanticsNode`, use
`hasFlag(SemanticsFlag.isSelected)` and report it. Read the English
`themeProfile` select value for `none` from `app_en.arb` ("Default
profile") and the ADHD title from `themeProfileAdhdFriendlyTitle`.

`theme_settings_groups_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_card_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_standard_group.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

Widget scoped(
  Widget group, {
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
  AccessibilitySettingsStyle style = AccessibilitySettingsStyle.standard,
}) => PanelScope(
  configuration: configuration,
  style: style,
  child: CustomScrollView(slivers: [group]),
);

void main() {
  testWidgets('the standard group shows every item by default', (tester) async {
    await pumpMaterial(tester, scoped(const ThemeSettingsStandardGroup()));
    expect(find.byType(ThemeProfileSetting), findsNWidgets(3));
    expect(find.byType(ThemeModeSetting), findsOneWidget);
    expect(find.byType(EffectsModeSetting), findsOneWidget);
  });

  testWidgets('the standard group honours the configuration', (tester) async {
    await pumpMaterial(
      tester,
      scoped(
        const ThemeSettingsStandardGroup(),
        configuration: const AccessibilitySettingsConfiguration(
          showThemeProfileSeizureSafe: false,
          showThemeProfileAdhdFriendly: false,
          showEffectsSetting: false,
        ),
      ),
    );
    expect(find.byType(ThemeProfileSetting), findsOneWidget);
    expect(find.byType(EffectsModeSetting), findsNothing);
  });

  testWidgets('the cards group shows the none card plus the enabled ones', (
    tester,
  ) async {
    await pumpMaterial(
      tester,
      scoped(
        const ThemeSettingsCardGroup(),
        style: AccessibilitySettingsStyle.cards,
        configuration: const AccessibilitySettingsConfiguration(
          showThemeProfileVisionImpaired: false,
        ),
      ),
    );
    expect(find.byType(ThemeProfileCard), findsNWidgets(3));
    expect(find.byType(ThemeModeSetting), findsOneWidget);
    expect(find.byType(EffectsModeSetting), findsOneWidget);
  });
}
```

Extend `accessibility_settings_panel_test.dart` with:

```dart
    testWidgets('renders the theme group in both styles', (tester) async {
      await pumpMaterial(tester, const AccessibilitySettingsPanel());
      expect(find.byType(ThemeSettingsStandardGroup), findsOneWidget);
      await pumpMaterial(
        tester,
        const AccessibilitySettingsPanel(style: AccessibilitySettingsStyle.cards),
      );
      expect(find.byType(ThemeSettingsCardGroup), findsOneWidget);
    });

    testWidgets('hides the theme group on request', (tester) async {
      await pumpMaterial(
        tester,
        const AccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showThemeSettingsGroup: false,
          ),
        ),
      );
      expect(find.byType(ThemeSettingsStandardGroup), findsNothing);
    });
```

- [ ] **Step 5: Verify and commit**

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_material
```

```bash
git commit -m "feat(material): add the theme group with tri-state modes and profile switches and cards"
```

---

### Task 8: Colour group (shared by both styles)

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/core/material_palette.dart`,
  `packages/accessibility_material/lib/src/ui/core/color_semantics.dart`,
  `packages/accessibility_material/lib/src/ui/core/color_profile_icons.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/circle_color.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/color_picker.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_multi_selection_card.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/color/color_profile_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/color/text_color_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/color/background_color_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/color/color_settings_group.dart`
- Modify: `packages/accessibility_material/lib/src/ui/settings/widgets/accessibility_settings_panel.dart`
- Test: `packages/accessibility_material/test/ui/core/color_semantics_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/components/color_picker_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/color/color_profile_setting_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/color/color_settings_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/color/color_settings_group_test.dart`

**Interfaces:**
- Consumes: `setTextColor(int?)`, `setBackgroundColor(int?)`,
  `nextColorProfile()`, `settings.textSettings.color`,
  `settings.colorSettings.backgroundColor`, `settings.colorSettings.colorProfile`;
  the configuration's `textColorCandidates`, `backgroundColorCandidates`
  (`Iterable<ColorSwatch<int>>?`, `null` meaning the default palette) and
  the two `*AllowPickingShades` flags; the l10n keys `colorAdjustment`,
  `adjustTextColors`, `adjustBackgroundColors`, `changeTextColor`,
  `changeTextColorShade`, `changePagesBackgroundColor`, `restoreMainColor`,
  `returnToMainColors`, `color(String)`, `colorProfile(String)`,
  `colorProfileChangedTo`.
- Produces: `kMaterialColors` (19 swatches), the extensions
  `ColorSwatchShades.shades`, `ColorSemantics.semanticLabel(l10n)` and
  `ColorSemantics.shadeNumberIn(swatch)`, `colorProfileIcon(level)`,
  `CircleColor`, `ColorPicker({required Iterable<ColorSwatch<int>> colors, int? selectedColorValue, required ValueChanged<int?> onColorSelected, required String changeLabel, required String changeShadeLabel, bool allowPickingShades = true})`,
  `SettingsItemMultiSelectionCard`, the three colour items and
  `ColorSettingsGroup`.

The 1.x colour picker (`master:lib/src/view/widgets/components/color_picker.dart`),
`CircleColor` and `SettingsItemMultiSelectionCard` are ported with these
changes: `material_ui` imports; the ViewModel replaces the storage calls;
the label of the background picker uses `changePagesBackgroundColor`
(1.x mislabelled it with the text-colour string); the announcement of a
colour-profile change uses the current `SemanticsService` API; the picker
reports an ARGB `int?` (`null` clears).

- [ ] **Step 1: Write the palette, the semantics helpers and the icon map**

`packages/accessibility_material/lib/src/ui/core/material_palette.dart`:

```dart
import 'package:material_ui/material_ui.dart';

/// The default colour candidates of the pickers: Material's 19 primary
/// swatches, as in 1.x.
const kMaterialColors = <ColorSwatch<int>>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];
```

`packages/accessibility_material/lib/src/ui/core/color_semantics.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// The shades of a swatch, lightest first.
extension ColorSwatchShades on ColorSwatch<int> {
  /// The non-null shades among 50, 100, 200, ..., 900.
  List<Color> get shades => [
    for (final key in const [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
      if (this[key] case final Color shade) shade,
  ];
}

/// Spoken names for colours.
extension ColorSemantics on Color {
  /// The localised name of this colour, from the `color` message, which
  /// maps codes such as `cF44336` to "Red"; unknown colours get the
  /// fallback of that message.
  String semanticLabel(AccessibilityLocalizations l10n) {
    final hex = toARGB32().toRadixString(16).padLeft(8, '0');
    return l10n.color('c${hex.substring(2).toUpperCase()}');
  }

  /// The Material shade number (50, 100, ..., 900) of this colour within
  /// [swatch], or 0 when it is not one of its shades.
  int shadeNumberIn(ColorSwatch<int> swatch) {
    final index = swatch.shades.indexOf(this);
    return switch (index) {
      < 0 => 0,
      0 => 50,
      _ => index * 100,
    };
  }
}
```

`packages/accessibility_material/lib/src/ui/core/color_profile_icons.dart`:

```dart
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The icon of a colour profile, as in 1.x.
IconData colorProfileIcon(ColorProfileLevel level) => switch (level) {
  ColorProfileLevel.normal => Icons.brightness_medium,
  ColorProfileLevel.lowSaturation => Icons.brightness_low,
  ColorProfileLevel.highSaturation => Icons.brightness_high,
  ColorProfileLevel.monochrome => Icons.brightness_1_outlined,
  ColorProfileLevel.highContrast => Icons.brightness_1,
};
```

Test `packages/accessibility_material/test/ui/core/color_semantics_test.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_material/src/ui/core/color_semantics.dart';
import 'package:accessibility_material/src/ui/core/material_palette.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  test('shades lists the ten Material shades in order', () {
    expect(Colors.red.shades, hasLength(10));
    expect(Colors.red.shades.first, Colors.red[50]);
    expect(Colors.red.shades.last, Colors.red[900]);
  });

  test('shadeNumberIn maps the index to the shade number', () {
    expect(Colors.red[50]!.shadeNumberIn(Colors.red), 50);
    expect(Colors.red[500]!.shadeNumberIn(Colors.red), 500);
    expect(const Color(0xFF123456).shadeNumberIn(Colors.red), 0);
  });

  test('semanticLabel names every default swatch', () async {
    final l10n = await AccessibilityLocalizations.delegate.load(
      const Locale('en'),
    );
    for (final swatch in kMaterialColors) {
      expect(
        swatch.semanticLabel(l10n),
        isNot('Color not recognized'),
        reason: '$swatch',
      );
    }
    expect(Colors.red.semanticLabel(l10n), 'Red');
    expect(const Color(0xFF123456).semanticLabel(l10n), 'Color not recognized');
  });
}
```

- [ ] **Step 2: Port the circle and the picker**

`packages/accessibility_material/lib/src/ui/settings/widgets/components/circle_color.dart`:

```dart
import 'package:material_ui/material_ui.dart';

/// A tappable colour disc with a 48 dp tap target.
final class CircleColor extends StatelessWidget {
  /// Creates the disc.
  const CircleColor({
    required this.color,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.size = 38,
    super.key,
  });

  /// The colour shown.
  final Color color;

  /// The spoken name of the colour.
  final String label;

  /// Called when the disc is tapped.
  final VoidCallback? onTap;

  /// Whether a check mark is drawn on the disc.
  final bool isSelected;

  /// The diameter of the disc.
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: label,
      button: true,
      selected: isSelected,
      onTap: onTap,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox.square(
          dimension: kMinInteractiveDimension,
          child: Center(
            child: Material(
              elevation: 4,
              shape: const CircleBorder(),
              child: CircleAvatar(
                radius: size / 2,
                backgroundColor: color,
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: color.computeLuminance() > 0.5
                            ? scheme.onSurface
                            : scheme.surface,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/color_picker.dart`:

```dart
import 'package:accessibility_material/src/ui/core/color_semantics.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/circle_color.dart';
import 'package:material_ui/material_ui.dart';

/// Picks a colour among [colors], optionally down to a shade.
///
/// Shows the main colours; tapping one selects it and, when
/// [allowPickingShades] is true, opens its shades. A close button clears
/// the selection; a back button returns to the main colours. Reports the
/// ARGB value through [onColorSelected] (`null` when cleared).
final class ColorPicker extends StatefulWidget {
  /// Creates the picker.
  const ColorPicker({
    required this.colors,
    required this.onColorSelected,
    required this.changeLabel,
    required this.changeShadeLabel,
    this.selectedColorValue,
    this.allowPickingShades = true,
    super.key,
  });

  /// The swatches offered.
  final Iterable<ColorSwatch<int>> colors;

  /// The selected ARGB value, or `null`.
  final int? selectedColorValue;

  /// Called with the selected ARGB value, or `null` when cleared.
  final ValueChanged<int?> onColorSelected;

  /// The spoken prefix of a main colour, e.g. "Change the text colour to:".
  final String changeLabel;

  /// The spoken prefix of a shade.
  final String changeShadeLabel;

  /// Whether tapping a main colour opens its shades.
  final bool allowPickingShades;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  ColorSwatch<int>? _openSwatch;

  ColorSwatch<int>? get _selectedSwatch {
    final value = widget.selectedColorValue;
    if (value == null) {
      return null;
    }
    for (final swatch in widget.colors) {
      if (swatch.toARGB32() == value ||
          swatch.shades.any((shade) => shade.toARGB32() == value)) {
        return swatch;
      }
    }
    return null;
  }

  void _selectMain(ColorSwatch<int> swatch) {
    widget.onColorSelected(swatch.toARGB32());
    if (widget.allowPickingShades) {
      setState(() => _openSwatch = swatch);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final open = _openSwatch;
    final selected = _selectedSwatch;
    final value = widget.selectedColorValue;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          if (open != null)
            IconButton(
              tooltip: l10n.returnToMainColors,
              icon: const Icon(Icons.arrow_back),
              onPressed: () => setState(() => _openSwatch = null),
            )
          else if (selected != null)
            IconButton(
              tooltip: l10n.restoreMainColor,
              icon: const Icon(Icons.close),
              onPressed: () => widget.onColorSelected(null),
            ),
          if (open != null)
            for (final shade in open.shades)
              CircleColor(
                color: shade,
                label: '${widget.changeShadeLabel} ${shade.shadeNumberIn(open)}',
                isSelected: shade.toARGB32() == value,
                onTap: () => widget.onColorSelected(shade.toARGB32()),
              )
          else
            for (final swatch in widget.colors)
              CircleColor(
                color: swatch,
                label: '${widget.changeLabel} ${swatch.semanticLabel(l10n)}',
                isSelected: swatch == selected,
                onTap: () => _selectMain(swatch),
              ),
        ],
      ),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_multi_selection_card.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A card that cycles through [selections] values on tap, showing the
/// current position as a row of segments.
final class SettingsItemMultiSelectionCard extends StatelessWidget {
  /// Creates the card.
  const SettingsItemMultiSelectionCard({
    required this.selections,
    required this.selectedIndex,
    required this.title,
    required this.onTap,
    this.icon,
    super.key,
  });

  /// How many values there are.
  final int selections;

  /// The index of the current value.
  final int selectedIndex;

  /// The label of the current value.
  final String title;

  /// Called on tap; the caller advances to the next value.
  final VoidCallback onTap;

  /// The icon of the current value.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: title,
      value: '${selectedIndex + 1}/$selections',
      button: true,
      onTap: onTap,
      excludeSemantics: true,
      child: Card(
        color: scheme.surfaceContainerHigh,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kPanelRadius),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: kSettingsCardMinHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon, size: 28),
                  if (icon != null) const SizedBox(height: 8),
                  AccessibleText(title, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Row(
                    spacing: 4,
                    children: [
                      for (var i = 0; i < selections; i++)
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: i == selectedIndex
                                  ? scheme.primary
                                  : scheme.outlineVariant,
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 3: Write the items and the group**

`packages/accessibility_material/lib/src/ui/settings/widgets/color/color_profile_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/color_profile_icons.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_multi_selection_card.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Cycles through the colour profiles.
final class ColorProfileSetting extends StatelessWidget {
  /// Creates the setting.
  const ColorProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final level = AccessibilityScope.settingsOf(context).colorSettings.colorProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemMultiSelectionCard(
      selections: ColorProfileLevel.values.length,
      selectedIndex: level.index,
      icon: colorProfileIcon(level),
      title: l10n.colorProfile(level.name),
      onTap: () async {
        await viewModel.nextColorProfile();
        final next = viewModel.settings.colorSettings.colorProfile;
        await SemanticsService.announce(
          '${l10n.colorProfileChangedTo} ${l10n.colorProfile(next.name)}',
          Directionality.of(context),
        );
      },
    );
  }
}
```

If `SemanticsService.announce` is deprecated on the installed SDK, use the
replacement the deprecation message names (for example
`SemanticsService.sendAnnouncement`) and report it. Guard the
`Directionality.of(context)` call with `if (!context.mounted) return;`
after the first `await`.

`packages/accessibility_material/lib/src/ui/settings/widgets/color/text_color_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/material_palette.dart';
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/color_picker.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Picks the text colour.
final class TextColorSetting extends StatelessWidget {
  /// Creates the setting.
  const TextColorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return ColorPicker(
      colors: configuration.textColorCandidates ?? kMaterialColors,
      selectedColorValue: AccessibilityScope.settingsOf(context).textSettings.color,
      allowPickingShades: configuration.textColorAllowPickingShades,
      changeLabel: l10n.changeTextColor,
      changeShadeLabel: l10n.changeTextColorShade,
      onColorSelected: AccessibilityScope.of(context).setTextColor,
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/color/background_color_setting.dart`:
the same with `backgroundColorCandidates`, `backgroundColorAllowPickingShades`,
`settings.colorSettings.backgroundColor`, `changeLabel: l10n.changePagesBackgroundColor`,
`changeShadeLabel: l10n.changeTextColorShade`, and `setBackgroundColor`.
Class `BackgroundColorSetting`, doc "Picks the page background colour."

`packages/accessibility_material/lib/src/ui/settings/widgets/color/color_settings_group.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_container.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:material_ui/material_ui.dart';

/// The colour group, identical in both styles.
final class ColorSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const ColorSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return SettingsGroup(
      title: l10n.colorAdjustment,
      separator: const SizedBox.shrink(),
      settings: [
        if (configuration.showColorProfileSetting)
          const SettingsItemContainer(
            widthFactor: 0.75,
            child: ColorProfileSetting(),
          ),
        if (configuration.showTextColorSetting)
          SettingsItemContainer(
            title: l10n.adjustTextColors,
            child: const TextColorSetting(),
          ),
        if (configuration.showBackgroundColorSetting)
          SettingsItemContainer(
            title: l10n.adjustBackgroundColors,
            child: const BackgroundColorSetting(),
          ),
      ],
    );
  }
}
```

In `accessibility_settings_panel.dart`, replace the Task 8 comment with:

```dart
          if (configuration.showColorSettingsGroup) const ColorSettingsGroup(),
```

- [ ] **Step 4: Write the tests**

`test/ui/settings/widgets/components/color_picker_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/components/color_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  group('ColorPicker', () {
    Widget picker(
      List<int?> log, {
      int? selected,
      bool allowPickingShades = true,
    }) => ColorPicker(
      colors: const [Colors.red, Colors.blue],
      selectedColorValue: selected,
      allowPickingShades: allowPickingShades,
      changeLabel: 'Change to',
      changeShadeLabel: 'Shade',
      onColorSelected: log.add,
    );

    testWidgets('reports a main colour and opens its shades', (tester) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log));
      await tester.tap(find.bySemanticsLabel('Change to Red'));
      await tester.pumpAndSettle();
      expect(log, [Colors.red.toARGB32()]);
      expect(find.bySemanticsLabel('Shade 500'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('reports a shade', (tester) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log, selected: Colors.red.toARGB32()));
      await tester.tap(find.bySemanticsLabel('Change to Red'));
      await tester.pumpAndSettle();
      await tester.tap(find.bySemanticsLabel('Shade 900'));
      await tester.pumpAndSettle();
      expect(log.last, Colors.red[900]!.toARGB32());
    });

    testWidgets('clears the selection with the close button', (tester) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log, selected: Colors.blue.toARGB32()));
      expect(find.byIcon(Icons.close), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(log, [null]);
    });

    testWidgets('stays on the main colours when shades are not allowed', (
      tester,
    ) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log, allowPickingShades: false));
      await tester.tap(find.bySemanticsLabel('Change to Blue'));
      await tester.pumpAndSettle();
      expect(log, [Colors.blue.toARGB32()]);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.bySemanticsLabel('Change to Red'), findsOneWidget);
    });
  });
}
```

`test/ui/settings/widgets/color/color_profile_setting_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ColorProfileSetting cycles to the next profile', (tester) async {
    final viewModel = await pumpMaterial(tester, const ColorProfileSetting());
    expect(find.bySemanticsLabel('Normal'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Normal'));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.colorSettings.colorProfile,
      ColorProfileLevel.lowSaturation,
    );
    expect(find.bySemanticsLabel('Low saturation'), findsOneWidget);
  });
}
```

`test/ui/settings/widgets/color/color_settings_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

Widget inPanel(
  Widget child, {
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
}) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.standard,
  child: child,
);

void main() {
  testWidgets('TextColorSetting sets and clears the text colour', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      inPanel(const TextColorSetting()),
    );
    await tester.tap(find.bySemanticsLabel('Change the text color to:  Red'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.color, Colors.red.toARGB32());
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.color, isNull);
  });

  testWidgets('BackgroundColorSetting uses the configured candidates', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      inPanel(
        const BackgroundColorSetting(),
        configuration: const AccessibilitySettingsConfiguration(
          backgroundColorCandidates: [Colors.teal],
          backgroundColorAllowPickingShades: false,
        ),
      ),
    );
    expect(find.byType(CircleColor), findsOneWidget);
    await tester.tap(find.byType(CircleColor));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.colorSettings.backgroundColor,
      Colors.teal.toARGB32(),
    );
  });
}
```

Build the exact semantics label from `app_en.arb`: the `changeTextColor`
value followed by a space and the colour name ("Red"); adjust the finder to
the real concatenation (the 1.x value ends with a colon and a space, so the
label may contain two spaces; use the value verbatim). Import `CircleColor`.

`test/ui/settings/widgets/color/color_settings_group_test.dart`: pump
`ColorSettingsGroup` inside a `PanelScope` and a `CustomScrollView` as in
Task 7's group test; assert the three items by type with the default
configuration and that `showTextColorSetting: false` hides
`TextColorSetting`. Extend `accessibility_settings_panel_test.dart` with a
test that the colour group renders by default and is hidden by
`showColorSettingsGroup: false`.

- [ ] **Step 5: Verify and commit**

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_material
```

```bash
git commit -m "feat(material): add the colour group with the profile card and the pickers"
```

---

### Task 9: Text group, standard style

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/core/slider_config.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_slider.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_range_settings.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_align_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/bold_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/font_setting.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_settings_standard_group.dart`
- Modify: `packages/accessibility_material/lib/src/ui/settings/widgets/accessibility_settings_panel.dart`
- Test: `packages/accessibility_material/test/ui/settings/widgets/text/text_range_settings_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/text/text_align_setting_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/text/bold_and_font_settings_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/text/text_settings_standard_group_test.dart`

**Interfaces:**
- Consumes: `setTextScaleFactor`, `setWordSpacing`, `setLineHeight`,
  `setLetterSpacing`, `setTextAlign`, `setBold({required bool value})`,
  `setAccessibleFontEnabled({required bool enabled})`,
  `viewModel.accessibleFonts`, `viewModel.activeFont`; the l10n keys
  `sizeAndTextDisplay`, `fontSize`, `increaseOrDecreaseTextSize`,
  `incrementTextScaleFactor`, `decrementTextScaleFactor`, `wordSpacing`,
  `increaseOrDecreaseWordSpacing`, `incrementWordSpacing`,
  `decrementWordSpacing`, `lineHeight`, `increaseOrDecreaseLineHeight`,
  `incrementLineHeight`, `decrementLineHeight`, `letterSpacing`,
  `increaseOrDecreaseLetterSpacing`, `incrementLetterSpacing`,
  `decrementLetterSpacing`, `textAlignment`, `alignLeft`, `alignCenter`,
  `alignRight`, `boldText`, `changeBoldText`, `accessibleFont`,
  `accessibleFontSubtitle`.
- Produces: the range constants; `SettingsItemSlider({required String title, required String subtitle, required double value, required double min, required double max, required int divisions, required String incrementLabel, required String decrementLabel, required ValueChanged<double> onChanged})`;
  `TextScaleFactorSetting`, `WordSpacingSetting`, `LineHeightSetting`,
  `LetterSpacingSetting`, `TextAlignSetting`, `BoldSetting`, `FontSetting`,
  `TextSettingsStandardGroup`. Task 10 reuses the constants and the three
  toggle semantics.

The 1.x ranges (`master:lib/src/core/constants/component_config.dart`) are
kept: scale factor 1 to 2, word spacing 0.5 to 3, line height 1.5 to 2,
letter spacing 0.5 to 1, four divisions each. An unset value (`null`)
shows at the minimum; the first change stores the slider value. Text
alignment offers left, centre and right in both styles (1.x used
start/centre/end in the cards style; the l10n labels say left and right).

- [ ] **Step 1: Write the constants and the slider component**

`packages/accessibility_material/lib/src/ui/core/slider_config.dart`:

```dart
/// The text scale factor range of the panel.
const double kMinTextScaleFactor = 1;

/// The text scale factor range of the panel.
const double kMaxTextScaleFactor = 2;

/// The word spacing range of the panel.
const double kMinWordSpacing = 0.5;

/// The word spacing range of the panel.
const double kMaxWordSpacing = 3;

/// The line height range of the panel.
const double kMinLineHeight = 1.5;

/// The line height range of the panel.
const double kMaxLineHeight = 2;

/// The letter spacing range of the panel.
const double kMinLetterSpacing = 0.5;

/// The letter spacing range of the panel.
const double kMaxLetterSpacing = 1;

/// The number of steps of every range.
const int kRangeDivisions = 4;
```

`packages/accessibility_material/lib/src/ui/settings/widgets/components/settings_item_slider.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:material_ui/material_ui.dart';

/// A ranged setting: a titled tile, a slider and two step buttons.
final class SettingsItemSlider extends StatelessWidget {
  /// Creates the slider setting.
  const SettingsItemSlider({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.incrementLabel,
    required this.decrementLabel,
    required this.onChanged,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String subtitle;

  /// The current value, clamped to the range for display.
  final double value;

  /// The lowest value.
  final double min;

  /// The highest value.
  final double max;

  /// The number of steps between [min] and [max].
  final int divisions;

  /// The spoken label of the plus button.
  final String incrementLabel;

  /// The spoken label of the minus button.
  final String decrementLabel;

  /// Called with the new value.
  final ValueChanged<double> onChanged;

  double get _step => (max - min) / divisions;

  double get _clamped => value.clamp(min, max);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ListTile(title: Text(title), subtitle: Text(subtitle)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPanelPadding / 2),
        child: Row(
          children: [
            IconButton(
              tooltip: decrementLabel,
              icon: const Icon(Icons.remove),
              onPressed: () => onChanged((_clamped - _step).clamp(min, max)),
            ),
            Expanded(
              child: Slider.adaptive(
                value: _clamped,
                min: min,
                max: max,
                divisions: divisions,
                label: _clamped.toStringAsFixed(2),
                semanticFormatterCallback: (value) => value.toStringAsFixed(2),
                onChanged: onChanged,
              ),
            ),
            IconButton(
              tooltip: incrementLabel,
              icon: const Icon(Icons.add),
              onPressed: () => onChanged((_clamped + _step).clamp(min, max)),
            ),
          ],
        ),
      ),
    ],
  );
}
```

- [ ] **Step 2: Write the items and the group**

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_range_settings.dart`
(four widgets in one file, since they differ only by range, strings and
command):

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/slider_config.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_slider.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text scale factor, 1 to 2.
final class TextScaleFactorSetting extends StatelessWidget {
  /// Creates the setting.
  const TextScaleFactorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.fontSize,
      subtitle: l10n.increaseOrDecreaseTextSize,
      value: AccessibilityScope.settingsOf(context).textSettings.textScaleFactor,
      min: kMinTextScaleFactor,
      max: kMaxTextScaleFactor,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementTextScaleFactor,
      decrementLabel: l10n.decrementTextScaleFactor,
      onChanged: AccessibilityScope.of(context).setTextScaleFactor,
    );
  }
}

/// The word spacing, 0.5 to 3.
final class WordSpacingSetting extends StatelessWidget {
  /// Creates the setting.
  const WordSpacingSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.wordSpacing,
      subtitle: l10n.increaseOrDecreaseWordSpacing,
      value:
          AccessibilityScope.settingsOf(context).textSettings.wordSpacing ??
          kMinWordSpacing,
      min: kMinWordSpacing,
      max: kMaxWordSpacing,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementWordSpacing,
      decrementLabel: l10n.decrementWordSpacing,
      onChanged: AccessibilityScope.of(context).setWordSpacing,
    );
  }
}

/// The line height, 1.5 to 2.
final class LineHeightSetting extends StatelessWidget {
  /// Creates the setting.
  const LineHeightSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.lineHeight,
      subtitle: l10n.increaseOrDecreaseLineHeight,
      value:
          AccessibilityScope.settingsOf(context).textSettings.lineHeight ??
          kMinLineHeight,
      min: kMinLineHeight,
      max: kMaxLineHeight,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementLineHeight,
      decrementLabel: l10n.decrementLineHeight,
      onChanged: AccessibilityScope.of(context).setLineHeight,
    );
  }
}

/// The letter spacing, 0.5 to 1.
final class LetterSpacingSetting extends StatelessWidget {
  /// Creates the setting.
  const LetterSpacingSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsItemSlider(
      title: l10n.letterSpacing,
      subtitle: l10n.increaseOrDecreaseLetterSpacing,
      value:
          AccessibilityScope.settingsOf(context).textSettings.letterSpacing ??
          kMinLetterSpacing,
      min: kMinLetterSpacing,
      max: kMaxLetterSpacing,
      divisions: kRangeDivisions,
      incrementLabel: l10n.incrementLetterSpacing,
      decrementLabel: l10n.decrementLetterSpacing,
      onChanged: AccessibilityScope.of(context).setLetterSpacing,
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_align_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Left, centre or right alignment as three cards; tapping the active one
/// clears the override.
final class TextAlignSetting extends StatelessWidget {
  /// Creates the setting.
  const TextAlignSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = AccessibilityScope.settingsOf(context).textSettings.textAlign;
    final viewModel = AccessibilityScope.of(context);
    final options = [
      (TextAlignMode.left, Icons.align_horizontal_left_outlined, l10n.alignLeft),
      (TextAlignMode.center, Icons.align_horizontal_center_outlined, l10n.alignCenter),
      (TextAlignMode.right, Icons.align_horizontal_right_outlined, l10n.alignRight),
    ];
    return SettingsItemRow(
      items: [
        for (final (mode, icon, label) in options)
          SettingsItemCard(
            title: label,
            icon: icon,
            minHeight: 80,
            isHighlighted: current == mode,
            onTap: () => viewModel.setTextAlign(
              current == mode ? TextAlignMode.none : mode,
            ),
          ),
      ],
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/text/bold_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_switch.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Bold text on or off.
final class BoldSetting extends StatelessWidget {
  /// Creates the setting.
  const BoldSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemSwitch(
      title: l10n.boldText,
      subtitle: l10n.changeBoldText,
      icon: Icons.format_bold,
      value: AccessibilityScope.settingsOf(context).textSettings.isBold,
      onChanged: (value) => viewModel.setBold(value: value),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/text/font_setting.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_switch.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The accessible font on or off. Shown only when a font is registered.
final class FontSetting extends StatelessWidget {
  /// Creates the setting.
  const FontSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = AccessibilityScope.of(context);
    final enabled =
        AccessibilityScope.settingsOf(context).textSettings.fontFamily != null;
    return SettingsItemSwitch(
      title: l10n.accessibleFont,
      subtitle: l10n.accessibleFontSubtitle,
      icon: Icons.font_download,
      value: enabled,
      onChanged: (value) => viewModel.setAccessibleFontEnabled(enabled: value),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_settings_standard_group.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text group in the standard style: alignment cards, switches and
/// sliders.
final class TextSettingsStandardGroup extends StatelessWidget {
  /// Creates the group.
  const TextSettingsStandardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final hasFonts = AccessibilityScope.of(context).accessibleFonts.isNotEmpty;
    return SettingsGroup(
      title: context.l10n.sizeAndTextDisplay,
      settings: [
        if (configuration.showTextAlignSetting) const TextAlignSetting(),
        if (configuration.showBoldSetting) const BoldSetting(),
        if (configuration.showFontSetting && hasFonts) const FontSetting(),
        if (configuration.showTextScaleFactorSetting)
          const TextScaleFactorSetting(),
        if (configuration.showWordSpacingSetting) const WordSpacingSetting(),
        if (configuration.showLineHeightSetting) const LineHeightSetting(),
        if (configuration.showLetterSpacingSetting)
          const LetterSpacingSetting(),
      ],
    );
  }
}
```

In `accessibility_settings_panel.dart`, replace the Tasks 9 and 10 comment
with:

```dart
          if (configuration.showTextSettingsGroup)
            switch (scope.style) {
              AccessibilitySettingsStyle.standard =>
                const TextSettingsStandardGroup(),
              // Task 10 replaces this with TextSettingsCardGroup.
              AccessibilitySettingsStyle.cards =>
                const TextSettingsStandardGroup(),
            },
```

- [ ] **Step 3: Write the tests**

`test/ui/settings/widgets/text/text_range_settings_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('TextScaleFactorSetting steps and slides', (tester) async {
    final viewModel = await pumpMaterial(tester, const TextScaleFactorSetting());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1.25);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 1);
    await tester.drag(find.byType(Slider), const Offset(600, 0));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textScaleFactor, 2);
  });

  testWidgets('WordSpacingSetting starts at the minimum when unset', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(tester, const WordSpacingSetting());
    expect(viewModel.settings.textSettings.wordSpacing, isNull);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.wordSpacing, closeTo(1.125, 0.001));
  });

  testWidgets('LineHeightSetting and LetterSpacingSetting step', (
    tester,
  ) async {
    var viewModel = await pumpMaterial(tester, const LineHeightSetting());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.lineHeight, closeTo(1.625, 0.001));
    viewModel = await pumpMaterial(tester, const LetterSpacingSetting());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.letterSpacing, closeTo(0.625, 0.001));
  });
}
```

`Slider.adaptive` renders a Material `Slider` on the test platform; if the
finder fails, drag `find.byType(Slider)`'s adaptive equivalent reported by
the failure.

`test/ui/settings/widgets/text/text_align_setting_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('TextAlignSetting sets and clears the alignment', (tester) async {
    final viewModel = await pumpMaterial(tester, const TextAlignSetting());
    await tester.tap(find.bySemanticsLabel('Align center'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.center);
    await tester.tap(find.bySemanticsLabel('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.right);
    await tester.tap(find.bySemanticsLabel('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.none);
  });
}
```

`test/ui/settings/widgets/text/bold_and_font_settings_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/font_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

void main() {
  testWidgets('BoldSetting toggles bold text', (tester) async {
    final viewModel = await pumpMaterial(tester, const BoldSetting());
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.isBold, isTrue);
  });

  testWidgets('FontSetting enables and disables the registered font', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      const FontSetting(),
      fonts: const [andika],
    );
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.fontFamily, 'Andika');
    expect(viewModel.activeFont, andika);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.fontFamily, isNull);
  });
}
```

`test/ui/settings/widgets/text/text_settings_standard_group_test.dart`:
pump `TextSettingsStandardGroup` inside a `PanelScope` and a
`CustomScrollView` (as in Task 7's group test) and assert: with no fonts
registered, `FontSetting` is absent and the other six items present; with
`fonts: const [andika]` it is present; with `showTextScaleFactorSetting: false`
and `showTextAlignSetting: false` the two are absent. Extend
`accessibility_settings_panel_test.dart` with a test that the text group
renders by default and is hidden by `showTextSettingsGroup: false`.

- [ ] **Step 4: Verify and commit**

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_material
```

```bash
git commit -m "feat(material): add the text group in the standard style"
```

---

### Task 10: Text group, cards style

**Files:**
- Create: `packages/accessibility_material/lib/src/ui/settings/widgets/components/stepper_settings_card.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_range_cards.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_align_card.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_toggle_cards.dart`,
  `packages/accessibility_material/lib/src/ui/settings/widgets/text/text_settings_card_group.dart`
- Modify: `packages/accessibility_material/lib/src/ui/settings/widgets/accessibility_settings_panel.dart`
- Test: `packages/accessibility_material/test/ui/settings/widgets/components/stepper_settings_card_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/text/text_cards_test.dart`,
  `packages/accessibility_material/test/ui/settings/widgets/text/text_settings_card_group_test.dart`

**Interfaces:**
- Consumes: the range constants and commands of Task 9,
  `SettingsItemCard`, `SettingsItemRow`, `SettingsGroup`.
- Produces: `StepperSettingsCard({required IconData icon, required String title, required double value, required double min, required double max, required int divisions, required String decrementLabel, required String incrementLabel, required ValueChanged<double> onChanged})`;
  `TextScaleFactorCard`, `WordSpacingCard`, `LineHeightCard`,
  `LetterSpacingCard`, `TextAlignCard`, `BoldCard`, `FontCard`,
  `TextSettingsCardGroup`.

- [ ] **Step 1: Write the stepper card**

`packages/accessibility_material/lib/src/ui/settings/widgets/components/stepper_settings_card.dart`
(from `master:lib/src/view/widgets/settings/cards/stepper_settings_card.dart`):

```dart
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A ranged setting as a card with minus and plus buttons and step dots.
final class StepperSettingsCard extends StatelessWidget {
  /// Creates the card.
  const StepperSettingsCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.decrementLabel,
    required this.incrementLabel,
    required this.onChanged,
    super.key,
  });

  /// The icon above the title.
  final IconData icon;

  /// The setting name.
  final String title;

  /// The current value, clamped to the range for display.
  final double value;

  /// The lowest value.
  final double min;

  /// The highest value.
  final double max;

  /// The number of steps between [min] and [max].
  final int divisions;

  /// The spoken label of the minus button.
  final String decrementLabel;

  /// The spoken label of the plus button.
  final String incrementLabel;

  /// Called with the new value.
  final ValueChanged<double> onChanged;

  double get _step => (max - min) / divisions;

  int get _index => ((value.clamp(min, max) - min) / _step).round();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final atMin = _index <= 0;
    final atMax = _index >= divisions;
    return Card(
      color: scheme.surfaceContainerHigh,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: kSettingsCardMinHeight),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 8),
              AccessibleText(title, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    tooltip: decrementLabel,
                    icon: const Icon(Icons.remove),
                    onPressed: atMin
                        ? null
                        : () => onChanged((min + (_index - 1) * _step)),
                  ),
                  Expanded(
                    child: Semantics(
                      value: '${_index + 1}/${divisions + 1}',
                      child: ExcludeSemantics(
                        child: Row(
                          spacing: 4,
                          children: [
                            for (var i = 0; i <= divisions; i++)
                              Expanded(
                                child: Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: i <= _index
                                        ? scheme.primary
                                        : scheme.outlineVariant,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: incrementLabel,
                    icon: const Icon(Icons.add),
                    onPressed: atMax
                        ? null
                        : () => onChanged((min + (_index + 1) * _step)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Write the cards and the group**

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_range_cards.dart`:
four widgets `TextScaleFactorCard`, `WordSpacingCard`, `LineHeightCard`,
`LetterSpacingCard`, each a `StatelessWidget` building a
`StepperSettingsCard` with the same `value`, `min`, `max`, `divisions`,
labels and command as the corresponding Task 9 slider widget, and the
icons `Icons.format_size`, `Icons.space_bar`, `Icons.format_line_spacing`,
`Icons.text_fields`; the titles are `l10n.fontSize`, `l10n.wordSpacing`,
`l10n.lineHeight`, `l10n.letterSpacing`. Same file layout and docs as
`text_range_settings.dart`.

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_align_card.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/core/panel_metrics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Left, centre or right alignment as a segmented button; deselecting the
/// active segment clears the override.
final class TextAlignCard extends StatelessWidget {
  /// Creates the card.
  const TextAlignCard({super.key});

  static const _modes = {
    TextAlignMode.left,
    TextAlignMode.center,
    TextAlignMode.right,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = AccessibilityScope.settingsOf(context).textSettings.textAlign;
    final viewModel = AccessibilityScope.of(context);
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: kSettingsCardMinHeight),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AccessibleText(l10n.textAlignment, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              SegmentedButton<TextAlignMode>(
                emptySelectionAllowed: true,
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: TextAlignMode.left,
                    icon: const Icon(Icons.align_horizontal_left_outlined),
                    tooltip: l10n.alignLeft,
                  ),
                  ButtonSegment(
                    value: TextAlignMode.center,
                    icon: const Icon(Icons.align_horizontal_center_outlined),
                    tooltip: l10n.alignCenter,
                  ),
                  ButtonSegment(
                    value: TextAlignMode.right,
                    icon: const Icon(Icons.align_horizontal_right_outlined),
                    tooltip: l10n.alignRight,
                  ),
                ],
                selected: _modes.contains(current) ? {current} : const {},
                onSelectionChanged: (selection) => viewModel.setTextAlign(
                  selection.isEmpty ? TextAlignMode.none : selection.single,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_toggle_cards.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_card.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Bold text as a toggling card.
final class BoldCard extends StatelessWidget {
  /// Creates the card.
  const BoldCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bold = AccessibilityScope.settingsOf(context).textSettings.isBold;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemCard(
      title: context.l10n.boldText,
      icon: Icons.format_bold,
      isHighlighted: bold,
      onTap: () => viewModel.setBold(value: !bold),
    );
  }
}

/// The accessible font as a toggling card.
final class FontCard extends StatelessWidget {
  /// Creates the card.
  const FontCard({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled =
        AccessibilityScope.settingsOf(context).textSettings.fontFamily != null;
    final viewModel = AccessibilityScope.of(context);
    return SettingsItemCard(
      title: context.l10n.accessibleFont,
      icon: enabled ? Icons.font_download : Icons.font_download_outlined,
      isHighlighted: enabled,
      onTap: () => viewModel.setAccessibleFontEnabled(enabled: !enabled),
    );
  }
}
```

`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_settings_card_group.dart`:

```dart
import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_row.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_align_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_range_cards.dart';
import 'package:accessibility_material/src/ui/settings/widgets/text/text_toggle_cards.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The text group in the cards style: the alignment card, the toggle
/// cards and the stepper cards two per row.
final class TextSettingsCardGroup extends StatelessWidget {
  /// Creates the group.
  const TextSettingsCardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final hasFonts = AccessibilityScope.of(context).accessibleFonts.isNotEmpty;
    final toggles = [
      if (configuration.showBoldSetting) const BoldCard(),
      if (configuration.showFontSetting && hasFonts) const FontCard(),
    ];
    final steppers = [
      if (configuration.showTextScaleFactorSetting) const TextScaleFactorCard(),
      if (configuration.showWordSpacingSetting) const WordSpacingCard(),
      if (configuration.showLineHeightSetting) const LineHeightCard(),
      if (configuration.showLetterSpacingSetting) const LetterSpacingCard(),
    ];
    return SettingsGroup(
      title: context.l10n.sizeAndTextDisplay,
      separator: const SizedBox.shrink(),
      settings: [
        if (configuration.showTextAlignSetting)
          const SettingsItemRow(items: [TextAlignCard()]),
        if (toggles.isNotEmpty) SettingsItemRow(items: toggles),
        for (var i = 0; i < steppers.length; i += 2)
          SettingsItemRow(
            items: steppers.sublist(i, (i + 2).clamp(0, steppers.length)),
          ),
      ],
    );
  }
}
```

In `accessibility_settings_panel.dart`, replace the cards branch of the
text group switch with `const TextSettingsCardGroup()` and drop the Task 10
comment.

- [ ] **Step 3: Write the tests**

`test/ui/settings/widgets/components/stepper_settings_card_test.dart`:

```dart
import 'package:accessibility_material/src/ui/settings/widgets/components/stepper_settings_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('StepperSettingsCard steps within the range', (tester) async {
    final log = <double>[];
    Widget card(double value) => StepperSettingsCard(
      icon: Icons.format_size,
      title: 'Size',
      value: value,
      min: 1,
      max: 2,
      divisions: 4,
      decrementLabel: 'Less',
      incrementLabel: 'More',
      onChanged: log.add,
    );
    await pumpMaterial(tester, card(1));
    expect(tester.widget<IconButton>(find.byTooltip('Less')).onPressed, isNull);
    await tester.tap(find.byTooltip('More'));
    expect(log, [1.25]);
    await pumpMaterial(tester, card(2));
    expect(tester.widget<IconButton>(find.byTooltip('More')).onPressed, isNull);
    await tester.tap(find.byTooltip('Less'));
    expect(log.last, 1.75);
    expect(find.bySemanticsValue('5/5'), findsOneWidget);
  });
}
```

If `find.bySemanticsValue` is not available, read
`tester.getSemantics(find.byType(StepperSettingsCard))` and search its
descendants for `value == '5/5'`, and report it.

`test/ui/settings/widgets/text/text_cards_test.dart`: one test per card in
the shape of Task 9's tests: `TextScaleFactorCard` plus button → 1.25;
`WordSpacingCard` plus → 1.125; `LineHeightCard` plus → 1.625;
`LetterSpacingCard` plus → 0.625; `TextAlignCard` tap the centre segment
(`find.byIcon(Icons.align_horizontal_center_outlined)`) → `center`, tap it
again → `none`; `BoldCard` tap → bold, tap → not bold; `FontCard` with the
Andika font registered → `fontFamily` `'Andika'` then `null`.

`test/ui/settings/widgets/text/text_settings_card_group_test.dart`: as the
standard group test, asserting the card types and the configuration
gating, plus that four stepper cards produce two `SettingsItemRow`s of two
(`find.byType(SettingsItemRow)` count with the default configuration and
no fonts: 1 alignment row + 1 toggle row + 2 stepper rows = 4). Extend
`accessibility_settings_panel_test.dart` so the cards style asserts
`TextSettingsCardGroup`.

- [ ] **Step 4: Verify and commit**

Run: `cd packages/accessibility_material && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_material
```

```bash
git commit -m "feat(material): add the text group in the cards style"
```

---

### Task 11: Accessibility guideline tests, public API, example, docs and verification

**Files:**
- Create: `packages/accessibility_material/test/accessibility_guidelines_test.dart`,
  `packages/accessibility_material/test/public_api_test.dart`,
  `packages/accessibility_material/example/main.dart`
- Modify: `packages/accessibility_material/README.md`,
  `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`

**Interfaces:**
- Produces: the guideline tests of spec section 14 on the panel in both
  styles; a public API test; the pub.dev example; the spec aligned.

- [ ] **Step 1: Write the guideline tests**

`packages/accessibility_material/test/accessibility_guidelines_test.dart`:

```dart
import 'package:accessibility_material/accessibility_material.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_material.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

void main() {
  for (final style in AccessibilitySettingsStyle.values) {
    group('AccessibilitySettingsPanel (${style.name})', () {
      testWidgets('meets the accessibility guidelines', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpMaterial(
          tester,
          AccessibilitySettingsPanel(style: style),
          fonts: const [andika],
        );
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });

      testWidgets('meets the guidelines with every setting active', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();
        await pumpMaterial(
          tester,
          AccessibilitySettingsPanel(style: style),
          fonts: const [andika],
          initial: AccessibilitySettingsSamples.everythingSet,
        );
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });
    });
  }
}
```

The panel is taller than the test window; the guidelines evaluate the
laid-out semantics, so scroll the panel in steps (`tester.drag` by
`-400` pixels, `pumpAndSettle`, re-run the three guidelines) until the
restore button is visible, so every item is checked at least once. Write
that loop as a helper in the test file. If a guideline fails, fix the
offending widget (a missing label, a tap target below 48 dp, a text below
the contrast ratio) in its own file and report the change; never relax the
guideline.

- [ ] **Step 2: Write the public API test and the example**

`packages/accessibility_material/test/public_api_test.dart`:

```dart
import 'dart:io';

import 'package:accessibility_material/accessibility_material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the package API and the re-exports', () {
    final barrel = File('lib/accessibility_material.dart').readAsStringSync();
    for (final name in [
      'AccessibleThemeData',
      'AccessibleThemes',
      'AccessibleThemeBuilder',
      'AccessibleThemesWidgetBuilder',
      'AccessiblePageTransitionsTheme',
      'AccessibilitySettingsPanel',
      'RestoreSettingsButton',
      'ReadMoreText',
    ]) {
      expect(barrel, contains(name), reason: name);
    }
    expect(
      barrel,
      contains("export 'package:flutter_accessibility/flutter_accessibility.dart';"),
    );
    expect(barrel, contains('show AccessibilityLocalizations'));
    expect(barrel, isNot(contains('material_ui')));
  });

  test('the re-exported names resolve', () {
    expect(AccessibilitySettings.defaults.isDefault, isTrue);
    expect(AccessibilityLocalizations.supportedLocales, isNotEmpty);
    expect(const AccessibilitySettingsPanel().style, AccessibilitySettingsStyle.standard);
  });
}
```

`packages/accessibility_material/example/main.dart`:

```dart
import 'package:accessibility_material/accessibility_material.dart';
import 'package:material_ui/material_ui.dart';

/// Keeps the settings in memory; a real app uses
/// `accessibility_shared_preferences`.
final class InMemoryStorage implements AccessibilityStorageService {
  AccessibilitySettings? _value;

  @override
  Future<AccessibilitySettings?> read() async => _value;

  @override
  Future<void> write(AccessibilitySettings settings) async {
    _value = settings;
  }

  @override
  Future<void> clear() async {
    _value = null;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: InMemoryStorage(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const ExampleApp(),
    ),
  );
}

/// A Material app themed by the accessibility settings.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

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
      home: const SettingsPage(),
    ),
  );
}

/// The settings panel in a scaffold, with a style switch in the app bar.
final class SettingsPage extends StatefulWidget {
  /// Creates the page.
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _style = AccessibilitySettingsStyle.standard;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AccessibilityLocalizations.of(context).accessibilitySettings),
      actions: [
        IconButton(
          tooltip: 'Switch style',
          icon: const Icon(Icons.dashboard_customize),
          onPressed: () => setState(
            () => _style = _style == AccessibilitySettingsStyle.standard
                ? AccessibilitySettingsStyle.cards
                : AccessibilitySettingsStyle.standard,
          ),
        ),
      ],
    ),
    body: AccessibilitySettingsPanel(style: _style),
  );
}
```

- [ ] **Step 3: Finish the README and align the spec**

Append to `packages/accessibility_material/README.md`:

```markdown
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

## Localizations

The panel's strings come from `accessibility_localizations`; add
`AccessibilityLocalizations.delegate` next to
`GlobalMaterialLocalizations.delegates` (from `material_ui`) as in the
example above.
```

In the spec:
- Section 11.1: after the usage snippet, add "The `localizationsDelegates`
  list uses `material_ui`'s own `GlobalMaterialLocalizations.delegates`,
  which already include the widgets and Cupertino delegates." Replace
  `...GlobalMaterialLocalizations.delegates,` in the snippet with the same
  text (it is already correct).
- Section 11.2: replace "The 1.x transformation (text theme, primary text
  theme, button styles, input decoration, app bar, colour scheme
  adjustment, page transitions) moves as is, with three changes:" with
  "The 1.x transformation (text theme, primary text theme, button styles,
  app bar, component themes, colour scheme adjustment, page transitions)
  moves as is, with these changes:" and append to the list of changes:
  "the input decoration theme, left unapplied in 1.x, is applied
  (`errorStyle` keeps its colour); the app's own page-transition builders
  are kept; the high-contrast themes are derived by the builder from the
  app's `theme` and `darkTheme` with the profile forced, not taken as
  inputs."
- Section 11.3: add after the status card bullet: "The status card reads
  `AccessibilityScope.statusOf`, added to `flutter_accessibility` by plan
  4." Add after the tri-state bullet: "Their segment labels are the keys
  `themeModeSystem`, `themeModeLight`, `themeModeDark`,
  `effectsModeSystem`, `effectsModeEnabled`, `effectsModeDisabled`, added
  to `accessibility_localizations` by plan 4." Add a bullet: "Text
  alignment offers left, centre and right in both styles; the accessible
  font setting is shown only when the ViewModel has at least one registered
  font; the background colour picker is labelled with
  `changePagesBackgroundColor` (1.x reused the text-colour label)."
- Section 6.2: add `statusOf` to the scope's accessor list.
- Section 8: the count of keys becomes 79 (73 + 6 mode labels).

- [ ] **Step 4: Dry run, full verification and commit**

Run: `cd packages/accessibility_material && dart pub publish --dry-run`
Expected: `Package has 0 warnings` (notes about `resolution: workspace`
and the unpublished dependencies are acceptable).

From the workspace root:

```bash
flutter pub get
dart run melos run gen-l10n
git status --porcelain
dart run melos run format
dart run melos run analyze
dart run melos run test:coverage
dart run melos run coverage:check
```

Expected: no content change after `gen-l10n` (on Windows, `git diff --stat`
must be empty for `lib/src/generated`); every script green;
`accessibility`, `accessibility_testing`, `flutter_accessibility` and
`accessibility_shared_preferences` at 100.00%. Report the test count of
every package.

```bash
git add packages/accessibility_material docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md
```

```bash
git commit -m "test(material): add the accessibility guideline tests, the example and align the spec"
```

Tell the user the branch `feat/accessibility-material` is ready for its
pull request into `release/2.0`.

---

## Self-review against the spec

- **Section 3 / 3.1:** the package depends on `material_ui`,
  `flutter_accessibility`, `accessibility_localizations` (and `flutter`),
  re-exports `flutter_accessibility` and `AccessibilityLocalizations`
  (Task 2 barrel, Task 11 test); no `flutter/material.dart`, `cupertino_ui`
  or `flutter_localizations` import (Task 2 architecture test).
- **Section 4:** Views only; `lib/src/ui/theme`, `lib/src/ui/settings/widgets`,
  `lib/src/ui/text/widgets`, `lib/src/ui/core` (Tasks 4 to 10).
- **Section 6.4:** the shared configuration drives every group and item
  (Tasks 7 to 10); nullable candidates fall back to the 19-swatch palette
  (Task 8).
- **Section 11.1:** `AccessibleThemes` and `AccessibleThemeBuilder` with the
  four themes and the mode (Task 5); high-contrast variants by forcing the
  profile (Task 4 `forceHighContrast`).
- **Section 11.2:** `AccessibleThemeData.from(themeData:, settings:, font:, forceHighContrast:)`
  as an extension type (Task 4); text settings through `applyTextSettings`,
  colours through `withColorProfile`, nullable fields; the transitions
  theme resolving `effectsEnabledOf` at transition time (Task 4);
  deviations recorded in the spec (Task 11).
- **Section 11.3:** `AccessibilitySettingsPanel(style, configuration)`
  (Task 6); status card with the three visible states and retry (Task 6);
  tri-state segmented buttons in both styles (Task 7); active profile from
  `matchingThemeProfile` (Task 7); colour-profile icon map (Task 8);
  `RestoreSettingsButton` calling `restoreDefaults` then
  `onRestoreSettings` (Task 6); `ReadMoreText` over `CollapsibleText`
  (Task 6); groups, cards, tiles, sliders, colour picker and semantics
  ported (Tasks 7 to 10).
- **Section 11.4:** no `AccessibleMaterialApp`, `AppThemes`, public colour
  constants or `SettingsGroup` in the public API (Task 11 public API test:
  the barrel lists exactly eight names).
- **Section 13:** reduce motion through `effectsEnabledOf` in the page
  transitions (Task 4); increase contrast through the high-contrast themes
  (Task 5).
- **Section 14:** guideline tests in both styles, one rendering test per
  item asserting the command through the real repository and the fake
  service, the status card's three states, the four themes, the
  transitions on and off (Tasks 4 to 11); no coverage gate.
- **Section 15:** workspace and CI entries (Task 2).
- **Carried notes:** `ColorProfile.normal` never applied by the theme
  layer (Task 4 `_applyColorSettings`); `AccessibleText` applies only
  alignment and colour, so the theme is the single scaling point (Task 4
  doc and tests).
