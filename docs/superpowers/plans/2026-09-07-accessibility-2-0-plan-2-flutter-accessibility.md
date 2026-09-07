# accessibility 2.0, Plan 2 of 6: `flutter_accessibility`

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver `packages/flutter_accessibility` 2.0.0, the design-system-neutral
UI layer: the `ChangeNotifier` ViewModel, the `AccessibilityScope`, the
builders, the shared panel configuration, and the accessible widgets ported
from 1.x, at 100% line coverage, wired into melos and CI.

**Architecture:** MVVM per the Flutter architecture guide. This package is the
UI layer's neutral part: one ViewModel that subscribes to the core
repository and exposes commands, plus Views that only use
`package:flutter/widgets.dart`. It re-exports `accessibility`. It never
imports Material, Cupertino or `package:listen`.

**Tech Stack:** Flutter >= 3.44 (`widgets.dart`, `foundation.dart`,
`painting.dart`), `flutter_test`, `accessibility` 2.0.0,
`accessibility_testing` 2.0.0, melos 7, GitHub Actions.

**Spec:** `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
(sections 3, 4, 6, 13, 14, 15 drive this plan).

**Plan series:** 1 foundation and core (merged, PR #13) · 2 `flutter_accessibility`
(this) · 3 localizations, shared_preferences, font · 4 `accessibility_material`
· 5 `accessibility_cupertino` · 6 examples, deploy, docs, release.

## Global Constraints

- Dart SDK `^3.12.0`; Flutter `>=3.44.0`; the package depends on `flutter`
  (sdk) and `accessibility: ^2.0.0` only; dev dependencies `flutter_test`
  (sdk) and `accessibility_testing: ^2.0.0`.
- No file under `lib/` imports `package:flutter/material.dart`,
  `package:flutter/cupertino.dart`, `package:material_ui`,
  `package:cupertino_ui` or `package:listen` (enforced by a test).
- The ViewModel extends Flutter's `ChangeNotifier`; the `listen` types of the
  repository never appear in this package's public API.
- 100% line coverage, gated by `tool/check_coverage.dart`.
- Every public member documented; `package:` imports only; 80-column lines;
  trailing commas; `prefer_expression_function_bodies`;
  `avoid_positional_boolean_parameters` (boolean parameters are named);
  `use_named_constants`, `prefer_const_constructors`,
  `avoid_redundant_argument_values` (never pass a literal equal to the
  default); `dart analyze --fatal-infos --fatal-warnings` clean. Infos are
  fatal, so implementers add `const` where the analyzer asks and treat any
  such deviation from the plan's code as formatting.
- Widgets are Views: they read `AccessibilityScope` and `MediaQuery`, invoke
  ViewModel commands, and hold no business logic.
- Commits follow Conventional Commits with the `flutter` scope for package
  code; branch names use conventional types. No `Co-Authored-By` trailer, no
  session link, no "generated with" line.
- Work happens on branch `feat/flutter-accessibility` (from `release/2.0`)
  in the worktree `.claude/worktrees/feat-flutter-accessibility`; the branch
  lands in `release/2.0` through a pull request.
- Git commands in this worktree are refused by the tooling when combined with
  other commands: every `git` invocation is its own plain Bash call.
- melos runs as `dart run melos <cmd>` from the workspace root. Because the
  workspace now contains a Flutter package, dependency resolution is
  `flutter pub get` at the root.

---

### Task 1: Package skeleton, workspace, melos and CI

**Files:**
- Create: `packages/flutter_accessibility/pubspec.yaml`,
  `packages/flutter_accessibility/analysis_options.yaml`,
  `packages/flutter_accessibility/.pubignore`,
  `packages/flutter_accessibility/LICENSE`,
  `packages/flutter_accessibility/CHANGELOG.md`,
  `packages/flutter_accessibility/README.md`,
  `packages/flutter_accessibility/lib/flutter_accessibility.dart`
- Modify: `pubspec.yaml` (root), `.github/workflows/build.yml`

**Interfaces:**
- Produces: a resolvable Flutter workspace member `flutter_accessibility`
  2.0.0 whose `dart analyze` is clean; melos scripts split between Dart and
  Flutter packages; a CI matrix entry with `flutter test --coverage`.

- [ ] **Step 1: Create the package files**

`packages/flutter_accessibility/pubspec.yaml`:

```yaml
name: flutter_accessibility
description: Flutter widgets layer of the accessibility package family, with the settings ViewModel, scope, builders and accessible widgets, independent of any design system.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/flutter_accessibility
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - wcag
  - widgets
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  accessibility: ^2.0.0
  flutter:
    sdk: flutter

dev_dependencies:
  accessibility_testing: ^2.0.0
  flutter_test:
    sdk: flutter
```

`packages/flutter_accessibility/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

`packages/flutter_accessibility/.pubignore`:

```
analysis_options.yaml
coverage/
```

Copy the licence: `cp LICENSE packages/flutter_accessibility/LICENSE`.

`packages/flutter_accessibility/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release of the widgets layer extracted from `accessibility` 1.x:
  `AccessibilitySettingsViewModel`, `AccessibilityScope`,
  `AccessibilitySettingsBuilder`, `EffectsBuilder`, the shared panel
  configuration, and the accessible widgets (`AccessibleText`,
  `AccessibleWidgetBuilder`, `AccessibleSizedBox`, `AccessibleHeight`,
  `TextRawMagnifier`, `CollapsibleText`), built on `widgets.dart` only.
```

`packages/flutter_accessibility/README.md`:

```markdown
# flutter_accessibility

The Flutter widgets layer of the accessibility package family. It depends on
`package:flutter/widgets.dart` only, so it works with Material, Cupertino or
a custom design system. It re-exports `package:accessibility`.

- `AccessibilitySettingsViewModel`: a `ChangeNotifier` over the core
  repository, exposing the settings, the load status and commands.
- `AccessibilityScope`: provides the ViewModel to the widget tree.
- `AccessibilitySettingsBuilder` and `EffectsBuilder`: rebuild on changes;
  `EffectsBuilder` also honours the OS reduce-motion setting.
- `AccessibleText`, `AccessibleWidgetBuilder`, `AccessibleSizedBox`,
  `AccessibleHeight`, `TextRawMagnifier`, `CollapsibleText`: widgets that
  follow the settings without a design-system theme.

## Usage

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(service: myStorage);
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const MyApp(),
    ),
  );
}

// Anywhere below the scope:
final settings = AccessibilityScope.settingsOf(context); // rebuilds on change
AccessibilityScope.of(context).setTextScaleFactor(1.5);  // a command
```

For a ready-made settings panel and theme integration use
`accessibility_material` or `accessibility_cupertino`.
```

`packages/flutter_accessibility/lib/flutter_accessibility.dart`:

```dart
/// Flutter widgets layer of the accessibility package family.
///
/// Provides the settings ViewModel, the scope that exposes it to the widget
/// tree, builders that react to changes, and accessible widgets, all built on
/// `package:flutter/widgets.dart` only. Re-exports `package:accessibility`.
library;

export 'package:accessibility/accessibility.dart';
```

- [ ] **Step 2: Add the member and split the melos scripts**

Replace the root `pubspec.yaml` with:

```yaml
name: accessibility_workspace
description: Workspace of the accessibility package family. Not published.
publish_to: none

environment:
  sdk: ^3.12.0

workspace:
  - packages/accessibility
  - packages/accessibility_testing
  - packages/flutter_accessibility

dev_dependencies:
  melos: ^7.0.0

melos:
  scripts:
    analyze:
      description: Analyze every package with infos and warnings as errors.
      run: melos exec -c 1 -- dart analyze --fatal-infos --fatal-warnings .
    format:
      description: Fail when any package is not formatted.
      run: melos exec -c 1 -- dart format --set-exit-if-changed .
    test:
      description: Run the tests of every package that has a test directory.
      run: melos run test:dart --no-select && melos run test:flutter --no-select
    test:dart:
      description: Run the tests of the pure Dart packages.
      run: melos exec -c 1 --no-flutter --dir-exists=test -- dart test
    test:flutter:
      description: Run the tests of the Flutter packages.
      run: melos exec -c 1 --flutter --dir-exists=test -- flutter test
    test:coverage:
      description: Run the tests of every package with coverage output.
      run: melos run test:coverage:dart --no-select && melos run test:coverage:flutter --no-select
    test:coverage:dart:
      description: Run the pure Dart tests with coverage output.
      run: melos exec -c 1 --no-flutter --dir-exists=test -- dart run coverage:test_with_coverage
    test:coverage:flutter:
      description: Run the Flutter tests with coverage output.
      run: melos exec -c 1 --flutter --dir-exists=test -- flutter test --coverage
    coverage:check:
      description: Fail when a gated package is below 100% line coverage.
      run: melos exec -c 1 --scope=accessibility --scope=accessibility_testing --scope=flutter_accessibility -- dart ../../tool/check_coverage.dart coverage/lcov.info 100
```

If melos rejects `--no-select` on `melos run`, drop that flag; if it rejects
`&&` inside `run:` on Windows, keep only the two sub-scripts and document
that `test` is `test:dart` followed by `test:flutter` (note it in the
report).

- [ ] **Step 3: Update the CI matrix**

In `.github/workflows/build.yml` change the `matrix.include` block, the
root resolution step and the test step:

```yaml
      matrix:
        include:
          - package: accessibility
            coverage_gate: 100
            pana: true
            test_command: dart run coverage:test_with_coverage
          - package: accessibility_testing
            coverage_gate: 100
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
            test_command: dart run coverage:test_with_coverage
          - package: flutter_accessibility
            coverage_gate: 100
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
            test_command: flutter test --coverage
```

```yaml
      - name: 📦 Resolving the workspace
        working-directory: .
        run: flutter pub get
```

```yaml
      - name: 🧪 Test with coverage
        run: ${{ matrix.test_command }}
```

Also change the `tooling` job's resolution step to `flutter pub get`.
Everything else stays as it is.

- [ ] **Step 4: Resolve and verify**

```bash
flutter pub get
cd packages/flutter_accessibility && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed . ; cd ../..
dart run melos bootstrap
dart run melos run analyze
```

Expected: resolution succeeds from the root; the new package analyzes and
formats clean; melos lists three packages and `analyze` passes for all.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat(flutter): add the flutter_accessibility package skeleton and wire it into melos and CI"
```

(Two plain git calls.)

---

### Task 2: AccessibilitySettingsViewModel

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/settings/view_model/accessibility_settings_view_model.dart`
- Test: `packages/flutter_accessibility/test/ui/settings/view_model/accessibility_settings_view_model_test.dart`

**Interfaces:**
- Consumes: `AccessibilitySettingsRepository` (`settings`, `status`, `load`,
  `save`, `clear`), `AccessibilitySettings` and its `copyWith` /
  `withThemeProfile` / `withNextColorProfile`, `TextSettings.copyWith` with
  sentinel clearing, `AccessibleFont`.
- Produces: `AccessibilitySettingsViewModel extends ChangeNotifier` with
  `settings`, `status`, `accessibleFonts`, `activeFont`, `load()`,
  `setThemeMode`, `setEffectsMode`, `setTextScaleFactor`, `setLineHeight`,
  `setLetterSpacing`, `setWordSpacing`, `setBold({required bool value})`,
  `setTextAlign`, `setTextColor`, `setFontFamily`,
  `setAccessibleFontEnabled({required bool enabled})`, `setBackgroundColor`,
  `setColorProfile`, `nextColorProfile()`, `applyThemeProfile`,
  `restoreDefaults()`, `dispose()`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/ui/settings/view_model/accessibility_settings_view_model_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

const andika = AccessibleFont(family: 'Andika', package: 'font_andika');
const dyslexic = AccessibleFont(family: 'OpenDyslexic');

void main() {
  late FakeAccessibilityStorageService service;
  late AccessibilitySettingsRepository repository;
  late AccessibilitySettingsViewModel viewModel;
  late int notifications;

  setUp(() {
    service = FakeAccessibilityStorageService();
    repository = AccessibilitySettingsRepository(service: service);
    viewModel = AccessibilitySettingsViewModel(
      repository: repository,
      accessibleFonts: const [andika, dyslexic],
    );
    notifications = 0;
    viewModel.addListener(() => notifications++);
  });

  tearDown(() {
    viewModel.dispose();
    repository.dispose();
  });

  group('AccessibilitySettingsViewModel', () {
    test('is a Flutter ChangeNotifier exposing the repository state', () {
      expect(viewModel, isA<ChangeNotifier>());
      expect(viewModel.settings, AccessibilitySettings.defaults);
      expect(viewModel.status, isA<AccessibilitySettingsIdle>());
      expect(viewModel.accessibleFonts, [andika, dyslexic]);
      expect(viewModel.activeFont, isNull);
    });

    test('accessibleFonts is unmodifiable and defaults to empty', () {
      expect(() => viewModel.accessibleFonts.add(andika), throwsUnsupportedError);
      final bare = AccessibilitySettingsViewModel(repository: repository);
      expect(bare.accessibleFonts, isEmpty);
      bare.dispose();
    });

    test('load forwards to the repository and notifies on status change',
        () async {
      service.readError = Exception('disk');
      await viewModel.load();
      expect(viewModel.status, isA<AccessibilitySettingsLoadFailed>());
      expect(notifications, 1);
      service.readError = null;
      await viewModel.load();
      expect(viewModel.status, isA<AccessibilitySettingsLoaded>());
      expect(notifications, 2);
    });

    test('every command saves the expected settings and notifies once',
        () async {
      final cases = <String, (Future<void> Function(), AccessibilitySettings)>{
        'setThemeMode': (
          () => viewModel.setThemeMode(AccessibilityThemeMode.dark),
          const AccessibilitySettings(themeMode: AccessibilityThemeMode.dark),
        ),
        'setEffectsMode': (
          () => viewModel.setEffectsMode(EffectsMode.disabled),
          const AccessibilitySettings(effectsMode: EffectsMode.disabled),
        ),
        'setTextScaleFactor': (
          () => viewModel.setTextScaleFactor(1.5),
          const AccessibilitySettings(
            textSettings: TextSettings(textScaleFactor: 1.5),
          ),
        ),
        'setLineHeight': (
          () => viewModel.setLineHeight(2),
          const AccessibilitySettings(textSettings: TextSettings(lineHeight: 2)),
        ),
        'setLetterSpacing': (
          () => viewModel.setLetterSpacing(0.5),
          const AccessibilitySettings(
            textSettings: TextSettings(letterSpacing: 0.5),
          ),
        ),
        'setWordSpacing': (
          () => viewModel.setWordSpacing(3),
          const AccessibilitySettings(textSettings: TextSettings(wordSpacing: 3)),
        ),
        'setBold': (
          () => viewModel.setBold(value: true),
          const AccessibilitySettings(textSettings: TextSettings(isBold: true)),
        ),
        'setTextAlign': (
          () => viewModel.setTextAlign(TextAlignMode.justify),
          const AccessibilitySettings(
            textSettings: TextSettings(textAlign: TextAlignMode.justify),
          ),
        ),
        'setTextColor': (
          () => viewModel.setTextColor(0xFF112233),
          const AccessibilitySettings(
            textSettings: TextSettings(color: 0xFF112233),
          ),
        ),
        'setFontFamily': (
          () => viewModel.setFontFamily('OpenDyslexic'),
          const AccessibilitySettings(
            textSettings: TextSettings(fontFamily: 'OpenDyslexic'),
          ),
        ),
        'setBackgroundColor': (
          () => viewModel.setBackgroundColor(0xFFFFFFF0),
          const AccessibilitySettings(
            colorSettings: ColorSettings(backgroundColor: 0xFFFFFFF0),
          ),
        ),
        'setColorProfile': (
          () => viewModel.setColorProfile(ColorProfileLevel.monochrome),
          const AccessibilitySettings(
            colorSettings: ColorSettings(
              colorProfile: ColorProfileLevel.monochrome,
            ),
          ),
        ),
        'nextColorProfile': (
          viewModel.nextColorProfile,
          const AccessibilitySettings(
            colorSettings: ColorSettings(
              colorProfile: ColorProfileLevel.lowSaturation,
            ),
          ),
        ),
        'applyThemeProfile': (
          () => viewModel.applyThemeProfile(ThemeProfileLevel.seizureSafe),
          AccessibilitySettingsSamples.seizureSafe,
        ),
      };
      for (final entry in cases.entries) {
        await repository.clear();
        notifications = 0;
        await entry.value.$1();
        expect(viewModel.settings, entry.value.$2, reason: entry.key);
        expect(service.stored, entry.value.$2, reason: entry.key);
        expect(notifications, 1, reason: entry.key);
      }
    });

    test('nullable setters clear with null', () async {
      await viewModel.setLineHeight(2);
      await viewModel.setLetterSpacing(1);
      await viewModel.setWordSpacing(1);
      await viewModel.setTextColor(0xFF000000);
      await viewModel.setFontFamily('Andika');
      await viewModel.setBackgroundColor(0xFF000000);
      await viewModel.setLineHeight(null);
      await viewModel.setLetterSpacing(null);
      await viewModel.setWordSpacing(null);
      await viewModel.setTextColor(null);
      await viewModel.setFontFamily(null);
      await viewModel.setBackgroundColor(null);
      expect(viewModel.settings, AccessibilitySettings.defaults);
    });

    test('a command that does not change the value does not notify',
        () async {
      await viewModel.setTextScaleFactor(1);
      expect(notifications, 0);
    });

    test('restoreDefaults clears the repository', () async {
      await viewModel.setBold(value: true);
      notifications = 0;
      await viewModel.restoreDefaults();
      expect(viewModel.settings, AccessibilitySettings.defaults);
      expect(service.stored, isNull);
      expect(service.calls.last, 'clear');
      expect(notifications, 1);
    });

    test('activeFont resolves the registered font by family', () async {
      await viewModel.setFontFamily('Andika');
      expect(viewModel.activeFont, andika);
      await viewModel.setFontFamily('OpenDyslexic');
      expect(viewModel.activeFont, dyslexic);
      await viewModel.setFontFamily('Unknown');
      expect(viewModel.activeFont, isNull);
    });

    test('setAccessibleFontEnabled toggles the first registered font',
        () async {
      await viewModel.setAccessibleFontEnabled(enabled: true);
      expect(viewModel.settings.textSettings.fontFamily, 'Andika');
      expect(viewModel.activeFont, andika);
      await viewModel.setAccessibleFontEnabled(enabled: false);
      expect(viewModel.settings.textSettings.fontFamily, isNull);
    });

    test('setAccessibleFontEnabled is a no-op without registered fonts',
        () async {
      final bare = AccessibilitySettingsViewModel(repository: repository);
      await bare.setAccessibleFontEnabled(enabled: true);
      expect(bare.settings, AccessibilitySettings.defaults);
      bare.dispose();
    });

    test('dispose stops forwarding repository changes', () async {
      final own = AccessibilitySettingsRepository(service: service);
      final disposable = AccessibilitySettingsViewModel(repository: own);
      var count = 0;
      disposable.addListener(() => count++);
      disposable.dispose();
      await own.save(
        const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
      );
      expect(count, 0);
      own.dispose();
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/settings/view_model ; cd ../..
```

Expected: compilation error, the view model file does not exist.

- [ ] **Step 3: Write the ViewModel**

`packages/flutter_accessibility/lib/src/ui/settings/view_model/accessibility_settings_view_model.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/foundation.dart';

/// The ViewModel of the accessibility settings.
///
/// Subscribes to an [AccessibilitySettingsRepository], exposes its settings
/// and load status to the widget tree as a Flutter [ChangeNotifier], and
/// offers one command per setting. The Views (the settings panels or a
/// custom UI) call the commands and never touch the repository.
final class AccessibilitySettingsViewModel extends ChangeNotifier {
  /// Creates the ViewModel over [repository].
  ///
  /// [accessibleFonts] are the fonts the app offers as accessible
  /// alternatives; the first one is selected by [setAccessibleFontEnabled].
  AccessibilitySettingsViewModel({
    required AccessibilitySettingsRepository repository,
    List<AccessibleFont> accessibleFonts = const [],
  })  : _repository = repository,
        accessibleFonts = List.unmodifiable(accessibleFonts) {
    _repository.settings.addListener(notifyListeners);
    _repository.status.addListener(notifyListeners);
  }

  final AccessibilitySettingsRepository _repository;

  /// The fonts registered as accessible alternatives, in registration order.
  final List<AccessibleFont> accessibleFonts;

  /// The current settings.
  AccessibilitySettings get settings => _repository.settings.value;

  /// The outcome of the last load.
  AccessibilitySettingsStatus get status => _repository.status.value;

  /// The registered font whose family equals the selected font family, or
  /// `null` when no font is selected or the family is not registered.
  AccessibleFont? get activeFont {
    final family = settings.textSettings.fontFamily;
    if (family == null) {
      return null;
    }
    for (final font in accessibleFonts) {
      if (font.family == family) {
        return font;
      }
    }
    return null;
  }

  /// Loads the stored settings; also used to retry after a failure.
  Future<void> load() => _repository.load();

  /// Sets the theme brightness.
  Future<void> setThemeMode(AccessibilityThemeMode mode) =>
      _repository.save(settings.copyWith(themeMode: mode));

  /// Sets whether effects and animations are allowed.
  Future<void> setEffectsMode(EffectsMode mode) =>
      _repository.save(settings.copyWith(effectsMode: mode));

  /// Sets the multiplier applied to every font size.
  Future<void> setTextScaleFactor(double value) =>
      _saveText(settings.textSettings.copyWith(textScaleFactor: value));

  /// Sets the line height, or clears it with `null`.
  Future<void> setLineHeight(double? value) =>
      _saveText(settings.textSettings.copyWith(lineHeight: value));

  /// Sets the letter spacing, or clears it with `null`.
  Future<void> setLetterSpacing(double? value) =>
      _saveText(settings.textSettings.copyWith(letterSpacing: value));

  /// Sets the word spacing, or clears it with `null`.
  Future<void> setWordSpacing(double? value) =>
      _saveText(settings.textSettings.copyWith(wordSpacing: value));

  /// Sets whether all text is bold.
  Future<void> setBold({required bool value}) =>
      _saveText(settings.textSettings.copyWith(isBold: value));

  /// Sets the text alignment override.
  Future<void> setTextAlign(TextAlignMode mode) =>
      _saveText(settings.textSettings.copyWith(textAlign: mode));

  /// Sets the text colour as ARGB, or clears it with `null`.
  Future<void> setTextColor(int? argb) =>
      _saveText(settings.textSettings.copyWith(color: argb));

  /// Sets the font family, or clears it with `null`.
  Future<void> setFontFamily(String? family) =>
      _saveText(settings.textSettings.copyWith(fontFamily: family));

  /// Selects the first registered accessible font, or clears the font.
  ///
  /// Does nothing when [enabled] is true and no font is registered.
  Future<void> setAccessibleFontEnabled({required bool enabled}) {
    if (!enabled) {
      return setFontFamily(null);
    }
    if (accessibleFonts.isEmpty) {
      return Future.value();
    }
    return setFontFamily(accessibleFonts.first.family);
  }

  /// Sets the page background colour as ARGB, or clears it with `null`.
  Future<void> setBackgroundColor(int? argb) => _repository.save(
        settings.copyWith(
          colorSettings: settings.colorSettings.copyWith(backgroundColor: argb),
        ),
      );

  /// Sets the colour profile.
  Future<void> setColorProfile(ColorProfileLevel level) => _repository.save(
        settings.copyWith(
          colorSettings: settings.colorSettings.copyWith(colorProfile: level),
        ),
      );

  /// Cycles to the next colour profile, wrapping around.
  Future<void> nextColorProfile() =>
      _repository.save(settings.withNextColorProfile());

  /// Applies a theme profile preset, keeping the theme brightness.
  Future<void> applyThemeProfile(ThemeProfileLevel level) =>
      _repository.save(settings.withThemeProfile(level));

  /// Restores the default settings and clears the stored ones.
  Future<void> restoreDefaults() => _repository.clear();

  Future<void> _saveText(TextSettings textSettings) =>
      _repository.save(settings.copyWith(textSettings: textSettings));

  @override
  void dispose() {
    _repository.settings.removeListener(notifyListeners);
    _repository.status.removeListener(notifyListeners);
    super.dispose();
  }
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test test/ui/settings/view_model && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean. If the "every command" test's
`service.calls;` line triggers `unnecessary_statements`, delete that line
(it has no effect).

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add AccessibilitySettingsViewModel"
```

---

### Task 3: AccessibilityScope and the test pump helper

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/settings/widgets/accessibility_scope.dart`,
  `packages/flutter_accessibility/test/helpers/pump_scoped.dart`
- Test: `packages/flutter_accessibility/test/ui/settings/widgets/accessibility_scope_test.dart`

**Interfaces:**
- Produces: `AccessibilityScope extends InheritedNotifier<AccessibilitySettingsViewModel>`
  with `AccessibilityScope({required viewModel, required child, key})`,
  `static of(context)`, `static maybeOf(context)`, `static settingsOf(context)`,
  `static effectsEnabledOf(context)`. Test helper
  `pumpScoped(tester, child, {initial, fonts, service, disableAnimations, size, textStyle})`
  returning the ViewModel it created, and a `scopeOnly` variant.

- [ ] **Step 1: Write the test helper**

`packages/flutter_accessibility/test/helpers/pump_scoped.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';
import 'package:flutter_test/flutter_test.dart';

/// The default text style every pumped tree starts from.
const kTestTextStyle = TextStyle(fontSize: 14, color: Color(0xFF000000));

/// Pumps [child] under an [AccessibilityScope], a [MediaQuery], a
/// [Directionality] and a [DefaultTextStyle], with no design system.
///
/// Returns the ViewModel so tests can invoke commands. The repository is
/// backed by a [FakeAccessibilityStorageService] holding [initial] and is
/// loaded before the first frame.
Future<AccessibilitySettingsViewModel> pumpScoped(
  WidgetTester tester,
  Widget child, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  List<AccessibleFont> fonts = const [],
  bool disableAnimations = false,
  Size size = const Size(400, 800),
  TextStyle textStyle = kTestTextStyle,
}) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(initial: initial),
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
        data: MediaQueryData(size: size, disableAnimations: disableAnimations),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: DefaultTextStyle(style: textStyle, child: child),
        ),
      ),
    ),
  );
  return viewModel;
}
```

- [ ] **Step 2: Write the failing tests**

`packages/flutter_accessibility/test/ui/settings/widgets/accessibility_scope_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  group('AccessibilityScope', () {
    testWidgets('of returns the view model without a dependency',
        (tester) async {
      late BuildContext captured;
      var builds = 0;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            builds++;
            return const SizedBox();
          },
        ),
      );
      expect(AccessibilityScope.of(captured), same(viewModel));
      expect(AccessibilityScope.maybeOf(captured), same(viewModel));
      await viewModel.setBold(value: true);
      await tester.pump();
      expect(builds, 1);
    });

    testWidgets('settingsOf rebuilds the caller on change', (tester) async {
      var builds = 0;
      late AccessibilitySettings seen;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            builds++;
            seen = AccessibilityScope.settingsOf(context);
            return const SizedBox();
          },
        ),
      );
      expect(seen, AccessibilitySettings.defaults);
      await viewModel.setBold(value: true);
      await tester.pump();
      expect(builds, 2);
      expect(seen.textSettings.isBold, isTrue);
    });

    testWidgets('effectsEnabledOf resolves the mode against MediaQuery',
        (tester) async {
      late BuildContext captured;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
        disableAnimations: true,
      );
      expect(AccessibilityScope.effectsEnabledOf(captured), isFalse);
      await viewModel.setEffectsMode(EffectsMode.enabled);
      await tester.pump();
      expect(AccessibilityScope.effectsEnabledOf(captured), isTrue);
      await viewModel.setEffectsMode(EffectsMode.disabled);
      await tester.pump();
      expect(AccessibilityScope.effectsEnabledOf(captured), isFalse);
    });

    testWidgets('effectsEnabledOf follows the system when not reduced',
        (tester) async {
      late BuildContext captured;
      await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      );
      expect(AccessibilityScope.effectsEnabledOf(captured), isTrue);
    });

    testWidgets('accessors assert without a scope', (tester) async {
      late BuildContext captured;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      );
      expect(AccessibilityScope.maybeOf(captured), isNull);
      expect(() => AccessibilityScope.of(captured), throwsAssertionError);
      expect(
        () => AccessibilityScope.settingsOf(captured),
        throwsAssertionError,
      );
    });
  });
}
```

- [ ] **Step 3: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/settings/widgets ; cd ../..
```

Expected: compilation error, the scope file does not exist.

- [ ] **Step 4: Write the scope**

`packages/flutter_accessibility/lib/src/ui/settings/widgets/accessibility_scope.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';

/// Exposes an [AccessibilitySettingsViewModel] to the widget tree.
///
/// Place it above the app's root widget. Widgets read the ViewModel with
/// [of] (to invoke commands) or the settings with [settingsOf] (to rebuild
/// on changes).
final class AccessibilityScope
    extends InheritedNotifier<AccessibilitySettingsViewModel> {
  /// Creates a scope providing [viewModel] to [child].
  const AccessibilityScope({
    required AccessibilitySettingsViewModel viewModel,
    required super.child,
    super.key,
  }) : super(notifier: viewModel);

  /// The ViewModel above [context], without registering a dependency.
  ///
  /// Use it to invoke commands. Asserts when no scope is found.
  static AccessibilitySettingsViewModel of(BuildContext context) {
    final viewModel = maybeOf(context);
    assert(viewModel != null, 'No AccessibilityScope found above this widget');
    return viewModel!;
  }

  /// The ViewModel above [context], or `null` when there is no scope.
  static AccessibilitySettingsViewModel? maybeOf(BuildContext context) =>
      context.getInheritedWidgetOfExactType<AccessibilityScope>()?.notifier;

  /// The current settings, registering a dependency so the caller rebuilds
  /// whenever they change. Asserts when no scope is found.
  static AccessibilitySettings settingsOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AccessibilityScope>();
    assert(scope != null, 'No AccessibilityScope found above this widget');
    return scope!.notifier!.settings;
  }

  /// Whether effects are enabled, resolving [EffectsMode.system] against the
  /// OS reduce-motion signal (`MediaQuery.disableAnimationsOf`).
  ///
  /// Registers dependencies on both the scope and the media query.
  static bool effectsEnabledOf(BuildContext context) =>
      settingsOf(context).effectsMode.resolve(
            systemReducesMotion: MediaQuery.disableAnimationsOf(context),
          );
}
```

- [ ] **Step 5: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean.

- [ ] **Step 6: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add AccessibilityScope and the scoped test helper"
```

---

### Task 4: AccessibilitySettingsBuilder and EffectsBuilder

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/settings/widgets/accessibility_settings_builder.dart`,
  `packages/flutter_accessibility/lib/src/ui/settings/widgets/effects_builder.dart`
- Test: `packages/flutter_accessibility/test/ui/settings/widgets/accessibility_settings_builder_test.dart`,
  `packages/flutter_accessibility/test/ui/settings/widgets/effects_builder_test.dart`

**Interfaces:**
- Produces: `AccessibilitySettingsBuilder({required builder, child, key})`
  with `builder: Widget Function(BuildContext, AccessibilitySettings, Widget?)`;
  `EffectsBuilder({required builder, child, key})` with
  `builder: Widget Function(BuildContext, {required bool effectsEnabled, Widget? child})`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/ui/settings/widgets/accessibility_settings_builder_test.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_settings_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  testWidgets('AccessibilitySettingsBuilder rebuilds with the settings',
      (tester) async {
    const passthrough = SizedBox(key: Key('child'));
    var builds = 0;
    final viewModel = await pumpScoped(
      tester,
      AccessibilitySettingsBuilder(
        builder: (context, settings, child) {
          builds++;
          return Column(
            children: [
              Text('scale ${settings.textSettings.textScaleFactor}'),
              child!,
            ],
          );
        },
        child: passthrough,
      ),
    );
    expect(find.text('scale 1.0'), findsOneWidget);
    expect(find.byKey(const Key('child')), findsOneWidget);
    await viewModel.setTextScaleFactor(2);
    await tester.pump();
    expect(find.text('scale 2.0'), findsOneWidget);
    expect(builds, 2);
  });
}
```

`packages/flutter_accessibility/test/ui/settings/widgets/effects_builder_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/effects_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  Widget subject() => EffectsBuilder(
        builder: (context, {required effectsEnabled, child}) => Column(
          children: [
            Text(effectsEnabled ? 'on' : 'off'),
            child!,
          ],
        ),
        child: const SizedBox(key: Key('child')),
      );

  testWidgets('EffectsBuilder follows the OS signal in system mode',
      (tester) async {
    await pumpScoped(tester, subject(), disableAnimations: true);
    expect(find.text('off'), findsOneWidget);
    expect(find.byKey(const Key('child')), findsOneWidget);
  });

  testWidgets('EffectsBuilder follows the explicit modes', (tester) async {
    final viewModel = await pumpScoped(
      tester,
      subject(),
      disableAnimations: true,
    );
    await viewModel.setEffectsMode(EffectsMode.enabled);
    await tester.pump();
    expect(find.text('on'), findsOneWidget);
    await viewModel.setEffectsMode(EffectsMode.disabled);
    await tester.pump();
    expect(find.text('off'), findsOneWidget);
  });

  testWidgets('EffectsBuilder is on by default without reduce motion',
      (tester) async {
    await pumpScoped(tester, subject());
    expect(find.text('on'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/settings/widgets ; cd ../..
```

Expected: compilation errors, the builder files do not exist.

- [ ] **Step 3: Write the builders**

`packages/flutter_accessibility/lib/src/ui/settings/widgets/accessibility_settings_builder.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Signature of the [AccessibilitySettingsBuilder] builder.
typedef AccessibilitySettingsWidgetBuilder = Widget Function(
  BuildContext context,
  AccessibilitySettings settings,
  Widget? child,
);

/// Rebuilds [builder] whenever the accessibility settings change.
///
/// [child] is passed through untouched, so a subtree that does not depend
/// on the settings is built once.
final class AccessibilitySettingsBuilder extends StatelessWidget {
  /// Creates a builder that reacts to settings changes.
  const AccessibilitySettingsBuilder({
    required this.builder,
    this.child,
    super.key,
  });

  /// Builds the subtree from the current settings.
  final AccessibilitySettingsWidgetBuilder builder;

  /// A settings-independent widget handed back to [builder].
  final Widget? child;

  @override
  Widget build(BuildContext context) =>
      builder(context, AccessibilityScope.settingsOf(context), child);
}
```

`packages/flutter_accessibility/lib/src/ui/settings/widgets/effects_builder.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Signature of the [EffectsBuilder] builder.
typedef EffectsWidgetBuilder = Widget Function(
  BuildContext context, {
  required bool effectsEnabled,
  Widget? child,
});

/// Rebuilds [builder] with whether effects and animations are enabled.
///
/// Resolves the effects mode against the OS reduce-motion signal, so a
/// change in the system settings rebuilds the subtree as well.
final class EffectsBuilder extends StatelessWidget {
  /// Creates a builder that reacts to the effects setting.
  const EffectsBuilder({required this.builder, this.child, super.key});

  /// Builds the subtree from the resolved effects flag.
  final EffectsWidgetBuilder builder;

  /// An effects-independent widget handed back to [builder].
  final Widget? child;

  @override
  Widget build(BuildContext context) => builder(
        context,
        effectsEnabled: AccessibilityScope.effectsEnabledOf(context),
        child: child,
      );
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add AccessibilitySettingsBuilder and EffectsBuilder"
```

---

### Task 5: Shared panel configuration and style

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/settings/accessibility_settings_configuration.dart`,
  `packages/flutter_accessibility/lib/src/ui/settings/accessibility_settings_style.dart`
- Test: `packages/flutter_accessibility/test/ui/settings/accessibility_settings_configuration_test.dart`

**Interfaces:**
- Produces: `enum AccessibilitySettingsStyle { standard, cards }`;
  `AccessibilitySettingsConfiguration` with the eighteen `show*` flags
  (default `true`), `Iterable<ColorSwatch<int>>? textColorCandidates`,
  `bool textColorAllowPickingShades = true`,
  `Iterable<ColorSwatch<int>>? backgroundColorCandidates`,
  `bool backgroundColorAllowPickingShades = true`,
  `FutureOr<void> Function()? onRestoreSettings`, value equality,
  `hashCode`, `toString`. A `null` candidate list means "the panel's own
  default palette".

- [ ] **Step 1: Write the failing test**

`packages/flutter_accessibility/test/ui/settings/accessibility_settings_configuration_test.dart`:

```dart
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/settings/accessibility_settings_configuration.dart';
import 'package:flutter_accessibility/src/ui/settings/accessibility_settings_style.dart';
import 'package:flutter_test/flutter_test.dart';

const _red = ColorSwatch<int>(0xFFFF0000, {500: Color(0xFFFF0000)});
const _blue = ColorSwatch<int>(0xFF0000FF, {500: Color(0xFF0000FF)});

void main() {
  group('AccessibilitySettingsConfiguration', () {
    test('defaults show everything and use the panel palette', () {
      const configuration = AccessibilitySettingsConfiguration();
      expect(configuration.showThemeSettingsGroup, isTrue);
      expect(configuration.showThemeProfileSeizureSafe, isTrue);
      expect(configuration.showThemeProfileVisionImpaired, isTrue);
      expect(configuration.showThemeProfileAdhdFriendly, isTrue);
      expect(configuration.showThemeModeSetting, isTrue);
      expect(configuration.showEffectsSetting, isTrue);
      expect(configuration.showColorSettingsGroup, isTrue);
      expect(configuration.showColorProfileSetting, isTrue);
      expect(configuration.showBackgroundColorSetting, isTrue);
      expect(configuration.showTextColorSetting, isTrue);
      expect(configuration.showTextSettingsGroup, isTrue);
      expect(configuration.showTextAlignSetting, isTrue);
      expect(configuration.showBoldSetting, isTrue);
      expect(configuration.showFontSetting, isTrue);
      expect(configuration.showLetterSpacingSetting, isTrue);
      expect(configuration.showLineHeightSetting, isTrue);
      expect(configuration.showTextScaleFactorSetting, isTrue);
      expect(configuration.showWordSpacingSetting, isTrue);
      expect(configuration.textColorCandidates, isNull);
      expect(configuration.textColorAllowPickingShades, isTrue);
      expect(configuration.backgroundColorCandidates, isNull);
      expect(configuration.backgroundColorAllowPickingShades, isTrue);
      expect(configuration.onRestoreSettings, isNull);
    });

    test('is a value type comparing candidate lists element-wise', () {
      const a = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: [_red, _blue],
      );
      const b = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: [_red, _blue],
      );
      const c = AccessibilitySettingsConfiguration(
        showFontSetting: false,
        textColorCandidates: [_blue, _red],
      );
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(c));
      expect(a, isNot(const AccessibilitySettingsConfiguration()));
      expect(a.toString(), contains('showFontSetting: false'));
    });

    test('keeps the restore callback', () async {
      var called = false;
      final configuration = AccessibilitySettingsConfiguration(
        onRestoreSettings: () => called = true,
      );
      await configuration.onRestoreSettings!();
      expect(called, isTrue);
    });
  });

  test('AccessibilitySettingsStyle has the two panel styles', () {
    expect(AccessibilitySettingsStyle.values, [
      AccessibilitySettingsStyle.standard,
      AccessibilitySettingsStyle.cards,
    ]);
  });
}
```

- [ ] **Step 2: Run the test to verify it fails**

```bash
cd packages/flutter_accessibility && flutter test test/ui/settings/accessibility_settings_configuration_test.dart ; cd ../..
```

Expected: compilation error, the files do not exist.

- [ ] **Step 3: Write the configuration and the style**

`packages/flutter_accessibility/lib/src/ui/settings/accessibility_settings_style.dart`:

```dart
/// The visual style of the accessibility settings panels.
///
/// Both styles share the same state and configuration; only the
/// presentation differs.
enum AccessibilitySettingsStyle {
  /// List tiles, switches and sliders.
  standard,

  /// Tappable cards with explicit state and stepper cards for ranges.
  cards,
}
```

`packages/flutter_accessibility/lib/src/ui/settings/accessibility_settings_configuration.dart`:

```dart
import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart' show immutable, listEquals;
import 'package:flutter/painting.dart' show ColorSwatch;

/// Which settings the panels show, and the colours they offer.
///
/// Shared by the Material and Cupertino panels. A `null` candidate list
/// means the panel uses its own default palette.
@immutable
final class AccessibilitySettingsConfiguration {
  /// Creates a configuration. Every setting is shown by default.
  const AccessibilitySettingsConfiguration({
    this.showThemeSettingsGroup = true,
    this.showThemeProfileSeizureSafe = true,
    this.showThemeProfileVisionImpaired = true,
    this.showThemeProfileAdhdFriendly = true,
    this.showThemeModeSetting = true,
    this.showEffectsSetting = true,
    this.showColorSettingsGroup = true,
    this.showColorProfileSetting = true,
    this.showBackgroundColorSetting = true,
    this.showTextColorSetting = true,
    this.showTextSettingsGroup = true,
    this.showTextAlignSetting = true,
    this.showBoldSetting = true,
    this.showFontSetting = true,
    this.showLetterSpacingSetting = true,
    this.showLineHeightSetting = true,
    this.showTextScaleFactorSetting = true,
    this.showWordSpacingSetting = true,
    this.textColorCandidates,
    this.textColorAllowPickingShades = true,
    this.backgroundColorCandidates,
    this.backgroundColorAllowPickingShades = true,
    this.onRestoreSettings,
  });

  /// Whether the theme group is shown at all.
  final bool showThemeSettingsGroup;

  /// Whether the seizure-safe preset is offered.
  final bool showThemeProfileSeizureSafe;

  /// Whether the vision-impaired preset is offered.
  final bool showThemeProfileVisionImpaired;

  /// Whether the ADHD-friendly preset is offered.
  final bool showThemeProfileAdhdFriendly;

  /// Whether the theme brightness setting is shown.
  final bool showThemeModeSetting;

  /// Whether the effects setting is shown.
  final bool showEffectsSetting;

  /// Whether the colour group is shown at all.
  final bool showColorSettingsGroup;

  /// Whether the colour profile setting is shown.
  final bool showColorProfileSetting;

  /// Whether the page background colour setting is shown.
  final bool showBackgroundColorSetting;

  /// Whether the text colour setting is shown.
  final bool showTextColorSetting;

  /// Whether the text group is shown at all.
  final bool showTextSettingsGroup;

  /// Whether the text alignment setting is shown.
  final bool showTextAlignSetting;

  /// Whether the bold text setting is shown.
  final bool showBoldSetting;

  /// Whether the accessible font setting is shown (it also requires at
  /// least one registered font).
  final bool showFontSetting;

  /// Whether the letter spacing setting is shown.
  final bool showLetterSpacingSetting;

  /// Whether the line height setting is shown.
  final bool showLineHeightSetting;

  /// Whether the text scale factor setting is shown.
  final bool showTextScaleFactorSetting;

  /// Whether the word spacing setting is shown.
  final bool showWordSpacingSetting;

  /// The swatches offered for the text colour, or `null` for the panel's
  /// default palette.
  final Iterable<ColorSwatch<int>>? textColorCandidates;

  /// Whether the text colour picker lets the user pick shades.
  final bool textColorAllowPickingShades;

  /// The swatches offered for the background colour, or `null` for the
  /// panel's default palette.
  final Iterable<ColorSwatch<int>>? backgroundColorCandidates;

  /// Whether the background colour picker lets the user pick shades.
  final bool backgroundColorAllowPickingShades;

  /// Called after the user restores the default settings, for example to
  /// show a confirmation.
  final FutureOr<void> Function()? onRestoreSettings;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessibilitySettingsConfiguration &&
          other.showThemeSettingsGroup == showThemeSettingsGroup &&
          other.showThemeProfileSeizureSafe == showThemeProfileSeizureSafe &&
          other.showThemeProfileVisionImpaired ==
              showThemeProfileVisionImpaired &&
          other.showThemeProfileAdhdFriendly == showThemeProfileAdhdFriendly &&
          other.showThemeModeSetting == showThemeModeSetting &&
          other.showEffectsSetting == showEffectsSetting &&
          other.showColorSettingsGroup == showColorSettingsGroup &&
          other.showColorProfileSetting == showColorProfileSetting &&
          other.showBackgroundColorSetting == showBackgroundColorSetting &&
          other.showTextColorSetting == showTextColorSetting &&
          other.showTextSettingsGroup == showTextSettingsGroup &&
          other.showTextAlignSetting == showTextAlignSetting &&
          other.showBoldSetting == showBoldSetting &&
          other.showFontSetting == showFontSetting &&
          other.showLetterSpacingSetting == showLetterSpacingSetting &&
          other.showLineHeightSetting == showLineHeightSetting &&
          other.showTextScaleFactorSetting == showTextScaleFactorSetting &&
          other.showWordSpacingSetting == showWordSpacingSetting &&
          other.textColorAllowPickingShades == textColorAllowPickingShades &&
          other.backgroundColorAllowPickingShades ==
              backgroundColorAllowPickingShades &&
          listEquals(
            other.textColorCandidates?.toList(),
            textColorCandidates?.toList(),
          ) &&
          listEquals(
            other.backgroundColorCandidates?.toList(),
            backgroundColorCandidates?.toList(),
          ) &&
          other.onRestoreSettings == onRestoreSettings;

  @override
  int get hashCode => Object.hashAll([
        showThemeSettingsGroup,
        showThemeProfileSeizureSafe,
        showThemeProfileVisionImpaired,
        showThemeProfileAdhdFriendly,
        showThemeModeSetting,
        showEffectsSetting,
        showColorSettingsGroup,
        showColorProfileSetting,
        showBackgroundColorSetting,
        showTextColorSetting,
        showTextSettingsGroup,
        showTextAlignSetting,
        showBoldSetting,
        showFontSetting,
        showLetterSpacingSetting,
        showLineHeightSetting,
        showTextScaleFactorSetting,
        showWordSpacingSetting,
        textColorAllowPickingShades,
        backgroundColorAllowPickingShades,
        Object.hashAll(textColorCandidates ?? const []),
        Object.hashAll(backgroundColorCandidates ?? const []),
        onRestoreSettings,
      ]);

  @override
  String toString() => 'AccessibilitySettingsConfiguration('
      'showThemeSettingsGroup: $showThemeSettingsGroup, '
      'showThemeProfileSeizureSafe: $showThemeProfileSeizureSafe, '
      'showThemeProfileVisionImpaired: $showThemeProfileVisionImpaired, '
      'showThemeProfileAdhdFriendly: $showThemeProfileAdhdFriendly, '
      'showThemeModeSetting: $showThemeModeSetting, '
      'showEffectsSetting: $showEffectsSetting, '
      'showColorSettingsGroup: $showColorSettingsGroup, '
      'showColorProfileSetting: $showColorProfileSetting, '
      'showBackgroundColorSetting: $showBackgroundColorSetting, '
      'showTextColorSetting: $showTextColorSetting, '
      'showTextSettingsGroup: $showTextSettingsGroup, '
      'showTextAlignSetting: $showTextAlignSetting, '
      'showBoldSetting: $showBoldSetting, '
      'showFontSetting: $showFontSetting, '
      'showLetterSpacingSetting: $showLetterSpacingSetting, '
      'showLineHeightSetting: $showLineHeightSetting, '
      'showTextScaleFactorSetting: $showTextScaleFactorSetting, '
      'showWordSpacingSetting: $showWordSpacingSetting, '
      'textColorCandidates: $textColorCandidates, '
      'textColorAllowPickingShades: $textColorAllowPickingShades, '
      'backgroundColorCandidates: $backgroundColorCandidates, '
      'backgroundColorAllowPickingShades: '
      '$backgroundColorAllowPickingShades)';
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add the shared settings panel configuration and style"
```

---

### Task 6: Text style, alignment, orientation and colour helpers

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/core/accessible_text_style.dart`,
  `packages/flutter_accessibility/lib/src/ui/core/text_align_mode_mapping.dart`,
  `packages/flutter_accessibility/lib/src/ui/core/orientation.dart`,
  `packages/flutter_accessibility/lib/src/ui/core/accessible_color.dart`
- Test: `packages/flutter_accessibility/test/ui/core/accessible_text_style_test.dart`,
  `packages/flutter_accessibility/test/ui/core/text_align_mode_mapping_test.dart`,
  `packages/flutter_accessibility/test/ui/core/orientation_test.dart`,
  `packages/flutter_accessibility/test/ui/core/accessible_color_test.dart`

**Interfaces:**
- Produces (public): `extension AccessibleTextStyle on TextStyle { TextStyle applyTextSettings(TextSettings settings, {AccessibleFont? font}) }`;
  `extension AccessibleColor on Color { Color withColorProfile(ColorProfile profile) }`.
- Produces (internal): `extension TextAlignModeMapping on TextAlignMode { TextAlign? toTextAlign() }`;
  `Orientation orientationOf(BuildContext context)`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/ui/core/accessible_text_style_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_test/flutter_test.dart';

const base = TextStyle(
  fontSize: 14,
  fontFamily: 'Roboto',
  fontFamilyFallback: ['Arial'],
  color: Color(0xFF000000),
);
const andika = AccessibleFont(family: 'Andika', package: 'font_andika');

void main() {
  group('applyTextSettings', () {
    test('returns the same style for default settings', () {
      expect(
        identical(base.applyTextSettings(TextSettings.defaults), base),
        isTrue,
      );
    });

    test('scales the font size and applies spacing, weight and colour', () {
      final styled = base.applyTextSettings(
        const TextSettings(
          textScaleFactor: 1.5,
          lineHeight: 2,
          letterSpacing: 0.5,
          wordSpacing: 3,
          isBold: true,
          color: 0xFF112233,
        ),
      );
      expect(styled.fontSize, 21);
      expect(styled.height, 2);
      expect(styled.letterSpacing, 0.5);
      expect(styled.wordSpacing, 3);
      expect(styled.fontWeight, FontWeight.bold);
      expect(styled.color, const Color(0xFF112233));
      expect(styled.fontFamily, 'Roboto');
      expect(styled.fontFamilyFallback, ['Arial']);
    });

    test('keeps a null font size and unset fields', () {
      const sizeless = TextStyle(color: Color(0xFF000000));
      final styled = sizeless.applyTextSettings(
        const TextSettings(textScaleFactor: 2),
      );
      expect(styled.fontSize, isNull);
      expect(styled.height, isNull);
      expect(styled.fontWeight, isNull);
      expect(styled.color, const Color(0xFF000000));
    });

    test('uses the registered font and keeps the app font as fallback', () {
      final styled = base.applyTextSettings(
        const TextSettings(fontFamily: 'Andika'),
        font: andika,
      );
      expect(styled.fontFamily, 'packages/font_andika/Andika');
      expect(styled.fontFamilyFallback, ['Roboto', 'Arial']);
    });

    test('uses the raw family when it is not a registered font', () {
      final styled = base.applyTextSettings(
        const TextSettings(fontFamily: 'OpenDyslexic'),
      );
      expect(styled.fontFamily, 'OpenDyslexic');
      expect(styled.fontFamilyFallback, ['Roboto', 'Arial']);
    });

    test('ignores a registered font that does not match the selection', () {
      final styled = base.applyTextSettings(
        const TextSettings(fontFamily: 'OpenDyslexic'),
        font: andika,
      );
      expect(styled.fontFamily, 'OpenDyslexic');
    });

    test('a style without a family gets no fallback chain', () {
      const bare = TextStyle(fontSize: 10);
      final styled = bare.applyTextSettings(
        const TextSettings(fontFamily: 'Andika'),
        font: andika,
      );
      expect(styled.fontFamily, 'packages/font_andika/Andika');
      expect(styled.fontFamilyFallback, isNull);
    });
  });
}
```

`packages/flutter_accessibility/test/ui/core/text_align_mode_mapping_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/text_align_mode_mapping.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TextAlignMode maps to TextAlign, none to null', () {
    expect(TextAlignMode.none.toTextAlign(), isNull);
    expect(TextAlignMode.start.toTextAlign(), TextAlign.start);
    expect(TextAlignMode.end.toTextAlign(), TextAlign.end);
    expect(TextAlignMode.left.toTextAlign(), TextAlign.left);
    expect(TextAlignMode.right.toTextAlign(), TextAlign.right);
    expect(TextAlignMode.center.toTextAlign(), TextAlign.center);
    expect(TextAlignMode.justify.toTextAlign(), TextAlign.justify);
  });
}
```

`packages/flutter_accessibility/test/ui/core/orientation_test.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<Orientation> orientationFor(WidgetTester tester, Size size) async {
    late Orientation seen;
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: size),
        child: Builder(
          builder: (context) {
            seen = orientationOf(context);
            return const SizedBox();
          },
        ),
      ),
    );
    return seen;
  }

  testWidgets('orientationOf derives the orientation from the size',
      (tester) async {
    expect(
      await orientationFor(tester, const Size(400, 800)),
      Orientation.portrait,
    );
    expect(
      await orientationFor(tester, const Size(800, 400)),
      Orientation.landscape,
    );
    expect(
      await orientationFor(tester, const Size(500, 500)),
      Orientation.portrait,
    );
  });
}
```

`packages/flutter_accessibility/test/ui/core/accessible_color_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_color.dart';
import 'package:flutter_test/flutter_test.dart';

const red = Color(0xFFFF0000);

void main() {
  group('withColorProfile', () {
    test('normal reproduces the 1.x arithmetic: lightness factor 0', () {
      // ColorProfile.normal carries lightnessFactor 0 from 1.x, so applying
      // it turns any colour black; theme layers never apply `normal`.
      expect(red.withColorProfile(ColorProfile.normal), const Color(0xFF000000));
    });

    test('lowSaturation halves the saturation', () {
      final hsl = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.lowSaturation),
      );
      expect(hsl.saturation, closeTo(0.5, 0.01));
      expect(hsl.lightness, closeTo(0.5, 0.01));
    });

    test('highSaturation clamps the saturation to 1', () {
      final source = HSLColor.fromColor(red).withSaturation(0.4).toColor();
      final hsl = HSLColor.fromColor(
        source.withColorProfile(ColorProfile.highSaturation),
      );
      expect(hsl.saturation, closeTo(0.8, 0.02));
      final clamped = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.highSaturation),
      );
      expect(clamped.saturation, closeTo(1, 0.01));
    });

    test('monochrome removes the saturation', () {
      final hsl = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.monochrome),
      );
      expect(hsl.saturation, closeTo(0, 0.01));
    });

    test('highContrast halves the lightness', () {
      final hsl = HSLColor.fromColor(
        red.withColorProfile(ColorProfile.highContrast),
      );
      expect(hsl.lightness, closeTo(0.25, 0.01));
      expect(hsl.saturation, closeTo(1, 0.01));
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/core ; cd ../..
```

Expected: compilation errors, the four files do not exist.

- [ ] **Step 3: Write the helpers**

`packages/flutter_accessibility/lib/src/ui/core/accessible_text_style.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';

/// Applies [TextSettings] to a [TextStyle].
extension AccessibleTextStyle on TextStyle {
  /// Returns this style with [settings] applied.
  ///
  /// The font size is multiplied by the scale factor when it is set; line
  /// height, spacing, weight and colour override the style only when the
  /// setting is set. When a font family is selected, [font] (the registered
  /// font matching it) provides the qualified family and the style's own
  /// family and fallbacks become the fallback chain, so scripts the
  /// accessible font does not cover keep rendering. Default settings return
  /// this instance unchanged.
  TextStyle applyTextSettings(TextSettings settings, {AccessibleFont? font}) {
    if (settings.isDefault) {
      return this;
    }
    final selectedFamily = settings.fontFamily;
    final matchingFont =
        font != null && font.family == selectedFamily ? font : null;
    final family = selectedFamily == null
        ? null
        : matchingFont?.qualifiedFamily ?? selectedFamily;
    final fallback = <String>[
      if (fontFamily != null) fontFamily!,
      ...?fontFamilyFallback,
    ];
    final size = fontSize;
    return copyWith(
      fontSize: size == null ? null : size * settings.textScaleFactor,
      height: settings.lineHeight,
      letterSpacing: settings.letterSpacing,
      wordSpacing: settings.wordSpacing,
      fontWeight: settings.isBold ? FontWeight.bold : null,
      color: settings.color == null ? null : Color(settings.color!),
      fontFamily: family,
      fontFamilyFallback:
          family != null && fallback.isNotEmpty ? fallback : null,
    );
  }
}
```

`packages/flutter_accessibility/lib/src/ui/core/text_align_mode_mapping.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/painting.dart';

/// Maps the core alignment setting to Flutter's [TextAlign].
extension TextAlignModeMapping on TextAlignMode {
  /// The [TextAlign] for this mode, or `null` for [TextAlignMode.none].
  TextAlign? toTextAlign() => switch (this) {
        TextAlignMode.none => null,
        TextAlignMode.start => TextAlign.start,
        TextAlignMode.end => TextAlign.end,
        TextAlignMode.left => TextAlign.left,
        TextAlignMode.right => TextAlign.right,
        TextAlignMode.center => TextAlign.center,
        TextAlignMode.justify => TextAlign.justify,
      };
}
```

`packages/flutter_accessibility/lib/src/ui/core/orientation.dart`:

```dart
import 'package:flutter/widgets.dart';

/// The orientation derived from the media query size: landscape when the
/// width exceeds the height, portrait otherwise.
///
/// Unlike `MediaQuery.orientationOf`, this follows the actual window shape,
/// which matters on foldables and desktop windows.
Orientation orientationOf(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  return size.width > size.height ? Orientation.landscape : Orientation.portrait;
}
```

`packages/flutter_accessibility/lib/src/ui/core/accessible_color.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/painting.dart';

/// Applies a [ColorProfile] to a [Color].
extension AccessibleColor on Color {
  /// Returns this colour with the profile's saturation multiplier and
  /// lightness factor applied in HSL space; a `null` factor keeps the
  /// component unchanged.
  Color withColorProfile(ColorProfile profile) {
    var hsl = HSLColor.fromColor(this);
    final saturationMultiplier = profile.saturationMultiplier;
    if (saturationMultiplier != null) {
      hsl = hsl.withSaturation(
        clampDouble(hsl.saturation * saturationMultiplier, 0, 1),
      );
    }
    final lightnessFactor = profile.lightnessFactor;
    if (lightnessFactor != null) {
      hsl = hsl.withLightness(
        clampDouble(hsl.lightness * lightnessFactor, 0, 1),
      );
    }
    return hsl.toColor();
  }
}
```

Note: `ColorProfile.normal` carries `lightnessFactor: 0` from 1.x, which
turns any colour black. This reproduces the 1.x `_adjustColor` arithmetic
exactly and is asserted by the test; the theme layers of plans 4 and 5 only
apply a profile when it is not `normal`, as 1.x did. Record this in the
report so the plan 4 implementer sees it.

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add the text style, alignment, orientation and colour helpers"
```

---

### Task 7: AccessibleText

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/text/widgets/accessible_text.dart`
- Test: `packages/flutter_accessibility/test/ui/text/widgets/accessible_text_test.dart`

**Interfaces:**
- Consumes: `AccessibilityScope.of` / `settingsOf`, `applyTextSettings`,
  `toTextAlign`.
- Produces: `AccessibleText(String data, {textColor, style, strutStyle, textAlign, textDirection, softWrap, overflow, maxLines, semanticsLabel, locale, textScaler, textWidthBasis, textHeightBehavior, selectionColor, semanticsIdentifier, key})`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/ui/text/widgets/accessible_text_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/accessible_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

const andika = AccessibleFont(family: 'Andika', package: 'font_andika');

Text rendered(WidgetTester tester) => tester.widget<Text>(find.byType(Text));

void main() {
  group('AccessibleText', () {
    testWidgets('renders the default text style when settings are default',
        (tester) async {
      await pumpScoped(tester, const AccessibleText('hello'));
      final text = rendered(tester);
      expect(text.data, 'hello');
      expect(text.style?.fontSize, 14);
      expect(text.style?.color, const Color(0xFF000000));
      expect(text.textAlign, isNull);
    });

    testWidgets('merges the given style over the default one',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello', style: TextStyle(fontSize: 20)),
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 20);
      expect(text.style?.color, const Color(0xFF000000));
    });

    testWidgets('applies the text settings and the registered font',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello'),
        initial: const AccessibilitySettings(
          textSettings: TextSettings(
            textScaleFactor: 2,
            isBold: true,
            letterSpacing: 1,
            color: 0xFF112233,
            fontFamily: 'Andika',
            textAlign: TextAlignMode.center,
          ),
        ),
        fonts: const [andika],
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 28);
      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.letterSpacing, 1);
      expect(text.style?.color, const Color(0xFF112233));
      expect(text.style?.fontFamily, 'packages/font_andika/Andika');
      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('textColor wins over the settings colour', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello', textColor: Color(0xFFABCDEF)),
        initial: const AccessibilitySettings(
          textSettings: TextSettings(color: 0xFF112233),
        ),
      );
      expect(rendered(tester).style?.color, const Color(0xFFABCDEF));
    });

    testWidgets('the settings alignment wins over the widget alignment',
        (tester) async {
      final viewModel = await pumpScoped(
        tester,
        const AccessibleText('hello', textAlign: TextAlign.right),
      );
      expect(rendered(tester).textAlign, TextAlign.right);
      await viewModel.setTextAlign(TextAlignMode.justify);
      await tester.pump();
      expect(rendered(tester).textAlign, TextAlign.justify);
    });

    testWidgets('forwards the remaining Text parameters', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText(
          'hello',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          semanticsLabel: 'greeting',
          semanticsIdentifier: 'id',
          textDirection: TextDirection.rtl,
          textWidthBasis: TextWidthBasis.longestLine,
          selectionColor: Color(0xFF00FF00),
        ),
      );
      final text = rendered(tester);
      expect(text.maxLines, 2);
      expect(text.overflow, TextOverflow.ellipsis);
      expect(text.softWrap, isFalse);
      expect(text.semanticsLabel, 'greeting');
      expect(text.semanticsIdentifier, 'id');
      expect(text.textDirection, TextDirection.rtl);
      expect(text.textWidthBasis, TextWidthBasis.longestLine);
      expect(text.selectionColor, const Color(0xFF00FF00));
    });

    testWidgets('rebuilds when the settings change', (tester) async {
      final viewModel = await pumpScoped(tester, const AccessibleText('hi'));
      await viewModel.setTextScaleFactor(1.5);
      await tester.pump();
      expect(rendered(tester).style?.fontSize, 21);
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/text ; cd ../..
```

Expected: compilation error, the widget file does not exist.

- [ ] **Step 3: Write the widget**

`packages/flutter_accessibility/lib/src/ui/text/widgets/accessible_text.dart`:

```dart
import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_accessibility/src/ui/core/text_align_mode_mapping.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// A [Text] that follows the accessibility text settings.
///
/// The effective style is the ambient [DefaultTextStyle] merged with [style],
/// with the text settings applied on top (scale, spacing, weight, font and
/// colour); [textColor] then overrides the colour. The settings alignment,
/// when set, overrides [textAlign]. Works without any design-system theme.
final class AccessibleText extends StatelessWidget {
  /// Creates an accessible text.
  const AccessibleText(
    this.data, {
    this.textColor,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.locale,
    this.textScaler,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.semanticsIdentifier,
    super.key,
  });

  /// The text to display.
  final String data;

  /// A colour that overrides both the style and the settings colour.
  final Color? textColor;

  /// The style merged over the ambient [DefaultTextStyle].
  final TextStyle? style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// The alignment used when the settings do not override it.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow is handled.
  final TextOverflow? overflow;

  /// The maximum number of lines.
  final int? maxLines;

  /// {@macro flutter.widgets.Text.semanticsLabel}
  final String? semanticsLabel;

  /// The locale used to select a font for the same Unicode character.
  final Locale? locale;

  /// {@macro flutter.painting.textPainter.textScaler}
  final TextScaler? textScaler;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// The colour used when painting the selection.
  final Color? selectionColor;

  /// A unique identifier for the semantics node of this widget.
  final String? semanticsIdentifier;

  @override
  Widget build(BuildContext context) {
    final settings = AccessibilityScope.settingsOf(context).textSettings;
    final font = AccessibilityScope.of(context).activeFont;
    var effectiveStyle = DefaultTextStyle.of(context)
        .style
        .merge(style)
        .applyTextSettings(settings, font: font);
    if (textColor != null) {
      effectiveStyle = effectiveStyle.copyWith(color: textColor);
    }
    return Text(
      data,
      style: effectiveStyle,
      textAlign: settings.textAlign.toTextAlign() ?? textAlign,
      strutStyle: strutStyle,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      locale: locale,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      semanticsIdentifier: semanticsIdentifier,
    );
  }
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add AccessibleText applying the text settings without a theme"
```

---

### Task 8: AccessibleWidgetBuilder, AccessibleSizedBox and AccessibleHeight

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/layout/accessible_height.dart`,
  `packages/flutter_accessibility/lib/src/ui/layout/widgets/accessible_widget_builder.dart`,
  `packages/flutter_accessibility/lib/src/ui/layout/widgets/accessible_sized_box.dart`
- Test: `packages/flutter_accessibility/test/ui/layout/accessible_height_test.dart`,
  `packages/flutter_accessibility/test/ui/layout/widgets/accessible_widget_builder_test.dart`,
  `packages/flutter_accessibility/test/ui/layout/widgets/accessible_sized_box_test.dart`

**Interfaces:**
- Produces: `extension AccessibleHeight on double { double makeHeightAccessible(BuildContext context, {double extraPortraitMultiplier = 1, double extraLandscapeMultiplier = 1}) }`;
  `AccessibleWidgetBuilder({required child, accessibleChild, showAccessibleChildOnlyOnLandscape = false, key})`;
  `AccessibleSizedBox.fromHeight({required height, heightInLandscape, child, width, extraHeightPortraitMultiplier, extraHeightLandscapeMultiplier, key})`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/ui/layout/accessible_height_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/layout/accessible_height.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_scoped.dart';

Future<double> heightFor(
  WidgetTester tester, {
  required AccessibilitySettings settings,
  Size size = const Size(400, 800),
  double portrait = 1,
  double landscape = 1,
}) async {
  late double seen;
  await pumpScoped(
    tester,
    Builder(
      builder: (context) {
        seen = 100.0.makeHeightAccessible(
          context,
          extraPortraitMultiplier: portrait,
          extraLandscapeMultiplier: landscape,
        );
        return const SizedBox();
      },
    ),
    initial: settings,
    size: size,
  );
  return seen;
}

void main() {
  group('makeHeightAccessible', () {
    testWidgets('keeps the height for default settings', (tester) async {
      expect(
        await heightFor(tester, settings: AccessibilitySettings.defaults),
        100,
      );
    });

    testWidgets('grows with the scale factor above 1', (tester) async {
      expect(
        await heightFor(
          tester,
          settings: const AccessibilitySettings(
            textSettings: TextSettings(textScaleFactor: 2),
          ),
        ),
        closeTo(190, 0.001),
      );
    });

    testWidgets('grows with a line height above 1.5', (tester) async {
      expect(
        await heightFor(
          tester,
          settings: const AccessibilitySettings(
            textSettings: TextSettings(lineHeight: 2),
          ),
        ),
        closeTo(110, 0.001),
      );
    });

    testWidgets('applies the orientation multiplier only when scaled',
        (tester) async {
      expect(
        await heightFor(
          tester,
          settings: AccessibilitySettings.defaults,
          portrait: 2,
          landscape: 3,
        ),
        100,
      );
      const scaled = AccessibilitySettings(
        textSettings: TextSettings(textScaleFactor: 2),
      );
      expect(
        await heightFor(tester, settings: scaled, portrait: 2, landscape: 3),
        closeTo(380, 0.001),
      );
      expect(
        await heightFor(
          tester,
          settings: scaled,
          size: const Size(800, 400),
          portrait: 2,
          landscape: 3,
        ),
        closeTo(570, 0.001),
      );
    });

    testWidgets('rejects non-positive multipliers', (tester) async {
      await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            100.0.makeHeightAccessible(context, extraPortraitMultiplier: 0);
            return const SizedBox();
          },
        ),
      );
      expect(tester.takeException(), isAssertionError);
    });
  });
}
```

`packages/flutter_accessibility/test/ui/layout/widgets/accessible_widget_builder_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/layout/widgets/accessible_widget_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

const plain = SizedBox(key: Key('plain'));
const accessible = SizedBox(key: Key('accessible'));
const scaled = AccessibilitySettings(
  textSettings: TextSettings(textScaleFactor: 2),
);

void main() {
  group('AccessibleWidgetBuilder', () {
    testWidgets('shows the child with default settings', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          child: plain,
        ),
      );
      expect(find.byKey(const Key('plain')), findsOneWidget);
    });

    testWidgets('shows the accessible child when text settings are set',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          child: plain,
        ),
        initial: scaled,
      );
      expect(find.byKey(const Key('accessible')), findsOneWidget);
    });

    testWidgets('falls back to the child without an accessible child',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(child: plain),
        initial: scaled,
      );
      expect(find.byKey(const Key('plain')), findsOneWidget);
    });

    testWidgets('landscape-only shows the accessible child in landscape only',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          showAccessibleChildOnlyOnLandscape: true,
          child: plain,
        ),
        initial: scaled,
      );
      expect(find.byKey(const Key('plain')), findsOneWidget);
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          showAccessibleChildOnlyOnLandscape: true,
          child: plain,
        ),
        initial: scaled,
        size: const Size(800, 400),
      );
      expect(find.byKey(const Key('accessible')), findsOneWidget);
    });
  });
}
```

`packages/flutter_accessibility/test/ui/layout/widgets/accessible_sized_box_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/layout/widgets/accessible_sized_box.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

SizedBox box(WidgetTester tester) => tester.widget<SizedBox>(
      find
          .descendant(
            of: find.byType(AccessibleSizedBox),
            matching: find.byType(SizedBox),
          )
          .first,
    );

void main() {
  group('AccessibleSizedBox', () {
    testWidgets('uses the height and width as given by default',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(
          height: 50,
          width: 30,
          child: SizedBox(key: Key('child')),
        ),
      );
      expect(box(tester).height, 50);
      expect(box(tester).width, 30);
      expect(find.byKey(const Key('child')), findsOneWidget);
    });

    testWidgets('scales the height with the settings and rebuilds',
        (tester) async {
      final viewModel = await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(height: 50),
      );
      await viewModel.setTextScaleFactor(2);
      await tester.pump();
      expect(box(tester).height, closeTo(95, 0.001));
    });

    testWidgets('uses the landscape height in landscape', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(height: 50, heightInLandscape: 20),
        size: const Size(800, 400),
      );
      expect(box(tester).height, 20);
    });

    testWidgets('applies the extra multipliers when settings are active',
        (tester) async {
      await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(
          height: 50,
          extraHeightPortraitMultiplier: 2,
          extraHeightLandscapeMultiplier: 3,
        ),
        initial: const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      expect(box(tester).height, closeTo(190, 0.001));
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/layout ; cd ../..
```

Expected: compilation errors, the three files do not exist.

- [ ] **Step 3: Write the extension and the widgets**

`packages/flutter_accessibility/lib/src/ui/layout/accessible_height.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Weight of the text scale factor in the height computation.
const _textScaleFactorWeight = 0.9;

/// Weight of the line height in the height computation.
const _lineHeightWeight = 0.1;

/// Height computations that follow the accessibility text settings.
extension AccessibleHeight on double {
  /// Returns this height adjusted for the text scale factor and line height.
  ///
  /// The multipliers grow with the scale factor above 1 and the line height
  /// above 1.5. When either applies, the height is also multiplied by
  /// [extraPortraitMultiplier] or [extraLandscapeMultiplier] depending on the
  /// window shape, for widgets whose fixed height must leave extra room.
  /// Registers a dependency on the settings and the media query.
  double makeHeightAccessible(
    BuildContext context, {
    double extraPortraitMultiplier = 1,
    double extraLandscapeMultiplier = 1,
  }) {
    assert(
      extraPortraitMultiplier > 0 && extraLandscapeMultiplier > 0,
      'All extra multipliers must be greater than 0',
    );
    final textSettings = AccessibilityScope.settingsOf(context).textSettings;
    final textScaleFactor = textSettings.textScaleFactor;
    final lineHeight = textSettings.lineHeight;
    final size = MediaQuery.sizeOf(context);
    final textScaleMultiplier = textScaleFactor <= 1
        ? 1.0
        : textScaleFactor - (1 - _textScaleFactorWeight);
    final lineHeightMultiplier = lineHeight == null || lineHeight <= 1.5
        ? 1.0
        : lineHeight - (1 - _lineHeightWeight);
    final extraMultiplier =
        textScaleMultiplier == 1 && lineHeightMultiplier == 1
            ? 1.0
            : size.height > size.width
                ? extraPortraitMultiplier
                : extraLandscapeMultiplier;
    return this * textScaleMultiplier * lineHeightMultiplier * extraMultiplier;
  }
}
```

`packages/flutter_accessibility/lib/src/ui/layout/widgets/accessible_widget_builder.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

/// Shows [accessibleChild] instead of [child] when text settings are active.
final class AccessibleWidgetBuilder extends StatelessWidget {
  /// Creates the builder.
  const AccessibleWidgetBuilder({
    required this.child,
    this.accessibleChild,
    this.showAccessibleChildOnlyOnLandscape = false,
    super.key,
  });

  /// The widget shown when the text settings are the defaults.
  final Widget child;

  /// The widget shown when any text setting is active; `null` shows [child].
  final Widget? accessibleChild;

  /// Whether [accessibleChild] is shown only in landscape.
  final bool showAccessibleChildOnlyOnLandscape;

  @override
  Widget build(BuildContext context) {
    final textSettings = AccessibilityScope.settingsOf(context).textSettings;
    if (textSettings.isDefault) {
      return child;
    }
    if (showAccessibleChildOnlyOnLandscape &&
        orientationOf(context) == Orientation.portrait) {
      return child;
    }
    return accessibleChild ?? child;
  }
}
```

`packages/flutter_accessibility/lib/src/ui/layout/widgets/accessible_sized_box.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_accessibility/src/ui/layout/accessible_height.dart';

/// A [SizedBox] whose height follows the accessibility text settings.
final class AccessibleSizedBox extends StatelessWidget {
  /// Creates a box of [height] (or [heightInLandscape] in landscape) that
  /// grows with the text settings, see [AccessibleHeight].
  const AccessibleSizedBox.fromHeight({
    required this.height,
    this.heightInLandscape,
    this.child,
    this.width,
    double? extraHeightPortraitMultiplier,
    double? extraHeightLandscapeMultiplier,
    super.key,
  })  : extraHeightPortraitMultiplier = extraHeightPortraitMultiplier ?? 1,
        extraHeightLandscapeMultiplier = extraHeightLandscapeMultiplier ?? 1;

  /// The child of the box.
  final Widget? child;

  /// The width of the box.
  final double? width;

  /// The height before the accessibility adjustment.
  final double height;

  /// The height used in landscape, or `null` to use [height].
  final double? heightInLandscape;

  /// The extra multiplier applied in portrait when settings are active.
  final double extraHeightPortraitMultiplier;

  /// The extra multiplier applied in landscape when settings are active.
  final double extraHeightLandscapeMultiplier;

  @override
  Widget build(BuildContext context) {
    final landscapeHeight = heightInLandscape;
    final baseHeight =
        landscapeHeight != null && orientationOf(context) == Orientation.landscape
            ? landscapeHeight
            : height;
    return SizedBox(
      width: width,
      height: baseHeight.makeHeightAccessible(
        context,
        extraPortraitMultiplier: extraHeightPortraitMultiplier,
        extraLandscapeMultiplier: extraHeightLandscapeMultiplier,
      ),
      child: child,
    );
  }
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add AccessibleWidgetBuilder, AccessibleSizedBox and AccessibleHeight"
```

---

### Task 9: TextRawMagnifier

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/text/widgets/text_raw_magnifier.dart`
- Test: `packages/flutter_accessibility/test/ui/text/widgets/text_raw_magnifier_test.dart`

**Interfaces:**
- Produces: `TextRawMagnifier({required child, borderColor, size = Size(200, 100), magnificationScale = 1.5, key})`.

- [ ] **Step 1: Write the failing test**

`packages/flutter_accessibility/test/ui/text/widgets/text_raw_magnifier_test.dart`:

```dart
import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/text_raw_magnifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  testWidgets('TextRawMagnifier shows a magnifier while long-pressing',
      (tester) async {
    await pumpScoped(
      tester,
      const Center(
        child: TextRawMagnifier(
          borderColor: Color(0xFFFF0000),
          child: Text('magnify me'),
        ),
      ),
    );
    expect(find.byType(RawMagnifier), findsNothing);
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('magnify me')),
    );
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    expect(find.byType(RawMagnifier), findsOneWidget);
    final before = tester.getTopLeft(find.byType(RawMagnifier));
    await gesture.moveBy(const Offset(20, 10));
    await tester.pump();
    final after = tester.getTopLeft(find.byType(RawMagnifier));
    expect(after.dx, closeTo(before.dx + 20, 0.5));
    expect(after.dy, closeTo(before.dy + 10, 0.5));
    await gesture.up();
    await tester.pump();
    expect(find.byType(RawMagnifier), findsNothing);
  });

  testWidgets('TextRawMagnifier uses the default text colour as border',
      (tester) async {
    await pumpScoped(
      tester,
      const Center(child: TextRawMagnifier(child: Text('magnify me'))),
    );
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('magnify me')),
    );
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    final magnifier = tester.widget<RawMagnifier>(find.byType(RawMagnifier));
    final shape = magnifier.decoration.shape as RoundedRectangleBorder;
    expect(shape.side.color, const Color(0xFF000000));
    await gesture.up();
    await tester.pump();
  });
}
```

- [ ] **Step 2: Run the test to verify it fails**

```bash
cd packages/flutter_accessibility && flutter test test/ui/text/widgets/text_raw_magnifier_test.dart ; cd ../..
```

Expected: compilation error, the widget file does not exist.

- [ ] **Step 3: Write the widget**

`packages/flutter_accessibility/lib/src/ui/text/widgets/text_raw_magnifier.dart`:

```dart
import 'package:flutter/widgets.dart';

/// Magnifies [child] under the finger while it is long-pressed.
///
/// Meant for text but works with any widget. The magnifier follows the
/// finger and disappears when it lifts.
final class TextRawMagnifier extends StatefulWidget {
  /// Creates a magnifier over [child].
  const TextRawMagnifier({
    required this.child,
    this.borderColor,
    this.size = const Size(200, 100),
    this.magnificationScale = 1.5,
    super.key,
  });

  /// The widget to magnify.
  final Widget child;

  /// The border colour of the lens; defaults to the ambient text colour,
  /// or black when there is none.
  final Color? borderColor;

  /// The size of the lens.
  final Size size;

  /// The magnification factor.
  final double magnificationScale;

  @override
  State<TextRawMagnifier> createState() => _TextRawMagnifierState();
}

class _TextRawMagnifierState extends State<TextRawMagnifier> {
  Offset? _position;

  void _show(Offset position) => setState(() => _position = position);

  void _hide() => setState(() => _position = null);

  @override
  Widget build(BuildContext context) {
    final position = _position;
    final borderColor = widget.borderColor ??
        DefaultTextStyle.of(context).style.color ??
        const Color(0xFF000000);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onLongPressStart: (details) => _show(details.localPosition),
          onLongPressMoveUpdate: (details) => _show(details.localPosition),
          onLongPressEnd: (_) => _hide(),
          onLongPressCancel: _hide,
          child: widget.child,
        ),
        if (position != null)
          Positioned(
            left: position.dx,
            top: position.dy,
            child: RawMagnifier(
              size: widget.size,
              magnificationScale: widget.magnificationScale,
              decoration: MagnifierDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: borderColor),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean. If the position assertions fail
by the lens offset, compare positions relative to `before` only as written
and do not loosen the tolerance beyond 1 logical pixel.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add TextRawMagnifier without a design-system dependency"
```

---

### Task 10: CollapsibleText

**Files:**
- Create: `packages/flutter_accessibility/lib/src/ui/text/widgets/collapsible_text.dart`
- Test: `packages/flutter_accessibility/test/ui/text/widgets/collapsible_text_test.dart`

**Interfaces:**
- Produces: `typedef CollapsibleToggleBuilder = Widget Function(BuildContext context, {required bool expanded, required VoidCallback onToggle})`;
  `CollapsibleText({required text, required toggleBuilder, maxLines = 3, style, key})`.
  Design-system packages wrap it as `ReadMoreText` / `CupertinoReadMoreText`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/ui/text/widgets/collapsible_text_test.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/collapsible_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

const longText = 'word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word';

Widget subject(String text, {int maxLines = 3, double width = 200}) => Center(
      child: SizedBox(
        width: width,
        child: CollapsibleText(
          text: text,
          maxLines: maxLines,
          toggleBuilder: (context, {required expanded, required onToggle}) =>
              GestureDetector(
            onTap: onToggle,
            child: Text(expanded ? 'less' : 'more'),
          ),
        ),
      ),
    );

Text body(WidgetTester tester) => tester.widget<Text>(
      find.descendant(
        of: find.byType(CollapsibleText),
        matching: find.byType(Text),
      ).first,
    );

void main() {
  group('CollapsibleText', () {
    testWidgets('shows short text in full without a toggle', (tester) async {
      await pumpScoped(tester, subject('short'));
      expect(find.text('short'), findsOneWidget);
      expect(find.text('more'), findsNothing);
      expect(body(tester).maxLines, isNull);
    });

    testWidgets('truncates long text and expands on toggle', (tester) async {
      await pumpScoped(tester, subject(longText));
      expect(body(tester).maxLines, 3);
      expect(body(tester).overflow, TextOverflow.ellipsis);
      expect(find.text('more'), findsOneWidget);
      await tester.tap(find.text('more'));
      await tester.pump();
      expect(body(tester).maxLines, isNull);
      expect(find.text('less'), findsOneWidget);
      await tester.tap(find.text('less'));
      await tester.pump();
      expect(body(tester).maxLines, 3);
    });

    testWidgets('leaves one line for the toggle in landscape', (tester) async {
      await pumpScoped(
        tester,
        subject(longText),
        size: const Size(800, 400),
      );
      expect(body(tester).maxLines, 2);
      await pumpScoped(
        tester,
        subject(longText, maxLines: 1),
        size: const Size(800, 400),
      );
      expect(body(tester).maxLines, 1);
    });

    testWidgets('measures with the accessible style', (tester) async {
      // The test font renders every glyph as a fontSize-wide square, so at
      // 14px a 200px box holds 14 characters per line: 22 characters take
      // two lines, and at 3x (42px, 4 characters per line) six lines.
      final viewModel = await pumpScoped(
        tester,
        subject('fits in two lines here', width: 200),
      );
      expect(find.text('more'), findsNothing);
      await viewModel.setTextScaleFactor(3);
      await tester.pump();
      expect(find.text('more'), findsOneWidget);
    });

    test('rejects a non-positive maxLines', () {
      expect(
        () => CollapsibleText(
          text: 'x',
          maxLines: 0,
          toggleBuilder: (context, {required expanded, required onToggle}) =>
              const SizedBox(),
        ),
        throwsAssertionError,
      );
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/flutter_accessibility && flutter test test/ui/text/widgets/collapsible_text_test.dart ; cd ../..
```

Expected: compilation error, the widget file does not exist.

- [ ] **Step 3: Write the widget**

`packages/flutter_accessibility/lib/src/ui/text/widgets/collapsible_text.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/accessible_text.dart';

/// Builds the control that expands or collapses a [CollapsibleText].
typedef CollapsibleToggleBuilder = Widget Function(
  BuildContext context, {
  required bool expanded,
  required VoidCallback onToggle,
});

/// Text that is truncated to [maxLines] with a toggle to show it in full.
///
/// The toggle only appears when the text, laid out with the accessible
/// style at the available width, exceeds [maxLines]. In landscape one line
/// is reserved for the toggle. The design-system packages provide the
/// toggle through [toggleBuilder].
final class CollapsibleText extends StatefulWidget {
  /// Creates a collapsible text.
  const CollapsibleText({
    required this.text,
    required this.toggleBuilder,
    this.maxLines = 3,
    this.style,
    super.key,
  }) : assert(maxLines > 0, 'maxLines must be at least 1');

  /// The text to display.
  final String text;

  /// Builds the expand/collapse control.
  final CollapsibleToggleBuilder toggleBuilder;

  /// The number of lines shown while collapsed.
  final int maxLines;

  /// The style merged over the ambient [DefaultTextStyle].
  final TextStyle? style;

  @override
  State<CollapsibleText> createState() => _CollapsibleTextState();
}

class _CollapsibleTextState extends State<CollapsibleText> {
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  int _lineCount(BuildContext context, double maxWidth) {
    final settings = AccessibilityScope.settingsOf(context).textSettings;
    final font = AccessibilityScope.of(context).activeFont;
    final style = DefaultTextStyle.of(context)
        .style
        .merge(widget.style)
        .applyTextSettings(settings, font: font);
    final painter = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout(maxWidth: maxWidth);
    final lines = painter.computeLineMetrics().length;
    painter.dispose();
    return lines;
  }

  int _collapsedMaxLines(BuildContext context) =>
      widget.maxLines > 1 && orientationOf(context) == Orientation.landscape
          ? widget.maxLines - 1
          : widget.maxLines;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (_lineCount(context, constraints.maxWidth) <= widget.maxLines) {
            return AccessibleText(widget.text, style: widget.style);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AccessibleText(
                widget.text,
                style: widget.style,
                maxLines: _expanded ? null : _collapsedMaxLines(context),
                overflow: _expanded ? null : TextOverflow.ellipsis,
              ),
              widget.toggleBuilder(
                context,
                expanded: _expanded,
                onToggle: _toggle,
              ),
            ],
          );
        },
      );
}
```

- [ ] **Step 4: Run the tests, format and analyze**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: all tests pass; analysis clean. If `Text.overflow` cannot be
`null` when expanded on the installed Flutter, pass `TextOverflow.clip`
when expanded and adjust the test's expectation to `isNot(TextOverflow.ellipsis)`.

- [ ] **Step 5: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): add CollapsibleText with a pluggable toggle"
```

---

### Task 11: Public barrel, architecture tests, interop test and example

**Files:**
- Modify: `packages/flutter_accessibility/lib/flutter_accessibility.dart`
- Create: `packages/flutter_accessibility/test/architecture_test.dart`,
  `packages/flutter_accessibility/test/public_api_test.dart`,
  `packages/flutter_accessibility/example/main.dart`

**Interfaces:**
- Produces: the public API of `flutter_accessibility` 2.0.0 (spec section 6),
  verified free of Material, Cupertino and `listen` imports and usable with
  Flutter's `ListenableBuilder`.

- [ ] **Step 1: Write the failing tests**

`packages/flutter_accessibility/test/architecture_test.dart`:

```dart
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const forbidden = [
  "'package:flutter/material.dart'",
  "'package:flutter/cupertino.dart'",
  "'package:material_ui",
  "'package:cupertino_ui",
  "'package:listen",
];

void main() {
  test('lib/ imports neither a design system nor package:listen', () {
    final offenders = <String>[];
    final files = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    for (final file in files) {
      for (final line in file.readAsLinesSync()) {
        final directive = line.trim();
        final isDirective =
            directive.startsWith('import ') || directive.startsWith('export ');
        if (isDirective && forbidden.any(directive.contains)) {
          offenders.add('${file.path}: $directive');
        }
      }
    }
    expect(offenders, isEmpty);
  });
}
```

`packages/flutter_accessibility/test/public_api_test.dart`:

```dart
import 'dart:io';

import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the whole public API', () {
    final barrel = File('lib/flutter_accessibility.dart').readAsStringSync();
    for (final name in [
      'AccessibilitySettingsViewModel',
      'AccessibilityScope',
      'AccessibilitySettingsBuilder',
      'EffectsBuilder',
      'AccessibilitySettingsConfiguration',
      'AccessibilitySettingsStyle',
      'AccessibleTextStyle',
      'AccessibleColor',
      'AccessibleText',
      'AccessibleWidgetBuilder',
      'AccessibleSizedBox',
      'AccessibleHeight',
      'TextRawMagnifier',
      'CollapsibleText',
      'CollapsibleToggleBuilder',
    ]) {
      expect(barrel, contains(name), reason: name);
    }
    expect(barrel, contains("export 'package:accessibility/accessibility.dart'"));
    expect(barrel, isNot(contains('package:listen')));
  });

  testWidgets('the view model works with Flutter listenable widgets',
      (tester) async {
    final repository = AccessibilitySettingsRepository(
      service: FakeAccessibilityStorageService(),
    );
    final viewModel = AccessibilitySettingsViewModel(repository: repository);
    addTearDown(() {
      viewModel.dispose();
      repository.dispose();
    });
    final Listenable asListenable = viewModel;
    final ChangeNotifier asNotifier = viewModel;
    expect(asListenable, same(asNotifier));
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) =>
              Text('bold ${viewModel.settings.textSettings.isBold}'),
        ),
      ),
    );
    expect(find.text('bold false'), findsOneWidget);
    await viewModel.setBold(value: true);
    await tester.pump();
    expect(find.text('bold true'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run the tests to verify the expected failures**

```bash
cd packages/flutter_accessibility && flutter test test/architecture_test.dart test/public_api_test.dart ; cd ../..
```

Expected: the architecture test passes; the public API test fails to
compile because the barrel exports none of the package's own names yet.

- [ ] **Step 3: Finish the barrel**

Replace `packages/flutter_accessibility/lib/flutter_accessibility.dart` with:

```dart
/// Flutter widgets layer of the accessibility package family.
///
/// Provides the [AccessibilitySettingsViewModel], the [AccessibilityScope]
/// that exposes it to the widget tree, builders that react to changes, and
/// accessible widgets, all built on `package:flutter/widgets.dart` only.
/// Re-exports `package:accessibility`.
library;

import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';

export 'package:accessibility/accessibility.dart';

export 'src/ui/core/accessible_color.dart' show AccessibleColor;
export 'src/ui/core/accessible_text_style.dart' show AccessibleTextStyle;
export 'src/ui/layout/accessible_height.dart' show AccessibleHeight;
export 'src/ui/layout/widgets/accessible_sized_box.dart'
    show AccessibleSizedBox;
export 'src/ui/layout/widgets/accessible_widget_builder.dart'
    show AccessibleWidgetBuilder;
export 'src/ui/settings/accessibility_settings_configuration.dart'
    show AccessibilitySettingsConfiguration;
export 'src/ui/settings/accessibility_settings_style.dart'
    show AccessibilitySettingsStyle;
export 'src/ui/settings/view_model/accessibility_settings_view_model.dart'
    show AccessibilitySettingsViewModel;
export 'src/ui/settings/widgets/accessibility_scope.dart'
    show AccessibilityScope;
export 'src/ui/settings/widgets/accessibility_settings_builder.dart'
    show AccessibilitySettingsBuilder, AccessibilitySettingsWidgetBuilder;
export 'src/ui/settings/widgets/effects_builder.dart'
    show EffectsBuilder, EffectsWidgetBuilder;
export 'src/ui/text/widgets/accessible_text.dart' show AccessibleText;
export 'src/ui/text/widgets/collapsible_text.dart'
    show CollapsibleText, CollapsibleToggleBuilder;
export 'src/ui/text/widgets/text_raw_magnifier.dart' show TextRawMagnifier;
```

`orientationOf` and `TextAlignModeMapping` stay internal.

- [ ] **Step 4: Add the pub.dev example**

`packages/flutter_accessibility/example/main.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Keeps the settings in memory; a real app uses
/// `accessibility_shared_preferences` or its own adapter.
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

/// A design-system-free app: the settings apply through AccessibleText.
final class ExampleApp extends StatelessWidget {
  /// Creates the example app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
        color: const Color(0xFF6750A4),
        builder: (context, child) => const DefaultTextStyle(
          style: TextStyle(fontSize: 16, color: Color(0xFF1C1B1F)),
          child: ExamplePage(),
        ),
      );
}

/// Shows the settings in use and a control that changes them.
final class ExamplePage extends StatelessWidget {
  /// Creates the page.
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AccessibilityScope.of(context);
    return ColoredBox(
      color: const Color(0xFFFFFBFE),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AccessibleText('This text follows the settings.'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => viewModel.setTextScaleFactor(
                viewModel.settings.textSettings.textScaleFactor >= 2 ? 1 : 2,
              ),
              child: const AccessibleText('Tap to toggle 2x text'),
            ),
            EffectsBuilder(
              builder: (context, {required effectsEnabled, child}) =>
                  AccessibleText(
                effectsEnabled ? 'Effects on' : 'Effects off',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 5: Run everything and the publish dry run**

```bash
cd packages/flutter_accessibility && dart format . && flutter test && dart analyze --fatal-infos --fatal-warnings . && dart pub publish --dry-run ; cd ../..
```

Expected: all tests pass; analysis clean including the example; the dry run
reports `Package has 0 warnings` (a note about `resolution: workspace` or
the unpublished `accessibility` dependency is acceptable). Never publish
for real.

- [ ] **Step 6: Commit**

```bash
git add packages/flutter_accessibility
git commit -m "feat(flutter): finalise the public API with architecture, API and interop tests"
```

---

### Task 12: Coverage gate, changelog and documentation alignment

**Files:**
- Modify: `packages/flutter_accessibility/CHANGELOG.md` (only if the API
  changed during the tasks), `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`

**Interfaces:**
- Produces: `flutter_accessibility` at 100% line coverage under the melos
  gate; the spec's two parked wording nits fixed; the spec's section 6
  aligned with the delivered API.

- [ ] **Step 1: Run the coverage pipeline**

```bash
dart run melos run test:coverage:flutter
dart run melos run coverage:check
```

Expected: `flutter_accessibility` prints `Line coverage: 100.00%`. If it is
below 100, open `packages/flutter_accessibility/coverage/lcov.info`, list
every `DA:<line>,0`, and add the missing test cases to the existing test
files before continuing (do not delete code to raise coverage).

- [ ] **Step 2: Align the spec**

In the spec:
- Section 3 tree: pad the `accessibility_testing/` line so its comment
  column aligns with the sibling lines.
- Section 10: replace `Pure Dart, depends on \`accessibility\` and \`meta\`.`
  with `Pure Dart, depends on \`accessibility\` only.`
- Section 6.1: change `Future<void> setBold(bool value);` to
  `Future<void> setBold({required bool value});` and add after the method
  list: "Boolean parameters are named because the lint set forbids
  positional booleans."
- Section 6.3: replace the `EffectsBuilder` signature with
  `builder: Widget Function(BuildContext, {required bool effectsEnabled, Widget? child})`.
- Section 6.4: replace `final Iterable<ColorSwatch<int>> textColorCandidates;      // default: private Material palette`
  with `final Iterable<ColorSwatch<int>>? textColorCandidates;     // null: the panel's default palette`
  and the same for `backgroundColorCandidates`; rename `onRestoreSettings`
  stays as is.
- Section 6.5: replace the `CollapsibleText` bullet's builder signature with
  `toggleBuilder(BuildContext, {required bool expanded, required VoidCallback onToggle})`,
  and add to the `TextRawMagnifier` mention: "with an optional `borderColor`
  defaulting to the ambient text colour, since there is no theme here".
- Section 6.5, `AccessibleColor` bullet: add "`ColorProfile.normal` keeps
  the 1.x lightness factor of 0; theme layers apply a profile only when it
  is not `normal`."

- [ ] **Step 3: Commit**

```bash
git add docs packages/flutter_accessibility
git commit -m "docs: align the spec with the delivered flutter_accessibility API"
```

- [ ] **Step 4: Full verification and hand over**

```bash
flutter pub get
dart run melos run format
dart run melos run analyze
dart run melos run test:coverage
dart run melos run coverage:check
```

Expected: every script green; `accessibility`, `accessibility_testing` and
`flutter_accessibility` all at 100.00%. Tell the user the branch
`feat/flutter-accessibility` is ready for its pull request into
`release/2.0`.

---

## Self-review against the spec

- **Section 3 / 3.1:** package, dependencies and re-export (Task 1, Task 11);
  no design system, no `listen` (architecture test, Task 11).
- **Section 4:** `ui/settings/view_model`, `ui/settings/widgets`,
  `ui/core`, `ui/text/widgets`, `ui/layout` folders; views hold no logic.
- **Section 6.1:** ViewModel API and semantics (Task 2), including
  `activeFont`, `setAccessibleFontEnabled`, Flutter `ChangeNotifier`, no
  repository disposal; boolean parameters named per the lint set (recorded
  in Task 12's spec alignment).
- **Section 6.2:** scope with `of`, `maybeOf`, `settingsOf`,
  `effectsEnabledOf`; blocking initialisation shown in the README and example
  (Tasks 1, 3, 11).
- **Section 6.3:** both builders, `MediaQuery.disableAnimationsOf`
  resolution (Task 4).
- **Section 6.4:** configuration and style with nullable candidates (Task 5).
- **Section 6.5:** `AccessibleText` composing with the text scaler
  (Task 7), `AccessibleWidgetBuilder`, `AccessibleSizedBox`,
  `AccessibleHeight` (Task 8), `TextRawMagnifier` (Task 9),
  `CollapsibleText` (Task 10), `AccessibleColor` (Task 6);
  `BuildContextControls` not re-created.
- **Section 13:** reduce motion honoured by `EffectsBuilder` and
  `effectsEnabledOf`; text size and bold left to Flutter.
- **Section 14:** 100% gate (Task 12), no `listen` type in the public API
  (Task 11 interop and architecture tests).
- **Section 15:** melos scripts split by Dart/Flutter, CI matrix with the
  Flutter test command (Task 1).
- **Final review carry-overs from plan 1:** ViewModel notifications counted
  on the ViewModel (Task 2 tests); public API test built on the barrel plus a
  compile-time interop test rather than `package:analyzer` (ruling: the
  analyzer dependency is not worth it for two packages); the two spec
  wording nits (Task 12).
