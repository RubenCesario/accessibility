# accessibility 2.0, Plan 5 of 6: `accessibility_cupertino`

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver `packages/accessibility_cupertino` 2.0.0 on `cupertino_ui`
with full parity to `accessibility_material`: the theme builder and theme
data that apply the settings to a `CupertinoApp`, the routes that honour the
effects mode, and the settings panel in its two styles, driven by the
`flutter_accessibility` ViewModel.

**Architecture:** MVVM per the Flutter architecture guide. Views only: state
through `AccessibilityScope.settingsOf`/`statusOf`, commands through
`AccessibilityScope.of`. The theme layer is a pure transformation
`CupertinoThemeData -> CupertinoThemeData`; text goes through
`AccessibleTextStyle.applyTextSettings`, colours through
`AccessibleColor.withColorProfile` applied to every variant of a
`CupertinoDynamicColor`. Cupertino has no page-transitions theme, so the
reduce-motion behaviour lives in a route and a page class the app uses in
place of the originals.

**Tech Stack:** Flutter >= 3.44, `cupertino_ui` ^1.0.0 (re-exports
`package:flutter/widgets.dart`, ships `GlobalCupertinoLocalizations` with a
`delegates` list), `flutter_accessibility` 2.0.0, `accessibility_localizations`
2.0.0, `accessibility_testing` 2.0.0, `flutter_test` (accessibility
guidelines), melos 7, GitHub Actions.

**Spec:** `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
(sections 3, 4, 6.4, 12, 13, 14, 15 drive this plan).

**Plan series:** 1 foundation and core (merged, PR #13) · 2 `flutter_accessibility`
(merged, PRs #14, #15) · 3 localizations, shared_preferences, font (merged,
PRs #16, #17) · 4 `accessibility_material` (merged, PR #18) · 5
`accessibility_cupertino` (this) · 6 examples, deploy, docs, release.

**Reference implementation:** `packages/accessibility_material` (plan 4) is
the model for every widget here; its files, tests and rulings are named
where they matter. `cupertino_ui` 1.0.2 facts were verified in its sources
on 2026-09-08 and are quoted where they matter.

## Global Constraints

- Dart SDK `^3.12.0`; Flutter `>=3.44.0`. Dependencies of the package:
  `accessibility_localizations: ^2.0.0`, `cupertino_ui: ^1.0.0`, `flutter`
  (sdk), `flutter_accessibility: ^2.0.0`; dev dependencies
  `accessibility_testing: ^2.0.0`, `flutter_test` (sdk).
- No file under `lib/` imports `package:flutter/material.dart`,
  `package:flutter/cupertino.dart`, `package:material_ui`, `package:listen`
  or `package:flutter_localizations` (enforced by a test). Cupertino widgets
  come from `package:cupertino_ui/cupertino_ui.dart` only;
  `package:flutter/semantics.dart` is allowed for announcements.
- The package re-exports `package:flutter_accessibility/flutter_accessibility.dart`
  and `AccessibilityLocalizations`; its own public API is exactly:
  `AccessibleCupertinoThemeData`, `AccessibleCupertinoThemeBuilder`,
  `AccessibleCupertinoThemeWidgetBuilder`, `AccessibleCupertinoPageRoute`,
  `AccessibleCupertinoPage`, `CupertinoAccessibilitySettingsPanel`,
  `CupertinoRestoreSettingsButton`, `CupertinoReadMoreText`.
- Views hold no business logic; persistence is the ViewModel's concern.
- `ColorProfile.normal` is never applied; the high-contrast profile composes
  with (is applied after) the user's profile, once, exactly as
  `accessibility_material` does.
- Every `CupertinoTextThemeData` style goes through `applyTextSettings`;
  `AccessibleText` applies only alignment and colour.
- Tests: no coverage gate (`coverage_gate: 0`); required tests are the
  accessibility-guideline tests on the panel in both styles
  (`labeledTapTargetGuideline`, `iOSTapTargetGuideline`,
  `textContrastGuideline`), one rendering test per settings item asserting
  the ViewModel command through the real repository and the fake service,
  the status card's three visible states, the theme builder, the route and
  the page with effects on and off. Tap targets are at least 44 dp
  (`kMinInteractiveDimensionCupertino`).
- Every public member documented; `package:` imports only under `lib/`;
  80-column lines (import URIs exempt); trailing commas;
  `prefer_expression_function_bodies`; `avoid_positional_boolean_parameters`;
  `use_named_constants`, `prefer_const_constructors`,
  `avoid_redundant_argument_values`; `dart analyze --fatal-infos --fatal-warnings`
  clean including `example/` and `test/`. Infos are fatal: implementers add
  `const` where the analyzer asks and treat such edits as formatting.
  `num.clamp` returns `num` under strict casts: use `math.min`/`math.max`
  where an `int` or `double` is required.
- Localised strings come from `AccessibilityLocalizations` (lowerCamelCase
  keys, including the six tri-state labels added by plan 4).
- Commits follow Conventional Commits with the scopes `cupertino` and
  `flutter`; branch names use conventional types. No `Co-Authored-By`
  trailer, no session link, no "generated with" line.
- Work happens on branch `feat/accessibility-cupertino` (from `release/2.0`)
  in the worktree `.claude/worktrees/feat-flutter-accessibility`; the branch
  lands in `release/2.0` through a pull request.
- Git commands in this worktree are refused by the tooling when combined
  with other commands: every `git` invocation is its own plain Bash call.
  Never `git stash`.
- melos runs as `dart run melos run <cmd>` from the workspace root;
  dependency resolution is `flutter pub get` at the root. The console test
  reporter garbles lines under piped output: audit counts with
  `flutter test --file-reporter json:<scratch file>`.

---

### Task 1: `kDefaultColorCandidates` in `flutter_accessibility`

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/core/default_color_candidates.dart`
- Modify: `packages/flutter_accessibility/lib/flutter_accessibility.dart`,
  `packages/flutter_accessibility/CHANGELOG.md`,
  `packages/flutter_accessibility/test/public_api_test.dart`
- Test: `packages/flutter_accessibility/test/ui/core/default_color_candidates_test.dart`

**Interfaces:**
- Produces: `const List<ColorSwatch<int>> kDefaultColorCandidates`, the
  design-system-neutral palette the panels use when the configuration's
  candidates are `null`: the 19 Material primary swatches (red, pink,
  purple, deepPurple, indigo, blue, lightBlue, cyan, teal, green,
  lightGreen, lime, yellow, amber, orange, deepOrange, brown, grey,
  blueGrey), each with its ten shades 50..900, built with
  `ColorSwatch<int>` from `package:flutter/painting.dart` (no Material
  import). The `color` message of `accessibility_localizations` names
  exactly these 19 primaries, so their spoken labels work in every design
  system. Task 7 uses it as the Cupertino default palette.

- [ ] **Step 1: Write the failing test**

`packages/flutter_accessibility/test/ui/core/default_color_candidates_test.dart`:

```dart
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/default_color_candidates.dart';
import 'package:flutter_test/flutter_test.dart';

const primaries = [
  0xFFF44336,
  0xFFE91E63,
  0xFF9C27B0,
  0xFF673AB7,
  0xFF3F51B5,
  0xFF2196F3,
  0xFF03A9F4,
  0xFF00BCD4,
  0xFF009688,
  0xFF4CAF50,
  0xFF8BC34A,
  0xFFCDDC39,
  0xFFFFEB3B,
  0xFFFFC107,
  0xFFFF9800,
  0xFFFF5722,
  0xFF795548,
  0xFF9E9E9E,
  0xFF607D8B,
];

void main() {
  test('kDefaultColorCandidates holds the 19 Material primaries in order', () {
    expect(kDefaultColorCandidates, hasLength(19));
    expect(
      [for (final swatch in kDefaultColorCandidates) swatch.toARGB32()],
      primaries,
    );
  });

  test('every candidate has the ten shades and the 500 shade is the primary', () {
    for (final swatch in kDefaultColorCandidates) {
      for (final key in const [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]) {
        expect(swatch[key], isNotNull, reason: '$swatch $key');
      }
      expect(swatch[500], Color(swatch.toARGB32()), reason: '$swatch');
    }
  });
}
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `cd packages/flutter_accessibility && flutter test test/ui/core/default_color_candidates_test.dart`
Expected: compilation error, the file does not exist.

- [ ] **Step 3: Write the palette**

`packages/flutter_accessibility/lib/src/ui/core/default_color_candidates.dart`:
the 19 swatches as `const ColorSwatch<int>(primary, {50: Color(...), ..., 900: Color(...)})`
with the literal ARGB values of `material_ui`'s `Colors.red`, `Colors.pink`,
`Colors.purple`, `Colors.deepPurple`, `Colors.indigo`, `Colors.blue`,
`Colors.lightBlue`, `Colors.cyan`, `Colors.teal`, `Colors.green`,
`Colors.lightGreen`, `Colors.lime`, `Colors.yellow`, `Colors.amber`,
`Colors.orange`, `Colors.deepOrange`, `Colors.brown`, `Colors.grey`,
`Colors.blueGrey`. Copy the shade maps verbatim from
`C:\Users\ruben\AppData\Local\Pub\Cache\hosted\pub.dev\material_ui-1.1.1\lib\src\colors.dart`
(each is a `MaterialColor(0xFF..., <int, Color>{50: Color(0xFF...), ...})`
literal); the primaries are the ones listed in the test. File shape:

```dart
import 'package:flutter/painting.dart';

/// The colour candidates the settings panels offer when the configuration
/// gives none: the 19 Material primary swatches with their ten shades.
///
/// Built on `painting` only, so every design system can use them; the
/// `color` message of `accessibility_localizations` names each primary.
const kDefaultColorCandidates = <ColorSwatch<int>>[
  ColorSwatch<int>(0xFFF44336, {
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFF44336),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  }),
  // ... the other 18 swatches in the order of the test's primaries
];
```

Export it from `lib/flutter_accessibility.dart`:

```dart
export 'src/ui/core/default_color_candidates.dart' show kDefaultColorCandidates;
```

(keep the export list sorted). Add `kDefaultColorCandidates` to the names
the barrel test `test/public_api_test.dart` checks. CHANGELOG 2.0.0 entry,
new bullet:

```markdown
* `kDefaultColorCandidates`, the 19-swatch palette the panels use when no
  colour candidates are configured, built on `painting` only.
```

- [ ] **Step 4: Verify and commit**

Run: `cd packages/flutter_accessibility && flutter test --coverage && dart ../../tool/check_coverage.dart coverage/lcov.info 100 && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, `Line coverage: 100.00%`, clean. (A `const`
list has no executable lines; the gate stays satisfied by the rest.)

```bash
git add packages/flutter_accessibility
```

```bash
git commit -m "feat(flutter): add kDefaultColorCandidates, the design-system-neutral palette"
```

---

### Task 2: Package skeleton, workspace, CI and the test pump helper

**Files:**
- Create: `packages/accessibility_cupertino/pubspec.yaml`,
  `packages/accessibility_cupertino/analysis_options.yaml`,
  `packages/accessibility_cupertino/.pubignore`,
  `packages/accessibility_cupertino/LICENSE`,
  `packages/accessibility_cupertino/CHANGELOG.md`,
  `packages/accessibility_cupertino/README.md`,
  `packages/accessibility_cupertino/lib/accessibility_cupertino.dart`,
  `packages/accessibility_cupertino/lib/src/ui/core/panel_localizations.dart`,
  `packages/accessibility_cupertino/test/architecture_test.dart`,
  `packages/accessibility_cupertino/test/helpers/pump_cupertino.dart`,
  `packages/accessibility_cupertino/test/helpers/pump_cupertino_test.dart`
- Modify: `pubspec.yaml` (root), `.github/workflows/build.yml`

**Interfaces:**
- Produces: a resolvable workspace member; the helper
  `Future<AccessibilitySettingsViewModel> pumpCupertino(WidgetTester tester, Widget child, {AccessibilitySettings initial, List<AccessibleFont> fonts, bool disableAnimations, bool highContrast, CupertinoThemeData? theme, AccessibilityStorageService? service})`
  building `AccessibilityScope > MediaQuery > CupertinoApp(home: CupertinoPageScaffold(child: child))`
  with `GlobalCupertinoLocalizations.delegates` plus the accessibility
  delegate; `BuildContext.l10n`.

- [ ] **Step 1: Create the package files**

`packages/accessibility_cupertino/pubspec.yaml`:

```yaml
name: accessibility_cupertino
description: Cupertino theme builder, routes and settings panel of the accessibility package family, built on cupertino_ui.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_cupertino
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - wcag
  - cupertino
  - theme
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  accessibility_localizations: ^2.0.0
  cupertino_ui: ^1.0.0
  flutter:
    sdk: flutter
  flutter_accessibility: ^2.0.0

dev_dependencies:
  accessibility_testing: ^2.0.0
  flutter_test:
    sdk: flutter
```

`analysis_options.yaml`: `include: ../../analysis_options.yaml`.
`.pubignore`: `analysis_options.yaml` and `coverage/` (two lines). Copy
the licence: `cp LICENSE packages/accessibility_cupertino/LICENSE`.

`packages/accessibility_cupertino/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release, with full parity to `accessibility_material`, built on
  `cupertino_ui`: `AccessibleCupertinoThemeBuilder` and
  `AccessibleCupertinoThemeData` apply the settings to the app's theme
  (brightness from the theme mode, high contrast from the OS),
  `AccessibleCupertinoPageRoute` and `AccessibleCupertinoPage` honour the
  effects mode, and `CupertinoAccessibilitySettingsPanel` offers the
  settings in the standard and the inset-grouped (cards) style, driven by
  the `flutter_accessibility` ViewModel.
```

`packages/accessibility_cupertino/README.md` (extended in Task 9):

````markdown
# accessibility_cupertino

The Cupertino layer of the accessibility package family, built on
`cupertino_ui`. It re-exports `flutter_accessibility` and
`AccessibilityLocalizations`, so this is the only import a Cupertino app
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
````

`packages/accessibility_cupertino/lib/accessibility_cupertino.dart`:

```dart
/// Cupertino theme builder, routes and settings panel of the accessibility
/// package family, built on `cupertino_ui`.
///
/// Re-exports `package:flutter_accessibility` and
/// `AccessibilityLocalizations`.
library;

export 'package:accessibility_localizations/accessibility_localizations.dart'
    show AccessibilityLocalizations;
export 'package:flutter_accessibility/flutter_accessibility.dart';
```

`packages/accessibility_cupertino/lib/src/ui/core/panel_localizations.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// Shorthand for the package's localised strings.
extension PanelLocalizations on BuildContext {
  /// The translations above this context.
  AccessibilityLocalizations get l10n => AccessibilityLocalizations.of(this);
}
```

- [ ] **Step 2: Register the package and the CI entry**

Root `pubspec.yaml`: append `- packages/accessibility_cupertino` to
`workspace:`. `.github/workflows/build.yml`, append to `matrix.include`:

```yaml
          - package: accessibility_cupertino
            coverage_gate: 0
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
            test_command: flutter test --coverage
```

Run: `flutter pub get`. Expected: resolves (`cupertino_ui` 1.0.x already in
the lockfile through `material_ui`).

- [ ] **Step 3: Write the architecture test**

`packages/accessibility_cupertino/test/architecture_test.dart`: the same
scanner as `packages/accessibility_material/test/architecture_test.dart`
(read it and copy its shape) with the forbidden list
`['package:flutter/material.dart', 'package:flutter/cupertino.dart', 'package:material_ui', 'package:listen', 'package:flutter_localizations']`
and the test name `'lib builds on cupertino_ui only'`.

- [ ] **Step 4: Write the pump helper and its smoke test**

`packages/accessibility_cupertino/test/helpers/pump_cupertino.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

/// Pumps [child] inside a `CupertinoPageScaffold` of a `CupertinoApp` under
/// an [AccessibilityScope], with the Cupertino and accessibility
/// translations loaded, and returns the ViewModel so tests can invoke
/// commands.
///
/// The repository is backed by [service] (a
/// [FakeAccessibilityStorageService] holding [initial] by default) and is
/// loaded before the first frame. [theme] replaces the default theme.
/// [disableAnimations] and [highContrast] set the media query flags.
Future<AccessibilitySettingsViewModel> pumpCupertino(
  WidgetTester tester,
  Widget child, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  List<AccessibleFont> fonts = const [],
  bool disableAnimations = false,
  bool highContrast = false,
  CupertinoThemeData? theme,
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
        child: CupertinoApp(
          theme: theme,
          localizationsDelegates: const [
            ...GlobalCupertinoLocalizations.delegates,
            AccessibilityLocalizations.delegate,
          ],
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          home: CupertinoPageScaffold(child: child),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return viewModel;
}
```

`packages/accessibility_cupertino/test/helpers/pump_cupertino_test.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_cupertino.dart';

void main() {
  testWidgets('pumpCupertino provides the scope, the theme and the strings', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpCupertino(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return Text(AccessibilityLocalizations.of(context).accessibility);
        },
      ),
    );
    expect(find.text('Accessibility'), findsOneWidget);
    expect(CupertinoTheme.of(captured).primaryColor, isNotNull);
    expect(CupertinoLocalizations.of(captured).alertDialogLabel, 'Alert');
  });

  testWidgets('pumpCupertino forwards the media query flags', (tester) async {
    late BuildContext captured;
    await pumpCupertino(
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

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: 3 tests pass, clean.

```bash
git add pubspec.yaml pubspec.lock .github/workflows/build.yml packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add the accessibility_cupertino package skeleton and wire it into melos and CI"
```

---

### Task 3: `AccessibleCupertinoThemeData`

**Files:**
- Create: `packages/accessibility_cupertino/lib/src/ui/theme/accessible_cupertino_theme_data.dart`
- Test: `packages/accessibility_cupertino/test/ui/theme/accessible_cupertino_theme_data_test.dart`

**Interfaces:**
- Produces: `extension type AccessibleCupertinoThemeData._(CupertinoThemeData) implements CupertinoThemeData` with `factory .from({required CupertinoThemeData themeData, required AccessibilitySettings settings, AccessibleFont? font, bool highContrast = false})`.
- Rulings (binding for the implementer):
  - Brightness: `AccessibilityThemeMode.system` keeps the app theme's own
    `brightness` (`null` by default, which follows the platform);
    `light`/`dark` force it. `copyWith` cannot reset a brightness to
    `null`, so `system` never touches it.
  - Colours: the four colours (`primaryColor`, `primaryContrastingColor`,
    `barBackgroundColor`, `scaffoldBackgroundColor`) plus
    `selectionHandleColor` go through the profile. A
    `CupertinoDynamicColor` is rebuilt variant by variant (its eight
    colours, keeping `debugLabel`) so the theme still resolves against
    brightness, elevation and OS contrast; a plain `Color` goes through
    `withColorProfile` directly. The user's profile is applied first,
    the high-contrast profile after it when [highContrast] is true and
    the user's profile is not already `highContrast` (the same
    composition rule as `accessibility_material`). `normal` is never
    applied. The background override sets `scaffoldBackgroundColor`.
  - Text: every one of the nine `CupertinoTextThemeData` styles goes
    through `applyTextSettings`; the text theme is read after the colour
    pass so a default text theme picks up the adjusted primary colour.
    Text style colours are not run through the profile (parity with
    Material, whose text theme colours are also left alone).

- [ ] **Step 1: Write the failing tests**

`packages/accessibility_cupertino/test/ui/theme/accessible_cupertino_theme_data_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_data.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

const base = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(fontFamily: 'AppFont', fontSize: 17),
  ),
);

AccessibleCupertinoThemeData themed(
  AccessibilitySettings settings, {
  CupertinoThemeData theme = base,
  AccessibleFont? font,
  bool highContrast = false,
}) => AccessibleCupertinoThemeData.from(
  themeData: theme,
  settings: settings,
  font: font,
  highContrast: highContrast,
);

final highContrastProfile = ColorProfile.fromLevel(
  ColorProfileLevel.highContrast,
);
final monochrome = ColorProfile.fromLevel(ColorProfileLevel.monochrome);

void main() {
  group('AccessibleCupertinoThemeData.from', () {
    test('leaves a default theme alone for default settings', () {
      final theme = themed(AccessibilitySettings.defaults);
      expect(theme.brightness, isNull);
      expect(theme.primaryColor, CupertinoColors.systemBlue);
      expect(theme.scaffoldBackgroundColor, CupertinoColors.systemBackground);
      expect(theme.textTheme.textStyle.fontSize, 17);
      expect(theme.textTheme.textStyle.fontFamily, 'AppFont');
    });

    test('maps the theme mode to the brightness', () {
      expect(
        themed(
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.dark),
        ).brightness,
        Brightness.dark,
      );
      expect(
        themed(
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
        ).brightness,
        Brightness.light,
      );
      const dark = CupertinoThemeData(brightness: Brightness.dark);
      expect(themed(AccessibilitySettings.defaults, theme: dark).brightness,
          Brightness.dark);
      expect(
        themed(
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
          theme: dark,
        ).brightness,
        Brightness.light,
      );
    });

    test('scales every text style', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      final text = theme.textTheme;
      expect(text.textStyle.fontSize, 34);
      expect(text.actionTextStyle.fontSize, 34);
      expect(text.actionSmallTextStyle.fontSize, 30);
      expect(text.tabLabelTextStyle.fontSize, 20);
      expect(text.navTitleTextStyle.fontSize, 34);
      expect(text.navLargeTitleTextStyle.fontSize, 68);
      expect(text.navActionTextStyle.fontSize, 34);
      expect(text.pickerTextStyle.fontSize, 42);
      expect(text.dateTimePickerTextStyle.fontSize, 42);
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
      final style = theme.textTheme.textStyle;
      expect(style.height, 1.8);
      expect(style.letterSpacing, 1);
      expect(style.wordSpacing, 2);
      expect(style.fontWeight, FontWeight.bold);
      expect(style.color, const Color(0xFF112233));
      expect(theme.textTheme.navTitleTextStyle.color, const Color(0xFF112233));
      expect(theme.textTheme.actionTextStyle.color, const Color(0xFF112233));
    });

    test(
      'qualifies the accessible font and keeps the app font as fallback',
      () {
        final theme = themed(
          const AccessibilitySettings(
            textSettings: TextSettings(fontFamily: 'Andika'),
          ),
          font: andika,
        );
        final style = theme.textTheme.textStyle;
        expect(style.fontFamily, 'packages/accessibility_font_andika/Andika');
        expect(style.fontFamilyFallback, contains('AppFont'));
        expect(
          theme.textTheme.navLargeTitleTextStyle.fontFamily,
          'packages/accessibility_font_andika/Andika',
        );
      },
    );

    test('keeps the dynamic label colour when no text colour is set', () {
      final theme = themed(
        const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 1.5),
        ),
        theme: const CupertinoThemeData(),
      );
      expect(theme.textTheme.textStyle.color, CupertinoColors.label);
      expect(theme.textTheme.textStyle.fontSize, 25.5);
    });

    test('sets the page background and leaves the rest for normal', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(backgroundColor: 0xFFFFFFF0),
        ),
      );
      expect(theme.scaffoldBackgroundColor, const Color(0xFFFFFFF0));
      expect(theme.primaryColor, CupertinoColors.systemBlue);
      expect(theme.barBackgroundColor, base.barBackgroundColor);
    });

    test('applies the profile to every variant of a dynamic colour', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final primary = theme.primaryColor;
      expect(primary, isA<CupertinoDynamicColor>());
      final dynamic = primary as CupertinoDynamicColor;
      const source = CupertinoColors.systemBlue;
      expect(dynamic.color, source.color.withColorProfile(monochrome));
      expect(dynamic.darkColor, source.darkColor.withColorProfile(monochrome));
      expect(
        dynamic.highContrastColor,
        source.highContrastColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.darkHighContrastColor,
        source.darkHighContrastColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.elevatedColor,
        source.elevatedColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.darkElevatedColor,
        source.darkElevatedColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.highContrastElevatedColor,
        source.highContrastElevatedColor.withColorProfile(monochrome),
      );
      expect(
        dynamic.darkHighContrastElevatedColor,
        source.darkHighContrastElevatedColor.withColorProfile(monochrome),
      );
      for (final color in [
        theme.primaryContrastingColor,
        theme.barBackgroundColor,
        theme.scaffoldBackgroundColor,
        theme.selectionHandleColor,
      ]) {
        expect(HSLColor.fromColor(color).saturation, 0, reason: '$color');
      }
    });

    test('applies the profile to plain colours', () {
      const custom = CupertinoThemeData(primaryColor: Color(0xFF2196F3));
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        theme: custom,
      );
      expect(theme.primaryColor, isNot(isA<CupertinoDynamicColor>()));
      expect(
        theme.primaryColor,
        const Color(0xFF2196F3).withColorProfile(monochrome),
      );
    });

    test('forces the high-contrast profile on request', () {
      final normal = themed(AccessibilitySettings.defaults);
      final forced = themed(AccessibilitySettings.defaults, highContrast: true);
      final expected = (normal.primaryColor as CupertinoDynamicColor).color
          .withColorProfile(highContrastProfile);
      expect((forced.primaryColor as CupertinoDynamicColor).color, expected);
      expect(forced.primaryColor, isNot(normal.primaryColor));
    });

    test('composes the forced high contrast with the user profile', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        highContrast: true,
      );
      expect(
        (theme.primaryColor as CupertinoDynamicColor).color,
        CupertinoColors.systemBlue.color
            .withColorProfile(monochrome)
            .withColorProfile(highContrastProfile),
      );
    });

    test(
      'applies high contrast once when the user profile is high contrast',
      () {
        const settings = AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.highContrast,
          ),
        );
        final unforced = themed(settings);
        final forced = themed(settings, highContrast: true);
        expect(forced.primaryColor, unforced.primaryColor);
      },
    );

    test('picks up the adjusted primary in a default text theme', () {
      final theme = themed(
        const AccessibilitySettings(
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
        theme: const CupertinoThemeData(),
      );
      expect(theme.textTheme.actionTextStyle.color, theme.primaryColor);
    });

    test('is a CupertinoThemeData', () {
      final CupertinoThemeData theme = themed(
        AccessibilitySettingsSamples.everythingSet,
      );
      expect(theme.applyThemeToAll, isFalse);
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `cd packages/accessibility_cupertino && flutter test test/ui/theme/accessible_cupertino_theme_data_test.dart`
Expected: compilation error, the file does not exist.

- [ ] **Step 3: Write the theme data**

`packages/accessibility_cupertino/lib/src/ui/theme/accessible_cupertino_theme_data.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A [CupertinoThemeData] with the accessibility settings applied.
///
/// The theme mode sets the brightness (`system` keeps the app theme's own,
/// which follows the platform when `null`); the colour settings set the
/// page background and adjust the theme colours with the colour profile,
/// variant by variant for a [CupertinoDynamicColor] (never for
/// [ColorProfileLevel.normal]); the text settings are applied through
/// [AccessibleTextStyle.applyTextSettings] to every style of the text
/// theme. [AccessibleText] therefore applies only alignment and colour.
extension type AccessibleCupertinoThemeData._(CupertinoThemeData _themeData)
    implements CupertinoThemeData {
  /// Applies [settings] to [themeData].
  ///
  /// [font] is the registered font matching the settings' family, used to
  /// qualify the family with its package. [highContrast] applies the
  /// high-contrast colour profile in addition to the settings' profile,
  /// for the OS "increase contrast" setting; it is a no-op when the
  /// settings' profile is already [ColorProfileLevel.highContrast], since
  /// that pass already applied it.
  factory AccessibleCupertinoThemeData.from({
    required CupertinoThemeData themeData,
    required AccessibilitySettings settings,
    AccessibleFont? font,
    bool highContrast = false,
  }) {
    final brightness = switch (settings.themeMode) {
      AccessibilityThemeMode.system => null,
      AccessibilityThemeMode.light => Brightness.light,
      AccessibilityThemeMode.dark => Brightness.dark,
    };
    final colored = _applyColorSettings(
      themeData.copyWith(brightness: brightness),
      settings.colorSettings,
      highContrast: highContrast,
    );
    return AccessibleCupertinoThemeData._(
      colored.copyWith(
        textTheme: _applyTextSettings(
          colored.textTheme,
          settings.textSettings,
          font,
        ),
      ),
    );
  }
}

CupertinoThemeData _applyColorSettings(
  CupertinoThemeData theme,
  ColorSettings settings, {
  required bool highContrast,
}) {
  final background = settings.backgroundColor;
  var result = theme;
  if (background != null) {
    result = result.copyWith(scaffoldBackgroundColor: Color(background));
  }
  if (settings.colorProfile != ColorProfileLevel.normal) {
    result = _adjustColors(result, ColorProfile.fromLevel(settings.colorProfile));
  }
  if (highContrast && settings.colorProfile != ColorProfileLevel.highContrast) {
    result = _adjustColors(
      result,
      ColorProfile.fromLevel(ColorProfileLevel.highContrast),
    );
  }
  return result;
}

/// Applies [profile] to every colour of [theme].
CupertinoThemeData _adjustColors(
  CupertinoThemeData theme,
  ColorProfile profile,
) => theme.copyWith(
  primaryColor: _adjust(theme.primaryColor, profile),
  primaryContrastingColor: _adjust(theme.primaryContrastingColor, profile),
  barBackgroundColor: _adjust(theme.barBackgroundColor, profile),
  scaffoldBackgroundColor: _adjust(theme.scaffoldBackgroundColor, profile),
  selectionHandleColor: _adjust(theme.selectionHandleColor, profile),
);

/// Applies [profile] to [color], variant by variant when it is dynamic so
/// it keeps resolving against brightness, elevation and OS contrast.
Color _adjust(Color color, ColorProfile profile) => switch (color) {
  CupertinoDynamicColor() => CupertinoDynamicColor(
    debugLabel: color.debugLabel,
    color: color.color.withColorProfile(profile),
    darkColor: color.darkColor.withColorProfile(profile),
    highContrastColor: color.highContrastColor.withColorProfile(profile),
    darkHighContrastColor: color.darkHighContrastColor.withColorProfile(
      profile,
    ),
    elevatedColor: color.elevatedColor.withColorProfile(profile),
    darkElevatedColor: color.darkElevatedColor.withColorProfile(profile),
    highContrastElevatedColor: color.highContrastElevatedColor
        .withColorProfile(profile),
    darkHighContrastElevatedColor: color.darkHighContrastElevatedColor
        .withColorProfile(profile),
  ),
  _ => color.withColorProfile(profile),
};

CupertinoTextThemeData _applyTextSettings(
  CupertinoTextThemeData source,
  TextSettings text,
  AccessibleFont? font,
) {
  if (text.isDefault) {
    return source;
  }
  TextStyle style(TextStyle style) => style.applyTextSettings(text, font: font);
  return source.copyWith(
    textStyle: style(source.textStyle),
    actionTextStyle: style(source.actionTextStyle),
    actionSmallTextStyle: style(source.actionSmallTextStyle),
    tabLabelTextStyle: style(source.tabLabelTextStyle),
    navTitleTextStyle: style(source.navTitleTextStyle),
    navLargeTitleTextStyle: style(source.navLargeTitleTextStyle),
    navActionTextStyle: style(source.navActionTextStyle),
    pickerTextStyle: style(source.pickerTextStyle),
    dateTimePickerTextStyle: style(source.dateTimePickerTextStyle),
  );
}
```

Notes for the implementer: `CupertinoThemeData.copyWith(brightness: null)`
keeps the theme's own brightness, which is exactly the `system` rule.
`CupertinoDynamicColor.debugLabel` is a public field. The expected sizes
in the scaling test come from cupertino_ui's default text theme (17, 17,
15, 10, 17, 34, 17, 21, 21) times two; if a size differs, read
`cupertino_ui-1.0.2/lib/src/text_theme.dart` and fix the test, not the
code. Format with `dart format` before analysing: the long `if` and
`_adjustColors` lines above wrap.

- [ ] **Step 4: Verify and commit**

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add AccessibleCupertinoThemeData applying the settings to a CupertinoThemeData"
```

---

### Task 4: Theme builder, route and page

**Files:**
- Create: `packages/accessibility_cupertino/lib/src/ui/theme/accessible_cupertino_theme_builder.dart`,
  `packages/accessibility_cupertino/lib/src/ui/routes/route_effects.dart`,
  `packages/accessibility_cupertino/lib/src/ui/routes/accessible_cupertino_transition_mixin.dart`,
  `packages/accessibility_cupertino/lib/src/ui/routes/accessible_cupertino_page_route.dart`,
  `packages/accessibility_cupertino/lib/src/ui/routes/accessible_cupertino_page.dart`
- Test: `packages/accessibility_cupertino/test/ui/theme/accessible_cupertino_theme_builder_test.dart`,
  `packages/accessibility_cupertino/test/ui/routes/route_effects_test.dart`,
  `packages/accessibility_cupertino/test/ui/routes/accessible_cupertino_routes_test.dart`

**Interfaces:**
- Produces: `AccessibleCupertinoThemeBuilder({required AccessibleCupertinoThemeWidgetBuilder builder, CupertinoThemeData? theme})`,
  `typedef AccessibleCupertinoThemeWidgetBuilder = Widget Function(BuildContext context, CupertinoThemeData theme)`;
  `AccessibleCupertinoPageRoute<T> extends CupertinoPageRoute<T>`,
  `AccessibleCupertinoPage<T> extends CupertinoPage<T>`, the mixin
  `AccessibleCupertinoTransitionMixin<T> on CupertinoRouteTransitionMixin<T>`
  (in `lib/src`, not exported) and `bool routeEffectsEnabled(BuildContext)`.
- Rulings:
  - The builder usually sits above `CupertinoApp`, where there is no
    `MediaQuery`. It reads `MediaQuery.maybeHighContrastOf` and, when
    there is no media query, falls back to the platform's
    `accessibilityFeatures.highContrast` through `View.of(context)`,
    observing `didChangeAccessibilityFeatures` to rebuild. The theme is
    `const CupertinoThemeData()` when none is given.
  - Cupertino has no page-transitions theme, so effects are honoured by
    the route: when effects are off the route keeps Cupertino's
    transition widgets but drives them with `kAlwaysCompleteAnimation`
    and `kAlwaysDismissedAnimation`, so the page is drawn in its final
    place with no motion while the edge-swipe back gesture keeps
    working, and `transitionDuration`/`reverseTransitionDuration` are
    `Duration.zero`, so neighbouring routes do not animate either. The
    durations are read when the route is installed, through the
    navigator's context and without registering dependencies
    (`routeEffectsEnabled`); `buildTransitions` uses
    `AccessibilityScope.effectsEnabledOf` so it follows later changes.
    Without an `AccessibilityScope` the route behaves like the original.

- [ ] **Step 1: Write the failing tests**

`packages/accessibility_cupertino/test/ui/theme/accessible_cupertino_theme_builder_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_builder.dart';
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Future<(AccessibilitySettingsViewModel, List<CupertinoThemeData>)> pumpBuilder(
  WidgetTester tester, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  CupertinoThemeData? theme,
  bool? highContrast,
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
  final seen = <CupertinoThemeData>[];
  Widget builder = AccessibleCupertinoThemeBuilder(
    theme: theme,
    builder: (context, theme) {
      seen.add(theme);
      return CupertinoApp(
        theme: theme,
        localizationsDelegates: const [
          ...GlobalCupertinoLocalizations.delegates,
          AccessibilityLocalizations.delegate,
        ],
        supportedLocales: AccessibilityLocalizations.supportedLocales,
        home: const CupertinoPageScaffold(child: Text('home')),
      );
    },
  );
  if (highContrast != null) {
    builder = MediaQuery(
      data: MediaQueryData(highContrast: highContrast),
      child: builder,
    );
  }
  await tester.pumpWidget(
    AccessibilityScope(viewModel: viewModel, child: builder),
  );
  await tester.pumpAndSettle();
  return (viewModel, seen);
}

void main() {
  group('AccessibleCupertinoThemeBuilder', () {
    testWidgets('yields a theme reflecting the settings', (tester) async {
      final (_, seen) = await pumpBuilder(
        tester,
        initial: const AccessibilitySettings(
          themeMode: AccessibilityThemeMode.dark,
          textSettings: TextSettings(textScaleFactor: 2, fontFamily: 'Andika'),
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final theme = seen.last;
      expect(theme.brightness, Brightness.dark);
      expect(theme.textTheme.textStyle.fontSize, 34);
      expect(
        theme.textTheme.textStyle.fontFamily,
        'packages/accessibility_font_andika/Andika',
      );
      expect(
        HSLColor.fromColor(
          (theme.primaryColor as CupertinoDynamicColor).color,
        ).saturation,
        0,
      );
    });

    testWidgets('uses the given theme and rebuilds on settings changes', (
      tester,
    ) async {
      const seed = CupertinoThemeData(primaryColor: Color(0xFF00FF00));
      final (viewModel, seen) = await pumpBuilder(tester, theme: seed);
      final before = seen.length;
      expect(seen.last.primaryColor, const Color(0xFF00FF00));
      await viewModel.setTextScaleFactor(1.5);
      await tester.pumpAndSettle();
      expect(seen.length, greaterThan(before));
      expect(seen.last.textTheme.textStyle.fontSize, 25.5);
    });

    testWidgets('forces high contrast from the media query', (tester) async {
      final (_, seen) = await pumpBuilder(tester, highContrast: true);
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(
        (seen.last.primaryColor as CupertinoDynamicColor).color,
        CupertinoColors.systemBlue.color.withColorProfile(profile),
      );
      final (_, normal) = await pumpBuilder(tester, highContrast: false);
      expect(normal.last.primaryColor, CupertinoColors.systemBlue);
    });

    testWidgets('follows the platform contrast without a media query', (
      tester,
    ) async {
      final (_, seen) = await pumpBuilder(tester);
      expect(seen.last.primaryColor, CupertinoColors.systemBlue);
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(highContrast: true);
      addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
      await tester.pumpAndSettle();
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(
        (seen.last.primaryColor as CupertinoDynamicColor).color,
        CupertinoColors.systemBlue.color.withColorProfile(profile),
      );
    });

    testWidgets('resolves the theme inside the app', (tester) async {
      late BuildContext captured;
      final repository = AccessibilitySettingsRepository(
        service: FakeAccessibilityStorageService(
          initial: const AccessibilitySettings(
            themeMode: AccessibilityThemeMode.dark,
          ),
        ),
      );
      await repository.load();
      final viewModel = AccessibilitySettingsViewModel(repository: repository);
      addTearDown(() {
        viewModel.dispose();
        repository.dispose();
      });
      await tester.pumpWidget(
        AccessibilityScope(
          viewModel: viewModel,
          child: AccessibleCupertinoThemeBuilder(
            builder: (context, theme) => CupertinoApp(
              theme: theme,
              home: Builder(
                builder: (context) {
                  captured = context;
                  return const SizedBox();
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(CupertinoTheme.brightnessOf(captured), Brightness.dark);
      expect(
        CupertinoTheme.of(captured).scaffoldBackgroundColor,
        CupertinoColors.systemBackground.darkColor,
      );
    });
  });
}
```

`packages/accessibility_cupertino/test/ui/routes/route_effects_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/routes/route_effects.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_cupertino.dart';

Widget capture(void Function(BuildContext context) onBuild) => Builder(
  builder: (context) {
    onBuild(context);
    return const SizedBox();
  },
);

void main() {
  group('routeEffectsEnabled', () {
    testWidgets('is true by default', (tester) async {
      late BuildContext captured;
      await pumpCupertino(tester, capture((context) => captured = context));
      expect(routeEffectsEnabled(captured), isTrue);
    });

    testWidgets('is false when the user disabled effects', (tester) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        capture((context) => captured = context),
        initial: const AccessibilitySettings(
          effectsMode: EffectsMode.disabled,
        ),
      );
      expect(routeEffectsEnabled(captured), isFalse);
    });

    testWidgets('follows the OS reduce-motion signal in system mode', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        capture((context) => captured = context),
        disableAnimations: true,
      );
      expect(routeEffectsEnabled(captured), isFalse);
    });

    testWidgets('ignores the OS signal when effects are forced on', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        capture((context) => captured = context),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.enabled),
        disableAnimations: true,
      );
      expect(routeEffectsEnabled(captured), isTrue);
    });

    testWidgets('is true without a scope', (tester) async {
      late BuildContext captured;
      await tester.pumpWidget(
        CupertinoApp(home: capture((context) => captured = context)),
      );
      expect(routeEffectsEnabled(captured), isTrue);
    });
  });
}
```

`packages/accessibility_cupertino/test/ui/routes/accessible_cupertino_routes_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_page.dart';
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_page_route.dart';
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_transition_mixin.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_cupertino.dart';

const second = Text('second');

/// A button that pushes [route] when tapped.
Widget pusher(AccessibleCupertinoPageRoute<void> route) => Builder(
  builder: (context) => CupertinoButton(
    onPressed: () => Navigator.of(context).push(route),
    child: const Text('go'),
  ),
);

AccessibleCupertinoPageRoute<void> secondRoute() =>
    AccessibleCupertinoPageRoute<void>(
      builder: (_) => const CupertinoPageScaffold(child: second),
    );

void main() {
  group('AccessibleCupertinoPageRoute', () {
    testWidgets('slides in with the default duration when effects are on', (
      tester,
    ) async {
      final route = secondRoute();
      expect(
        route.transitionDuration,
        CupertinoRouteTransitionMixin.kTransitionDuration,
      );
      await pumpCupertino(tester, pusher(route));
      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(
        route.transitionDuration,
        CupertinoRouteTransitionMixin.kTransitionDuration,
      );
      expect(route.reverseTransitionDuration, route.transitionDuration);
      expect(tester.getTopLeft(find.byWidget(second)).dx, greaterThan(0));
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
    });

    testWidgets('appears in place without motion when effects are off', (
      tester,
    ) async {
      final route = secondRoute();
      await pumpCupertino(
        tester,
        pusher(route),
        initial: const AccessibilitySettings(
          effectsMode: EffectsMode.disabled,
        ),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      expect(route.transitionDuration, Duration.zero);
      expect(route.reverseTransitionDuration, Duration.zero);
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
      // The transition widgets stay, so the back gesture keeps working.
      expect(find.byType(CupertinoPageTransition), findsWidgets);
      expect(tester.binding.hasScheduledFrame, isFalse);
    });

    testWidgets('follows the OS reduce-motion signal', (tester) async {
      final route = secondRoute();
      await pumpCupertino(tester, pusher(route), disableAnimations: true);
      await tester.tap(find.text('go'));
      await tester.pump();
      expect(route.transitionDuration, Duration.zero);
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
    });

    testWidgets('pops without motion when effects are off', (tester) async {
      final route = secondRoute();
      await pumpCupertino(
        tester,
        pusher(route),
        initial: const AccessibilitySettings(
          effectsMode: EffectsMode.disabled,
        ),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      Navigator.of(tester.element(find.byWidget(second))).pop();
      await tester.pump();
      await tester.pump();
      expect(find.byWidget(second), findsNothing);
      expect(find.text('go'), findsOneWidget);
    });

    testWidgets('behaves like CupertinoPageRoute without a scope', (
      tester,
    ) async {
      final route = secondRoute();
      await tester.pumpWidget(
        CupertinoApp(home: CupertinoPageScaffold(child: pusher(route))),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(
        route.transitionDuration,
        CupertinoRouteTransitionMixin.kTransitionDuration,
      );
      expect(tester.getTopLeft(find.byWidget(second)).dx, greaterThan(0));
    });

    testWidgets('keeps the fullscreen dialog transition', (tester) async {
      final route = AccessibleCupertinoPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const CupertinoPageScaffold(child: second),
      );
      await pumpCupertino(
        tester,
        pusher(route),
        initial: const AccessibilitySettings(
          effectsMode: EffectsMode.disabled,
        ),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      expect(find.byType(CupertinoFullscreenDialogTransition), findsOneWidget);
      expect(tester.getTopLeft(find.byWidget(second)).dy, 0);
    });
  });

  group('AccessibleCupertinoPage', () {
    Widget pages({required bool pushed, required void Function() onPop}) =>
        Navigator(
          pages: [
            const AccessibleCupertinoPage<void>(
              key: ValueKey('first'),
              child: CupertinoPageScaffold(child: Text('first')),
            ),
            if (pushed)
              const AccessibleCupertinoPage<void>(
                key: ValueKey('second'),
                title: 'Second',
                child: CupertinoPageScaffold(child: second),
              ),
          ],
          onDidRemovePage: (_) => onPop(),
        );

    testWidgets('creates a route with the accessible transition', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      );
      const page = AccessibleCupertinoPage<void>(
        title: 'Second',
        maintainState: false,
        fullscreenDialog: true,
        child: second,
      );
      final route = page.createRoute(captured);
      expect(route, isA<AccessibleCupertinoTransitionMixin<void>>());
      expect(route, isA<CupertinoRouteTransitionMixin<void>>());
      final cupertino = route as CupertinoRouteTransitionMixin<void>;
      expect(cupertino.title, 'Second');
      expect(route.settings, same(page));
      final pageRoute = route as PageRoute<void>;
      expect(pageRoute.maintainState, isFalse);
      expect(pageRoute.fullscreenDialog, isTrue);
      expect(pageRoute.debugLabel, contains('AccessibleCupertinoPage'));
    });

    testWidgets('shows the page in place when effects are off', (
      tester,
    ) async {
      var pushed = false;
      late StateSetter setPages;
      await pumpCupertino(
        tester,
        StatefulBuilder(
          builder: (context, setState) {
            setPages = setState;
            return pages(pushed: pushed, onPop: () => setState(() => pushed = false));
          },
        ),
        initial: const AccessibilitySettings(
          effectsMode: EffectsMode.disabled,
        ),
      );
      setPages(() => pushed = true);
      await tester.pump();
      await tester.pump();
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
      expect(tester.binding.hasScheduledFrame, isFalse);
    });

    testWidgets('slides the page in when effects are on', (tester) async {
      var pushed = false;
      late StateSetter setPages;
      await pumpCupertino(
        tester,
        StatefulBuilder(
          builder: (context, setState) {
            setPages = setState;
            return pages(pushed: pushed, onPop: () => setState(() => pushed = false));
          },
        ),
      );
      setPages(() => pushed = true);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(tester.getTopLeft(find.byWidget(second)).dx, greaterThan(0));
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `cd packages/accessibility_cupertino && flutter test test/ui/theme/accessible_cupertino_theme_builder_test.dart test/ui/routes`
Expected: compilation errors, the files do not exist.

- [ ] **Step 3: Write the builder**

`packages/accessibility_cupertino/lib/src/ui/theme/accessible_cupertino_theme_builder.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_data.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Builds the app from the [CupertinoThemeData] of the current settings.
typedef AccessibleCupertinoThemeWidgetBuilder =
    Widget Function(BuildContext context, CupertinoThemeData theme);

/// Applies the accessibility settings to the app's theme.
///
/// Place it under an [AccessibilityScope] and above `CupertinoApp`; the
/// [builder] receives the theme with the settings applied and passes it
/// on. It rebuilds whenever the settings change, and applies the
/// high-contrast colour profile when the OS asks for more contrast: from
/// the media query when there is one above, otherwise from the platform's
/// accessibility features, which it observes.
final class AccessibleCupertinoThemeBuilder extends StatefulWidget {
  /// Creates the builder over [theme], `CupertinoThemeData()` by default.
  const AccessibleCupertinoThemeBuilder({
    required this.builder,
    this.theme,
    super.key,
  });

  /// Builds the app from the theme.
  final AccessibleCupertinoThemeWidgetBuilder builder;

  /// The app's theme, before the settings.
  final CupertinoThemeData? theme;

  @override
  State<AccessibleCupertinoThemeBuilder> createState() =>
      _AccessibleCupertinoThemeBuilderState();
}

class _AccessibleCupertinoThemeBuilderState
    extends State<AccessibleCupertinoThemeBuilder>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAccessibilityFeatures() => setState(() {});

  bool _highContrastOf(BuildContext context) =>
      MediaQuery.maybeHighContrastOf(context) ??
      View.of(context).platformDispatcher.accessibilityFeatures.highContrast;

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    AccessibleCupertinoThemeData.from(
      themeData: widget.theme ?? const CupertinoThemeData(),
      settings: AccessibilityScope.settingsOf(context),
      font: AccessibilityScope.of(context).activeFont,
      highContrast: _highContrastOf(context),
    ),
  );
}
```

- [ ] **Step 4: Write the effects helper, the mixin, the route and the page**

`packages/accessibility_cupertino/lib/src/ui/routes/route_effects.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Whether effects are enabled above [context], without registering
/// dependencies, for routes that need the answer outside of a build.
///
/// Resolves [EffectsMode.system] against the nearest media query's
/// reduce-motion flag; `true` without an [AccessibilityScope].
bool routeEffectsEnabled(BuildContext context) {
  final viewModel = AccessibilityScope.maybeOf(context);
  if (viewModel == null) {
    return true;
  }
  final reducesMotion =
      context.getInheritedWidgetOfExactType<MediaQuery>()?.data
          .disableAnimations ??
      false;
  return viewModel.settings.effectsMode.resolve(
    systemReducesMotion: reducesMotion,
  );
}
```

`packages/accessibility_cupertino/lib/src/ui/routes/accessible_cupertino_transition_mixin.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/routes/route_effects.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Makes a Cupertino route honour the effects mode.
///
/// When effects are off the route keeps Cupertino's transition widgets
/// (so the edge-swipe back gesture still works) but drives them with
/// completed animations, and its durations are zero, so neither this
/// route nor its neighbours move. The durations are resolved through the
/// navigator's context when the route is installed; the transition itself
/// follows the settings on every build. Without an [AccessibilityScope]
/// the route behaves like the original.
mixin AccessibleCupertinoTransitionMixin<T>
    on CupertinoRouteTransitionMixin<T> {
  bool get _effectsEnabled {
    final context = navigator?.context;
    return context == null || routeEffectsEnabled(context);
  }

  @override
  Duration get transitionDuration =>
      _effectsEnabled ? super.transitionDuration : Duration.zero;

  @override
  Duration get reverseTransitionDuration =>
      _effectsEnabled ? super.reverseTransitionDuration : Duration.zero;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final hasScope = AccessibilityScope.maybeOf(context) != null;
    if (!hasScope || AccessibilityScope.effectsEnabledOf(context)) {
      return super.buildTransitions(
        context,
        animation,
        secondaryAnimation,
        child,
      );
    }
    return super.buildTransitions(
      context,
      kAlwaysCompleteAnimation,
      kAlwaysDismissedAnimation,
      child,
    );
  }
}
```

`packages/accessibility_cupertino/lib/src/ui/routes/accessible_cupertino_page_route.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_transition_mixin.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A [CupertinoPageRoute] that honours the effects mode.
///
/// When effects are off (the user's choice, or the OS reduce-motion
/// signal in system mode) the page appears in place without motion and
/// the route's durations are zero; the edge-swipe back gesture keeps
/// working. Use it wherever the app would use [CupertinoPageRoute].
final class AccessibleCupertinoPageRoute<T> extends CupertinoPageRoute<T>
    with AccessibleCupertinoTransitionMixin<T> {
  /// Creates the route; the parameters are those of [CupertinoPageRoute].
  AccessibleCupertinoPageRoute({
    required super.builder,
    super.title,
    super.settings,
    super.requestFocus,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.barrierDismissible,
  });
}
```

`packages/accessibility_cupertino/lib/src/ui/routes/accessible_cupertino_page.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_transition_mixin.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A [CupertinoPage] whose route honours the effects mode, for the pages
/// API of [Navigator]; see [AccessibleCupertinoPageRoute].
final class AccessibleCupertinoPage<T> extends CupertinoPage<T> {
  /// Creates the page; the parameters are those of [CupertinoPage].
  const AccessibleCupertinoPage({
    required super.child,
    super.maintainState,
    super.title,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.canPop,
    super.onPopInvoked,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => _AccessiblePageBasedRoute<T>(
    page: this,
    allowSnapshotting: allowSnapshotting,
  );
}

/// The page-based counterpart of [AccessibleCupertinoPageRoute], reading
/// its content and options from the page so they follow page updates.
final class _AccessiblePageBasedRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T>, AccessibleCupertinoTransitionMixin<T> {
  _AccessiblePageBasedRoute({
    required AccessibleCupertinoPage<T> page,
    super.allowSnapshotting,
  }) : super(settings: page);

  AccessibleCupertinoPage<T> get _page =>
      settings as AccessibleCupertinoPage<T>;

  @override
  DelegatedTransitionBuilder? get delegatedTransition =>
      fullscreenDialog ? null : CupertinoPageTransition.delegatedTransition;

  @override
  Widget buildContent(BuildContext context) => _page.child;

  @override
  String? get title => _page.title;

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}
```

Notes for the implementer: `kAlwaysCompleteAnimation` and
`kAlwaysDismissedAnimation` come from `flutter/animation.dart`, re-exported
by `cupertino_ui`. `CupertinoPageTransition.delegatedTransition` is a
public static. `PageRoute.fullscreenDialog` is a field in `PageRoute`;
overriding it with a getter is what cupertino_ui's own page-based route
does. If the "appears in place" test finds `hasScheduledFrame` true after
one pump, pump once more before asserting and note it in the ledger: the
navigator may schedule a focus frame after the push. If the pages test
fails because `debugLabel` reads `_AccessiblePageBasedRoute`, assert on
`contains('second')` (the page name) instead; do not weaken the other
assertions.

- [ ] **Step 5: Verify and commit**

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add the theme builder and the routes that honour the effects mode"
```

---

### Task 5: Panel scaffolding, components, status card, restore button and read-more text

**Files:**
- Create under `packages/accessibility_cupertino/lib/src/ui/`:
  `core/panel_metrics.dart`, `core/panel_colors.dart`,
  `core/slider_config.dart`, `core/color_semantics.dart`,
  `settings/widgets/panel_scope.dart`,
  `settings/widgets/components/settings_section.dart`,
  `settings/widgets/components/settings_tile.dart`,
  `settings/widgets/components/settings_icon_button.dart`,
  `settings/widgets/components/settings_switch_tile.dart`,
  `settings/widgets/components/settings_expansion_switch_tile.dart`,
  `settings/widgets/components/segmented_setting.dart`,
  `settings/widgets/components/settings_range_setting.dart`,
  `settings/widgets/components/circle_color.dart`,
  `settings/widgets/components/cupertino_color_picker.dart`,
  `settings/widgets/components/cupertino_restore_settings_button.dart`,
  `settings/widgets/status_card.dart`,
  `settings/widgets/cupertino_accessibility_settings_panel.dart`,
  `text/widgets/cupertino_read_more_text.dart`
- Test under `packages/accessibility_cupertino/test/ui/`:
  `core/color_semantics_test.dart`,
  `settings/widgets/components/settings_tile_test.dart`,
  `settings/widgets/components/settings_switch_tile_test.dart`,
  `settings/widgets/components/segmented_setting_test.dart`,
  `settings/widgets/components/settings_range_setting_test.dart`,
  `settings/widgets/components/cupertino_color_picker_test.dart`,
  `settings/widgets/components/cupertino_restore_settings_button_test.dart`,
  `settings/widgets/status_card_test.dart`,
  `text/widgets/cupertino_read_more_text_test.dart`

**Interfaces:**
- Produces the style-aware building blocks the three groups use. Every
  component reads `PanelScope.maybeOf(context)?.style` (standard when
  there is no panel): standard = `CupertinoListSection` +
  `CupertinoListTile`, cards = `CupertinoListSection.insetGrouped` +
  `CupertinoListTile.notched`.
- Rulings:
  - Tap targets: icon buttons are `CupertinoButton`s of 44 dp wrapped in
    one explicit `Semantics(label, button, onTap, excludeSemantics: true)`
    node; colour discs the same; switch tiles are `MergeSemantics` so the
    tile (44 dp or more) is the single tap target; segments are 44 dp
    tall.
  - Contrast: subtitles and additional info use `kPanelSecondaryTextColor`
    (`#636366` light, `#AEAEB2` dark), since Cupertino's
    `secondaryLabel` is 60 % alpha and fails the 4.5:1 guideline.
  - The panel is a `CustomScrollView` of `SliverToBoxAdapter`s (Cupertino
    sections are boxes), restoration id
    `cupertino_accessibility_settings_panel`.
  - Ranges: standard = tile + [minus button, `CupertinoSlider`, plus
    button]; cards = notched tile with the value as `additionalInfo`
    and the paired buttons as `trailing`, disabled at the ends.

- [ ] **Step 1: Write the core helpers and the scope**

`lib/src/ui/core/panel_metrics.dart`:

```dart
/// The padding around panel content.
const double kPanelPadding = 16;
```

`lib/src/ui/core/panel_colors.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';

/// The colour of secondary text (subtitles, additional info) in the panel.
///
/// Cupertino's `secondaryLabel` is 60 % translucent and misses the 4.5:1
/// contrast the guidelines ask for on small text; this opaque pair keeps
/// the hierarchy and passes in both brightnesses.
const CupertinoDynamicColor kPanelSecondaryTextColor =
    CupertinoDynamicColor.withBrightness(
      debugLabel: 'panelSecondaryText',
      color: Color(0xFF636366),
      darkColor: Color(0xFFAEAEB2),
    );
```

`lib/src/ui/core/slider_config.dart`: copy
`packages/accessibility_material/lib/src/ui/core/slider_config.dart`
verbatim (the eight range constants and `kRangeDivisions = 4`).

`lib/src/ui/core/color_semantics.dart`: copy
`packages/accessibility_material/lib/src/ui/core/color_semantics.dart`
with the import `package:material_ui/material_ui.dart` replaced by
`package:cupertino_ui/cupertino_ui.dart` (it needs `Color` and
`ColorSwatch` only). Its test `test/ui/core/color_semantics_test.dart`:
copy `packages/accessibility_material/test/ui/core/color_semantics_test.dart`
with the same import swap and the Material `Colors.*` references replaced
by literal swatches (`const ColorSwatch<int>(0xFFF44336, {50: Color(0xFFFFEBEE), 500: Color(0xFFF44336), 900: Color(0xFFB71C1C)})`);
keep every assertion (names from the `color` message, the fallback for an
unknown colour, `shades` ordering, `shadeNumberIn` for 50, 500, 900 and a
foreign colour).

`lib/src/ui/settings/widgets/panel_scope.dart`: copy
`packages/accessibility_material/lib/src/ui/settings/widgets/panel_scope.dart`
with the `material_ui` import replaced by `cupertino_ui` and the assertion
message `'No CupertinoAccessibilitySettingsPanel above this widget'`.

- [ ] **Step 2: Write the components and their tests**

`lib/src/ui/settings/widgets/components/settings_section.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A titled group of settings: a plain list section in the standard
/// style, an inset grouped one in the cards style. Renders nothing when
/// there are no settings (a Cupertino section needs children or a header).
final class SettingsSection extends StatelessWidget {
  /// Creates a section of [settings], optionally titled.
  const SettingsSection({required this.settings, this.title, super.key});

  /// The settings, in order.
  final List<Widget> settings;

  /// The header shown above the section.
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (settings.isEmpty) {
      return const SizedBox.shrink();
    }
    final style =
        PanelScope.maybeOf(context)?.style ??
        AccessibilitySettingsStyle.standard;
    final header = title == null
        ? null
        : Semantics(header: true, child: Text(title!));
    return switch (style) {
      AccessibilitySettingsStyle.standard => CupertinoListSection(
        header: header,
        children: settings,
      ),
      AccessibilitySettingsStyle.cards => CupertinoListSection.insetGrouped(
        header: header,
        children: settings,
      ),
    };
  }
}
```

`lib/src/ui/settings/widgets/components/settings_tile.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// One setting row: a list tile in the standard style, a notched one in
/// the cards style, with an optional selected state for the semantics.
final class SettingsTile extends StatelessWidget {
  /// Creates the tile.
  const SettingsTile({
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.additionalInfo,
    this.onTap,
    this.selected,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String? subtitle;

  /// The icon before the name.
  final IconData? icon;

  /// The widget at the end of the row.
  final Widget? trailing;

  /// The value shown before [trailing].
  final String? additionalInfo;

  /// Called when the row is tapped.
  final VoidCallback? onTap;

  /// Whether the row reads as selected; `null` leaves the semantics alone.
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    final style =
        PanelScope.maybeOf(context)?.style ??
        AccessibilitySettingsStyle.standard;
    const secondary = TextStyle(color: kPanelSecondaryTextColor);
    final leading = icon == null ? null : Icon(icon);
    final subtitleText = subtitle == null
        ? null
        : Text(subtitle!, style: secondary);
    final info = additionalInfo == null
        ? null
        : Text(additionalInfo!, style: secondary);
    final tile = switch (style) {
      AccessibilitySettingsStyle.standard => CupertinoListTile(
        title: Text(title),
        subtitle: subtitleText,
        leading: leading,
        trailing: trailing,
        additionalInfo: info,
        onTap: onTap,
      ),
      AccessibilitySettingsStyle.cards => CupertinoListTile.notched(
        title: Text(title),
        subtitle: subtitleText,
        leading: leading,
        trailing: trailing,
        additionalInfo: info,
        onTap: onTap,
      ),
    };
    return selected == null ? tile : Semantics(selected: selected, child: tile);
  }
}
```

`lib/src/ui/settings/widgets/components/settings_icon_button.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';

/// A 44 dp icon button that is one labelled tap target.
final class SettingsIconButton extends StatelessWidget {
  /// Creates the button.
  const SettingsIconButton({
    required this.icon,
    required this.label,
    this.onPressed,
    super.key,
  });

  /// The icon drawn in the button.
  final IconData icon;

  /// The spoken label.
  final String label;

  /// Called on tap; `null` disables the button.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    label: label,
    button: true,
    enabled: onPressed != null,
    onTap: onPressed,
    excludeSemantics: true,
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: const Size.square(kMinInteractiveDimensionCupertino),
      onPressed: onPressed,
      child: Icon(icon),
    ),
  );
}
```

`lib/src/ui/settings/widgets/components/settings_switch_tile.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A switch setting as a tile; the whole row toggles it.
final class SettingsSwitchTile extends StatelessWidget {
  /// Creates the switch tile.
  const SettingsSwitchTile({
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
  Widget build(BuildContext context) => MergeSemantics(
    child: SettingsTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      trailing: CupertinoSwitch(value: value, onChanged: onChanged),
      onTap: () => onChanged(!value),
    ),
  );
}
```

`lib/src/ui/settings/widgets/components/settings_expansion_switch_tile.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:accessibility_cupertino/src/ui/text/widgets/cupertino_read_more_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A switch tile followed by a collapsible description.
final class SettingsExpansionSwitchTile extends StatelessWidget {
  /// Creates the switch with its description.
  const SettingsExpansionSwitchTile({
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
      SettingsSwitchTile(
        title: title,
        subtitle: subtitle,
        value: value,
        onChanged: onChanged,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          kPanelPadding,
          0,
          kPanelPadding,
          kPanelPadding / 2,
        ),
        child: CupertinoReadMoreText(text: description),
      ),
    ],
  );
}
```

`lib/src/ui/settings/widgets/components/segmented_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A setting with a few exclusive values as a sliding segmented control
/// under a title tile; every segment is a 44 dp tap target.
final class SegmentedSetting<T extends Object> extends StatelessWidget {
  /// Creates the setting.
  const SegmentedSetting({
    required this.title,
    required this.segments,
    required this.selected,
    required this.onSelected,
    this.icon,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The values and their labels, in order.
  final Map<T, String> segments;

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
      SettingsTile(title: title, icon: icon),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          kPanelPadding,
          0,
          kPanelPadding,
          kPanelPadding / 2,
        ),
        child: CupertinoSlidingSegmentedControl<T>(
          groupValue: selected,
          children: {
            for (final MapEntry(:key, :value) in segments.entries)
              key: SizedBox(
                height: kMinInteractiveDimensionCupertino,
                child: Center(
                  child: Text(value, textAlign: TextAlign.center),
                ),
              ),
          },
          onValueChanged: (value) {
            if (value != null) {
              onSelected(value);
            }
          },
        ),
      ),
    ],
  );
}
```

`lib/src/ui/settings/widgets/components/settings_range_setting.dart`:

```dart
import 'dart:math' as math;

import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_icon_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A ranged setting.
///
/// Standard style: a titled tile, then a minus button, a slider and a
/// plus button. Cards style: a notched tile showing the value, with the
/// two buttons at the end, disabled at the ends of the range.
final class SettingsRangeSetting extends StatelessWidget {
  /// Creates the setting.
  const SettingsRangeSetting({
    required this.title,
    required this.subtitle,
    required this.icon,
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

  /// The explanation under the name (standard style).
  final String subtitle;

  /// The icon before the name (cards style).
  final IconData icon;

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

  double _clampToRange(double value) => math.min(max, math.max(min, value));

  double get _clamped => _clampToRange(value);

  int get _index => ((_clamped - min) / _step).round();

  @override
  Widget build(BuildContext context) {
    final style =
        PanelScope.maybeOf(context)?.style ??
        AccessibilitySettingsStyle.standard;
    return switch (style) {
      AccessibilitySettingsStyle.standard => _slider(),
      AccessibilitySettingsStyle.cards => _stepper(),
    };
  }

  Widget _slider() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SettingsTile(title: title, subtitle: subtitle),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPanelPadding / 2),
        child: Row(
          children: [
            SettingsIconButton(
              icon: CupertinoIcons.minus,
              label: decrementLabel,
              onPressed: () => onChanged(_clampToRange(_clamped - _step)),
            ),
            Expanded(
              child: CupertinoSlider(
                value: _clamped,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: onChanged,
              ),
            ),
            SettingsIconButton(
              icon: CupertinoIcons.plus,
              label: incrementLabel,
              onPressed: () => onChanged(_clampToRange(_clamped + _step)),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _stepper() {
    final atMin = _index <= 0;
    final atMax = _index >= divisions;
    return SettingsTile(
      title: title,
      icon: icon,
      additionalInfo: _clamped.toStringAsFixed(2),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsIconButton(
            icon: CupertinoIcons.minus,
            label: decrementLabel,
            onPressed: atMin ? null : () => onChanged(min + (_index - 1) * _step),
          ),
          SettingsIconButton(
            icon: CupertinoIcons.plus,
            label: incrementLabel,
            onPressed: atMax ? null : () => onChanged(min + (_index + 1) * _step),
          ),
        ],
      ),
    );
  }
}
```

`lib/src/ui/settings/widgets/components/circle_color.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';

/// A tappable colour disc with a 44 dp tap target.
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
  Widget build(BuildContext context) => Semantics(
    label: label,
    button: true,
    selected: isSelected,
    onTap: onTap,
    excludeSemantics: true,
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox.square(
        dimension: kMinInteractiveDimensionCupertino,
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: isSelected
                ? Icon(
                    CupertinoIcons.check_mark,
                    color: color.computeLuminance() > 0.5
                        ? CupertinoColors.black
                        : CupertinoColors.white,
                  )
                : null,
          ),
        ),
      ),
    ),
  );
}
```

`lib/src/ui/settings/widgets/components/cupertino_color_picker.dart`: copy
`packages/accessibility_material/lib/src/ui/settings/widgets/components/color_picker.dart`
renaming the class to `CupertinoColorPicker` (state `_CupertinoColorPickerState`),
importing `package:cupertino_ui/cupertino_ui.dart`, this package's
`color_semantics.dart`, `panel_localizations.dart`, `circle_color.dart` and
`settings_icon_button.dart`, and replacing the two `IconButton`s with:

```dart
          if (open != null)
            SettingsIconButton(
              icon: CupertinoIcons.arrow_left,
              label: l10n.returnToMainColors,
              onPressed: () => setState(() => _openSwatch = null),
            )
          else if (selected != null)
            SettingsIconButton(
              icon: CupertinoIcons.xmark,
              label: l10n.restoreMainColor,
              onPressed: () => widget.onColorSelected(null),
            ),
```

Everything else (fields, docs, `_selectedSwatch`, `_selectMain`, the
`Wrap` of `CircleColor`s with the `changeLabel`/`changeShadeLabel`
semantics) stays identical.

`lib/src/ui/settings/widgets/components/cupertino_restore_settings_button.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_metrics.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A full-width filled button that restores the default settings.
///
/// Calls [AccessibilitySettingsViewModel.restoreDefaults], then the panel
/// configuration's `onRestoreSettings` when the button is inside a
/// `CupertinoAccessibilitySettingsPanel`.
final class CupertinoRestoreSettingsButton extends StatelessWidget {
  /// Creates the button.
  const CupertinoRestoreSettingsButton({this.color, super.key});

  /// Overrides the theme's primary colour as the button's fill.
  final Color? color;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(kPanelPadding),
    child: SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        color: color,
        onPressed: () => _restore(context),
        child: Text(context.l10n.restoreSettings),
      ),
    ),
  );

  Future<void> _restore(BuildContext context) async {
    final viewModel = AccessibilityScope.of(context);
    final onRestore = PanelScope.maybeOf(
      context,
    )?.configuration.onRestoreSettings;
    await viewModel.restoreDefaults();
    await onRestore?.call();
  }
}
```

`lib/src/ui/text/widgets/cupertino_read_more_text.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A [CollapsibleText] with a Cupertino button using the localised
/// `moreInfo` / `lessInfo` labels to expand or collapse the text.
final class CupertinoReadMoreText extends StatelessWidget {
  /// Creates the text, collapsed to [maxLines].
  const CupertinoReadMoreText({
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
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onToggle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Icon(
              expanded
                  ? CupertinoIcons.minus_circle
                  : CupertinoIcons.plus_circle,
            ),
            Text(expanded ? context.l10n.lessInfo : context.l10n.moreInfo),
          ],
        ),
      ),
    ),
  );
}
```

Tests. `test/ui/settings/widgets/components/settings_tile_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget inPanel(AccessibilitySettingsStyle style, Widget child) => PanelScope(
  configuration: const AccessibilitySettingsConfiguration(),
  style: style,
  child: child,
);

void main() {
  group('SettingsTile', () {
    testWidgets('is a plain tile outside a panel and in the standard style', (
      tester,
    ) async {
      await pumpCupertino(
        tester,
        const SettingsTile(title: 'Title', subtitle: 'Sub', additionalInfo: '1'),
      );
      expect(find.byType(CupertinoListTile), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(tester.widget<Text>(find.text('Sub')).style?.color,
          kPanelSecondaryTextColor);
      expect(tester.widget<Text>(find.text('1')).style?.color,
          kPanelSecondaryTextColor);
      await pumpCupertino(
        tester,
        inPanel(
          AccessibilitySettingsStyle.standard,
          const SettingsTile(title: 'Title'),
        ),
      );
      expect(
        tester.widget<CupertinoListTile>(find.byType(CupertinoListTile))
            .leadingSize,
        28,
      );
    });

    testWidgets('is a notched tile in the cards style', (tester) async {
      await pumpCupertino(
        tester,
        inPanel(
          AccessibilitySettingsStyle.cards,
          const SettingsTile(title: 'Title', icon: CupertinoIcons.gear),
        ),
      );
      expect(
        tester.widget<CupertinoListTile>(find.byType(CupertinoListTile))
            .leadingSize,
        30,
      );
      expect(find.byIcon(CupertinoIcons.gear), findsOneWidget);
    });

    testWidgets('taps and exposes the selected state', (tester) async {
      var taps = 0;
      await pumpCupertino(
        tester,
        SettingsTile(title: 'Title', selected: true, onTap: () => taps++),
      );
      await tester.tap(find.text('Title'));
      expect(taps, 1);
      final semantics = tester.getSemantics(find.text('Title'));
      expect(semantics.flagsCollection.isSelected.toBoolOrNull(), isTrue);
      expect(semantics.getSemanticsData().hasAction(SemanticsAction.tap), isTrue);
    });
  });
}
```

`test/ui/settings/widgets/components/settings_switch_tile_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('SettingsSwitchTile toggles from the switch and the row', (
    tester,
  ) async {
    final log = <bool>[];
    await pumpCupertino(
      tester,
      SettingsSwitchTile(
        title: 'Bold',
        subtitle: 'Heavier text',
        value: false,
        onChanged: log.add,
      ),
    );
    await tester.tap(find.byType(CupertinoSwitch));
    await tester.tap(find.text('Bold'));
    expect(log, [true, true]);
    final node = tester.getSemantics(find.byType(MergeSemantics).first);
    expect(node.label, contains('Bold'));
    expect(node.rect.height, greaterThanOrEqualTo(44));
  });
}
```

`test/ui/settings/widgets/components/segmented_setting_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/segmented_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('SegmentedSetting reports the tapped value', (tester) async {
    final log = <int>[];
    await pumpCupertino(
      tester,
      SegmentedSetting<int>(
        title: 'Mode',
        icon: CupertinoIcons.gear,
        segments: const {1: 'One', 2: 'Two', 3: 'Three'},
        selected: 1,
        onSelected: log.add,
      ),
    );
    expect(find.text('Mode'), findsOneWidget);
    await tester.tap(find.text('Three'));
    await tester.pumpAndSettle();
    expect(log, [3]);
    expect(tester.getSize(find.text('Two')).height, lessThan(44));
    expect(
      tester.getSize(find.ancestor(
        of: find.text('Two'),
        matching: find.byType(SizedBox),
      ).first).height,
      44,
    );
  });
}
```

`test/ui/settings/widgets/components/settings_range_setting_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_icon_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_range_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  Widget setting(List<double> log, double value) => SettingsRangeSetting(
    title: 'Size',
    subtitle: 'Bigger or smaller',
    icon: CupertinoIcons.textformat_size,
    value: value,
    min: 1,
    max: 2,
    divisions: 4,
    incrementLabel: 'More',
    decrementLabel: 'Less',
    onChanged: log.add,
  );

  final decrement = find.byIcon(CupertinoIcons.minus);
  final increment = find.byIcon(CupertinoIcons.plus);

  group('SettingsRangeSetting', () {
    testWidgets('steps and slides in the standard style', (tester) async {
      final log = <double>[];
      await pumpCupertino(tester, setting(log, 1));
      expect(find.text('Bigger or smaller'), findsOneWidget);
      expect(find.bySemanticsLabel('Less'), findsOneWidget);
      expect(find.bySemanticsLabel('More'), findsOneWidget);
      await tester.tap(increment);
      expect(log, [1.25]);
      await tester.tap(decrement);
      expect(log.last, 1);
      await tester.drag(find.byType(CupertinoSlider), const Offset(600, 0));
      await tester.pumpAndSettle();
      expect(log.last, 2);
      expect(tester.getSize(find.byType(SettingsIconButton).first).height, 44);
    });

    testWidgets('clamps an out-of-range value for display', (tester) async {
      final log = <double>[];
      await pumpCupertino(tester, setting(log, 5));
      expect(tester.widget<CupertinoSlider>(find.byType(CupertinoSlider)).value,
          2);
      await tester.tap(decrement);
      expect(log, [1.75]);
    });

    testWidgets('steps with disabled ends in the cards style', (tester) async {
      final log = <double>[];
      Widget cards(double value) => PanelScope(
        configuration: const AccessibilitySettingsConfiguration(),
        style: AccessibilitySettingsStyle.cards,
        child: setting(log, value),
      );
      await pumpCupertino(tester, cards(1));
      expect(find.byType(CupertinoSlider), findsNothing);
      expect(find.text('1.00'), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.textformat_size), findsOneWidget);
      expect(
        tester.widget<SettingsIconButton>(
          find.widgetWithIcon(SettingsIconButton, CupertinoIcons.minus),
        ).onPressed,
        isNull,
      );
      await tester.tap(increment);
      expect(log, [1.25]);
      await pumpCupertino(tester, cards(2));
      expect(find.text('2.00'), findsOneWidget);
      expect(
        tester.widget<SettingsIconButton>(
          find.widgetWithIcon(SettingsIconButton, CupertinoIcons.plus),
        ).onPressed,
        isNull,
      );
      await tester.tap(decrement);
      expect(log.last, 1.75);
    });
  });
}
```

`test/ui/settings/widgets/components/cupertino_color_picker_test.dart`:
copy `packages/accessibility_material/test/ui/settings/widgets/components/color_picker_test.dart`
with `CupertinoColorPicker`, `pumpCupertino`, two literal swatches
(`red = ColorSwatch<int>(0xFFF44336, {500: Color(0xFFF44336), 900: Color(0xFFB71C1C)})`
and `blue = ColorSwatch<int>(0xFF2196F3, {500: Color(0xFF2196F3)})`
declared as top-level consts, `red[900]` for the shade assertion),
`CupertinoIcons.arrow_left` for the back button and `CupertinoIcons.xmark`
for the close button; keep the four scenarios and their assertions.

`test/ui/settings/widgets/components/cupertino_restore_settings_button_test.dart`:
copy `packages/accessibility_material/test/ui/settings/widgets/components/restore_settings_button_test.dart`
with `CupertinoRestoreSettingsButton`, `pumpCupertino` and
`find.byType(CupertinoButton)` in place of `FilledButton`.

`test/ui/text/widgets/cupertino_read_more_text_test.dart`: copy
`packages/accessibility_material/test/ui/text/widgets/read_more_text_test.dart`
with `CupertinoReadMoreText`, `pumpCupertino`, `find.byType(CupertinoButton)`
and `CupertinoIcons.minus_circle`.

- [ ] **Step 3: Write the status card, the panel and their tests**

`lib/src/ui/settings/widgets/status_card.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Shows the settings load status at the top of the panel.
///
/// Renders nothing while idle or loaded, an activity indicator while
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
      AccessibilitySettingsLoading() => SettingsSection(
        settings: [
          SettingsTile(
            title: l10n.settingsLoading,
            trailing: const CupertinoActivityIndicator(),
          ),
        ],
      ),
      AccessibilitySettingsLoadFailed() => SettingsSection(
        settings: [
          SettingsTile(
            title: l10n.settingsLoadFailed,
            icon: CupertinoIcons.exclamationmark_triangle,
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: AccessibilityScope.of(context).load,
              child: Text(l10n.retry),
            ),
          ),
        ],
      ),
    };
  }
}
```

`lib/src/ui/settings/widgets/cupertino_accessibility_settings_panel.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_restore_settings_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The accessibility settings panel, Cupertino style.
///
/// A scrollable list of the settings groups (theme, colours, text) in the
/// requested [style], with the load status at the top and the restore
/// button at the bottom. Reads state through [AccessibilityScope] and
/// invokes the ViewModel commands; place it under an [AccessibilityScope]
/// and inside a `CupertinoPageScaffold` (or any box with bounded height).
final class CupertinoAccessibilitySettingsPanel extends StatelessWidget {
  /// Creates the panel.
  const CupertinoAccessibilitySettingsPanel({
    this.style = AccessibilitySettingsStyle.standard,
    this.configuration = const AccessibilitySettingsConfiguration(),
    super.key,
  });

  /// The visual style: plain list sections, or inset grouped ones.
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
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    return SafeArea(
      child: CustomScrollView(
        restorationId: 'cupertino_accessibility_settings_panel',
        slivers: [
          const SliverToBoxAdapter(child: StatusCard()),
          if (configuration.showThemeSettingsGroup)
            const SliverToBoxAdapter(child: ThemeSettingsGroup()),
          if (configuration.showColorSettingsGroup)
            const SliverToBoxAdapter(child: ColorSettingsGroup()),
          if (configuration.showTextSettingsGroup)
            const SliverToBoxAdapter(child: TextSettingsGroup()),
          const SliverToBoxAdapter(child: CupertinoRestoreSettingsButton()),
        ],
      ),
    );
  }
}
```

The three groups arrive in Tasks 6 to 8. To keep this task green, create
the three group files now as placeholders that will be replaced:
`theme/theme_settings_group.dart`, `color/color_settings_group.dart` and
`text/text_settings_group.dart`, each a `final class XSettingsGroup extends
StatelessWidget` with a documented const constructor whose `build` returns
`const SizedBox.shrink()`; the panel test below asserts only on the status
card, the restore button and the presence or absence of the group types.

`test/ui/settings/widgets/status_card_test.dart`: copy
`packages/accessibility_material/test/ui/settings/widgets/status_card_test.dart`
with `pumpCupertino`, `GlobalCupertinoLocalizations.delegates`,
`CupertinoApp(home: CupertinoPageScaffold(child: StatusCard()))`,
`find.byType(CupertinoListSection)` in place of `Card`, and
`CupertinoActivityIndicator` in place of `CircularProgressIndicator`; keep
the three scenarios, the `SlowService` and the 'Retry' tap assertions.

`test/ui/settings/widgets/cupertino_accessibility_settings_panel_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_restore_settings_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/cupertino_accessibility_settings_panel.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_cupertino.dart';

void main() {
  group('CupertinoAccessibilitySettingsPanel', () {
    testWidgets('renders the status card, the groups and the button', (
      tester,
    ) async {
      await pumpCupertino(tester, const CupertinoAccessibilitySettingsPanel());
      expect(find.byType(StatusCard, skipOffstage: false), findsOneWidget);
      expect(find.byType(ThemeSettingsGroup, skipOffstage: false), findsOneWidget);
      expect(find.byType(ColorSettingsGroup, skipOffstage: false), findsOneWidget);
      expect(find.byType(TextSettingsGroup, skipOffstage: false), findsOneWidget);
      expect(
        find.byType(CupertinoRestoreSettingsButton, skipOffstage: false),
        findsOneWidget,
      );
      expect(find.byType(CustomScrollView), findsOneWidget);
    });

    testWidgets('provides its style and configuration to the items', (
      tester,
    ) async {
      const configuration = AccessibilitySettingsConfiguration(
        showBoldSetting: false,
      );
      await pumpCupertino(
        tester,
        const CupertinoAccessibilitySettingsPanel(
          style: AccessibilitySettingsStyle.cards,
          configuration: configuration,
        ),
      );
      final scope = PanelScope.of(tester.element(find.byType(StatusCard)));
      expect(scope.style, AccessibilitySettingsStyle.cards);
      expect(scope.configuration, configuration);
    });

    testWidgets('hides the groups on request', (tester) async {
      await pumpCupertino(
        tester,
        const CupertinoAccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showThemeSettingsGroup: false,
            showColorSettingsGroup: false,
            showTextSettingsGroup: false,
          ),
        ),
      );
      expect(find.byType(ThemeSettingsGroup, skipOffstage: false), findsNothing);
      expect(find.byType(ColorSettingsGroup, skipOffstage: false), findsNothing);
      expect(find.byType(TextSettingsGroup, skipOffstage: false), findsNothing);
    });
  });
}
```

- [ ] **Step 4: Verify and commit**

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean. If `find.bySemanticsLabel` complains
that semantics are disabled, add `final handle = tester.ensureSemantics();`
at the start of that test and `handle.dispose()` at its end; do not drop
the assertion.

```bash
git add packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add the settings panel scaffolding, its components, the status card and the restore button"
```

---

### Task 6: Theme settings group

**Files:**
- Create under `packages/accessibility_cupertino/lib/src/ui/`:
  `core/theme_profile_icons.dart`, `core/theme_profile_strings.dart`,
  `settings/widgets/theme/theme_profile_setting.dart`,
  `settings/widgets/theme/theme_mode_setting.dart`,
  `settings/widgets/theme/effects_mode_setting.dart`
- Replace: `settings/widgets/theme/theme_settings_group.dart`
- Test under `packages/accessibility_cupertino/test/ui/settings/widgets/theme/`:
  `theme_profile_setting_test.dart`, `theme_mode_setting_test.dart`,
  `effects_mode_setting_test.dart`, `theme_settings_group_test.dart`

**Interfaces:**
- Produces `ThemeSettingsGroup` (the section titled with nothing, as in
  Material: profiles, then theme mode, then effects), `ThemeProfileSetting({required ThemeProfileLevel level})`
  (standard: expansion switch tile; cards: notched tile with a check mark,
  including the `none` tile that restores the default profile),
  `ThemeModeSetting` and `EffectsModeSetting` (segmented in both styles).
- Icons: profiles `arrow_counterclockwise` (none), `bolt_slash` (seizure
  safe), `eye` (vision impaired), `sparkles` (ADHD friendly); theme mode
  tile `moon`; effects tile `eye`.

- [ ] **Step 1: Write the helpers**

`lib/src/ui/core/theme_profile_icons.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The icon of a theme profile.
IconData themeProfileIcon(ThemeProfileLevel level) => switch (level) {
  ThemeProfileLevel.none => CupertinoIcons.arrow_counterclockwise,
  ThemeProfileLevel.seizureSafe => CupertinoIcons.bolt_slash,
  ThemeProfileLevel.visionImpaired => CupertinoIcons.eye,
  ThemeProfileLevel.adhdFriendly => CupertinoIcons.sparkles,
};
```

`lib/src/ui/core/theme_profile_strings.dart`: copy
`packages/accessibility_material/lib/src/ui/core/theme_profile_strings.dart`
verbatim (it imports only `accessibility_localizations` and
`flutter_accessibility`).

- [ ] **Step 2: Write the settings and the group**

`lib/src/ui/settings/widgets/theme/theme_profile_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/core/theme_profile_icons.dart';
import 'package:accessibility_cupertino/src/ui/core/theme_profile_strings.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_expansion_switch_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A theme profile.
///
/// Standard style: a switch with the profile's description. Cards style:
/// a notched tile with a check mark when the profile is active; tapping
/// it applies the profile, and the `none` tile restores the default one.
final class ThemeProfileSetting extends StatelessWidget {
  /// Creates the setting for [level].
  const ThemeProfileSetting({required this.level, super.key});

  /// The profile this setting applies.
  final ThemeProfileLevel level;

  @override
  Widget build(BuildContext context) {
    final strings = themeProfileStrings(context.l10n, level);
    final active = AccessibilityScope.settingsOf(context).matchingThemeProfile;
    final viewModel = AccessibilityScope.of(context);
    final isActive = active == level;
    return switch (PanelScope.maybeOf(context)?.style) {
      null ||
      AccessibilitySettingsStyle.standard => SettingsExpansionSwitchTile(
        title: strings.title,
        subtitle: strings.subtitle,
        description: strings.description,
        value: isActive,
        onChanged: (on) =>
            viewModel.applyThemeProfile(on ? level : ThemeProfileLevel.none),
      ),
      AccessibilitySettingsStyle.cards => SettingsTile(
        title: strings.title,
        subtitle: level == ThemeProfileLevel.none ? null : strings.subtitle,
        icon: themeProfileIcon(level),
        selected: isActive,
        trailing: isActive
            ? Icon(
                CupertinoIcons.check_mark,
                color: CupertinoTheme.of(context).primaryColor,
              )
            : null,
        onTap: () => viewModel.applyThemeProfile(level),
      ),
    };
  }
}
```

`lib/src/ui/settings/widgets/theme/theme_mode_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/segmented_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// System, light or dark theme.
final class ThemeModeSetting extends StatelessWidget {
  /// Creates the setting.
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SegmentedSetting<AccessibilityThemeMode>(
      title: l10n.themeMode,
      icon: CupertinoIcons.moon,
      segments: {
        AccessibilityThemeMode.system: l10n.themeModeSystem,
        AccessibilityThemeMode.light: l10n.themeModeLight,
        AccessibilityThemeMode.dark: l10n.themeModeDark,
      },
      selected: AccessibilityScope.settingsOf(context).themeMode,
      onSelected: AccessibilityScope.of(context).setThemeMode,
    );
  }
}
```

`lib/src/ui/settings/widgets/theme/effects_mode_setting.dart`: the same
shape with `EffectsMode`, title `l10n.effects`, icon `CupertinoIcons.eye`,
labels `effectsModeSystem`/`effectsModeEnabled`/`effectsModeDisabled`,
`settingsOf(context).effectsMode` and `setEffectsMode`.

`lib/src/ui/settings/widgets/theme/theme_settings_group.dart` (replacing
the placeholder):

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The theme group: the profiles, then the theme and effects modes.
///
/// The cards style also offers the `none` profile, which restores the
/// default one, since its tiles cannot be switched off.
final class ThemeSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const ThemeSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = PanelScope.of(context);
    final configuration = scope.configuration;
    final cards = scope.style == AccessibilitySettingsStyle.cards;
    return SettingsSection(
      settings: [
        if (cards) const ThemeProfileSetting(level: ThemeProfileLevel.none),
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

When every setting is hidden `SettingsSection` renders nothing (a
Cupertino section asserts that it has children or a header); the group
test covers that case.

- [ ] **Step 3: Write the tests**

`test/ui/settings/widgets/theme/theme_profile_setting_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget cards(Widget child) => PanelScope(
  configuration: const AccessibilitySettingsConfiguration(),
  style: AccessibilitySettingsStyle.cards,
  child: child,
);

void main() {
  group('ThemeProfileSetting', () {
    testWidgets('applies and clears the profile with the switch', (
      tester,
    ) async {
      final viewModel = await pumpCupertino(
        tester,
        const ThemeProfileSetting(level: ThemeProfileLevel.seizureSafe),
      );
      expect(find.text('Seizure safe profile'), findsOneWidget);
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();
      expect(viewModel.settings, AccessibilitySettingsSamples.seizureSafe);
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();
      expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
    });

    testWidgets('reflects a profile set elsewhere', (tester) async {
      await pumpCupertino(
        tester,
        const ThemeProfileSetting(level: ThemeProfileLevel.visionImpaired),
        initial: AccessibilitySettingsSamples.visionImpaired,
      );
      expect(
        tester.widget<CupertinoSwitch>(find.byType(CupertinoSwitch)).value,
        isTrue,
      );
    });

    testWidgets('applies the profile from the cards tile', (tester) async {
      final viewModel = await pumpCupertino(
        tester,
        cards(const ThemeProfileSetting(level: ThemeProfileLevel.adhdFriendly)),
      );
      expect(find.byType(CupertinoSwitch), findsNothing);
      expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
      await tester.tap(find.text('ADHD friendly profile'));
      await tester.pumpAndSettle();
      expect(viewModel.settings, AccessibilitySettingsSamples.adhdFriendly);
      expect(find.byIcon(CupertinoIcons.check_mark), findsOneWidget);
    });

    testWidgets('the none tile restores the default profile', (tester) async {
      final viewModel = await pumpCupertino(
        tester,
        cards(const ThemeProfileSetting(level: ThemeProfileLevel.none)),
        initial: AccessibilitySettingsSamples.seizureSafe,
      );
      expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
      await tester.tap(find.text('Default profile'));
      await tester.pumpAndSettle();
      expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
      expect(find.byIcon(CupertinoIcons.check_mark), findsOneWidget);
    });
  });
}
```

The profile titles come from the ARB: `themeProfileSeizureSafeTitle` is
"Seizure safe profile", `themeProfileAdhdFriendlyTitle` is "ADHD friendly
profile" and `themeProfile(none)` is "Default profile"; check
`packages/accessibility_localizations/lib/l10n/app_en.arb` if a finder
misses.

`test/ui/settings/widgets/theme/theme_mode_setting_test.dart`: copy
`packages/accessibility_material/test/ui/settings/widgets/theme/theme_mode_setting_test.dart`
with `pumpCupertino` (the segment labels "System", "Light", "Dark" are the
same). `effects_mode_setting_test.dart`: the same for
`packages/accessibility_material/test/ui/settings/widgets/theme/effects_mode_setting_test.dart`
(read it for the labels; they are "System", "Enabled", "Disabled").

`test/ui/settings/widgets/theme/theme_settings_group_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/effects_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_profile_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget group(
  AccessibilitySettingsStyle style, [
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: style,
  child: const ThemeSettingsGroup(),
);

void main() {
  group('ThemeSettingsGroup', () {
    testWidgets('lists the three profiles and the two modes', (tester) async {
      await pumpCupertino(tester, group(AccessibilitySettingsStyle.standard));
      expect(find.byType(ThemeProfileSetting), findsNWidgets(3));
      expect(find.byType(CupertinoSwitch), findsNWidgets(3));
      expect(find.byType(ThemeModeSetting), findsOneWidget);
      expect(find.byType(EffectsModeSetting), findsOneWidget);
      expect(find.byType(CupertinoListSection), findsOneWidget);
    });

    testWidgets('adds the none tile in the cards style', (tester) async {
      await pumpCupertino(tester, group(AccessibilitySettingsStyle.cards));
      expect(find.byType(ThemeProfileSetting), findsNWidgets(4));
      expect(find.byType(CupertinoSwitch), findsNothing);
      expect(find.text('Default profile'), findsOneWidget);
    });

    testWidgets('hides settings on request and collapses when empty', (
      tester,
    ) async {
      await pumpCupertino(
        tester,
        group(
          AccessibilitySettingsStyle.standard,
          const AccessibilitySettingsConfiguration(
            showThemeProfileSeizureSafe: false,
            showThemeProfileVisionImpaired: false,
            showEffectsSetting: false,
          ),
        ),
      );
      expect(find.byType(ThemeProfileSetting), findsOneWidget);
      expect(find.byType(EffectsModeSetting), findsNothing);
      await pumpCupertino(
        tester,
        group(
          AccessibilitySettingsStyle.standard,
          const AccessibilitySettingsConfiguration(
            showThemeProfileSeizureSafe: false,
            showThemeProfileVisionImpaired: false,
            showThemeProfileAdhdFriendly: false,
            showThemeModeSetting: false,
            showEffectsSetting: false,
          ),
        ),
      );
      expect(find.byType(CupertinoListSection), findsNothing);
    });
  });
}
```

- [ ] **Step 4: Verify and commit**

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add the theme settings group with profiles, theme mode and effects"
```

---

### Task 7: Colour settings group

**Files:**
- Create under `packages/accessibility_cupertino/lib/src/ui/`:
  `core/color_profile_icons.dart`,
  `settings/widgets/color/color_profile_setting.dart`,
  `settings/widgets/color/text_color_setting.dart`,
  `settings/widgets/color/background_color_setting.dart`
- Replace: `settings/widgets/color/color_settings_group.dart`
- Test under `packages/accessibility_cupertino/test/ui/settings/widgets/color/`:
  `color_profile_setting_test.dart`, `color_settings_test.dart`,
  `color_settings_group_test.dart`

**Interfaces:**
- Produces `ColorSettingsGroup` (section titled `colorAdjustment`, the
  same in both styles), `ColorProfileSetting` (a tile that cycles through
  the profiles: icon, current name, position as additional info, a
  chevron, and a screen-reader announcement after the change),
  `TextColorSetting` and `BackgroundColorSetting` (a title tile followed
  by a `CupertinoColorPicker` over the configured candidates or
  `kDefaultColorCandidates` from Task 1).
- Icons: `paintbrush` (normal), `circle` (low saturation), `circle_fill`
  (high saturation), `circle_lefthalf_fill` (monochrome), `sun_max`
  (high contrast).

- [ ] **Step 1: Write the settings and the group**

`lib/src/ui/core/color_profile_icons.dart`:

```dart
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The icon of a colour profile.
IconData colorProfileIcon(ColorProfileLevel level) => switch (level) {
  ColorProfileLevel.normal => CupertinoIcons.paintbrush,
  ColorProfileLevel.lowSaturation => CupertinoIcons.circle,
  ColorProfileLevel.highSaturation => CupertinoIcons.circle_fill,
  ColorProfileLevel.monochrome => CupertinoIcons.circle_lefthalf_fill,
  ColorProfileLevel.highContrast => CupertinoIcons.sun_max,
};
```

`lib/src/ui/settings/widgets/color/color_profile_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/color_profile_icons.dart';
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Cycles through the colour profiles; the tile shows the current one and
/// its position, and announces the new profile after a tap.
final class ColorProfileSetting extends StatelessWidget {
  /// Creates the setting.
  const ColorProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final level = AccessibilityScope.settingsOf(
      context,
    ).colorSettings.colorProfile;
    final viewModel = AccessibilityScope.of(context);
    return SettingsTile(
      title: l10n.colorProfile(level.name),
      icon: colorProfileIcon(level),
      additionalInfo: '${level.index + 1}/${ColorProfileLevel.values.length}',
      trailing: const Icon(CupertinoIcons.chevron_right),
      onTap: () async {
        await viewModel.nextColorProfile();
        if (!context.mounted) {
          return;
        }
        final next = viewModel.settings.colorSettings.colorProfile;
        await SemanticsService.sendAnnouncement(
          View.of(context),
          '${l10n.colorProfileChangedTo} ${l10n.colorProfile(next.name)}',
          Directionality.of(context),
        );
      },
    );
  }
}
```

`lib/src/ui/settings/widgets/color/text_color_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_color_picker.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Picks the text colour.
final class TextColorSetting extends StatelessWidget {
  /// Creates the setting.
  const TextColorSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsTile(title: l10n.adjustTextColors),
        CupertinoColorPicker(
          colors: configuration.textColorCandidates ?? kDefaultColorCandidates,
          selectedColorValue: AccessibilityScope.settingsOf(
            context,
          ).textSettings.color,
          allowPickingShades: configuration.textColorAllowPickingShades,
          changeLabel: l10n.changeTextColor,
          changeShadeLabel: l10n.changeTextColorShade,
          onColorSelected: AccessibilityScope.of(context).setTextColor,
        ),
      ],
    );
  }
}
```

`lib/src/ui/settings/widgets/color/background_color_setting.dart`: the
same shape with title `l10n.adjustBackgroundColors`,
`backgroundColorCandidates`, `colorSettings.backgroundColor`,
`backgroundColorAllowPickingShades`, `changePagesBackgroundColor`,
`changeTextColorShade` and `setBackgroundColor`.

`lib/src/ui/settings/widgets/color/color_settings_group.dart` (replacing
the placeholder):

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// The colour group, identical in both styles.
final class ColorSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const ColorSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    return SettingsSection(
      title: context.l10n.colorAdjustment,
      settings: [
        if (configuration.showColorProfileSetting) const ColorProfileSetting(),
        if (configuration.showTextColorSetting) const TextColorSetting(),
        if (configuration.showBackgroundColorSetting)
          const BackgroundColorSetting(),
      ],
    );
  }
}
```

- [ ] **Step 2: Write the tests**

`test/ui/settings/widgets/color/color_profile_setting_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('ColorProfileSetting cycles to the next profile', (tester) async {
    final viewModel = await pumpCupertino(tester, const ColorProfileSetting());
    expect(find.text('Normal'), findsOneWidget);
    expect(find.text('1/5'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.paintbrush), findsOneWidget);
    await tester.tap(find.text('Normal'));
    await tester.pumpAndSettle();
    expect(
      viewModel.settings.colorSettings.colorProfile,
      ColorProfileLevel.lowSaturation,
    );
    expect(find.text('Low saturation'), findsOneWidget);
    expect(find.text('2/5'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.circle), findsOneWidget);
  });
}
```

`test/ui/settings/widgets/color/color_settings_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/circle_color.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

const teal = ColorSwatch<int>(0xFF009688, {
  500: Color(0xFF009688),
  900: Color(0xFF004D40),
});

Widget inPanel(
  Widget child, [
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.standard,
  child: child,
);

void main() {
  testWidgets('TextColorSetting sets the text colour from the palette', (
    tester,
  ) async {
    final viewModel = await pumpCupertino(
      tester,
      inPanel(const TextColorSetting()),
    );
    expect(find.text('Adjust text colors'), findsOneWidget);
    expect(find.byType(CircleColor), findsNWidgets(19));
    await tester.tap(find.bySemanticsLabel('Change the color of the text to: Red'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.color, 0xFFF44336);
  });

  testWidgets('BackgroundColorSetting uses the configured candidates', (
    tester,
  ) async {
    final viewModel = await pumpCupertino(
      tester,
      inPanel(
        const BackgroundColorSetting(),
        const AccessibilitySettingsConfiguration(
          backgroundColorCandidates: [teal],
          backgroundColorAllowPickingShades: false,
        ),
      ),
    );
    expect(find.text('Adjust background colors'), findsOneWidget);
    expect(find.byType(CircleColor), findsOneWidget);
    await tester.tap(find.byType(CircleColor));
    await tester.pumpAndSettle();
    expect(viewModel.settings.colorSettings.backgroundColor, 0xFF009688);
    expect(find.byType(CircleColor), findsOneWidget);
  });
}
```

The spoken prefix comes from the ARB (`changeTextColor` is "Change the
color of the text to:"; `color(cF44336)` is "Red"); read `app_en.arb` if
the finder misses, and fix the finder, not the widget.

`test/ui/settings/widgets/color/color_settings_group_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

Widget group([
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: AccessibilitySettingsStyle.cards,
  child: const SingleChildScrollView(child: ColorSettingsGroup()),
);

void main() {
  group('ColorSettingsGroup', () {
    testWidgets('lists the three colour settings under its title', (
      tester,
    ) async {
      await pumpCupertino(tester, group());
      expect(find.text('Color adjustment'), findsOneWidget);
      expect(find.byType(ColorProfileSetting), findsOneWidget);
      expect(find.byType(TextColorSetting), findsOneWidget);
      expect(find.byType(BackgroundColorSetting), findsOneWidget);
      expect(find.byType(CupertinoListSection), findsOneWidget);
    });

    testWidgets('hides settings on request', (tester) async {
      await pumpCupertino(
        tester,
        group(
          const AccessibilitySettingsConfiguration(
            showColorProfileSetting: false,
            showBackgroundColorSetting: false,
          ),
        ),
      );
      expect(find.byType(ColorProfileSetting), findsNothing);
      expect(find.byType(TextColorSetting), findsOneWidget);
      expect(find.byType(BackgroundColorSetting), findsNothing);
    });
  });
}
```

The section title "Color adjustment" is the `colorAdjustment` message;
check the ARB if it differs.

- [ ] **Step 3: Verify and commit**

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add the colour settings group with the profile cycler and the colour pickers"
```

---

### Task 8: Text settings group

**Files:**
- Create under `packages/accessibility_cupertino/lib/src/ui/settings/widgets/text/`:
  `text_align_setting.dart`, `bold_setting.dart`, `font_setting.dart`,
  `text_range_settings.dart`
- Replace: `settings/widgets/text/text_settings_group.dart`
- Test under `packages/accessibility_cupertino/test/ui/settings/widgets/text/`:
  `text_align_setting_test.dart`, `bold_and_font_settings_test.dart`,
  `text_range_settings_test.dart`, `text_settings_group_test.dart`

**Interfaces:**
- Produces `TextSettingsGroup` (section titled `sizeAndTextDisplay`:
  alignment, bold, font, then the four ranges), `TextAlignSetting` (a
  title tile plus three check-mark tiles for left, centre and right;
  tapping the active one clears the override), `BoldSetting` and
  `FontSetting` (switch tiles), `TextScaleFactorSetting`,
  `WordSpacingSetting`, `LineHeightSetting`, `LetterSpacingSetting`
  (`SettingsRangeSetting`s, style-aware).
- Icons: alignment `text_alignleft`/`text_aligncenter`/`text_alignright`,
  title tile `text_justify`; bold `bold`; font `textformat_abc`; scale
  `textformat_size`; word spacing `textformat`; line height
  `line_horizontal_3_decrease`; letter spacing `textformat_abc`.

- [ ] **Step 1: Write the settings and the group**

`lib/src/ui/settings/widgets/text/text_align_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Left, centre or right alignment as three check-mark tiles under a
/// title; tapping the active one clears the override.
final class TextAlignSetting extends StatelessWidget {
  /// Creates the setting.
  const TextAlignSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = AccessibilityScope.settingsOf(
      context,
    ).textSettings.textAlign;
    final viewModel = AccessibilityScope.of(context);
    final check = Icon(
      CupertinoIcons.check_mark,
      color: CupertinoTheme.of(context).primaryColor,
    );
    final options = [
      (TextAlignMode.left, CupertinoIcons.text_alignleft, l10n.alignLeft),
      (TextAlignMode.center, CupertinoIcons.text_aligncenter, l10n.alignCenter),
      (TextAlignMode.right, CupertinoIcons.text_alignright, l10n.alignRight),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsTile(title: l10n.textAlignment, icon: CupertinoIcons.text_justify),
        for (final (mode, icon, label) in options)
          SettingsTile(
            title: label,
            icon: icon,
            selected: current == mode,
            trailing: current == mode ? check : null,
            onTap: () => viewModel.setTextAlign(
              current == mode ? TextAlignMode.none : mode,
            ),
          ),
      ],
    );
  }
}
```

`lib/src/ui/settings/widgets/text/bold_setting.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Bold text on or off.
final class BoldSetting extends StatelessWidget {
  /// Creates the setting.
  const BoldSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = AccessibilityScope.of(context);
    return SettingsSwitchTile(
      title: l10n.boldText,
      subtitle: l10n.changeBoldText,
      icon: CupertinoIcons.bold,
      value: AccessibilityScope.settingsOf(context).textSettings.isBold,
      onChanged: (value) => viewModel.setBold(value: value),
    );
  }
}
```

`lib/src/ui/settings/widgets/text/font_setting.dart`: the same shape as
`packages/accessibility_material/lib/src/ui/settings/widgets/text/font_setting.dart`
with `SettingsSwitchTile` and `CupertinoIcons.textformat_abc`.

`lib/src/ui/settings/widgets/text/text_range_settings.dart`: the four
widgets of
`packages/accessibility_material/lib/src/ui/settings/widgets/text/text_range_settings.dart`
built on `SettingsRangeSetting`, each passing the `icon` listed above in
addition to the Material parameters (same titles, subtitles, ranges,
labels and commands; `slider_config.dart` constants).

`lib/src/ui/settings/widgets/text/text_settings_group.dart` (replacing
the placeholder):

```dart
import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The text group: alignment, switches, then the four ranges.
final class TextSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const TextSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    final hasFonts = AccessibilityScope.of(context).accessibleFonts.isNotEmpty;
    return SettingsSection(
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

- [ ] **Step 2: Write the tests**

`test/ui/settings/widgets/text/text_align_setting_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('TextAlignSetting sets and clears the alignment', (tester) async {
    final viewModel = await pumpCupertino(tester, const TextAlignSetting());
    expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
    await tester.tap(find.text('Align center'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.center);
    expect(find.byIcon(CupertinoIcons.check_mark), findsOneWidget);
    await tester.tap(find.text('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.right);
    await tester.tap(find.text('Align right'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.textSettings.textAlign, TextAlignMode.none);
    expect(find.byIcon(CupertinoIcons.check_mark), findsNothing);
  });
}
```

The labels are the `alignLeft`/`alignCenter`/`alignRight` messages
("Align left", "Align center", "Align right"); read `app_en.arb` if a
finder misses.

`test/ui/settings/widgets/text/bold_and_font_settings_test.dart`: copy
`packages/accessibility_material/test/ui/settings/widgets/text/bold_and_font_settings_test.dart`
with `pumpCupertino` and `CupertinoSwitch` in place of `Switch` (read it
for its scenarios: bold toggles `isBold`, the font switch enables the
first registered font and clears it, and the font setting needs fonts).

`test/ui/settings/widgets/text/text_range_settings_test.dart`: copy
`packages/accessibility_material/test/ui/settings/widgets/text/text_range_settings_test.dart`
with `pumpCupertino`, `CupertinoIcons.plus`/`minus` and
`find.byType(CupertinoSlider)`; keep every scenario and value.

`test/ui/settings/widgets/text/text_settings_group_test.dart`:

```dart
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/bold_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/font_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_align_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_range_settings.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Widget group(
  AccessibilitySettingsStyle style, [
  AccessibilitySettingsConfiguration configuration =
      const AccessibilitySettingsConfiguration(),
]) => PanelScope(
  configuration: configuration,
  style: style,
  child: const SingleChildScrollView(child: TextSettingsGroup()),
);

void main() {
  group('TextSettingsGroup', () {
    testWidgets('lists every text setting with sliders in the standard style', (
      tester,
    ) async {
      await pumpCupertino(
        tester,
        group(AccessibilitySettingsStyle.standard),
        fonts: const [andika],
      );
      expect(find.text('Size and text display'), findsOneWidget);
      expect(find.byType(TextAlignSetting), findsOneWidget);
      expect(find.byType(BoldSetting), findsOneWidget);
      expect(find.byType(FontSetting), findsOneWidget);
      expect(find.byType(TextScaleFactorSetting), findsOneWidget);
      expect(find.byType(WordSpacingSetting), findsOneWidget);
      expect(find.byType(LineHeightSetting), findsOneWidget);
      expect(find.byType(LetterSpacingSetting), findsOneWidget);
      expect(find.byType(CupertinoSlider), findsNWidgets(4));
    });

    testWidgets('uses steppers in the cards style', (tester) async {
      await pumpCupertino(tester, group(AccessibilitySettingsStyle.cards));
      expect(find.byType(CupertinoSlider), findsNothing);
      expect(find.byIcon(CupertinoIcons.plus), findsNWidgets(4));
      expect(find.byType(FontSetting), findsNothing);
    });

    testWidgets('hides settings on request', (tester) async {
      await pumpCupertino(
        tester,
        group(
          AccessibilitySettingsStyle.standard,
          const AccessibilitySettingsConfiguration(
            showTextAlignSetting: false,
            showBoldSetting: false,
            showFontSetting: false,
            showWordSpacingSetting: false,
            showLineHeightSetting: false,
            showLetterSpacingSetting: false,
          ),
        ),
        fonts: const [andika],
      );
      expect(find.byType(TextAlignSetting), findsNothing);
      expect(find.byType(BoldSetting), findsNothing);
      expect(find.byType(FontSetting), findsNothing);
      expect(find.byType(TextScaleFactorSetting), findsOneWidget);
      expect(find.byType(CupertinoSlider), findsOneWidget);
    });
  });
}
```

The section title is the `sizeAndTextDisplay` message; check the ARB if
it differs.

- [ ] **Step 3: Verify and commit**

Run: `cd packages/accessibility_cupertino && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, clean.

```bash
git add packages/accessibility_cupertino
```

```bash
git commit -m "feat(cupertino): add the text settings group with alignment, switches and ranges"
```

---

### Task 9: Guideline tests, public API, example, README, spec alignment and verification

**Files:**
- Modify: `packages/accessibility_cupertino/lib/accessibility_cupertino.dart`,
  `packages/accessibility_cupertino/README.md`,
  `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
- Create: `packages/accessibility_cupertino/test/accessibility_guidelines_test.dart`,
  `packages/accessibility_cupertino/test/public_api_test.dart`,
  `packages/accessibility_cupertino/example/lib/main.dart`,
  `packages/accessibility_cupertino/example/pubspec.yaml`,
  `packages/accessibility_cupertino/example/analysis_options.yaml`

- [ ] **Step 1: Write the guideline tests**

`packages/accessibility_cupertino/test/accessibility_guidelines_test.dart`:
copy `packages/accessibility_material/test/accessibility_guidelines_test.dart`
with `pumpCupertino`, `CupertinoAccessibilitySettingsPanel`,
`CupertinoRestoreSettingsButton`, `iOSTapTargetGuideline` in place of
`androidTapTargetGuideline`, the doc comment mentioning the 44 dp iOS
target, and `CustomScrollView` kept for the drag. Keep the two scenarios
per style (defaults, and `AccessibilitySettingsSamples.everythingSet`)
and the 400 px scroll loop.

Run: `cd packages/accessibility_cupertino && flutter test test/accessibility_guidelines_test.dart`
Expected: 4 tests pass. If a guideline fails, the failure names the
node: fix the widget (label, size or colour), never the test. Known
sensitive spots: the section header (13 px on the grouped background,
already 4.7:1), any secondary text not using `kPanelSecondaryTextColor`,
segments shorter than 44 dp, and the check-mark tiles' labels.

- [ ] **Step 2: Complete the barrel and its test**

`packages/accessibility_cupertino/lib/accessibility_cupertino.dart`, add
after the two re-exports (sorted):

```dart
export 'src/ui/routes/accessible_cupertino_page.dart'
    show AccessibleCupertinoPage;
export 'src/ui/routes/accessible_cupertino_page_route.dart'
    show AccessibleCupertinoPageRoute;
export 'src/ui/settings/widgets/components/cupertino_restore_settings_button.dart'
    show CupertinoRestoreSettingsButton;
export 'src/ui/settings/widgets/cupertino_accessibility_settings_panel.dart'
    show CupertinoAccessibilitySettingsPanel;
export 'src/ui/text/widgets/cupertino_read_more_text.dart'
    show CupertinoReadMoreText;
export 'src/ui/theme/accessible_cupertino_theme_builder.dart'
    show AccessibleCupertinoThemeBuilder, AccessibleCupertinoThemeWidgetBuilder;
export 'src/ui/theme/accessible_cupertino_theme_data.dart'
    show AccessibleCupertinoThemeData;
```

`packages/accessibility_cupertino/test/public_api_test.dart`: copy
`packages/accessibility_material/test/public_api_test.dart` with the
barrel path, the eight names of this package, `isNot(contains("export 'package:cupertino_ui"))`,
`isNot(contains("import 'package:cupertino_ui"))` and
`const CupertinoAccessibilitySettingsPanel().style` in the resolution
test.

- [ ] **Step 3: Write the example**

`packages/accessibility_cupertino/example/pubspec.yaml`:

```yaml
name: accessibility_cupertino_example
description: Example app of accessibility_cupertino.
publish_to: none
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  accessibility_cupertino: ^2.0.0
  accessibility_font_andika: ^2.0.0
  accessibility_shared_preferences: ^2.0.0
  cupertino_ui: ^1.0.0
  flutter:
    sdk: flutter

flutter:
  uses-material-design: false
```

`example/analysis_options.yaml`: `include: ../../../analysis_options.yaml`.
Register the example in the root `pubspec.yaml` workspace list (after
`packages/accessibility_cupertino`, matching how the other examples are
listed; if no example is registered yet, add this one and note it in the
ledger for plan 6). Run `flutter pub get` at the root.

`example/lib/main.dart`:

```dart
import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

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
        accessibleFonts: const [andikaFont],
      ),
      child: const ExampleApp(),
    ),
  );
}

/// The example app: a Cupertino app whose theme follows the settings.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

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
        builder: (_) => switch (settings.name) {
          '/settings' => const SettingsPage(),
          _ => const HomePage(),
        },
      ),
    ),
  );
}

/// The home page, with a sample text and a link to the settings.
final class HomePage extends StatelessWidget {
  /// Creates the page.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(l10n.accessibility)),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const AccessibleText(
              'The quick brown fox jumps over the lazy dog.',
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: () => Navigator.of(context).pushNamed('/settings'),
              child: Text(l10n.accessibilitySettings),
            ),
          ],
        ),
      ),
    );
  }
}

/// The settings page, switching between the two panel styles.
final class SettingsPage extends StatefulWidget {
  /// Creates the page.
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AccessibilitySettingsStyle _style = AccessibilitySettingsStyle.standard;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text(AccessibilityLocalizations.of(context).settings),
      trailing: CupertinoSlidingSegmentedControl<AccessibilitySettingsStyle>(
        groupValue: _style,
        children: const {
          AccessibilitySettingsStyle.standard: Text('List'),
          AccessibilitySettingsStyle.cards: Text('Grouped'),
        },
        onValueChanged: (style) {
          if (style != null) {
            setState(() => _style = style);
          }
        },
      ),
    ),
    child: CupertinoAccessibilitySettingsPanel(style: _style),
  );
}
```

Check the exact name of the Andika font constant in
`packages/accessibility_font_andika/lib/accessibility_font_andika.dart`
and use it. Run: `cd packages/accessibility_cupertino/example && dart analyze --fatal-infos --fatal-warnings .`
Expected: clean (the package's `dart analyze .` also covers `example/`).

- [ ] **Step 4: Complete the README**

Append to `packages/accessibility_cupertino/README.md` after the usage
block:

```markdown
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

## Parity with accessibility_material

Every setting, style and configuration flag of `accessibility_material`
is available here with the same ViewModel commands; only the widgets
differ. Apps that ship both design systems share the
`AccessibilityScope`, the repository and the storage service.
```

- [ ] **Step 5: Align the spec**

Edit section 12 of
`docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
to record the rulings of this plan (short, factual, no code):

- 12.1: the builder yields one `CupertinoThemeData`; `system` keeps the
  app theme's own brightness; high contrast comes from the media query or,
  above the app, from the platform's accessibility features, observed.
- 12.2: the profile maps every variant of a `CupertinoDynamicColor`;
  `selectionHandleColor` is adjusted too; text style colours are left
  alone (parity with Material).
- 12.3: when effects are off the route keeps the Cupertino transition
  widgets with completed animations (the back gesture survives) and zero
  durations, resolved at install through the navigator's context.
- 12.4: the cards style is inset grouped sections with notched tiles and
  a `none` profile tile; tri-states use the sliding segmented control
  with 44 dp segments; alignment uses three check-mark tiles (no new
  localisation key); ranges are slider rows (standard) or stepper tiles
  (cards); secondary text uses an opaque colour pair for contrast; the
  default palette is `kDefaultColorCandidates` from `flutter_accessibility`
  (added in this plan, section 6 gets a line for it).

Also add `accessibility_cupertino` to the CI/workspace lists of sections
15 and 16 where `accessibility_material` was added in plan 4, and note
in the 16.2 table that both panels share the configuration and the
default palette.

- [ ] **Step 6: Full verification**

Run from the workspace root:
`flutter pub get && dart run melos run format && dart run melos run analyze && dart run melos run test && dart run melos run coverage:check`
Expected: every package formatted, analysed and tested; the four gated
packages report 100 %. Then
`cd packages/accessibility_cupertino && flutter test --file-reporter json:../../.superpowers/sdd/plan5-tests.json`
and count the passing tests for the ledger (expect at least 60).

Run `cd packages/accessibility_cupertino && flutter pub publish --dry-run`
Expected: no errors (warnings about the unpublished 2.0.0 dependencies
are expected until the release).

- [ ] **Step 7: Commit**

```bash
git add packages/accessibility_cupertino docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md pubspec.yaml pubspec.lock
```

```bash
git commit -m "feat(cupertino): add the guideline tests, the public API, the example and the README"
```

Then push the branch, open the pull request into `release/2.0` titled
`feat(cupertino): add accessibility_cupertino with full parity to accessibility_material`
whose body follows the repository's template (summary, what changed per
task, rulings, verification numbers), with no attribution lines; merge
with a merge commit when CI is green.

## Self-review notes

- Spec coverage: 12.1 (builder), 12.2 (theme data), 12.3 (route and
  page), 12.4 (panel: both styles, every item, status card, restore
  button, read-more text, icon map), 13 (localisation delegates), 14
  (guideline tests), 3/15/16 (workspace, CI, parity). Section 6 gains
  `kDefaultColorCandidates`.
- Every task ends with the package's full test run, analysis and format
  check and its own commit; Task 9 runs the whole workspace.
- Interfaces named in later tasks exist in earlier ones:
  `PanelScope`, `SettingsSection`, `SettingsTile`, `SettingsIconButton`,
  `SettingsSwitchTile`, `SettingsExpansionSwitchTile`, `SegmentedSetting`,
  `SettingsRangeSetting`, `CircleColor`, `CupertinoColorPicker`,
  `CupertinoRestoreSettingsButton`, `CupertinoReadMoreText`, `StatusCard`
  (Task 5); `kDefaultColorCandidates` (Task 1); the three groups replace
  Task 5 placeholders in Tasks 6 to 8.
