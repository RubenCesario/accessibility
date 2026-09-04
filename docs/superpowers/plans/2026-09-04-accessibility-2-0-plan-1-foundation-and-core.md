# accessibility 2.0, Plan 1 of 6: foundation and core

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn the single-package repo into a pub workspace and deliver the
pure Dart core `accessibility` 2.0.0 and its `accessibility_test` companion,
both at 100% line coverage, with CI enforcing it.

**Architecture:** MVVM per the Flutter architecture guide. This plan builds
the domain models and the Data layer (repository + service contract) in pure
Dart on `package:listen`, plus the fake service used by every later plan.
No UI code is written here.

**Tech Stack:** Dart 3.12+, pub workspaces, melos 7, `package:listen` 1.0.1,
`package:test`, `package:coverage`, GitHub Actions, Codecov, pana.

**Spec:** `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
(sections 3, 4, 5, 10, 15, 21 drive this plan).

**Plan series:** 1 foundation and core (this) · 2 `flutter_accessibility` ·
3 `accessibility_localizations`, `accessibility_shared_preferences`,
`accessibility_font_andika` · 4 `accessibility_material` and the Material
example · 5 `accessibility_cupertino` and the Cupertino example · 6 remaining
examples, deploy, docs, migration guide, release.

## Global Constraints

- Dart SDK constraint `^3.12.0` in every package.
- `listen: ^1.0.1`, `meta: ^1.16.0`, `collection: ^1.19.0`.
- The core never imports `package:flutter` or `dart:ui` (enforced by a test).
- The core does not re-export any `package:listen` type.
- `accessibility` and `accessibility_test` are gated at 100% line coverage.
- Every public member has a doc comment (`public_member_api_docs` is on).
- Package imports only (`always_use_package_imports`), 80-column lines,
  trailing commas, expression bodies where possible, single quotes.
- Commits and PR titles follow Conventional Commits; branch names use the
  same types in kebab-case. No AI attribution anywhere: no `Co-Authored-By`
  trailer, no session link, no "generated with" line.
- All packages are versioned 2.0.0.
- Commands below are written for the Git Bash shell available on the
  development machine; `dart`, `git` and `melos` behave the same on CI.

---

### Task 1: Branches

**Files:**
- Modify: `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`

**Interfaces:**
- Produces: branch `1.x` (maintenance line, from the last 1.4.0 commit) and
  branch `feat/accessibility-2-0` (integration branch for every plan of the
  series), containing the spec and this plan.

- [ ] **Step 1: Create the maintenance branch from master without switching**

```bash
git branch 1.x master
git log --oneline -1 1.x
```

Expected: the printed commit is `55a912d Feat/settings UI accessibility (#12)`.

- [ ] **Step 2: Create the integration branch from the design branch**

```bash
git checkout -b feat/accessibility-2-0 docs/accessibility-2-0-design
git log --oneline -2
```

Expected: the top commit is `docs: add accessibility 2.0 monorepo design spec`.

- [ ] **Step 3: Confirm the working tree is clean**

```bash
git status --short
```

Expected: no output. The spec and this plan are already committed on the
design branch, so Task 1 produces no commit of its own.

---

### Task 2: Workspace root and core package skeleton

**Files:**
- Delete (tracked): `lib/`, `test/`, `pubspec.yaml`, `pubspec.lock`,
  `l10n.yaml`, `l10n_untranslated_label.txt`, `dartdoc_options.yaml`,
  `devtools_options.yaml`, `accessibility.iml`, `doc/`
- Move: `CHANGELOG.md` -> `packages/accessibility/CHANGELOG.md`
- Create: `pubspec.yaml` (workspace root), `packages/accessibility/pubspec.yaml`,
  `packages/accessibility/analysis_options.yaml`,
  `packages/accessibility/lib/accessibility.dart`,
  `packages/accessibility/README.md`, `packages/accessibility/LICENSE`
- Modify: `analysis_options.yaml` (root), `.gitignore`

**Interfaces:**
- Produces: a resolvable workspace with one member, `accessibility` 2.0.0,
  whose `dart analyze` is clean. Later tasks add files under
  `packages/accessibility/lib/src/` and `packages/accessibility/test/`.

- [ ] **Step 1: Remove the 1.x root package files**

```bash
git rm -r -q lib test doc pubspec.yaml pubspec.lock l10n.yaml l10n_untranslated_label.txt dartdoc_options.yaml devtools_options.yaml accessibility.iml
rm -rf build coverage .dart_tool
mkdir -p packages/accessibility
git mv CHANGELOG.md packages/accessibility/CHANGELOG.md
cp LICENSE packages/accessibility/LICENSE
git status --short | head -20
```

Expected: deletions listed as `D`, the changelog as `R`, `screenshots/`,
`example/`, `README.md`, `LICENSE`, `AUTHORS`, `.github/` untouched.

- [ ] **Step 2: Fix the two deprecated lints in the root analysis options**

Remove these two lines from `analysis_options.yaml` (they are deprecated on
Dart 3.12 and fail `--fatal-warnings`):

```yaml
    - avoid_null_checks_in_equality_operators
    - use_if_null_to_convert_nulls_to_bools
```

- [ ] **Step 3: Write the workspace root pubspec**

Create `pubspec.yaml` at the repo root:

```yaml
name: accessibility_workspace
description: Workspace of the accessibility package family. Not published.
publish_to: none

environment:
  sdk: ^3.12.0

workspace:
  - packages/accessibility

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
      run: melos exec -c 1 --dir-exists=test -- dart test
```

- [ ] **Step 4: Write the core package pubspec, lints and barrel**

Create `packages/accessibility/pubspec.yaml`:

```yaml
name: accessibility
description: Pure Dart core of the accessibility package family, with the settings models, the repository and the storage contract.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - wcag
resolution: workspace

environment:
  sdk: ^3.12.0

dependencies:
  collection: ^1.19.0
  listen: ^1.0.1
  meta: ^1.16.0

dev_dependencies:
  coverage: ^1.11.0
  test: ^1.25.0
```

Create `packages/accessibility/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

Create `packages/accessibility/lib/accessibility.dart`:

```dart
/// Pure Dart core of the accessibility package family.
///
/// Contains the settings models, the settings repository and the storage
/// service contract. UI, persistence, translations and fonts live in
/// sibling packages.
library;
```

Task 12 rewrites this doc comment with `[...]` references once the
exports exist; until then it stays plain text so `comment_references`
has nothing to report.

- [ ] **Step 5: Write the core README and changelog entry**

Create `packages/accessibility/README.md`:

```markdown
# accessibility

Pure Dart core of the accessibility package family: the settings models,
the `AccessibilitySettingsRepository` (single source of truth) and the
`AccessibilityStorageService` contract that persistence adapters implement.

This package has no Flutter dependency. Use it directly to build your own
settings UI on any design system, or pick a sibling package:

| Package | Purpose |
|---|---|
| `flutter_accessibility` | ViewModel, scope and builders for Flutter widgets |
| `accessibility_material` | Material theme builder and settings panel |
| `accessibility_cupertino` | Cupertino theme builder and settings panel |
| `accessibility_shared_preferences` | Persistence on `shared_preferences` |
| `accessibility_localizations` | The settings strings in 80+ languages |
| `accessibility_font_andika` | The Andika accessible font as an asset |
| `accessibility_test` | Fake service and fixtures for tests |

## Usage

```dart
import 'package:accessibility/accessibility.dart';

final repository = AccessibilitySettingsRepository(service: myStorageService);
await repository.load();
repository.settings.addListener(() => print(repository.settings.value));
await repository.save(
  repository.settings.value.copyWith(
    textSettings: const TextSettings(textScaleFactor: 1.5),
  ),
);
```

`AccessibilitySettings` is immutable; `copyWith`, `withThemeProfile` and
`withNextColorProfile` produce new values. `toJson` and `fromJson` exist for
storage adapters.
```

Prepend this entry to `packages/accessibility/CHANGELOG.md` (keep the 1.x
history below it):

```markdown
## 2.0.0

### Breaking changes
* `accessibility` is now the pure Dart core of a package family. Widgets,
  Material and Cupertino UI, `shared_preferences` persistence, translations
  and the Andika font moved to sibling packages. See the migration guide
  in the repository (`docs/migration/1.x-to-2.0.md`).
* Settings are one immutable `AccessibilitySettings` value; nullable fields
  replace the `-1.0`, `0` and `''` sentinels.
* `ThemeMode` is replaced by `AccessibilityThemeMode`, `effectsAllowed` by
  the tri-state `EffectsMode`, `textAlignMode` strings by `TextAlignMode`.
* `SharedPreferencesService` is replaced by the three-method
  `AccessibilityStorageService`; persistence is owned by
  `AccessibilitySettingsRepository`.

```

- [ ] **Step 6: Ignore coverage output**

Append to `.gitignore`:

```gitignore

# Coverage output of every package
**/coverage/
```

- [ ] **Step 7: Resolve the workspace and analyze**

```bash
dart pub get
cd packages/accessibility && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
```

Expected: `dart pub get` prints `Resolving dependencies...` and succeeds
from the root; `dart analyze` reports no issues. If `dart pub get` complains that
`resolution: workspace` requires the root to list the package, check the
`workspace:` path spelling.

- [ ] **Step 8: Install melos and bootstrap**

```bash
dart pub global activate melos
melos bootstrap
melos run format
```

Expected: `melos bootstrap` lists `accessibility` as the only package;
`melos run format` exits 0.

- [ ] **Step 9: Commit**

```bash
git add -A
git commit -m "chore: convert the repository into a pub workspace with the core package skeleton"
```

---

### Task 3: Enums and enum lookup

**Files:**
- Create: `packages/accessibility/lib/src/domain/models/accessibility_theme_mode.dart`,
  `packages/accessibility/lib/src/domain/models/effects_mode.dart`,
  `packages/accessibility/lib/src/domain/models/text_align_mode.dart`,
  `packages/accessibility/lib/src/domain/models/color_profile_level.dart`,
  `packages/accessibility/lib/src/domain/models/theme_profile_level.dart`,
  `packages/accessibility/lib/src/domain/models/enum_by_name.dart`
- Test: `packages/accessibility/test/domain/models/effects_mode_test.dart`,
  `packages/accessibility/test/domain/models/enum_by_name_test.dart`

**Interfaces:**
- Produces: `enum AccessibilityThemeMode { system, light, dark }`,
  `enum EffectsMode { system, enabled, disabled }` with
  `bool resolve({required bool systemReducesMotion})`,
  `enum TextAlignMode { none, start, end, left, right, center, justify }`,
  `enum ColorProfileLevel { normal, lowSaturation, highSaturation, monochrome, highContrast }`,
  `enum ThemeProfileLevel { none, seizureSafe, visionImpaired, adhdFriendly }`,
  `T enumByName<T extends Enum>(Iterable<T> values, Object? name, {required T fallback})`.

- [ ] **Step 1: Write the failing tests**

`packages/accessibility/test/domain/models/effects_mode_test.dart`:

```dart
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:test/test.dart';

void main() {
  group('EffectsMode.resolve', () {
    test('system follows the OS reduce-motion signal', () {
      expect(
        EffectsMode.system.resolve(systemReducesMotion: false),
        isTrue,
      );
      expect(
        EffectsMode.system.resolve(systemReducesMotion: true),
        isFalse,
      );
    });

    test('enabled ignores the OS signal', () {
      expect(EffectsMode.enabled.resolve(systemReducesMotion: true), isTrue);
      expect(EffectsMode.enabled.resolve(systemReducesMotion: false), isTrue);
    });

    test('disabled ignores the OS signal', () {
      expect(
        EffectsMode.disabled.resolve(systemReducesMotion: true),
        isFalse,
      );
      expect(
        EffectsMode.disabled.resolve(systemReducesMotion: false),
        isFalse,
      );
    });
  });
}
```

`packages/accessibility/test/domain/models/enum_by_name_test.dart`:

```dart
import 'package:accessibility/src/domain/models/enum_by_name.dart';
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:test/test.dart';

void main() {
  group('enumByName', () {
    test('returns the value whose name matches', () {
      expect(
        enumByName(
          TextAlignMode.values,
          'justify',
          fallback: TextAlignMode.none,
        ),
        TextAlignMode.justify,
      );
    });

    test('returns the fallback for an unknown name', () {
      expect(
        enumByName(
          TextAlignMode.values,
          'diagonal',
          fallback: TextAlignMode.none,
        ),
        TextAlignMode.none,
      );
    });

    test('returns the fallback for a non-string value', () {
      expect(
        enumByName(TextAlignMode.values, 3, fallback: TextAlignMode.start),
        TextAlignMode.start,
      );
      expect(
        enumByName(TextAlignMode.values, null, fallback: TextAlignMode.end),
        TextAlignMode.end,
      );
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/accessibility && dart test test/domain/models ; cd ../..
```

Expected: compilation errors, the imported files do not exist.

- [ ] **Step 3: Write the enums and the lookup helper**

`packages/accessibility/lib/src/domain/models/accessibility_theme_mode.dart`:

```dart
/// The theme brightness chosen by the user.
///
/// Named with a prefix because Material users also import `ThemeMode`.
enum AccessibilityThemeMode {
  /// Follow the platform brightness.
  system,

  /// Always light.
  light,

  /// Always dark.
  dark,
}
```

`packages/accessibility/lib/src/domain/models/effects_mode.dart`:

```dart
/// Whether animations and visual effects are allowed.
enum EffectsMode {
  /// Follow the OS reduce-motion setting.
  system,

  /// Always allow effects.
  enabled,

  /// Never allow effects.
  disabled;

  /// Resolves this mode to a concrete value.
  ///
  /// [systemReducesMotion] is the OS reduce-motion signal, which Flutter
  /// exposes as `MediaQuery.disableAnimationsOf`.
  bool resolve({required bool systemReducesMotion}) => switch (this) {
        EffectsMode.system => !systemReducesMotion,
        EffectsMode.enabled => true,
        EffectsMode.disabled => false,
      };
}
```

`packages/accessibility/lib/src/domain/models/text_align_mode.dart`:

```dart
/// The horizontal text alignment override.
enum TextAlignMode {
  /// Do not override the alignment.
  none,

  /// Align to the leading edge.
  start,

  /// Align to the trailing edge.
  end,

  /// Align left.
  left,

  /// Align right.
  right,

  /// Center.
  center,

  /// Stretch lines to the full width.
  justify,
}
```

`packages/accessibility/lib/src/domain/models/color_profile_level.dart`:

```dart
/// The colour transformation applied to the whole theme.
enum ColorProfileLevel {
  /// No transformation.
  normal,

  /// Halve the saturation.
  lowSaturation,

  /// Double the saturation.
  highSaturation,

  /// Remove all saturation.
  monochrome,

  /// Push lightness towards the extremes.
  highContrast,
}
```

`packages/accessibility/lib/src/domain/models/theme_profile_level.dart`:

```dart
/// A preset of text, colour and effects settings.
enum ThemeProfileLevel {
  /// The default settings.
  none,

  /// No effects and low saturation, for users prone to seizures.
  seizureSafe,

  /// Bold, doubled text and high saturation, for low-vision users.
  visionImpaired,

  /// Slightly larger text, no effects and high saturation, for users with
  /// attention disorders.
  adhdFriendly,
}
```

`packages/accessibility/lib/src/domain/models/enum_by_name.dart`:

```dart
/// Returns the value of [values] whose `name` equals [name].
///
/// Returns [fallback] when [name] is not a `String` or matches no value.
T enumByName<T extends Enum>(
  Iterable<T> values,
  Object? name, {
  required T fallback,
}) {
  if (name is! String) {
    return fallback;
  }
  for (final value in values) {
    if (value.name == name) {
      return value;
    }
  }
  return fallback;
}
```

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test test/domain/models && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: 6 tests pass; analysis of `lib/src` and `test` is clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add settings enums and enum lookup"
```

---

### Task 4: TextSettings and ColorSettings

**Files:**
- Create: `packages/accessibility/lib/src/domain/models/text_settings.dart`,
  `packages/accessibility/lib/src/domain/models/color_settings.dart`
- Test: `packages/accessibility/test/domain/models/text_settings_test.dart`,
  `packages/accessibility/test/domain/models/color_settings_test.dart`

**Interfaces:**
- Consumes: `TextAlignMode`, `ColorProfileLevel` (Task 3).
- Produces: `TextSettings` (`lineHeight`, `wordSpacing`, `letterSpacing`:
  `double?`; `textScaleFactor`: `double` = 1.0; `isBold`: `bool` = false;
  `textAlign`: `TextAlignMode` = none; `color`: `int?`; `fontFamily`:
  `String?`; `static const defaults`; `bool get isDefault`; `copyWith`
  where passing `null` clears a nullable field). `ColorSettings`
  (`backgroundColor`: `int?`; `colorProfile`: `ColorProfileLevel` = normal;
  `defaults`; `isDefault`; `copyWith` with the same clearing rule).

- [ ] **Step 1: Write the failing tests**

`packages/accessibility/test/domain/models/text_settings_test.dart`:

```dart
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:test/test.dart';

void main() {
  group('TextSettings', () {
    test('defaults override nothing', () {
      const settings = TextSettings();
      expect(settings.lineHeight, isNull);
      expect(settings.wordSpacing, isNull);
      expect(settings.letterSpacing, isNull);
      expect(settings.textScaleFactor, 1.0);
      expect(settings.isBold, isFalse);
      expect(settings.textAlign, TextAlignMode.none);
      expect(settings.color, isNull);
      expect(settings.fontFamily, isNull);
      expect(settings, TextSettings.defaults);
      expect(settings.isDefault, isTrue);
    });

    test('is a value type', () {
      const a = TextSettings(lineHeight: 1.5, color: 0xFF000000);
      const b = TextSettings(lineHeight: 1.5, color: 0xFF000000);
      const c = TextSettings(lineHeight: 1.6, color: 0xFF000000);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(c));
      expect(a.isDefault, isFalse);
      expect(a.toString(), contains('lineHeight: 1.5'));
    });

    test('copyWith keeps fields that are not passed', () {
      const original = TextSettings(
        lineHeight: 1.5,
        wordSpacing: 2,
        letterSpacing: 0.5,
        textScaleFactor: 1.2,
        isBold: true,
        textAlign: TextAlignMode.center,
        color: 0xFF112233,
        fontFamily: 'Andika',
      );
      expect(original.copyWith(), original);
      expect(
        original.copyWith(textScaleFactor: 2, textAlign: TextAlignMode.end),
        const TextSettings(
          lineHeight: 1.5,
          wordSpacing: 2,
          letterSpacing: 0.5,
          textScaleFactor: 2,
          isBold: true,
          textAlign: TextAlignMode.end,
          color: 0xFF112233,
          fontFamily: 'Andika',
        ),
      );
    });

    test('copyWith with null clears a nullable field', () {
      const original = TextSettings(
        lineHeight: 1.5,
        wordSpacing: 2,
        letterSpacing: 0.5,
        color: 0xFF112233,
        fontFamily: 'Andika',
      );
      final cleared = original.copyWith(
        lineHeight: null,
        wordSpacing: null,
        letterSpacing: null,
        color: null,
        fontFamily: null,
      );
      expect(cleared, TextSettings.defaults);
    });

    test('copyWith sets nullable fields', () {
      final set = TextSettings.defaults.copyWith(
        lineHeight: 2,
        wordSpacing: 3,
        letterSpacing: 4,
        isBold: true,
        color: 0xFF445566,
        fontFamily: 'OpenDyslexic',
      );
      expect(set.lineHeight, 2);
      expect(set.wordSpacing, 3);
      expect(set.letterSpacing, 4);
      expect(set.isBold, isTrue);
      expect(set.color, 0xFF445566);
      expect(set.fontFamily, 'OpenDyslexic');
    });
  });
}
```

`packages/accessibility/test/domain/models/color_settings_test.dart`:

```dart
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:test/test.dart';

void main() {
  group('ColorSettings', () {
    test('defaults override nothing', () {
      const settings = ColorSettings();
      expect(settings.backgroundColor, isNull);
      expect(settings.colorProfile, ColorProfileLevel.normal);
      expect(settings, ColorSettings.defaults);
      expect(settings.isDefault, isTrue);
    });

    test('is a value type', () {
      const a = ColorSettings(
        backgroundColor: 0xFFFFFFFF,
        colorProfile: ColorProfileLevel.monochrome,
      );
      const b = ColorSettings(
        backgroundColor: 0xFFFFFFFF,
        colorProfile: ColorProfileLevel.monochrome,
      );
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(ColorSettings.defaults));
      expect(a.isDefault, isFalse);
      expect(a.toString(), contains('monochrome'));
    });

    test('copyWith keeps, sets and clears', () {
      const original = ColorSettings(
        backgroundColor: 0xFFFFFFFF,
        colorProfile: ColorProfileLevel.highContrast,
      );
      expect(original.copyWith(), original);
      expect(
        original.copyWith(colorProfile: ColorProfileLevel.lowSaturation),
        const ColorSettings(
          backgroundColor: 0xFFFFFFFF,
          colorProfile: ColorProfileLevel.lowSaturation,
        ),
      );
      expect(
        original.copyWith(backgroundColor: null),
        const ColorSettings(colorProfile: ColorProfileLevel.highContrast),
      );
      expect(
        ColorSettings.defaults.copyWith(backgroundColor: 0xFF000000)
            .backgroundColor,
        0xFF000000,
      );
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/accessibility && dart test test/domain/models/text_settings_test.dart test/domain/models/color_settings_test.dart ; cd ../..
```

Expected: compilation errors, the model files do not exist.

- [ ] **Step 3: Write the models**

`packages/accessibility/lib/src/domain/models/text_settings.dart`:

```dart
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:meta/meta.dart';

/// Sentinel that tells [TextSettings.copyWith] a parameter was not passed.
const Object _unset = Object();

/// The text accessibility settings.
///
/// `null` on a nullable field means "do not override the app value". The
/// ranges follow WCAG 2.1 AA 1.4.4 (resize text) and 1.4.12 (text spacing).
@immutable
final class TextSettings {
  /// Creates text settings. Every parameter is optional.
  const TextSettings({
    this.lineHeight,
    this.wordSpacing,
    this.letterSpacing,
    this.textScaleFactor = 1.0,
    this.isBold = false,
    this.textAlign = TextAlignMode.none,
    this.color,
    this.fontFamily,
  });

  /// The settings that override nothing.
  static const defaults = TextSettings();

  /// Line height multiplier, or `null` to keep the app value.
  final double? lineHeight;

  /// Extra space between words in logical pixels, or `null`.
  final double? wordSpacing;

  /// Extra space between letters in logical pixels, or `null`.
  final double? letterSpacing;

  /// Multiplier applied to every font size. `1.0` means no scaling.
  final double textScaleFactor;

  /// Whether all text is rendered bold.
  final bool isBold;

  /// Horizontal alignment override.
  final TextAlignMode textAlign;

  /// Text colour as ARGB, or `null` to keep the theme colour.
  final int? color;

  /// Font family override, or `null` to keep the app font.
  final String? fontFamily;

  /// Whether these settings equal [defaults].
  bool get isDefault => this == defaults;

  /// Returns a copy with the given fields replaced.
  ///
  /// Passing `null` for [lineHeight], [wordSpacing], [letterSpacing],
  /// [color] or [fontFamily] clears that field; not passing it keeps the
  /// current value.
  TextSettings copyWith({
    Object? lineHeight = _unset,
    Object? wordSpacing = _unset,
    Object? letterSpacing = _unset,
    double? textScaleFactor,
    bool? isBold,
    TextAlignMode? textAlign,
    Object? color = _unset,
    Object? fontFamily = _unset,
  }) =>
      TextSettings(
        lineHeight: identical(lineHeight, _unset)
            ? this.lineHeight
            : lineHeight as double?,
        wordSpacing: identical(wordSpacing, _unset)
            ? this.wordSpacing
            : wordSpacing as double?,
        letterSpacing: identical(letterSpacing, _unset)
            ? this.letterSpacing
            : letterSpacing as double?,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        isBold: isBold ?? this.isBold,
        textAlign: textAlign ?? this.textAlign,
        color: identical(color, _unset) ? this.color : color as int?,
        fontFamily: identical(fontFamily, _unset)
            ? this.fontFamily
            : fontFamily as String?,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextSettings &&
          other.lineHeight == lineHeight &&
          other.wordSpacing == wordSpacing &&
          other.letterSpacing == letterSpacing &&
          other.textScaleFactor == textScaleFactor &&
          other.isBold == isBold &&
          other.textAlign == textAlign &&
          other.color == color &&
          other.fontFamily == fontFamily;

  @override
  int get hashCode => Object.hash(
        lineHeight,
        wordSpacing,
        letterSpacing,
        textScaleFactor,
        isBold,
        textAlign,
        color,
        fontFamily,
      );

  @override
  String toString() => 'TextSettings('
      'lineHeight: $lineHeight, '
      'wordSpacing: $wordSpacing, '
      'letterSpacing: $letterSpacing, '
      'textScaleFactor: $textScaleFactor, '
      'isBold: $isBold, '
      'textAlign: $textAlign, '
      'color: $color, '
      'fontFamily: $fontFamily)';
}
```

`packages/accessibility/lib/src/domain/models/color_settings.dart`:

```dart
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:meta/meta.dart';

/// Sentinel that tells [ColorSettings.copyWith] a parameter was not passed.
const Object _unset = Object();

/// The colour accessibility settings.
@immutable
final class ColorSettings {
  /// Creates colour settings. Every parameter is optional.
  const ColorSettings({
    this.backgroundColor,
    this.colorProfile = ColorProfileLevel.normal,
  });

  /// The settings that override nothing.
  static const defaults = ColorSettings();

  /// Page background colour as ARGB, or `null` to keep the theme colour.
  final int? backgroundColor;

  /// The colour transformation applied to the theme.
  final ColorProfileLevel colorProfile;

  /// Whether these settings equal [defaults].
  bool get isDefault => this == defaults;

  /// Returns a copy with the given fields replaced.
  ///
  /// Passing `null` for [backgroundColor] clears it; not passing it keeps
  /// the current value.
  ColorSettings copyWith({
    Object? backgroundColor = _unset,
    ColorProfileLevel? colorProfile,
  }) =>
      ColorSettings(
        backgroundColor: identical(backgroundColor, _unset)
            ? this.backgroundColor
            : backgroundColor as int?,
        colorProfile: colorProfile ?? this.colorProfile,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorSettings &&
          other.backgroundColor == backgroundColor &&
          other.colorProfile == colorProfile;

  @override
  int get hashCode => Object.hash(backgroundColor, colorProfile);

  @override
  String toString() => 'ColorSettings('
      'backgroundColor: $backgroundColor, '
      'colorProfile: $colorProfile)';
}
```

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test test/domain/models && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add TextSettings and ColorSettings models"
```

---

### Task 5: ColorProfile and ThemeProfile

**Files:**
- Create: `packages/accessibility/lib/src/domain/models/color_profile.dart`,
  `packages/accessibility/lib/src/domain/models/theme_profile.dart`
- Test: `packages/accessibility/test/domain/models/color_profile_test.dart`,
  `packages/accessibility/test/domain/models/theme_profile_test.dart`

**Interfaces:**
- Consumes: `ColorProfileLevel`, `ThemeProfileLevel`, `EffectsMode`
  (Task 3); `TextSettings`, `ColorSettings` (Task 4).
- Produces: `ColorProfile` (`level`, `saturationMultiplier: double?`,
  `lightnessFactor: double?`, `factory ColorProfile.fromLevel`,
  `static const values`, and the five constants `normal`, `lowSaturation`,
  `highSaturation`, `monochrome`, `highContrast`). `ThemeProfile` (`level`,
  `textSettings`, `colorSettings`, `effectsMode`,
  `factory ThemeProfile.fromLevel`, constants `none`, `seizureSafe`,
  `visionImpaired`, `adhdFriendly`).

- [ ] **Step 1: Write the failing tests**

`packages/accessibility/test/domain/models/color_profile_test.dart`:

```dart
import 'package:accessibility/src/domain/models/color_profile.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:test/test.dart';

void main() {
  group('ColorProfile', () {
    test('fromLevel returns the profile of every level', () {
      for (final level in ColorProfileLevel.values) {
        expect(ColorProfile.fromLevel(level).level, level);
      }
    });

    test('values are ordered like the levels', () {
      expect(
        ColorProfile.values.map((profile) => profile.level),
        ColorProfileLevel.values,
      );
    });

    test('keeps the 1.x saturation and lightness values', () {
      expect(ColorProfile.normal.saturationMultiplier, 1);
      expect(ColorProfile.normal.lightnessFactor, 0);
      expect(ColorProfile.lowSaturation.saturationMultiplier, 0.5);
      expect(ColorProfile.lowSaturation.lightnessFactor, isNull);
      expect(ColorProfile.highSaturation.saturationMultiplier, 2);
      expect(ColorProfile.monochrome.saturationMultiplier, 0);
      expect(ColorProfile.highContrast.saturationMultiplier, isNull);
      expect(ColorProfile.highContrast.lightnessFactor, 0.5);
    });

    test('is a value type with a readable toString', () {
      expect(
        ColorProfile.fromLevel(ColorProfileLevel.monochrome),
        ColorProfile.monochrome,
      );
      expect(
        ColorProfile.monochrome.hashCode,
        ColorProfile.fromLevel(ColorProfileLevel.monochrome).hashCode,
      );
      expect(ColorProfile.monochrome, isNot(ColorProfile.normal));
      expect(ColorProfile.monochrome.toString(), contains('monochrome'));
    });
  });
}
```

`packages/accessibility/test/domain/models/theme_profile_test.dart`:

```dart
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:test/test.dart';

void main() {
  group('ThemeProfile', () {
    test('fromLevel returns the profile of every level', () {
      for (final level in ThemeProfileLevel.values) {
        expect(ThemeProfile.fromLevel(level).level, level);
      }
    });

    test('none is the default settings', () {
      expect(ThemeProfile.none.textSettings, TextSettings.defaults);
      expect(ThemeProfile.none.colorSettings, ColorSettings.defaults);
      expect(ThemeProfile.none.effectsMode, EffectsMode.system);
    });

    test('seizureSafe disables effects and lowers saturation', () {
      expect(ThemeProfile.seizureSafe.effectsMode, EffectsMode.disabled);
      expect(
        ThemeProfile.seizureSafe.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.lowSaturation),
      );
      expect(ThemeProfile.seizureSafe.textSettings, TextSettings.defaults);
    });

    test('visionImpaired doubles and bolds text with high saturation', () {
      expect(
        ThemeProfile.visionImpaired.textSettings,
        const TextSettings(isBold: true, textScaleFactor: 2),
      );
      expect(
        ThemeProfile.visionImpaired.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.highSaturation),
      );
      expect(ThemeProfile.visionImpaired.effectsMode, EffectsMode.system);
    });

    test('adhdFriendly enlarges text, disables effects, high saturation',
        () {
      expect(
        ThemeProfile.adhdFriendly.textSettings,
        const TextSettings(textScaleFactor: 1.25),
      );
      expect(ThemeProfile.adhdFriendly.effectsMode, EffectsMode.disabled);
      expect(
        ThemeProfile.adhdFriendly.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.highSaturation),
      );
    });

    test('is a value type with a readable toString', () {
      expect(
        ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe),
        ThemeProfile.seizureSafe,
      );
      expect(
        ThemeProfile.seizureSafe.hashCode,
        ThemeProfile.fromLevel(ThemeProfileLevel.seizureSafe).hashCode,
      );
      expect(ThemeProfile.seizureSafe, isNot(ThemeProfile.none));
      expect(ThemeProfile.seizureSafe.toString(), contains('seizureSafe'));
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/accessibility && dart test test/domain/models/color_profile_test.dart test/domain/models/theme_profile_test.dart ; cd ../..
```

Expected: compilation errors, the files do not exist.

- [ ] **Step 3: Write the profiles**

`packages/accessibility/lib/src/domain/models/color_profile.dart`:

```dart
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:meta/meta.dart';

/// How a [ColorProfileLevel] transforms colours.
@immutable
final class ColorProfile {
  const ColorProfile._({
    required this.level,
    this.saturationMultiplier,
    this.lightnessFactor,
  });

  /// Returns the profile of [level].
  factory ColorProfile.fromLevel(ColorProfileLevel level) => switch (level) {
        ColorProfileLevel.normal => normal,
        ColorProfileLevel.lowSaturation => lowSaturation,
        ColorProfileLevel.highSaturation => highSaturation,
        ColorProfileLevel.monochrome => monochrome,
        ColorProfileLevel.highContrast => highContrast,
      };

  /// No transformation.
  static const normal = ColorProfile._(
    level: ColorProfileLevel.normal,
    saturationMultiplier: 1,
    lightnessFactor: 0,
  );

  /// Saturation halved.
  static const lowSaturation = ColorProfile._(
    level: ColorProfileLevel.lowSaturation,
    saturationMultiplier: 0.5,
  );

  /// Saturation doubled.
  static const highSaturation = ColorProfile._(
    level: ColorProfileLevel.highSaturation,
    saturationMultiplier: 2,
  );

  /// Saturation removed.
  static const monochrome = ColorProfile._(
    level: ColorProfileLevel.monochrome,
    saturationMultiplier: 0,
  );

  /// Lightness pushed towards the extremes.
  static const highContrast = ColorProfile._(
    level: ColorProfileLevel.highContrast,
    lightnessFactor: 0.5,
  );

  /// Every profile, in [ColorProfileLevel] order.
  static const values = [
    normal,
    lowSaturation,
    highSaturation,
    monochrome,
    highContrast,
  ];

  /// The level this profile implements.
  final ColorProfileLevel level;

  /// Factor applied to the HSL saturation, or `null` to keep it.
  final double? saturationMultiplier;

  /// Amount by which lightness moves towards black or white, or `null`.
  final double? lightnessFactor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorProfile &&
          other.level == level &&
          other.saturationMultiplier == saturationMultiplier &&
          other.lightnessFactor == lightnessFactor;

  @override
  int get hashCode =>
      Object.hash(level, saturationMultiplier, lightnessFactor);

  @override
  String toString() => 'ColorProfile('
      'level: $level, '
      'saturationMultiplier: $saturationMultiplier, '
      'lightnessFactor: $lightnessFactor)';
}
```

`packages/accessibility/lib/src/domain/models/theme_profile.dart`:

```dart
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:meta/meta.dart';

/// The text, colour and effects values of a [ThemeProfileLevel] preset.
@immutable
final class ThemeProfile {
  const ThemeProfile._({
    required this.level,
    this.textSettings = TextSettings.defaults,
    this.colorSettings = ColorSettings.defaults,
    this.effectsMode = EffectsMode.system,
  });

  /// Returns the preset of [level].
  factory ThemeProfile.fromLevel(ThemeProfileLevel level) => switch (level) {
        ThemeProfileLevel.none => none,
        ThemeProfileLevel.seizureSafe => seizureSafe,
        ThemeProfileLevel.visionImpaired => visionImpaired,
        ThemeProfileLevel.adhdFriendly => adhdFriendly,
      };

  /// The default settings.
  static const none = ThemeProfile._(level: ThemeProfileLevel.none);

  /// No effects, low saturation.
  static const seizureSafe = ThemeProfile._(
    level: ThemeProfileLevel.seizureSafe,
    effectsMode: EffectsMode.disabled,
    colorSettings: ColorSettings(colorProfile: ColorProfileLevel.lowSaturation),
  );

  /// Bold, doubled text, high saturation.
  static const visionImpaired = ThemeProfile._(
    level: ThemeProfileLevel.visionImpaired,
    textSettings: TextSettings(isBold: true, textScaleFactor: 2),
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// Slightly larger text, no effects, high saturation.
  static const adhdFriendly = ThemeProfile._(
    level: ThemeProfileLevel.adhdFriendly,
    textSettings: TextSettings(textScaleFactor: 1.25),
    effectsMode: EffectsMode.disabled,
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// The level this preset implements.
  final ThemeProfileLevel level;

  /// The text settings of the preset.
  final TextSettings textSettings;

  /// The colour settings of the preset.
  final ColorSettings colorSettings;

  /// The effects mode of the preset.
  final EffectsMode effectsMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeProfile &&
          other.level == level &&
          other.textSettings == textSettings &&
          other.colorSettings == colorSettings &&
          other.effectsMode == effectsMode;

  @override
  int get hashCode =>
      Object.hash(level, textSettings, colorSettings, effectsMode);

  @override
  String toString() => 'ThemeProfile('
      'level: $level, '
      'textSettings: $textSettings, '
      'colorSettings: $colorSettings, '
      'effectsMode: $effectsMode)';
}
```

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test test/domain/models && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add ColorProfile and ThemeProfile presets"
```

---

### Task 6: AccessibleFont

**Files:**
- Create: `packages/accessibility/lib/src/domain/models/accessible_font.dart`
- Test: `packages/accessibility/test/domain/models/accessible_font_test.dart`

**Interfaces:**
- Produces: `AccessibleFont({required String family, String? package})`
  with `String get qualifiedFamily`.

- [ ] **Step 1: Write the failing test**

`packages/accessibility/test/domain/models/accessible_font_test.dart`:

```dart
import 'package:accessibility/src/domain/models/accessible_font.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibleFont', () {
    test('qualifies the family with the package when present', () {
      const font = AccessibleFont(
        family: 'Andika',
        package: 'accessibility_font_andika',
      );
      expect(font.qualifiedFamily, 'packages/accessibility_font_andika/Andika');
    });

    test('keeps the bare family without a package', () {
      const font = AccessibleFont(family: 'OpenDyslexic');
      expect(font.qualifiedFamily, 'OpenDyslexic');
    });

    test('is a value type with a readable toString', () {
      const a = AccessibleFont(family: 'Andika', package: 'p');
      const b = AccessibleFont(family: 'Andika', package: 'p');
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(const AccessibleFont(family: 'Andika')));
      expect(a.toString(), contains('Andika'));
    });
  });
}
```

- [ ] **Step 2: Run the test to verify it fails**

```bash
cd packages/accessibility && dart test test/domain/models/accessible_font_test.dart ; cd ../..
```

Expected: compilation error, the file does not exist.

- [ ] **Step 3: Write the model**

`packages/accessibility/lib/src/domain/models/accessible_font.dart`:

```dart
import 'package:meta/meta.dart';

/// A font family the app offers as an accessible alternative.
@immutable
final class AccessibleFont {
  /// Creates a font description.
  ///
  /// [package] is the pub package that bundles the font files, or `null`
  /// when the app bundles them itself.
  const AccessibleFont({required this.family, this.package});

  /// The font family name declared in the bundling pubspec.
  final String family;

  /// The pub package that bundles the font, if any.
  final String? package;

  /// The family name as Flutter expects it in a text style:
  /// `packages/<package>/<family>` when [package] is set, else [family].
  String get qualifiedFamily =>
      package == null ? family : 'packages/$package/$family';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessibleFont &&
          other.family == family &&
          other.package == package;

  @override
  int get hashCode => Object.hash(family, package);

  @override
  String toString() => 'AccessibleFont(family: $family, package: $package)';
}
```

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test test/domain/models && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add AccessibleFont model"
```

---

### Task 7: AccessibilitySettings behaviour

**Files:**
- Create: `packages/accessibility/lib/src/domain/models/accessibility_settings.dart`
- Test: `packages/accessibility/test/domain/models/accessibility_settings_test.dart`

**Interfaces:**
- Consumes: everything from Tasks 3, 4, 5.
- Produces: `AccessibilitySettings({themeMode, effectsMode, textSettings, colorSettings})`,
  `static const defaults`, `bool get isDefault`,
  `ThemeProfileLevel get matchingThemeProfile`, `copyWith`,
  `withThemeProfile(ThemeProfileLevel)`, `withNextColorProfile()`.
  JSON is added in Task 8.

- [ ] **Step 1: Write the failing tests**

`packages/accessibility/test/domain/models/accessibility_settings_test.dart`:

```dart
import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibilitySettings', () {
    test('defaults follow the system and override nothing', () {
      const settings = AccessibilitySettings();
      expect(settings.themeMode, AccessibilityThemeMode.system);
      expect(settings.effectsMode, EffectsMode.system);
      expect(settings.textSettings, TextSettings.defaults);
      expect(settings.colorSettings, ColorSettings.defaults);
      expect(settings, AccessibilitySettings.defaults);
      expect(settings.isDefault, isTrue);
    });

    test('is a value type with a readable toString', () {
      const a = AccessibilitySettings(themeMode: AccessibilityThemeMode.dark);
      const b = AccessibilitySettings(themeMode: AccessibilityThemeMode.dark);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(AccessibilitySettings.defaults));
      expect(a.isDefault, isFalse);
      expect(a.toString(), contains('dark'));
    });

    test('copyWith keeps and replaces', () {
      const original = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.light,
        effectsMode: EffectsMode.enabled,
        textSettings: TextSettings(isBold: true),
        colorSettings: ColorSettings(backgroundColor: 0xFF000000),
      );
      expect(original.copyWith(), original);
      final changed = original.copyWith(
        themeMode: AccessibilityThemeMode.dark,
        effectsMode: EffectsMode.disabled,
        textSettings: const TextSettings(textScaleFactor: 2),
        colorSettings: const ColorSettings(
          colorProfile: ColorProfileLevel.monochrome,
        ),
      );
      expect(changed.themeMode, AccessibilityThemeMode.dark);
      expect(changed.effectsMode, EffectsMode.disabled);
      expect(changed.textSettings, const TextSettings(textScaleFactor: 2));
      expect(
        changed.colorSettings,
        const ColorSettings(colorProfile: ColorProfileLevel.monochrome),
      );
    });

    test('withThemeProfile applies the preset and keeps the theme mode', () {
      const original = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
        textSettings: TextSettings(letterSpacing: 3),
      );
      for (final level in ThemeProfileLevel.values) {
        final applied = original.withThemeProfile(level);
        final profile = ThemeProfile.fromLevel(level);
        expect(applied.themeMode, AccessibilityThemeMode.dark);
        expect(applied.textSettings, profile.textSettings);
        expect(applied.colorSettings, profile.colorSettings);
        expect(applied.effectsMode, profile.effectsMode);
      }
    });

    test('matchingThemeProfile finds the applied preset or none', () {
      expect(
        AccessibilitySettings.defaults.matchingThemeProfile,
        ThemeProfileLevel.none,
      );
      for (final level in ThemeProfileLevel.values) {
        expect(
          AccessibilitySettings.defaults
              .withThemeProfile(level)
              .matchingThemeProfile,
          level,
        );
      }
      final customised = AccessibilitySettings.defaults
          .withThemeProfile(ThemeProfileLevel.visionImpaired)
          .copyWith(textSettings: const TextSettings(textScaleFactor: 3));
      expect(customised.matchingThemeProfile, ThemeProfileLevel.none);
      const darkDefaults = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
      );
      expect(darkDefaults.matchingThemeProfile, ThemeProfileLevel.none);
    });

    test('withNextColorProfile cycles through every level and wraps', () {
      var settings = AccessibilitySettings.defaults;
      final seen = <ColorProfileLevel>[];
      for (var i = 0; i < ColorProfileLevel.values.length; i++) {
        settings = settings.withNextColorProfile();
        seen.add(settings.colorSettings.colorProfile);
      }
      expect(seen, [
        ColorProfileLevel.lowSaturation,
        ColorProfileLevel.highSaturation,
        ColorProfileLevel.monochrome,
        ColorProfileLevel.highContrast,
        ColorProfileLevel.normal,
      ]);
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/accessibility && dart test test/domain/models/accessibility_settings_test.dart ; cd ../..
```

Expected: compilation error, the file does not exist.

- [ ] **Step 3: Write the model**

`packages/accessibility/lib/src/domain/models/accessibility_settings.dart`:

```dart
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:accessibility/src/domain/models/theme_profile.dart';
import 'package:accessibility/src/domain/models/theme_profile_level.dart';
import 'package:meta/meta.dart';

/// Every accessibility setting of the application, as one immutable value.
@immutable
final class AccessibilitySettings {
  /// Creates settings. Every parameter is optional.
  const AccessibilitySettings({
    this.themeMode = AccessibilityThemeMode.system,
    this.effectsMode = EffectsMode.system,
    this.textSettings = TextSettings.defaults,
    this.colorSettings = ColorSettings.defaults,
  });

  /// The settings that follow the system and override nothing.
  static const defaults = AccessibilitySettings();

  /// The theme brightness.
  final AccessibilityThemeMode themeMode;

  /// Whether effects and animations are allowed.
  final EffectsMode effectsMode;

  /// The text settings.
  final TextSettings textSettings;

  /// The colour settings.
  final ColorSettings colorSettings;

  /// Whether these settings equal [defaults].
  bool get isDefault => this == defaults;

  /// The preset whose text, colour and effects values equal this instance,
  /// or [ThemeProfileLevel.none] when no preset matches.
  ///
  /// Derived on every call; never stored.
  ThemeProfileLevel get matchingThemeProfile {
    const candidates = [
      ThemeProfileLevel.seizureSafe,
      ThemeProfileLevel.visionImpaired,
      ThemeProfileLevel.adhdFriendly,
    ];
    for (final level in candidates) {
      final profile = ThemeProfile.fromLevel(level);
      if (textSettings == profile.textSettings &&
          colorSettings == profile.colorSettings &&
          effectsMode == profile.effectsMode) {
        return level;
      }
    }
    return ThemeProfileLevel.none;
  }

  /// Returns a copy with the given fields replaced.
  AccessibilitySettings copyWith({
    AccessibilityThemeMode? themeMode,
    EffectsMode? effectsMode,
    TextSettings? textSettings,
    ColorSettings? colorSettings,
  }) =>
      AccessibilitySettings(
        themeMode: themeMode ?? this.themeMode,
        effectsMode: effectsMode ?? this.effectsMode,
        textSettings: textSettings ?? this.textSettings,
        colorSettings: colorSettings ?? this.colorSettings,
      );

  /// Returns a copy whose text, colour and effects values are those of the
  /// [level] preset. [themeMode] is kept.
  AccessibilitySettings withThemeProfile(ThemeProfileLevel level) {
    final profile = ThemeProfile.fromLevel(level);
    return copyWith(
      textSettings: profile.textSettings,
      colorSettings: profile.colorSettings,
      effectsMode: profile.effectsMode,
    );
  }

  /// Returns a copy with the next [ColorProfileLevel], wrapping around.
  AccessibilitySettings withNextColorProfile() {
    const levels = ColorProfileLevel.values;
    final next = levels[(colorSettings.colorProfile.index + 1) % levels.length];
    return copyWith(colorSettings: colorSettings.copyWith(colorProfile: next));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessibilitySettings &&
          other.themeMode == themeMode &&
          other.effectsMode == effectsMode &&
          other.textSettings == textSettings &&
          other.colorSettings == colorSettings;

  @override
  int get hashCode =>
      Object.hash(themeMode, effectsMode, textSettings, colorSettings);

  @override
  String toString() => 'AccessibilitySettings('
      'themeMode: $themeMode, '
      'effectsMode: $effectsMode, '
      'textSettings: $textSettings, '
      'colorSettings: $colorSettings)';
}
```

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test test/domain/models && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add AccessibilitySettings with presets and profile cycling"
```

---

### Task 8: JSON serialisation

**Files:**
- Modify: `packages/accessibility/lib/src/domain/models/text_settings.dart`,
  `packages/accessibility/lib/src/domain/models/color_settings.dart`,
  `packages/accessibility/lib/src/domain/models/accessibility_settings.dart`
- Create: `packages/accessibility/lib/src/domain/models/json_reading.dart`
- Test: `packages/accessibility/test/domain/models/accessibility_settings_json_test.dart`,
  `packages/accessibility/test/domain/models/json_reading_test.dart`

**Interfaces:**
- Produces: `Map<String, Object?> toJson()` and `factory X.fromJson(Map<String, Object?> json)`
  on `TextSettings`, `ColorSettings`, `AccessibilitySettings`; helpers
  `double? readDouble(Map<String, Object?> json, String key)`,
  `int? readInt(...)`, `bool? readBool(...)`, `String? readString(...)`,
  `Map<String, Object?>? readMap(...)`.
- JSON shape: keys equal field names; enums by `name`; nested maps for
  `textSettings` and `colorSettings`; `null` for unset values.

- [ ] **Step 1: Write the failing tests**

`packages/accessibility/test/domain/models/json_reading_test.dart`:

```dart
import 'package:accessibility/src/domain/models/json_reading.dart';
import 'package:test/test.dart';

void main() {
  group('json reading helpers', () {
    const json = <String, Object?>{
      'aDouble': 1.5,
      'anInt': 2,
      'aBool': true,
      'aString': 'x',
      'aMap': <String, Object?>{'k': 1},
      'aNull': null,
    };

    test('readDouble accepts num and rejects the rest', () {
      expect(readDouble(json, 'aDouble'), 1.5);
      expect(readDouble(json, 'anInt'), 2.0);
      expect(readDouble(json, 'aString'), isNull);
      expect(readDouble(json, 'aNull'), isNull);
      expect(readDouble(json, 'missing'), isNull);
    });

    test('readInt accepts int only', () {
      expect(readInt(json, 'anInt'), 2);
      expect(readInt(json, 'aDouble'), isNull);
      expect(readInt(json, 'missing'), isNull);
    });

    test('readBool accepts bool only', () {
      expect(readBool(json, 'aBool'), isTrue);
      expect(readBool(json, 'aString'), isNull);
    });

    test('readString accepts String only', () {
      expect(readString(json, 'aString'), 'x');
      expect(readString(json, 'anInt'), isNull);
    });

    test('readMap accepts maps with string keys only', () {
      expect(readMap(json, 'aMap'), {'k': 1});
      expect(readMap(json, 'aString'), isNull);
    });
  });
}
```

`packages/accessibility/test/domain/models/accessibility_settings_json_test.dart`:

```dart
import 'dart:convert';

import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility/src/domain/models/color_profile_level.dart';
import 'package:accessibility/src/domain/models/color_settings.dart';
import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:accessibility/src/domain/models/text_align_mode.dart';
import 'package:accessibility/src/domain/models/text_settings.dart';
import 'package:test/test.dart';

void main() {
  const everythingSet = AccessibilitySettings(
    themeMode: AccessibilityThemeMode.dark,
    effectsMode: EffectsMode.disabled,
    textSettings: TextSettings(
      lineHeight: 1.5,
      wordSpacing: 2,
      letterSpacing: 0.5,
      textScaleFactor: 1.5,
      isBold: true,
      textAlign: TextAlignMode.justify,
      color: 0xFF112233,
      fontFamily: 'Andika',
    ),
    colorSettings: ColorSettings(
      backgroundColor: 0xFFFFFFF0,
      colorProfile: ColorProfileLevel.monochrome,
    ),
  );

  group('AccessibilitySettings JSON', () {
    test('toJson uses field names and enum names', () {
      expect(everythingSet.toJson(), {
        'themeMode': 'dark',
        'effectsMode': 'disabled',
        'textSettings': {
          'lineHeight': 1.5,
          'wordSpacing': 2.0,
          'letterSpacing': 0.5,
          'textScaleFactor': 1.5,
          'isBold': true,
          'textAlign': 'justify',
          'color': 0xFF112233,
          'fontFamily': 'Andika',
        },
        'colorSettings': {
          'backgroundColor': 0xFFFFFFF0,
          'colorProfile': 'monochrome',
        },
      });
    });

    test('defaults serialise with nulls for unset values', () {
      final json = AccessibilitySettings.defaults.toJson();
      expect(json['themeMode'], 'system');
      expect((json['textSettings']! as Map)['lineHeight'], isNull);
      expect((json['colorSettings']! as Map)['backgroundColor'], isNull);
    });

    test('round trips through dart:convert', () {
      final encoded = jsonEncode(everythingSet.toJson());
      final decoded = jsonDecode(encoded) as Map<String, Object?>;
      expect(AccessibilitySettings.fromJson(decoded), everythingSet);
      final defaultsDecoded =
          jsonDecode(jsonEncode(AccessibilitySettings.defaults.toJson()))
              as Map<String, Object?>;
      expect(
        AccessibilitySettings.fromJson(defaultsDecoded),
        AccessibilitySettings.defaults,
      );
    });

    test('fromJson falls back to defaults for missing keys', () {
      expect(
        AccessibilitySettings.fromJson(const {}),
        AccessibilitySettings.defaults,
      );
      expect(
        AccessibilitySettings.fromJson(const {'themeMode': 'light'}),
        const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
      );
    });

    test('fromJson falls back to defaults for unknown enum names', () {
      final settings = AccessibilitySettings.fromJson(const {
        'themeMode': 'sepia',
        'effectsMode': 'maybe',
        'textSettings': {'textAlign': 'diagonal'},
        'colorSettings': {'colorProfile': 'neon'},
      });
      expect(settings, AccessibilitySettings.defaults);
    });

    test('fromJson treats wrong types as missing', () {
      final settings = AccessibilitySettings.fromJson(const {
        'themeMode': 3,
        'textSettings': 'not a map',
        'colorSettings': {'backgroundColor': 'red'},
      });
      expect(settings, AccessibilitySettings.defaults);
    });

    test('fromJson reads integral doubles written by other platforms', () {
      final settings = AccessibilitySettings.fromJson(const {
        'textSettings': {'lineHeight': 2, 'textScaleFactor': 2},
      });
      expect(settings.textSettings.lineHeight, 2.0);
      expect(settings.textSettings.textScaleFactor, 2.0);
    });
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

```bash
cd packages/accessibility && dart test test/domain/models/json_reading_test.dart test/domain/models/accessibility_settings_json_test.dart ; cd ../..
```

Expected: compilation errors (`json_reading.dart` missing, `toJson` undefined).

- [ ] **Step 3: Write the helpers and add JSON to the three models**

`packages/accessibility/lib/src/domain/models/json_reading.dart`:

```dart
/// Tolerant readers for JSON maps: a missing key or a value of the wrong
/// type reads as `null`, so callers fall back to defaults.
library;

/// Reads [key] as a `double`; integral values are widened.
double? readDouble(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is num ? value.toDouble() : null;
}

/// Reads [key] as an `int`.
int? readInt(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is int ? value : null;
}

/// Reads [key] as a `bool`.
bool? readBool(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is bool ? value : null;
}

/// Reads [key] as a `String`.
String? readString(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is String ? value : null;
}

/// Reads [key] as a JSON object.
Map<String, Object?>? readMap(Map<String, Object?> json, String key) {
  final value = json[key];
  return value is Map<String, Object?> ? value : null;
}
```

Add to `TextSettings` (after `isDefault`; add the imports for
`enum_by_name.dart` and `json_reading.dart`):

```dart
  /// Creates settings from a JSON object produced by [toJson].
  ///
  /// Missing keys and values of the wrong type fall back to the defaults;
  /// unknown [textAlign] names fall back to [TextAlignMode.none].
  factory TextSettings.fromJson(Map<String, Object?> json) => TextSettings(
        lineHeight: readDouble(json, 'lineHeight'),
        wordSpacing: readDouble(json, 'wordSpacing'),
        letterSpacing: readDouble(json, 'letterSpacing'),
        textScaleFactor: readDouble(json, 'textScaleFactor') ??
            defaults.textScaleFactor,
        isBold: readBool(json, 'isBold') ?? defaults.isBold,
        textAlign: enumByName(
          TextAlignMode.values,
          json['textAlign'],
          fallback: defaults.textAlign,
        ),
        color: readInt(json, 'color'),
        fontFamily: readString(json, 'fontFamily'),
      );

  /// Serialises to a JSON object with one key per field.
  Map<String, Object?> toJson() => {
        'lineHeight': lineHeight,
        'wordSpacing': wordSpacing,
        'letterSpacing': letterSpacing,
        'textScaleFactor': textScaleFactor,
        'isBold': isBold,
        'textAlign': textAlign.name,
        'color': color,
        'fontFamily': fontFamily,
      };
```

Add to `ColorSettings` (same imports):

```dart
  /// Creates settings from a JSON object produced by [toJson].
  ///
  /// Missing keys and values of the wrong type fall back to the defaults;
  /// unknown [colorProfile] names fall back to [ColorProfileLevel.normal].
  factory ColorSettings.fromJson(Map<String, Object?> json) => ColorSettings(
        backgroundColor: readInt(json, 'backgroundColor'),
        colorProfile: enumByName(
          ColorProfileLevel.values,
          json['colorProfile'],
          fallback: defaults.colorProfile,
        ),
      );

  /// Serialises to a JSON object with one key per field.
  Map<String, Object?> toJson() => {
        'backgroundColor': backgroundColor,
        'colorProfile': colorProfile.name,
      };
```

Add to `AccessibilitySettings` (same imports):

```dart
  /// Creates settings from a JSON object produced by [toJson].
  ///
  /// Missing keys, values of the wrong type and unknown enum names fall
  /// back to [defaults].
  factory AccessibilitySettings.fromJson(Map<String, Object?> json) {
    final textJson = readMap(json, 'textSettings');
    final colorJson = readMap(json, 'colorSettings');
    return AccessibilitySettings(
      themeMode: enumByName(
        AccessibilityThemeMode.values,
        json['themeMode'],
        fallback: defaults.themeMode,
      ),
      effectsMode: enumByName(
        EffectsMode.values,
        json['effectsMode'],
        fallback: defaults.effectsMode,
      ),
      textSettings: textJson == null
          ? TextSettings.defaults
          : TextSettings.fromJson(textJson),
      colorSettings: colorJson == null
          ? ColorSettings.defaults
          : ColorSettings.fromJson(colorJson),
    );
  }

  /// Serialises to a JSON object: field names as keys, enums by name,
  /// nested objects for [textSettings] and [colorSettings].
  Map<String, Object?> toJson() => {
        'themeMode': themeMode.name,
        'effectsMode': effectsMode.name,
        'textSettings': textSettings.toJson(),
        'colorSettings': colorSettings.toJson(),
      };
```

Keep `sort_unnamed_constructors_first` happy: the unnamed `const`
constructor stays first, the `fromJson` factory follows it.

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add tolerant JSON serialisation to the settings models"
```

---

### Task 9: Storage service contract and repository status

**Files:**
- Create: `packages/accessibility/lib/src/data/services/accessibility_storage_service.dart`,
  `packages/accessibility/lib/src/data/repositories/accessibility_settings_status.dart`
- Test: `packages/accessibility/test/data/repositories/accessibility_settings_status_test.dart`

**Interfaces:**
- Produces: `abstract interface class AccessibilityStorageService` with
  `Future<AccessibilitySettings?> read()`,
  `Future<void> write(AccessibilitySettings settings)`, `Future<void> clear()`.
  `sealed class AccessibilitySettingsStatus` with const subclasses
  `AccessibilitySettingsIdle`, `AccessibilitySettingsLoading`,
  `AccessibilitySettingsLoaded`, and
  `AccessibilitySettingsLoadFailed(Exception error, StackTrace stackTrace)`.

- [ ] **Step 1: Write the failing test**

`packages/accessibility/test/data/repositories/accessibility_settings_status_test.dart`:

```dart
import 'package:accessibility/src/data/repositories/accessibility_settings_status.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibilitySettingsStatus', () {
    test('const statuses are canonical', () {
      expect(
        const AccessibilitySettingsIdle(),
        same(const AccessibilitySettingsIdle()),
      );
      expect(
        const AccessibilitySettingsLoading(),
        same(const AccessibilitySettingsLoading()),
      );
      expect(
        const AccessibilitySettingsLoaded(),
        same(const AccessibilitySettingsLoaded()),
      );
    });

    test('LoadFailed carries the error and describes it', () {
      final error = Exception('disk');
      final status = AccessibilitySettingsLoadFailed(
        error,
        StackTrace.current,
      );
      expect(status.error, same(error));
      expect(status.toString(), contains('disk'));
    });

    test('is exhaustively switchable', () {
      String describe(AccessibilitySettingsStatus status) => switch (status) {
            AccessibilitySettingsIdle() => 'idle',
            AccessibilitySettingsLoading() => 'loading',
            AccessibilitySettingsLoaded() => 'loaded',
            AccessibilitySettingsLoadFailed() => 'failed',
          };
      expect(describe(const AccessibilitySettingsIdle()), 'idle');
      expect(describe(const AccessibilitySettingsLoading()), 'loading');
      expect(describe(const AccessibilitySettingsLoaded()), 'loaded');
      expect(
        describe(
          AccessibilitySettingsLoadFailed(Exception(), StackTrace.empty),
        ),
        'failed',
      );
    });
  });
}
```

- [ ] **Step 2: Run the test to verify it fails**

```bash
cd packages/accessibility && dart test test/data ; cd ../..
```

Expected: compilation error, the file does not exist.

- [ ] **Step 3: Write the contract and the status**

`packages/accessibility/lib/src/data/services/accessibility_storage_service.dart`:

```dart
import 'package:accessibility/src/domain/models/accessibility_settings.dart';

/// Persists [AccessibilitySettings] in an external store.
///
/// Implementations wrap one storage technology (shared preferences, a
/// database, a file) and hold no state of their own. The
/// `accessibility_shared_preferences` package ships one; the
/// `accessibility_test` package ships a fake.
abstract interface class AccessibilityStorageService {
  /// Returns the stored settings, or `null` when nothing has been stored.
  Future<AccessibilitySettings?> read();

  /// Stores [settings], replacing any previous value.
  Future<void> write(AccessibilitySettings settings);

  /// Removes the stored settings.
  Future<void> clear();
}
```

`packages/accessibility/lib/src/data/repositories/accessibility_settings_status.dart`:

```dart
/// The outcome of the last load performed by the repository.
sealed class AccessibilitySettingsStatus {
  const AccessibilitySettingsStatus();
}

/// No load has been attempted yet.
final class AccessibilitySettingsIdle extends AccessibilitySettingsStatus {
  /// Creates the idle status.
  const AccessibilitySettingsIdle();
}

/// A load is in progress.
final class AccessibilitySettingsLoading extends AccessibilitySettingsStatus {
  /// Creates the loading status.
  const AccessibilitySettingsLoading();
}

/// The last load completed.
final class AccessibilitySettingsLoaded extends AccessibilitySettingsStatus {
  /// Creates the loaded status.
  const AccessibilitySettingsLoaded();
}

/// The last load failed; the settings in memory were kept.
final class AccessibilitySettingsLoadFailed
    extends AccessibilitySettingsStatus {
  /// Creates a failed status carrying the [error] and its [stackTrace].
  const AccessibilitySettingsLoadFailed(this.error, this.stackTrace);

  /// The exception thrown by the storage service.
  final Exception error;

  /// Where [error] was thrown.
  final StackTrace stackTrace;

  @override
  String toString() => 'AccessibilitySettingsLoadFailed($error)';
}
```

- [ ] **Step 4: Run the tests and analysis**

```bash
cd packages/accessibility && dart test && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean.

- [ ] **Step 5: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add the storage service contract and the load status"
```

---

### Task 10: The `accessibility_test` package

**Files:**
- Modify: `pubspec.yaml` (root, add the workspace member),
  `packages/accessibility/lib/accessibility.dart` (temporary exports needed
  by this package; the full barrel is finished in Task 12)
- Create: `packages/accessibility_test/pubspec.yaml`,
  `packages/accessibility_test/analysis_options.yaml`,
  `packages/accessibility_test/README.md`,
  `packages/accessibility_test/CHANGELOG.md`,
  `packages/accessibility_test/LICENSE`,
  `packages/accessibility_test/lib/accessibility_test.dart`,
  `packages/accessibility_test/lib/src/fake_accessibility_storage_service.dart`,
  `packages/accessibility_test/lib/src/accessibility_settings_samples.dart`
- Test: `packages/accessibility_test/test/fake_accessibility_storage_service_test.dart`,
  `packages/accessibility_test/test/accessibility_settings_samples_test.dart`

**Interfaces:**
- Consumes: `AccessibilityStorageService`, `AccessibilitySettings` and the
  models, through the public barrel of `accessibility`.
- Produces: `FakeAccessibilityStorageService({AccessibilitySettings? initial, Exception? readError, Exception? writeError, Exception? clearError})`
  with `AccessibilitySettings? get stored`, `List<String> get calls`, and
  the mutable `readError`, `writeError`, `clearError` fields;
  `AccessibilitySettingsSamples.seizureSafe`, `.visionImpaired`,
  `.adhdFriendly`, `.everythingSet`.

- [ ] **Step 1: Export the core API needed by the fake**

Replace `packages/accessibility/lib/accessibility.dart` with:

```dart
/// Pure Dart core of the accessibility package family.
///
/// Contains the settings models, the settings repository and the storage
/// service contract. UI, persistence, translations and fonts live in
/// sibling packages.
library;

export 'src/data/repositories/accessibility_settings_status.dart'
    show
        AccessibilitySettingsIdle,
        AccessibilitySettingsLoadFailed,
        AccessibilitySettingsLoaded,
        AccessibilitySettingsLoading,
        AccessibilitySettingsStatus;
export 'src/data/services/accessibility_storage_service.dart'
    show AccessibilityStorageService;
export 'src/domain/models/accessibility_settings.dart'
    show AccessibilitySettings;
export 'src/domain/models/accessibility_theme_mode.dart'
    show AccessibilityThemeMode;
export 'src/domain/models/accessible_font.dart' show AccessibleFont;
export 'src/domain/models/color_profile.dart' show ColorProfile;
export 'src/domain/models/color_profile_level.dart' show ColorProfileLevel;
export 'src/domain/models/color_settings.dart' show ColorSettings;
export 'src/domain/models/effects_mode.dart' show EffectsMode;
export 'src/domain/models/text_align_mode.dart' show TextAlignMode;
export 'src/domain/models/text_settings.dart' show TextSettings;
export 'src/domain/models/theme_profile.dart' show ThemeProfile;
export 'src/domain/models/theme_profile_level.dart' show ThemeProfileLevel;
```

(`AccessibilitySettingsRepository` is exported in Task 12 once it exists.)

- [ ] **Step 2: Create the package files**

`packages/accessibility_test/pubspec.yaml`:

```yaml
name: accessibility_test
description: Fake storage service and settings fixtures for testing code built on the accessibility package.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_test
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - testing
resolution: workspace

environment:
  sdk: ^3.12.0

dependencies:
  accessibility: ^2.0.0
  meta: ^1.16.0

dev_dependencies:
  coverage: ^1.11.0
  test: ^1.25.0
```

`packages/accessibility_test/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

Copy the licence: `cp LICENSE packages/accessibility_test/LICENSE`.

`packages/accessibility_test/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release: `FakeAccessibilityStorageService` with call recording
  and error injection, and `AccessibilitySettingsSamples` fixtures.
```

`packages/accessibility_test/README.md`:

```markdown
# accessibility_test

Test doubles for code built on the `accessibility` package.

- `FakeAccessibilityStorageService`: an in-memory
  `AccessibilityStorageService` that records every call and can be told to
  throw on `read`, `write` or `clear`.
- `AccessibilitySettingsSamples`: ready-made `AccessibilitySettings`
  values, one per theme profile preset plus one with every field set.

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

void main() {
  test('loads the stored settings', () async {
    final service = FakeAccessibilityStorageService(
      initial: AccessibilitySettingsSamples.visionImpaired,
    );
    final repository = AccessibilitySettingsRepository(service: service);
    await repository.load();
    expect(repository.settings.value, AccessibilitySettingsSamples.visionImpaired);
    expect(service.calls, ['read']);
  });
}
```
```

`packages/accessibility_test/lib/accessibility_test.dart`:

```dart
/// Test doubles for the accessibility package family.
library;

export 'src/accessibility_settings_samples.dart'
    show AccessibilitySettingsSamples;
export 'src/fake_accessibility_storage_service.dart'
    show FakeAccessibilityStorageService;
```

Add the member to the root `pubspec.yaml`:

```yaml
workspace:
  - packages/accessibility
  - packages/accessibility_test
```

Then resolve: `dart pub get` from the root.

- [ ] **Step 3: Write the failing tests**

`packages/accessibility_test/test/fake_accessibility_storage_service_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

void main() {
  group('FakeAccessibilityStorageService', () {
    test('starts empty and records reads', () async {
      final service = FakeAccessibilityStorageService();
      expect(await service.read(), isNull);
      expect(service.stored, isNull);
      expect(service.calls, ['read']);
    });

    test('returns the initial value and keeps writes', () async {
      const initial = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
      );
      final service = FakeAccessibilityStorageService(initial: initial);
      expect(await service.read(), initial);
      const written = AccessibilitySettings(effectsMode: EffectsMode.disabled);
      await service.write(written);
      expect(service.stored, written);
      expect(await service.read(), written);
      await service.clear();
      expect(service.stored, isNull);
      expect(service.calls, ['read', 'write', 'read', 'clear']);
    });

    test('throws the injected errors and still records the call', () async {
      final service = FakeAccessibilityStorageService(
        readError: Exception('read'),
        writeError: Exception('write'),
        clearError: Exception('clear'),
      );
      await expectLater(service.read(), throwsException);
      await expectLater(
        service.write(AccessibilitySettings.defaults),
        throwsException,
      );
      await expectLater(service.clear(), throwsException);
      expect(service.calls, ['read', 'write', 'clear']);
      expect(service.stored, isNull);
    });

    test('errors can be injected after construction', () async {
      final service = FakeAccessibilityStorageService()
        ..writeError = Exception('late');
      await expectLater(
        service.write(AccessibilitySettings.defaults),
        throwsException,
      );
      service.writeError = null;
      await service.write(AccessibilitySettings.defaults);
      expect(service.stored, AccessibilitySettings.defaults);
    });
  });
}
```

`packages/accessibility_test/test/accessibility_settings_samples_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibilitySettingsSamples', () {
    test('presets equal the core theme profiles', () {
      expect(
        AccessibilitySettingsSamples.seizureSafe,
        AccessibilitySettings.defaults
            .withThemeProfile(ThemeProfileLevel.seizureSafe),
      );
      expect(
        AccessibilitySettingsSamples.visionImpaired,
        AccessibilitySettings.defaults
            .withThemeProfile(ThemeProfileLevel.visionImpaired),
      );
      expect(
        AccessibilitySettingsSamples.adhdFriendly,
        AccessibilitySettings.defaults
            .withThemeProfile(ThemeProfileLevel.adhdFriendly),
      );
    });

    test('everythingSet has no default field', () {
      const sample = AccessibilitySettingsSamples.everythingSet;
      expect(sample.themeMode, isNot(AccessibilityThemeMode.system));
      expect(sample.effectsMode, isNot(EffectsMode.system));
      expect(sample.textSettings.lineHeight, isNotNull);
      expect(sample.textSettings.wordSpacing, isNotNull);
      expect(sample.textSettings.letterSpacing, isNotNull);
      expect(sample.textSettings.textScaleFactor, isNot(1.0));
      expect(sample.textSettings.isBold, isTrue);
      expect(sample.textSettings.textAlign, isNot(TextAlignMode.none));
      expect(sample.textSettings.color, isNotNull);
      expect(sample.textSettings.fontFamily, isNotNull);
      expect(sample.colorSettings.backgroundColor, isNotNull);
      expect(
        sample.colorSettings.colorProfile,
        isNot(ColorProfileLevel.normal),
      );
      expect(sample.matchingThemeProfile, ThemeProfileLevel.none);
    });
  });
}
```

- [ ] **Step 4: Run the tests to verify they fail**

```bash
cd packages/accessibility_test && dart test ; cd ../..
```

Expected: compilation errors, the `src` files do not exist.

- [ ] **Step 5: Write the fake and the samples**

`packages/accessibility_test/lib/src/fake_accessibility_storage_service.dart`:

```dart
import 'package:accessibility/accessibility.dart';

/// An in-memory [AccessibilityStorageService] that records its calls.
///
/// Set [readError], [writeError] or [clearError] to make the matching
/// method throw; the call is recorded before throwing.
final class FakeAccessibilityStorageService
    implements AccessibilityStorageService {
  /// Creates a fake holding [initial], which may be `null`.
  FakeAccessibilityStorageService({
    AccessibilitySettings? initial,
    this.readError,
    this.writeError,
    this.clearError,
  }) : _stored = initial;

  /// Thrown by [read] when non-null.
  Exception? readError;

  /// Thrown by [write] when non-null.
  Exception? writeError;

  /// Thrown by [clear] when non-null.
  Exception? clearError;

  AccessibilitySettings? _stored;

  final List<String> _calls = [];

  /// The value currently stored, or `null`.
  AccessibilitySettings? get stored => _stored;

  /// The names of the methods called so far, in order:
  /// `'read'`, `'write'`, `'clear'`.
  List<String> get calls => List.unmodifiable(_calls);

  @override
  Future<AccessibilitySettings?> read() async {
    _calls.add('read');
    final error = readError;
    if (error != null) {
      throw error;
    }
    return _stored;
  }

  @override
  Future<void> write(AccessibilitySettings settings) async {
    _calls.add('write');
    final error = writeError;
    if (error != null) {
      throw error;
    }
    _stored = settings;
  }

  @override
  Future<void> clear() async {
    _calls.add('clear');
    final error = clearError;
    if (error != null) {
      throw error;
    }
    _stored = null;
  }
}
```

`packages/accessibility_test/lib/src/accessibility_settings_samples.dart`:

```dart
import 'package:accessibility/accessibility.dart';

/// Ready-made [AccessibilitySettings] values for tests.
abstract final class AccessibilitySettingsSamples {
  /// The seizure-safe preset, equal to
  /// `AccessibilitySettings.defaults.withThemeProfile(ThemeProfileLevel.seizureSafe)`.
  static const seizureSafe = AccessibilitySettings(
    effectsMode: EffectsMode.disabled,
    colorSettings: ColorSettings(colorProfile: ColorProfileLevel.lowSaturation),
  );

  /// The vision-impaired preset, equal to
  /// `AccessibilitySettings.defaults.withThemeProfile(ThemeProfileLevel.visionImpaired)`.
  static const visionImpaired = AccessibilitySettings(
    textSettings: TextSettings(isBold: true, textScaleFactor: 2),
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// The ADHD-friendly preset, equal to
  /// `AccessibilitySettings.defaults.withThemeProfile(ThemeProfileLevel.adhdFriendly)`.
  static const adhdFriendly = AccessibilitySettings(
    effectsMode: EffectsMode.disabled,
    textSettings: TextSettings(textScaleFactor: 1.25),
    colorSettings: ColorSettings(
      colorProfile: ColorProfileLevel.highSaturation,
    ),
  );

  /// Every nullable field non-null and every enum at a non-default value.
  static const everythingSet = AccessibilitySettings(
    themeMode: AccessibilityThemeMode.dark,
    effectsMode: EffectsMode.disabled,
    textSettings: TextSettings(
      lineHeight: 1.5,
      wordSpacing: 2,
      letterSpacing: 0.5,
      textScaleFactor: 1.5,
      isBold: true,
      textAlign: TextAlignMode.justify,
      color: 0xFF112233,
      fontFamily: 'Andika',
    ),
    colorSettings: ColorSettings(
      backgroundColor: 0xFFFFFFF0,
      colorProfile: ColorProfileLevel.monochrome,
    ),
  );
}
```

- [ ] **Step 6: Run the tests and analysis of both packages**

```bash
cd packages/accessibility_test && dart test && dart analyze --fatal-infos --fatal-warnings . ; cd ../..
cd packages/accessibility && dart test && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass in both packages, analysis clean.

- [ ] **Step 7: Commit**

```bash
git add pubspec.yaml pubspec.lock packages/accessibility packages/accessibility_test
git commit -m "feat(test): add accessibility_test with a fake storage service and fixtures"
```

---

### Task 11: AccessibilitySettingsRepository

**Files:**
- Create: `packages/accessibility/lib/src/data/repositories/accessibility_settings_repository.dart`
- Modify: `packages/accessibility/pubspec.yaml` (dev dependency on `accessibility_test`)
- Test: `packages/accessibility/test/data/repositories/accessibility_settings_repository_test.dart`

**Interfaces:**
- Consumes: `AccessibilityStorageService`, `AccessibilitySettingsStatus`
  (Task 9), `FakeAccessibilityStorageService` (Task 10),
  `ValueNotifier`/`ValueListenable` from `package:listen`.
- Produces: `AccessibilitySettingsRepository({AccessibilityStorageService? service, AccessibilitySettings initial = AccessibilitySettings.defaults})`
  with `ValueListenable<AccessibilitySettings> get settings`,
  `ValueListenable<AccessibilitySettingsStatus> get status`,
  `Future<void> load()`, `Future<void> save(AccessibilitySettings)`,
  `Future<void> clear()`, `void dispose()`.

- [ ] **Step 1: Add the dev dependency**

In `packages/accessibility/pubspec.yaml` set:

```yaml
dev_dependencies:
  accessibility_test: ^2.0.0
  coverage: ^1.11.0
  test: ^1.25.0
```

Run `dart pub get` from the root. Expected: resolves; the workspace allows
the dev-dependency cycle between the two members.

- [ ] **Step 2: Write the failing tests**

`packages/accessibility/test/data/repositories/accessibility_settings_repository_test.dart`:

```dart
import 'dart:async';

import 'package:accessibility/src/data/repositories/accessibility_settings_repository.dart';
import 'package:accessibility/src/data/repositories/accessibility_settings_status.dart';
import 'package:accessibility/src/data/services/accessibility_storage_service.dart';
import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

/// A service whose read completes only when the test says so.
final class _GatedService implements AccessibilityStorageService {
  final Completer<AccessibilitySettings?> readCompleter = Completer();

  @override
  Future<AccessibilitySettings?> read() => readCompleter.future;

  @override
  Future<void> write(AccessibilitySettings settings) async {}

  @override
  Future<void> clear() async {}
}

void main() {
  const stored = AccessibilitySettings(themeMode: AccessibilityThemeMode.dark);
  const chosen = AccessibilitySettings(themeMode: AccessibilityThemeMode.light);

  group('AccessibilitySettingsRepository', () {
    test('starts with the initial value and the idle status', () {
      final repository = AccessibilitySettingsRepository(initial: chosen);
      expect(repository.settings.value, chosen);
      expect(repository.status.value, isA<AccessibilitySettingsIdle>());
      repository.dispose();
    });

    test('defaults the initial value', () {
      final repository = AccessibilitySettingsRepository();
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test('load without a service is loaded immediately', () async {
      final repository = AccessibilitySettingsRepository();
      await repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test('load applies the stored value and reports loading then loaded',
        () async {
      final service = FakeAccessibilityStorageService(initial: stored);
      final repository = AccessibilitySettingsRepository(service: service);
      final statuses = <AccessibilitySettingsStatus>[];
      repository.status.addListener(() => statuses.add(repository.status.value));
      await repository.load();
      expect(repository.settings.value, stored);
      expect(statuses, [
        isA<AccessibilitySettingsLoading>(),
        isA<AccessibilitySettingsLoaded>(),
      ]);
      expect(service.calls, ['read']);
      repository.dispose();
    });

    test('load keeps the current value when nothing is stored', () async {
      final service = FakeAccessibilityStorageService();
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: chosen,
      );
      await repository.load();
      expect(repository.settings.value, chosen);
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      repository.dispose();
    });

    test('load failure keeps the value and reports the error', () async {
      final error = Exception('disk');
      final service = FakeAccessibilityStorageService(readError: error);
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: chosen,
      );
      await repository.load();
      expect(repository.settings.value, chosen);
      final status = repository.status.value;
      expect(status, isA<AccessibilitySettingsLoadFailed>());
      expect((status as AccessibilitySettingsLoadFailed).error, same(error));
      repository.dispose();
    });

    test('load can be retried after a failure', () async {
      final service = FakeAccessibilityStorageService(
        initial: stored,
        readError: Exception('disk'),
      );
      final repository = AccessibilitySettingsRepository(service: service);
      await repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoadFailed>());
      service.readError = null;
      await repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      expect(repository.settings.value, stored);
      repository.dispose();
    });

    test('save updates synchronously, notifies once, then writes', () async {
      final service = FakeAccessibilityStorageService();
      final repository = AccessibilitySettingsRepository(service: service);
      var notifications = 0;
      repository.settings.addListener(() => notifications++);
      final pending = repository.save(chosen);
      expect(repository.settings.value, chosen);
      expect(notifications, 1);
      await pending;
      expect(service.stored, chosen);
      expect(service.calls, ['write']);
      repository.dispose();
    });

    test('save with an equal value does not notify', () async {
      final repository = AccessibilitySettingsRepository(initial: chosen);
      var notifications = 0;
      repository.settings.addListener(() => notifications++);
      await repository.save(chosen);
      expect(notifications, 0);
      repository.dispose();
    });

    test('save propagates write errors but keeps the value', () async {
      final service = FakeAccessibilityStorageService(
        writeError: Exception('full'),
      );
      final repository = AccessibilitySettingsRepository(service: service);
      await expectLater(repository.save(chosen), throwsException);
      expect(repository.settings.value, chosen);
      repository.dispose();
    });

    test('clear restores the defaults, notifies and clears the service',
        () async {
      final service = FakeAccessibilityStorageService(initial: stored);
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: stored,
      );
      var notifications = 0;
      repository.settings.addListener(() => notifications++);
      await repository.clear();
      expect(repository.settings.value, AccessibilitySettings.defaults);
      expect(notifications, 1);
      expect(service.stored, isNull);
      expect(service.calls, ['clear']);
      repository.dispose();
    });

    test('clear propagates errors but keeps the defaults', () async {
      final service = FakeAccessibilityStorageService(
        initial: stored,
        clearError: Exception('locked'),
      );
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: stored,
      );
      await expectLater(repository.clear(), throwsException);
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test('a save during an in-flight load wins over the loaded value',
        () async {
      final service = _GatedService();
      final repository = AccessibilitySettingsRepository(service: service);
      final loading = repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoading>());
      await repository.save(chosen);
      service.readCompleter.complete(stored);
      await loading;
      expect(repository.settings.value, chosen);
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      repository.dispose();
    });

    test('a clear during an in-flight load wins over the loaded value',
        () async {
      final service = _GatedService();
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: chosen,
      );
      final loading = repository.load();
      await repository.clear();
      service.readCompleter.complete(stored);
      await loading;
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test('dispose releases the listenables', () {
      final repository = AccessibilitySettingsRepository();
      repository.dispose();
      expect(
        () => repository.settings.addListener(() {}),
        throwsA(isA<Error>()),
      );
    });
  });
}
```

- [ ] **Step 3: Run the tests to verify they fail**

```bash
cd packages/accessibility && dart test test/data/repositories/accessibility_settings_repository_test.dart ; cd ../..
```

Expected: compilation error, the repository file does not exist.

- [ ] **Step 4: Write the repository**

`packages/accessibility/lib/src/data/repositories/accessibility_settings_repository.dart`:

```dart
import 'package:accessibility/src/data/repositories/accessibility_settings_status.dart';
import 'package:accessibility/src/data/services/accessibility_storage_service.dart';
import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:listen/listen.dart';

/// The single source of truth for the [AccessibilitySettings] of an app.
///
/// Holds the current settings in memory, exposes them as a listenable, and
/// persists them through an optional [AccessibilityStorageService]. Create
/// one per app, call [load] before the first frame, and pass it to the
/// view model of the UI layer.
final class AccessibilitySettingsRepository {
  /// Creates a repository.
  ///
  /// Without a [service] nothing is persisted. [initial] is the value held
  /// until [load] replaces it.
  AccessibilitySettingsRepository({
    AccessibilityStorageService? service,
    AccessibilitySettings initial = AccessibilitySettings.defaults,
  })  : _service = service,
        _settings = ValueNotifier(initial),
        _status = ValueNotifier(const AccessibilitySettingsIdle());

  final AccessibilityStorageService? _service;
  final ValueNotifier<AccessibilitySettings> _settings;
  final ValueNotifier<AccessibilitySettingsStatus> _status;

  /// Counts [save] and [clear] calls so that a [load] that was already in
  /// flight can tell that a newer user choice must win.
  int _mutations = 0;

  /// The current settings. Notifies when the value changes.
  ValueListenable<AccessibilitySettings> get settings => _settings;

  /// The outcome of the last [load]. Notifies when it changes.
  ValueListenable<AccessibilitySettingsStatus> get status => _status;

  /// Reads the stored settings from the service.
  ///
  /// Never throws. A stored value replaces [settings]; `null` keeps the
  /// current value; an [Exception] keeps the current value and sets
  /// [status] to [AccessibilitySettingsLoadFailed]. A [save] or [clear]
  /// performed while the read is in flight wins over the read value.
  Future<void> load() async {
    final service = _service;
    if (service == null) {
      _status.value = const AccessibilitySettingsLoaded();
      return;
    }
    _status.value = const AccessibilitySettingsLoading();
    final mutationsBefore = _mutations;
    try {
      final stored = await service.read();
      if (stored != null && mutationsBefore == _mutations) {
        _settings.value = stored;
      }
      _status.value = const AccessibilitySettingsLoaded();
    } on Exception catch (error, stackTrace) {
      _status.value = AccessibilitySettingsLoadFailed(error, stackTrace);
    }
  }

  /// Replaces the settings, notifies, then writes them to the service.
  ///
  /// The returned future completes when the write completes; a write error
  /// propagates to the caller while the in-memory value stays updated.
  Future<void> save(AccessibilitySettings settings) async {
    _mutations++;
    _settings.value = settings;
    final service = _service;
    if (service != null) {
      await service.write(settings);
    }
  }

  /// Restores [AccessibilitySettings.defaults], notifies, then clears the
  /// service. Errors propagate like in [save].
  Future<void> clear() async {
    _mutations++;
    _settings.value = AccessibilitySettings.defaults;
    final service = _service;
    if (service != null) {
      await service.clear();
    }
  }

  /// Releases the listenables. The repository must not be used afterwards.
  void dispose() {
    _settings.dispose();
    _status.dispose();
  }
}
```

- [ ] **Step 5: Run the tests and analysis**

```bash
cd packages/accessibility && dart test && dart analyze --fatal-infos --fatal-warnings lib/src test ; cd ../..
```

Expected: all tests pass, analysis clean. If the dispose test fails because
`listen`'s `ValueNotifier` does not throw after dispose in release mode,
run the tests with asserts enabled (the default for `dart test`) and check
that `listen` 1.0.1 asserts on use after dispose; if it does not, replace
that test's expectation with `expect(repository.dispose, returnsNormally)`
called before `dispose()` is invoked a first time and drop the
`addListener` assertion.

- [ ] **Step 6: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): add AccessibilitySettingsRepository with load status and persistence"
```

---

### Task 12: Public barrel, architecture test and publish dry run

**Files:**
- Modify: `packages/accessibility/lib/accessibility.dart`
- Create: `packages/accessibility/test/architecture_test.dart`,
  `packages/accessibility/test/public_api_test.dart`,
  `packages/accessibility/example/main.dart`

**Interfaces:**
- Produces: the final public API of `accessibility` 2.0.0 (spec section 5),
  verified free of Flutter imports and of `listen` re-exports.

- [ ] **Step 1: Write the failing tests**

`packages/accessibility/test/architecture_test.dart`:

```dart
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('lib/ never imports Flutter or dart:ui', () {
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
        if (isDirective &&
            (directive.contains("'package:flutter") ||
                directive.contains("'dart:ui"))) {
          offenders.add('${file.path}: $directive');
        }
      }
    }
    expect(offenders, isEmpty);
  });
}
```

`packages/accessibility/test/public_api_test.dart`:

```dart
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('the barrel does not re-export package:listen', () {
    final barrel = File('lib/accessibility.dart').readAsStringSync();
    expect(barrel, isNot(contains('package:listen')));
  });

  test('the barrel exports the repository', () {
    final barrel = File('lib/accessibility.dart').readAsStringSync();
    expect(barrel, contains('AccessibilitySettingsRepository'));
  });
}
```

- [ ] **Step 2: Run the tests to verify the second one fails**

```bash
cd packages/accessibility && dart test test/architecture_test.dart test/public_api_test.dart ; cd ../..
```

Expected: the architecture test passes; `the barrel exports the repository`
fails.

- [ ] **Step 3: Finish the barrel**

Replace `packages/accessibility/lib/accessibility.dart` with:

```dart
/// Pure Dart core of the accessibility package family.
///
/// Contains the settings models, the [AccessibilitySettingsRepository] and
/// the [AccessibilityStorageService] contract. UI, persistence,
/// translations and fonts live in sibling packages.
library;

export 'src/data/repositories/accessibility_settings_repository.dart'
    show AccessibilitySettingsRepository;
export 'src/data/repositories/accessibility_settings_status.dart'
    show
        AccessibilitySettingsIdle,
        AccessibilitySettingsLoadFailed,
        AccessibilitySettingsLoaded,
        AccessibilitySettingsLoading,
        AccessibilitySettingsStatus;
export 'src/data/services/accessibility_storage_service.dart'
    show AccessibilityStorageService;
export 'src/domain/models/accessibility_settings.dart'
    show AccessibilitySettings;
export 'src/domain/models/accessibility_theme_mode.dart'
    show AccessibilityThemeMode;
export 'src/domain/models/accessible_font.dart' show AccessibleFont;
export 'src/domain/models/color_profile.dart' show ColorProfile;
export 'src/domain/models/color_profile_level.dart' show ColorProfileLevel;
export 'src/domain/models/color_settings.dart' show ColorSettings;
export 'src/domain/models/effects_mode.dart' show EffectsMode;
export 'src/domain/models/text_align_mode.dart' show TextAlignMode;
export 'src/domain/models/text_settings.dart' show TextSettings;
export 'src/domain/models/theme_profile.dart' show ThemeProfile;
export 'src/domain/models/theme_profile_level.dart' show ThemeProfileLevel;
```

`enumByName` and the `json_reading.dart` helpers stay internal.

- [ ] **Step 4: Add the pub.dev example**

`packages/accessibility/example/main.dart`:

```dart
// ignore_for_file: avoid_print

import 'package:accessibility/accessibility.dart';

/// Stores the settings in memory; a real app uses
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
  final repository = AccessibilitySettingsRepository(
    service: InMemoryStorage(),
  );
  await repository.load();
  repository.settings.addListener(() {
    print('Settings changed: ${repository.settings.value}');
  });
  await repository.save(
    repository.settings.value.withThemeProfile(
      ThemeProfileLevel.visionImpaired,
    ),
  );
  print('Matching profile: ${repository.settings.value.matchingThemeProfile}');
  print('JSON: ${repository.settings.value.toJson()}');
  repository.dispose();
}
```

- [ ] **Step 5: Run everything, then the publish dry run**

```bash
cd packages/accessibility && dart test && dart analyze --fatal-infos --fatal-warnings . && dart run example/main.dart && dart pub publish --dry-run ; cd ../..
```

Expected: all tests pass; analysis clean including the barrel, whose doc
comment now references exported names, and the example; the example prints
the changed settings, `visionImpaired` and a JSON map; the dry run reports
`Package has 0 warnings` (a note about `resolution: workspace` is
acceptable, an error is not).

- [ ] **Step 6: Commit**

```bash
git add packages/accessibility
git commit -m "feat(core): finalise the public API with architecture and API tests"
```

---

### Task 13: Coverage tooling

**Files:**
- Create: `tool/check_coverage.dart`
- Modify: `pubspec.yaml` (root, melos scripts)

**Interfaces:**
- Produces: `dart ../../tool/check_coverage.dart coverage/lcov.info <min>`
  exits 0 when line coverage >= `<min>` percent, 1 otherwise; melos
  scripts `test:coverage` and `coverage:check`.

- [ ] **Step 1: Write the checker**

`tool/check_coverage.dart`:

```dart
import 'dart:io';

/// Fails when the line coverage of an LCOV file is below a minimum.
///
/// Usage: `dart tool/check_coverage.dart <lcov.info> <minimum-percent>`.
void main(List<String> arguments) {
  if (arguments.length != 2) {
    stderr.writeln(
      'Usage: dart tool/check_coverage.dart <lcov.info> <minimum-percent>',
    );
    exit(64);
  }
  final file = File(arguments[0]);
  if (!file.existsSync()) {
    stderr.writeln('No such file: ${arguments[0]}');
    exit(66);
  }
  final minimum = double.parse(arguments[1]);
  var found = 0;
  var hit = 0;
  for (final line in file.readAsLinesSync()) {
    if (line.startsWith('LF:')) {
      found += int.parse(line.substring(3));
    } else if (line.startsWith('LH:')) {
      hit += int.parse(line.substring(3));
    }
  }
  final percent = found == 0 ? 100.0 : hit * 100 / found;
  stdout.writeln(
    'Line coverage: ${percent.toStringAsFixed(2)}% ($hit/$found)',
  );
  if (percent < minimum) {
    stderr.writeln('Coverage is below the minimum of $minimum%.');
    exit(1);
  }
}
```

- [ ] **Step 2: Add the melos scripts**

In the root `pubspec.yaml`, extend `melos: scripts:` with:

```yaml
    test:coverage:
      description: Run the tests of every package with coverage output.
      run: melos exec -c 1 --dir-exists=test -- dart run coverage:test_with_coverage
    coverage:check:
      description: Fail when a gated package is below 100% line coverage.
      run: melos exec -c 1 --scope=accessibility --scope=accessibility_test -- dart ../../tool/check_coverage.dart coverage/lcov.info 100
```

- [ ] **Step 3: Run the coverage pipeline**

```bash
dart analyze --fatal-infos --fatal-warnings tool
melos run test:coverage
melos run coverage:check
```

Expected: both packages print `Line coverage: 100.00%`. If a package is
below 100, open `coverage/lcov.info` in that package, find the `DA:<line>,0`
entries, and add the missing test before continuing. Both packages were
written with every branch exercised by the tests above, so a gap points to
code that drifted from this plan.

- [ ] **Step 4: Commit**

```bash
git add tool pubspec.yaml
git commit -m "chore: add the coverage checker and melos coverage scripts"
```

---

### Task 14: CI workflow

**Files:**
- Modify: `.github/workflows/build.yml` (full rewrite)

**Interfaces:**
- Produces: a `build` workflow with a package matrix that formats,
  analyzes, tests with coverage, enforces the gate, uploads to Codecov with
  a per-package flag and runs pana where the package's dependencies are all
  published. The 1.x example jobs are removed; plan 6 adds the new examples.

- [ ] **Step 1: Rewrite the workflow**

`.github/workflows/build.yml`:

```yaml
name: build

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

on:
  pull_request:
  push:
    branches:
      - master
      - feat/accessibility-2-0

permissions:
  contents: read

jobs:
  packages:
    name: ${{ matrix.package }}
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        include:
          - package: accessibility
            coverage_gate: 100
            pana: true
          - package: accessibility_test
            coverage_gate: 100
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
    defaults:
      run:
        working-directory: packages/${{ matrix.package }}
    steps:
      - name: 🐦 Checkout
        uses: actions/checkout@v5

      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'

      - name: 📦 Resolving the workspace
        working-directory: .
        run: dart pub get

      - name: ✨ Making sure the package is formatted
        run: dart format --set-exit-if-changed .

      - name: 🔍 Making sure that there are no analysis warnings or errors
        run: dart analyze --fatal-infos --fatal-warnings .

      - name: 🧪 Test with coverage
        run: dart run coverage:test_with_coverage

      - name: 📊 Verify coverage
        run: dart ../../tool/check_coverage.dart coverage/lcov.info ${{ matrix.coverage_gate }}

      - name: ⬆️ Upload coverage
        uses: codecov/codecov-action@v3
        with:
          flags: ${{ matrix.package }}
          token: ${{ secrets.CODECOV_TOKEN }}
          fail_ci_if_error: true
          file: packages/${{ matrix.package }}/coverage/lcov.info

      - name: 💯 Verify pub score
        if: ${{ matrix.pana }}
        run: |
          set -e
          sudo apt-get -y install webp
          dart pub global activate pana
          copy=$(mktemp -d)/${{ matrix.package }}
          cp -r . "$copy"
          sed -i '/^resolution: workspace$/d' "$copy/pubspec.yaml"
          pana --no-warning --exit-code-threshold 0 "$copy"

  tooling:
    name: workspace tooling
    runs-on: ubuntu-latest
    steps:
      - name: 🐦 Checkout
        uses: actions/checkout@v5

      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'

      - name: 📦 Resolving the workspace
        run: dart pub get

      - name: ✨ Making sure the tooling is formatted
        run: dart format --set-exit-if-changed tool

      - name: 🔍 Analyzing the tooling
        run: dart analyze --fatal-infos --fatal-warnings tool
```

Pana runs on a copy without `resolution: workspace` so it resolves the
package like pub.dev will. `--exit-code-threshold 0` fails the step unless
every point is granted.

- [ ] **Step 2: Validate the workflow locally as far as possible**

```bash
dart pub get
cd packages/accessibility && dart format --set-exit-if-changed . && dart analyze --fatal-infos --fatal-warnings . && dart run coverage:test_with_coverage && dart ../../tool/check_coverage.dart coverage/lcov.info 100 ; cd ../..
cd packages/accessibility_test && dart format --set-exit-if-changed . && dart analyze --fatal-infos --fatal-warnings . && dart run coverage:test_with_coverage && dart ../../tool/check_coverage.dart coverage/lcov.info 100 ; cd ../..
```

Expected: every command exits 0. The pana step is exercised on CI; if
`--exit-code-threshold` is rejected by the installed pana, replace that
line with the 1.x score parsing:

```bash
          PANA=$(pana --no-warning "$copy"); SCORE=$(echo "$PANA" | sed -n "s/.*Points: \([0-9]*\)\/\([0-9]*\)./\1/p"); TOTAL=$(echo "$PANA" | sed -n "s/.*Points: \([0-9]*\)\/\([0-9]*\)./\2/p")
          echo "score: $SCORE/$TOTAL"
          if [ "$SCORE" -lt "$TOTAL" ]; then echo "pub score below maximum"; exit 1; fi
```

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/build.yml
git commit -m "ci: run a package matrix with coverage gates and pana"
```

- [ ] **Step 4: Hand over**

Tell the user the branch `feat/accessibility-2-0` is ready to push and that
opening a pull request from it is their call. Plan 2 (`flutter_accessibility`)
starts from this branch.

---

## Self-review against the spec

- **Section 3 (structure, rules):** Tasks 2, 10 and 12 create the two
  packages, the workspace, the architecture test and the no-`listen`-export
  test. Constraints and versions match section 3.2.
- **Section 4 (MVVM folders):** `domain/models`, `data/services`,
  `data/repositories` are used; no `ui/` in the core, as specified.
- **Section 5.1 to 5.5:** enums (Task 3), models with nullable fields and
  `copyWith` clearing (Task 4), profiles with the 1.x values (Task 5),
  `AccessibleFont` (Task 6), `AccessibilitySettings` with
  `matchingThemeProfile`, `withThemeProfile`, `withNextColorProfile`
  (Task 7), tolerant JSON (Task 8), the three-method service and the
  sealed status (Task 9), the repository with every listed semantic
  including the in-flight discard rule (Task 11), the architecture test
  (Task 12).
- **Section 10:** the fake with call recording and error injection, and
  the four samples with the drift test (Task 10).
- **Section 14 (testing):** both packages gated at 100% (Tasks 13, 14).
- **Section 15 (tooling, CI):** explicit workspace list, melos scripts,
  matrix workflow with Codecov flags and pana on a copy (Tasks 2, 13, 14).
  `gen-l10n` and Flutter-specific scripts arrive with plans 2 and 3.
- **Section 16.1:** branches `1.x` and `feat/accessibility-2-0` (Task 1).
- **Section 21:** every commit message above is conventional; no
  attribution trailers.
- **Deviations already folded into the spec:** `LoadFailed.error` is an
  `Exception` and only `Exception`s are caught; the workspace list is
  explicit; the integration branch is `feat/accessibility-2-0`.
