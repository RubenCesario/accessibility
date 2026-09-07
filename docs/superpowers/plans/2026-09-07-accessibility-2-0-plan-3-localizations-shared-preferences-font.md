# accessibility 2.0, Plan 3 of 6: `accessibility_localizations`, `accessibility_shared_preferences`, `accessibility_font_andika`

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver the three support packages of the family: the translations
with their delegate, the `shared_preferences` storage adapter that reads the
1.x keys, and the Andika font package, each wired into the workspace, melos
and CI.

**Architecture:** Three independent packages. `accessibility_localizations`
is generated code around 81 ARB files with the Material delegates stripped
out, so it depends on `flutter` and `intl` only. `accessibility_shared_preferences`
is the data layer's service implementation (MVVM: `data/services`), split
into a pure key-value codec and a thin service with two backends.
`accessibility_font_andika` is an asset package with one constant.

**Tech Stack:** Flutter >= 3.44 (`widgets.dart`, `services.dart`,
`flutter gen-l10n`), `intl` ^0.20.2, `shared_preferences` ^2.5.5,
`shared_preferences_platform_interface` ^2.4.2 (in-memory test backends),
`accessibility` 2.0.0, `accessibility_testing` 2.0.0, melos 7, GitHub
Actions.

**Spec:** `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
(sections 3, 7, 8, 9, 14, 15, 16 drive this plan).

**Plan series:** 1 foundation and core (merged, PR #13) · 2 `flutter_accessibility`
(merged, PRs #14 and #15) · 3 localizations, shared_preferences, font (this)
· 4 `accessibility_material` · 5 `accessibility_cupertino` · 6 examples,
deploy, docs, release.

## Global Constraints

- Dart SDK `^3.12.0`; Flutter `>=3.44.0` on every package of this plan.
  Dependencies: `accessibility_localizations` on `flutter` (sdk) and
  `intl: ^0.20.2` only (Flutter 3.44 pins `intl` 0.20.2 through
  `flutter_localizations`, so the caret keeps apps resolvable);
  `accessibility_shared_preferences` on `accessibility: ^2.0.0`, `flutter`
  (sdk) and `shared_preferences: ^2.5.5`; `accessibility_font_andika` on
  `accessibility: ^2.0.0` and `flutter` (sdk).
- No file under `lib/` of any package imports `package:flutter/material.dart`,
  `package:flutter/cupertino.dart`, `package:material_ui`,
  `package:cupertino_ui`, `package:listen` or
  `package:flutter_localizations` (enforced by a test in each package).
- Coverage: `accessibility_shared_preferences` at 100% line coverage under
  `tool/check_coverage.dart`; the other two packages have tests but no gate.
- Every public member documented; `package:` imports only under `lib/`;
  80-column lines (import URIs exempt); trailing commas;
  `prefer_expression_function_bodies`; `avoid_positional_boolean_parameters`;
  `use_named_constants`, `prefer_const_constructors`,
  `avoid_redundant_argument_values` (never pass a literal equal to the
  default); `dart analyze --fatal-infos --fatal-warnings` clean including
  `example/` and `test/`. Infos are fatal, so implementers add `const` where
  the analyzer asks and treat any such deviation from the plan's code as
  formatting. Generated code under `lib/src/generated/` is excluded from
  analysis by the root `analysis_options.yaml` but is still formatted.
- Generated localizations are committed. Regeneration is
  `dart run melos run gen-l10n` from the workspace root and must produce a
  clean tree (`git status --porcelain` empty) on the committed ARBs.
- Storage keys are the 1.x keys, unchanged (section 7 of the spec). New key:
  `effectsMode`.
- Commits follow Conventional Commits with the scopes `l10n`, `prefs` and
  `font`; branch names use conventional types. No `Co-Authored-By` trailer,
  no session link, no "generated with" line.
- Work happens on branch `feat/localizations-shared-preferences-font` (from
  `release/2.0`) in the worktree
  `.claude/worktrees/feat-flutter-accessibility`; the branch lands in
  `release/2.0` through a pull request.
- Git commands in this worktree are refused by the tooling when combined
  with other commands: every `git` invocation is its own plain Bash call
  (no `&&`, `;`, `|`, `$(...)`, heredocs or awk/sed on the same line).
  Never `git stash`. The 1.x sources live on branch `master`; files are
  brought over with `git checkout master -- <path>` (a plain command) and
  then moved.
- melos runs as `dart run melos run <script>` from the workspace root;
  dependency resolution is `flutter pub get` at the root.
- Flutter installed locally is 3.44.0 stable; CI uses the stable channel.

---

### Task 1: `accessibility_localizations` package, ARB migration and generation

**Files:**
- Create: `packages/accessibility_localizations/pubspec.yaml`,
  `packages/accessibility_localizations/analysis_options.yaml`,
  `packages/accessibility_localizations/.pubignore`,
  `packages/accessibility_localizations/LICENSE`,
  `packages/accessibility_localizations/CHANGELOG.md`,
  `packages/accessibility_localizations/README.md`,
  `packages/accessibility_localizations/l10n.yaml`,
  `packages/accessibility_localizations/lib/l10n/app_<locale>.arb` (81 files, from `master`),
  `packages/accessibility_localizations/lib/src/generated/*.dart` (generated),
  `packages/accessibility_localizations/lib/accessibility_localizations.dart`,
  `packages/accessibility_localizations/untranslated_messages.json` (generated),
  `tool/strip_l10n_delegates.dart`
- Modify: `pubspec.yaml` (root: `workspace:` list and a `gen-l10n` melos script)

**Interfaces:**
- Consumes: nothing from earlier plans (the package is self-contained).
- Produces: `AccessibilityLocalizations` with `of(BuildContext)`, `delegate`,
  `supportedLocales`, and one getter per ARB key in lowerCamelCase (for
  example `readMore`, `restoreSettings`, `themeProfileSeizureSafeTitle`,
  `settingsLoading`, `settingsLoadFailed`, `retry`) plus the three `select`
  methods `colorProfile(String profile)`, `color(String color)`,
  `themeProfile(String themeProfileName)`. Plans 4 and 5 call these names.

- [ ] **Step 1: Create the package files**

`packages/accessibility_localizations/pubspec.yaml`:

```yaml
name: accessibility_localizations
description: Translations of the accessibility settings panels in 81 languages, with the localizations delegate of the accessibility package family.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_localizations
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - localization
  - i18n
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  flutter:
    sdk: flutter
  intl: ^0.20.2

dev_dependencies:
  flutter_test:
    sdk: flutter
```

`packages/accessibility_localizations/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

`packages/accessibility_localizations/.pubignore`:

```
analysis_options.yaml
coverage/
untranslated_messages.json
```

Copy the licence: `cp LICENSE packages/accessibility_localizations/LICENSE`.

`packages/accessibility_localizations/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release, extracted from `accessibility` 1.x: the 81 translations of
  the settings panels as `AccessibilityLocalizations`, with keys renamed to
  lowerCamelCase, three new keys for the settings load status
  (`settingsLoading`, `settingsLoadFailed`, `retry`), and only this
  package's own delegate (add the Material or Cupertino delegates yourself).
```

`packages/accessibility_localizations/README.md`:

```markdown
# accessibility_localizations

The translations of the accessibility settings panels, in 81 languages. Used
by `accessibility_material` and `accessibility_cupertino`; add it directly
only when you build your own settings screen with the same strings.

## Usage

```dart
MaterialApp(
  localizationsDelegates: const [
    AccessibilityLocalizations.delegate,
    // plus the delegates of your design system, for example
    // GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: AccessibilityLocalizations.supportedLocales,
  // ...
);

// Anywhere below the app:
final l10n = AccessibilityLocalizations.of(context);
Text(l10n.restoreSettings);
```

The package depends on `flutter` and `intl` only; it does not pull in
`flutter_localizations`.
```

`packages/accessibility_localizations/l10n.yaml`:

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-dir: lib/src/generated
output-localization-file: accessibility_localizations.dart
output-class: AccessibilityLocalizations
nullable-getter: false
use-deferred-loading: true
untranslated-messages-file: untranslated_messages.json
format: true
```

`packages/accessibility_localizations/lib/accessibility_localizations.dart`:

```dart
/// Translations of the accessibility settings panels, with the
/// localizations delegate of the accessibility package family.
library;

export 'package:accessibility_localizations/src/generated/accessibility_localizations.dart'
    show AccessibilityLocalizations;
```

- [ ] **Step 2: Bring the ARB files over from 1.x**

Restore the 1.x directory into the working tree (plain git command; it also
stages the files):

```bash
git checkout master -- lib/src/core/l10n/locales
```

Then move them (non-git commands may be chained):

```bash
mkdir -p packages/accessibility_localizations/lib/l10n && mv lib/src/core/l10n/locales/*.arb packages/accessibility_localizations/lib/l10n/ && rm -rf lib
```

Unstage the old paths so nothing at the root is left in the index:

```bash
git reset -q -- lib
```

Expected: `ls packages/accessibility_localizations/lib/l10n | wc -l` prints
81; `ls lib` fails (no `lib` at the root); `git status --porcelain` shows
only untracked files under `packages/accessibility_localizations/`.

- [ ] **Step 3: Rename every key to lowerCamelCase**

The 1.x keys are snake_case (`read_more`, `theme_profile_seizure_safe_title`).
Generated Dart getters must be lowerCamelCase for a public 2.0 API. Write a
one-off script in the scratchpad directory (never in the repository), for
example `<scratchpad>/rename_arb_keys.dart`:

```dart
import 'dart:convert';
import 'dart:io';

String camel(String key) => key.replaceAllMapped(
  RegExp('_([a-z0-9])'),
  (match) => match[1]!.toUpperCase(),
);

void main(List<String> arguments) {
  final files = Directory(arguments[0])
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.arb'));
  for (final file in files) {
    final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
    final renamed = <String, Object?>{};
    for (final entry in json.entries) {
      final key = entry.key;
      if (key.startsWith('@@')) {
        renamed[key] = entry.value;
      } else if (key.startsWith('@')) {
        renamed['@${camel(key.substring(1))}'] = entry.value;
      } else {
        renamed[camel(key)] = entry.value;
      }
    }
    file.writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(renamed)}\n',
    );
  }
}
```

Run: `dart <scratchpad>/rename_arb_keys.dart packages/accessibility_localizations/lib/l10n`

Expected: `grep -c '"[a-z]*_[a-z_]*":' packages/accessibility_localizations/lib/l10n/app_en.arb`
prints 0; `grep -c '^  "[a-zA-Z]*":' packages/accessibility_localizations/lib/l10n/app_en.arb`
prints 70 (the `@@locale` line and the three `@` metadata entries are not
counted). Spot-check: `app_en.arb` contains `"readMore"`, `"colorProfile"`,
`"@colorProfile"`, `"themeProfileSeizureSafeTitle"`; the placeholder names
inside the three `select` messages (`profile`, `color`, `themeProfileName`)
are unchanged.

- [ ] **Step 4: Add the three status keys, translated in every locale**

Append to `packages/accessibility_localizations/lib/l10n/app_en.arb`, before
the closing brace (keep the file valid JSON with two-space indentation):

```json
  "settingsLoading": "Loading the accessibility settings…",
  "@settingsLoading": {
    "description": "Shown in the settings panel while the stored settings are being loaded"
  },
  "settingsLoadFailed": "The accessibility settings could not be loaded.",
  "@settingsLoadFailed": {
    "description": "Shown in the settings panel when loading the stored settings failed; a retry button follows"
  },
  "retry": "Retry",
  "@retry": {
    "description": "Label of the button that loads the stored settings again"
  }
```

Italian (`app_it.arb`), as the reference for the tone of the other
translations:

```json
  "settingsLoading": "Caricamento delle impostazioni di accessibilità…",
  "settingsLoadFailed": "Impossibile caricare le impostazioni di accessibilità.",
  "retry": "Riprova"
```

Add the three keys, translated into the locale's language, to each of the
other 79 ARB files (only the values; the `@` metadata lives in the template).
Use the existing translations in the same file as the reference for
register and terminology (for example how "accessibility settings" and
"settings" are already translated in that file). Every locale gets all
three keys: the parity test of Task 2 fails otherwise.

- [ ] **Step 5: Write the strip tool**

`tool/strip_l10n_delegates.dart`:

```dart
import 'dart:io';

const _import =
    "import 'package:flutter_localizations/flutter_localizations.dart';";
const _blockStart = '/// A list of this localizations delegate along with';

/// Removes the `flutter_localizations` import and the
/// `localizationsDelegates` list that `flutter gen-l10n` writes into the
/// generated localizations class, so the package exposes only its own
/// delegate and does not depend on the legacy Material and Cupertino
/// delegates.
///
/// Usage: `dart tool/strip_l10n_delegates.dart <generated-file>`.
void main(List<String> arguments) {
  if (arguments.length != 1) {
    stderr.writeln(
      'Usage: dart tool/strip_l10n_delegates.dart <generated-file>',
    );
    exit(64);
  }
  final file = File(arguments[0]);
  if (!file.existsSync()) {
    stderr.writeln('No such file: ${arguments[0]}');
    exit(66);
  }
  final output = <String>[];
  var skipping = false;
  var stripped = false;
  for (final line in file.readAsLinesSync()) {
    if (line == _import) {
      stripped = true;
      continue;
    }
    if (line.trimLeft().startsWith(_blockStart)) {
      skipping = true;
    }
    if (skipping) {
      if (line.trim() == '];') {
        skipping = false;
      }
      continue;
    }
    output.add(line);
  }
  if (!stripped) {
    stderr.writeln('No flutter_localizations import found in ${file.path}.');
    exit(1);
  }
  file.writeAsStringSync('${output.join('\n')}\n');
}
```

Run: `dart format --set-exit-if-changed tool && dart analyze --fatal-infos --fatal-warnings tool`
Expected: both clean.

- [ ] **Step 6: Register the package and the melos script**

In the root `pubspec.yaml`, extend the workspace list:

```yaml
workspace:
  - packages/accessibility
  - packages/accessibility_testing
  - packages/flutter_accessibility
  - packages/accessibility_localizations
```

Add the script under `melos: scripts:` after `format:`:

```yaml
    gen-l10n:
      description: Regenerate the localizations and strip the Material delegates.
      run: melos exec --scope=accessibility_localizations -- flutter gen-l10n && melos exec --scope=accessibility_localizations -- dart ../../tool/strip_l10n_delegates.dart lib/src/generated/accessibility_localizations.dart && melos exec --scope=accessibility_localizations -- dart format lib/src/generated
```

Run: `flutter pub get`
Expected: resolves; `packages/accessibility_localizations/.dart_tool` exists.

- [ ] **Step 7: Generate**

Run: `dart run melos run gen-l10n`

Expected: `packages/accessibility_localizations/lib/src/generated/` holds
`accessibility_localizations.dart` plus one `accessibility_localizations_<locale>.dart`
per locale (82 files); `untranslated_messages.json` at the package root
contains `{}`; the tool prints nothing on stderr.

Verify the strip:

```bash
grep -c "flutter_localizations\|GlobalMaterialLocalizations\|localizationsDelegates =" packages/accessibility_localizations/lib/src/generated/accessibility_localizations.dart
```

Expected: 0. (The class doc comment still mentions `localizationsDelegates`
in a usage example; that is documentation text, not code, and is
acceptable.)

Verify the generated files are not ignored (the root `.gitignore` has a
`lib/generated` pattern that is anchored to the repository root and must
not match):

```bash
git check-ignore -v packages/accessibility_localizations/lib/src/generated/accessibility_localizations.dart
```

Expected: exit code 1 and no output (not ignored). If it prints a rule,
stop and report: the ignore rule must be fixed, not bypassed with `-f`.

Verify idempotence: run `dart run melos run gen-l10n` a second time, then
`git status --porcelain` shows the same set of files as before (no
modification churn on the generated files).

- [ ] **Step 8: Format and analyze**

Run: `dart run melos run format && dart run melos run analyze`
Expected: both green for every package.

- [ ] **Step 9: Commit**

```bash
git add tool/strip_l10n_delegates.dart pubspec.yaml packages/accessibility_localizations
```

```bash
git commit -m "feat(l10n): add accessibility_localizations with the 1.x translations and its own delegate"
```

---

### Task 2: Localizations tests, example and CI entry

**Files:**
- Create: `packages/accessibility_localizations/test/architecture_test.dart`,
  `packages/accessibility_localizations/test/accessibility_localizations_test.dart`,
  `packages/accessibility_localizations/test/arb_consistency_test.dart`,
  `packages/accessibility_localizations/example/main.dart`
- Modify: `.github/workflows/build.yml`

**Interfaces:**
- Consumes: `AccessibilityLocalizations` from Task 1.
- Produces: a CI matrix entry without a coverage gate; the pattern
  `coverage_gate: 0` skips the gate and the upload.

- [ ] **Step 1: Write the architecture test**

`packages/accessibility_localizations/test/architecture_test.dart`:

```dart
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const forbidden = [
  'package:flutter/material.dart',
  'package:flutter/cupertino.dart',
  'package:material_ui',
  'package:cupertino_ui',
  'package:listen',
  'package:flutter_localizations',
];

void main() {
  test('lib depends on widgets.dart and intl only', () {
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

- [ ] **Step 2: Write the delegate tests**

`packages/accessibility_localizations/test/accessibility_localizations_test.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizations', () {
    test('supports 81 distinct language-only locales including en and it', () {
      final locales = AccessibilityLocalizations.supportedLocales;
      expect(locales, hasLength(81));
      expect(locales.toSet(), hasLength(81));
      expect(locales.every((locale) => locale.countryCode == null), isTrue);
      expect(locales, contains(const Locale('en')));
      expect(locales, contains(const Locale('it')));
    });

    test('the delegate loads every supported locale', () async {
      for (final locale in AccessibilityLocalizations.supportedLocales) {
        expect(AccessibilityLocalizations.delegate.isSupported(locale), isTrue);
        final l10n = await AccessibilityLocalizations.delegate.load(locale);
        expect(l10n.localeName, locale.languageCode, reason: '$locale');
        expect(l10n.retry, isNotEmpty, reason: '$locale');
      }
    });

    test('the delegate rejects an unsupported locale and never reloads', () {
      expect(
        AccessibilityLocalizations.delegate.isSupported(const Locale('xx')),
        isFalse,
      );
      expect(
        AccessibilityLocalizations.delegate.shouldReload(
          AccessibilityLocalizations.delegate,
        ),
        isFalse,
      );
    });

    test('exposes the status card strings in English', () async {
      final l10n = await AccessibilityLocalizations.delegate.load(
        const Locale('en'),
      );
      expect(l10n.settingsLoading, 'Loading the accessibility settings…');
      expect(
        l10n.settingsLoadFailed,
        'The accessibility settings could not be loaded.',
      );
      expect(l10n.retry, 'Retry');
    });

    test('the select messages fall back for unknown arguments', () async {
      final l10n = await AccessibilityLocalizations.delegate.load(
        const Locale('en'),
      );
      expect(l10n.colorProfile('monochrome'), 'Monochrome');
      expect(l10n.colorProfile('unknown'), 'Normal');
      expect(l10n.themeProfile('seizureSafe'), 'Seizure safe');
      expect(l10n.themeProfile('unknown'), 'Theme profile not recognized');
      expect(l10n.color('cF44336'), 'Red');
      expect(l10n.color('unknown'), 'Color not recognized');
    });

    testWidgets('of(context) resolves through a Localizations widget', (
      tester,
    ) async {
      String? resolved;
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('it'),
          delegates: const [
            AccessibilityLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          child: Builder(
            builder: (context) {
              resolved = AccessibilityLocalizations.of(context).accessibility;
              return const SizedBox();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(resolved, 'Accessibilità');
    });
  });
}
```

Note: deferred libraries load asynchronously; `pumpAndSettle` lets the
`Localizations` widget finish loading before the assertion. If the widget
test reports a null `resolved` after settling, use
`await tester.pump(const Duration(milliseconds: 100))` in a short loop until
`resolved != null` (at most ten iterations) and report it.

- [ ] **Step 3: Write the ARB parity test**

`packages/accessibility_localizations/test/arb_consistency_test.dart`:

```dart
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

Map<String, Object?> readArb(File file) =>
    jsonDecode(file.readAsStringSync()) as Map<String, Object?>;

Set<String> messageKeys(Map<String, Object?> arb) =>
    arb.keys.where((key) => !key.startsWith('@')).toSet();

void main() {
  final directory = Directory('lib/l10n');
  final files = directory
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.arb'))
      .toList();
  final template = readArb(File('lib/l10n/app_en.arb'));
  final templateKeys = messageKeys(template);

  test('there are 81 ARB files and the template has 73 messages', () {
    expect(files, hasLength(81));
    expect(templateKeys, hasLength(73));
  });

  test('every key is lowerCamelCase', () {
    final pattern = RegExp(r'^[a-z][a-zA-Z0-9]*$');
    for (final key in templateKeys) {
      expect(pattern.hasMatch(key), isTrue, reason: key);
    }
  });

  test('every ARB declares its locale and has exactly the template keys', () {
    for (final file in files) {
      final name = file.uri.pathSegments.last;
      final locale = name.substring('app_'.length, name.length - '.arb'.length);
      final arb = readArb(file);
      expect(arb['@@locale'], locale, reason: name);
      expect(messageKeys(arb), templateKeys, reason: name);
    }
  });

  test('the untranslated report is empty', () {
    final report = File('untranslated_messages.json').readAsStringSync();
    expect(jsonDecode(report), isEmpty);
  });
}
```

- [ ] **Step 4: Run the tests**

Run: `cd packages/accessibility_localizations && flutter test`
Expected: all tests pass. If the parity test lists a locale missing one of
the three new keys, add the translation to that file, rerun
`dart run melos run gen-l10n` from the workspace root, and rerun the tests.

- [ ] **Step 5: Write the example**

`packages/accessibility_localizations/example/main.dart`:

```dart
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const ExampleApp());

/// A design-system-free app that shows one translated string.
final class ExampleApp extends StatelessWidget {
  /// Creates the example app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
    color: const Color(0xFF6750A4),
    localizationsDelegates: const [AccessibilityLocalizations.delegate],
    supportedLocales: AccessibilityLocalizations.supportedLocales,
    builder: (context, child) => Center(
      child: Text(
        AccessibilityLocalizations.of(context).accessibilitySettings,
        style: const TextStyle(fontSize: 24, color: Color(0xFF1C1B1F)),
      ),
    ),
  );
}
```

Run: `cd packages/accessibility_localizations && dart analyze --fatal-infos --fatal-warnings .`
Expected: clean.

- [ ] **Step 6: Add the CI matrix entry and the gate condition**

In `.github/workflows/build.yml`, append to `matrix.include`:

```yaml
          - package: accessibility_localizations
            coverage_gate: 0
            pana: true
            test_command: flutter test --coverage
```

Make the two coverage steps conditional. Replace:

```yaml
      - name: 📊 Verify coverage
        run: dart ../../tool/check_coverage.dart coverage/lcov.info ${{ matrix.coverage_gate }}

      - name: ⬆️ Upload coverage
        uses: codecov/codecov-action@v5
```

with:

```yaml
      - name: 📊 Verify coverage
        if: ${{ matrix.coverage_gate > 0 }}
        run: dart ../../tool/check_coverage.dart coverage/lcov.info ${{ matrix.coverage_gate }}

      - name: ⬆️ Upload coverage
        if: ${{ matrix.coverage_gate > 0 }}
        uses: codecov/codecov-action@v5
```

- [ ] **Step 7: Dry run and commit**

Run: `cd packages/accessibility_localizations && dart pub publish --dry-run`
Expected: `Package has 0 warnings` (a note about `resolution: workspace` is
acceptable; warnings about files, the pubspec or the repository URL are
not).

```bash
git add packages/accessibility_localizations .github/workflows/build.yml
```

```bash
git commit -m "test(l10n): cover the delegate, the ARB parity and the architecture, and wire CI"
```

---

### Task 3: `accessibility_shared_preferences` package, keys and codec

**Files:**
- Create: `packages/accessibility_shared_preferences/pubspec.yaml`,
  `packages/accessibility_shared_preferences/analysis_options.yaml`,
  `packages/accessibility_shared_preferences/.pubignore`,
  `packages/accessibility_shared_preferences/LICENSE`,
  `packages/accessibility_shared_preferences/CHANGELOG.md`,
  `packages/accessibility_shared_preferences/README.md`,
  `packages/accessibility_shared_preferences/lib/src/data/services/preferences_keys.dart`,
  `packages/accessibility_shared_preferences/lib/src/data/services/preferences_codec.dart`
- Test: `packages/accessibility_shared_preferences/test/data/services/preferences_codec_test.dart`,
  `packages/accessibility_shared_preferences/test/architecture_test.dart`
- Modify: `pubspec.yaml` (root: `workspace:` list and `coverage:check` scope)

**Interfaces:**
- Consumes: `AccessibilitySettings`, `TextSettings`, `ColorSettings`,
  `AccessibilityThemeMode`, `EffectsMode`, `TextAlignMode`,
  `ColorProfileLevel` from `package:accessibility`;
  `AccessibilitySettingsSamples.everythingSet` from `accessibility_testing`.
- Produces: `AccessibilitySettings? settingsFromPreferences(Map<String, Object?> values)`,
  `Map<String, Object?> preferencesFromSettings(AccessibilitySettings settings)`
  (a `null` value means "remove the key"), and the key constants
  `PreferencesKeys.settings` and `PreferencesKeys.all`, used by Task 4.

- [ ] **Step 1: Create the package files**

`packages/accessibility_shared_preferences/pubspec.yaml`:

```yaml
name: accessibility_shared_preferences
description: Persists the accessibility settings with shared_preferences, reading the keys written by accessibility 1.x so stored settings survive the upgrade.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_shared_preferences
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - shared-preferences
  - storage
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  accessibility: ^2.0.0
  flutter:
    sdk: flutter
  shared_preferences: ^2.5.5

dev_dependencies:
  accessibility_testing: ^2.0.0
  flutter_test:
    sdk: flutter
  shared_preferences_platform_interface: ^2.4.2
```

`packages/accessibility_shared_preferences/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

`packages/accessibility_shared_preferences/.pubignore`:

```
analysis_options.yaml
coverage/
```

Copy the licence: `cp LICENSE packages/accessibility_shared_preferences/LICENSE`.

`packages/accessibility_shared_preferences/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release, extracted from `accessibility` 1.x:
  `SharedPreferencesAccessibilityStorageService`, an
  `AccessibilityStorageService` on `SharedPreferencesWithCache` (default) or
  on the legacy `SharedPreferences` API (`.legacy()`), reading the 1.x keys
  and sentinels so stored settings survive the upgrade, and storing the new
  `effectsMode` value with a fallback on the 1.x `hasNoEffects` boolean.
```

`packages/accessibility_shared_preferences/README.md`:

```markdown
# accessibility_shared_preferences

The `shared_preferences` storage adapter of the accessibility package
family. It implements `AccessibilityStorageService` from the core package
and reads the keys written by `accessibility` 1.x, so users keep their
settings after the upgrade.

## Usage

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(/* AccessibilityScope(...) from flutter_accessibility */);
}
```

`SharedPreferencesAccessibilityStorageService()` uses
`SharedPreferencesWithCache`. Apps whose 1.x settings were written through
`SharedPreferencesServiceLegacy` use
`SharedPreferencesAccessibilityStorageService.legacy()` instead: on Android
the two APIs store their values in different places.
```

The public barrel `lib/accessibility_shared_preferences.dart` is written in
Task 4 together with the service it exports; this task ships only `lib/src`.

- [ ] **Step 2: Register the package**

In the root `pubspec.yaml`, add `- packages/accessibility_shared_preferences`
to the `workspace:` list (after `accessibility_localizations`) and extend
the `coverage:check` script:

```yaml
      run: melos exec -c 1 --scope=accessibility --scope=accessibility_testing --scope=flutter_accessibility --scope=accessibility_shared_preferences -- dart ../../tool/check_coverage.dart coverage/lcov.info 100
```

Run: `flutter pub get`
Expected: resolves, `shared_preferences` 2.5.x and
`shared_preferences_platform_interface` 2.4.x in `pubspec.lock`.

- [ ] **Step 3: Write the keys**

`packages/accessibility_shared_preferences/lib/src/data/services/preferences_keys.dart`:

```dart
/// The `shared_preferences` keys, unchanged from `accessibility` 1.x so
/// that stored settings survive the upgrade.
///
/// The names of the two legacy keys are misleading: `isDarkMode` holds the
/// name of the theme mode and `hasNoEffects` holds whether effects are
/// allowed, both exactly as 1.x wrote them.
abstract final class PreferencesKeys {
  /// The theme mode name (`system`, `light`, `dark`).
  static const themeMode = 'isDarkMode';

  /// The effects mode name (`system`, `enabled`, `disabled`). New in 2.0.
  static const effectsMode = 'effectsMode';

  /// The 1.x boolean: `true` when effects were allowed. Read only.
  static const legacyEffectsAllowed = 'hasNoEffects';

  /// The text scale factor, a double.
  static const textScaleFactor = 'textAccessibilitySettingScaleFactor';

  /// The line height, a double; `-1.0` meant unset in 1.x.
  static const lineHeight = 'textAccessibilitySettingLineHeight';

  /// The letter spacing, a double; `-1.0` meant unset in 1.x.
  static const letterSpacing = 'textAccessibilitySettingLetterSpacing';

  /// The word spacing, a double; `-1.0` meant unset in 1.x.
  static const wordSpacing = 'textAccessibilitySettingWordSpacing';

  /// Whether text is bold, a boolean.
  static const isBold = 'textAccessibilitySettingFontWeight';

  /// The text alignment name; `none` means no override.
  static const textAlign = 'textAccessibilitySettingAlignment';

  /// The text colour as an ARGB integer; `0` meant unset in 1.x.
  static const textColor = 'textColorSetting';

  /// The font family; `''` meant unset in 1.x.
  static const fontFamily = 'textAccessibilitySettingFontFamily';

  /// The page background colour as an ARGB integer; `0` meant unset in 1.x.
  static const backgroundColor = 'pagesBackgroundColorSetting';

  /// The colour profile name.
  static const colorProfile = 'colorProfileSetting';

  /// A 1.x key that is never read: the profile is derived from the values.
  static const legacyThemeProfile = 'themeProfileSetting';

  /// A 1.x key that is never read: a first-launch flag.
  static const legacyFirstTimeOpened = 'isFirstTimeOpened';

  /// The keys that carry settings. Reading returns `null` when none is
  /// present.
  static const settings = <String>{
    themeMode,
    effectsMode,
    legacyEffectsAllowed,
    textScaleFactor,
    lineHeight,
    letterSpacing,
    wordSpacing,
    isBold,
    textAlign,
    textColor,
    fontFamily,
    backgroundColor,
    colorProfile,
  };

  /// Every key this package or 1.x ever wrote; all removed by `clear()`.
  static const all = <String>{
    ...settings,
    legacyThemeProfile,
    legacyFirstTimeOpened,
  };
}
```

- [ ] **Step 4: Write the failing codec tests**

`packages/accessibility_shared_preferences/test/data/services/preferences_codec_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_codec.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';

/// What a 1.x install looks like after the user touched nothing but the
/// first-launch flag: every setting at its stored default and sentinel.
const untouchedOneX = <String, Object?>{
  PreferencesKeys.legacyFirstTimeOpened: false,
  PreferencesKeys.themeMode: 'system',
  PreferencesKeys.legacyEffectsAllowed: true,
  PreferencesKeys.textScaleFactor: 1.0,
  PreferencesKeys.lineHeight: -1.0,
  PreferencesKeys.letterSpacing: -1.0,
  PreferencesKeys.wordSpacing: -1.0,
  PreferencesKeys.isBold: false,
  PreferencesKeys.textAlign: 'none',
  PreferencesKeys.textColor: 0,
  PreferencesKeys.fontFamily: '',
  PreferencesKeys.backgroundColor: 0,
  PreferencesKeys.colorProfile: 'normal',
  PreferencesKeys.legacyThemeProfile: 'none',
};

void main() {
  group('settingsFromPreferences', () {
    test('returns null when no settings key is present', () {
      expect(settingsFromPreferences(const {}), isNull);
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.legacyFirstTimeOpened: false,
          PreferencesKeys.legacyThemeProfile: 'seizureSafe',
          'someone_elses_key': 1,
        }),
        isNull,
      );
    });

    test('maps the 1.x defaults and sentinels to the default settings', () {
      expect(
        settingsFromPreferences(untouchedOneX),
        AccessibilitySettings.defaults,
      );
    });

    test('maps every 1.x value', () {
      final settings = settingsFromPreferences(const {
        PreferencesKeys.themeMode: 'dark',
        PreferencesKeys.legacyEffectsAllowed: false,
        PreferencesKeys.textScaleFactor: 1.5,
        PreferencesKeys.lineHeight: 1.8,
        PreferencesKeys.letterSpacing: 0.5,
        PreferencesKeys.wordSpacing: 2.0,
        PreferencesKeys.isBold: true,
        PreferencesKeys.textAlign: 'justify',
        PreferencesKeys.textColor: 0xFF112233,
        PreferencesKeys.fontFamily: 'Andika',
        PreferencesKeys.backgroundColor: 0xFFFFFFFF,
        PreferencesKeys.colorProfile: 'monochrome',
      });
      expect(
        settings,
        const AccessibilitySettings(
          themeMode: AccessibilityThemeMode.dark,
          effectsMode: EffectsMode.disabled,
          textSettings: TextSettings(
            textScaleFactor: 1.5,
            lineHeight: 1.8,
            letterSpacing: 0.5,
            wordSpacing: 2,
            isBold: true,
            textAlign: TextAlignMode.justify,
            color: 0xFF112233,
            fontFamily: 'Andika',
          ),
          colorSettings: ColorSettings(
            backgroundColor: 0xFFFFFFFF,
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
    });

    test('maps the 1.x effects boolean when effectsMode is absent', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.legacyEffectsAllowed: true,
        })?.effectsMode,
        EffectsMode.enabled,
      );
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.legacyEffectsAllowed: false,
        })?.effectsMode,
        EffectsMode.disabled,
      );
    });

    test('prefers effectsMode over the 1.x boolean', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.effectsMode: 'system',
          PreferencesKeys.legacyEffectsAllowed: false,
        })?.effectsMode,
        EffectsMode.system,
      );
    });

    test('falls back to system effects when neither key is present', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.themeMode: 'light',
        })?.effectsMode,
        EffectsMode.system,
      );
    });

    test('accepts integers where doubles are expected', () {
      final settings = settingsFromPreferences(const {
        PreferencesKeys.textScaleFactor: 2,
        PreferencesKeys.lineHeight: 2,
      });
      expect(settings?.textSettings.textScaleFactor, 2.0);
      expect(settings?.textSettings.lineHeight, 2.0);
    });

    test('falls back to the defaults on unknown names and wrong types', () {
      final settings = settingsFromPreferences(const {
        PreferencesKeys.themeMode: 'sepia',
        PreferencesKeys.effectsMode: 42,
        PreferencesKeys.textScaleFactor: 'big',
        PreferencesKeys.lineHeight: true,
        PreferencesKeys.isBold: 'yes',
        PreferencesKeys.textAlign: 'diagonal',
        PreferencesKeys.textColor: 'red',
        PreferencesKeys.fontFamily: 7,
        PreferencesKeys.backgroundColor: 1.5,
        PreferencesKeys.colorProfile: 'vivid',
      });
      expect(settings, AccessibilitySettings.defaults);
    });

    test('effectsMode of the wrong type ignores the 1.x boolean', () {
      expect(
        settingsFromPreferences(const {
          PreferencesKeys.effectsMode: 42,
          PreferencesKeys.legacyEffectsAllowed: false,
        })?.effectsMode,
        EffectsMode.system,
      );
    });
  });

  group('preferencesFromSettings', () {
    test('writes every field and removes the unset ones', () {
      expect(preferencesFromSettings(AccessibilitySettings.defaults), const {
        PreferencesKeys.themeMode: 'system',
        PreferencesKeys.effectsMode: 'system',
        PreferencesKeys.textScaleFactor: 1.0,
        PreferencesKeys.lineHeight: null,
        PreferencesKeys.letterSpacing: null,
        PreferencesKeys.wordSpacing: null,
        PreferencesKeys.isBold: false,
        PreferencesKeys.textAlign: 'none',
        PreferencesKeys.textColor: null,
        PreferencesKeys.fontFamily: null,
        PreferencesKeys.backgroundColor: null,
        PreferencesKeys.colorProfile: 'normal',
      });
    });

    test('round-trips a fully set value', () {
      const settings = AccessibilitySettingsSamples.everythingSet;
      final values = preferencesFromSettings(settings);
      expect(values.values, everyElement(isNotNull));
      expect(settingsFromPreferences(values), settings);
    });

    test('never writes the legacy keys', () {
      final keys = preferencesFromSettings(
        AccessibilitySettingsSamples.everythingSet,
      ).keys;
      expect(keys, isNot(contains(PreferencesKeys.legacyEffectsAllowed)));
      expect(keys, isNot(contains(PreferencesKeys.legacyThemeProfile)));
      expect(keys, isNot(contains(PreferencesKeys.legacyFirstTimeOpened)));
      expect(PreferencesKeys.all, containsAll(keys));
    });
  });
}
```

Note: the "effectsMode of the wrong type" case pins the choice that a
present-but-invalid `effectsMode` means "2.0 has written here", so the 1.x
boolean is not consulted.

- [ ] **Step 5: Run the tests to verify they fail**

Run: `cd packages/accessibility_shared_preferences && flutter test test/data/services/preferences_codec_test.dart`
Expected: compilation error, `preferences_codec.dart` not found.

- [ ] **Step 6: Write the codec**

`packages/accessibility_shared_preferences/lib/src/data/services/preferences_codec.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';

/// Builds the settings from stored key-value pairs, translating the 1.x
/// sentinels (`-1.0`, `0`, `''`, `none`) and the 1.x effects boolean.
///
/// Returns `null` when none of [PreferencesKeys.settings] is present.
/// Values of the wrong type and unknown enum names fall back to the
/// defaults, like the JSON codec of the core.
AccessibilitySettings? settingsFromPreferences(Map<String, Object?> values) {
  if (!PreferencesKeys.settings.any(values.containsKey)) {
    return null;
  }
  return AccessibilitySettings(
    themeMode: _enumByName(
      AccessibilityThemeMode.values,
      values[PreferencesKeys.themeMode],
      fallback: AccessibilityThemeMode.system,
    ),
    effectsMode: _effectsMode(values),
    textSettings: TextSettings(
      textScaleFactor:
          _double(values[PreferencesKeys.textScaleFactor]) ??
          TextSettings.defaults.textScaleFactor,
      lineHeight: _unsetBelowZero(values[PreferencesKeys.lineHeight]),
      letterSpacing: _unsetBelowZero(values[PreferencesKeys.letterSpacing]),
      wordSpacing: _unsetBelowZero(values[PreferencesKeys.wordSpacing]),
      isBold: _bool(values[PreferencesKeys.isBold]) ??
          TextSettings.defaults.isBold,
      textAlign: _enumByName(
        TextAlignMode.values,
        values[PreferencesKeys.textAlign],
        fallback: TextAlignMode.none,
      ),
      color: _color(values[PreferencesKeys.textColor]),
      fontFamily: _nonEmptyString(values[PreferencesKeys.fontFamily]),
    ),
    colorSettings: ColorSettings(
      backgroundColor: _color(values[PreferencesKeys.backgroundColor]),
      colorProfile: _enumByName(
        ColorProfileLevel.values,
        values[PreferencesKeys.colorProfile],
        fallback: ColorProfileLevel.normal,
      ),
    ),
  );
}

/// The key-value pairs that store [settings].
///
/// A `null` value means the key must be removed, so an unset field never
/// leaves a stale value behind. The legacy keys are never written.
Map<String, Object?> preferencesFromSettings(AccessibilitySettings settings) {
  final text = settings.textSettings;
  final color = settings.colorSettings;
  return {
    PreferencesKeys.themeMode: settings.themeMode.name,
    PreferencesKeys.effectsMode: settings.effectsMode.name,
    PreferencesKeys.textScaleFactor: text.textScaleFactor,
    PreferencesKeys.lineHeight: text.lineHeight,
    PreferencesKeys.letterSpacing: text.letterSpacing,
    PreferencesKeys.wordSpacing: text.wordSpacing,
    PreferencesKeys.isBold: text.isBold,
    PreferencesKeys.textAlign: text.textAlign.name,
    PreferencesKeys.textColor: text.color,
    PreferencesKeys.fontFamily: text.fontFamily,
    PreferencesKeys.backgroundColor: color.backgroundColor,
    PreferencesKeys.colorProfile: color.colorProfile.name,
  };
}

EffectsMode _effectsMode(Map<String, Object?> values) {
  final stored = values[PreferencesKeys.effectsMode];
  if (values.containsKey(PreferencesKeys.effectsMode)) {
    return _enumByName(
      EffectsMode.values,
      stored,
      fallback: EffectsMode.system,
    );
  }
  return switch (_bool(values[PreferencesKeys.legacyEffectsAllowed])) {
    true => EffectsMode.enabled,
    false => EffectsMode.disabled,
    null => EffectsMode.system,
  };
}

T _enumByName<T extends Enum>(
  List<T> values,
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

double? _double(Object? value) => value is num ? value.toDouble() : null;

/// A double that 1.x stored as `-1.0` when unset.
double? _unsetBelowZero(Object? value) {
  final parsed = _double(value);
  return parsed == null || parsed < 0 ? null : parsed;
}

bool? _bool(Object? value) => value is bool ? value : null;

/// An ARGB colour that 1.x stored as `0` when unset.
int? _color(Object? value) => value is int && value != 0 ? value : null;

String? _nonEmptyString(Object? value) =>
    value is String && value.isNotEmpty ? value : null;
```

Note on `_unsetBelowZero`: 1.x wrote exactly `-1.0` as the sentinel, and
the panels never produced a negative spacing or height, so any negative
value is treated as unset rather than only `-1.0`.

- [ ] **Step 7: Run the tests to verify they pass**

Run: `cd packages/accessibility_shared_preferences && flutter test test/data/services/preferences_codec_test.dart && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: all tests pass, analysis clean, formatted.

- [ ] **Step 8: Write the architecture test**

`packages/accessibility_shared_preferences/test/architecture_test.dart`:

```dart
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const forbidden = [
  'package:flutter/material.dart',
  'package:flutter/cupertino.dart',
  'package:flutter/widgets.dart',
  'package:material_ui',
  'package:cupertino_ui',
  'package:listen',
];

void main() {
  test('lib knows nothing about widgets', () {
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

Run: `cd packages/accessibility_shared_preferences && flutter test test/architecture_test.dart`
Expected: passes.

- [ ] **Step 9: Commit**

```bash
git add pubspec.yaml packages/accessibility_shared_preferences
```

```bash
git commit -m "feat(prefs): add accessibility_shared_preferences with the 1.x key codec"
```

---

### Task 4: `SharedPreferencesAccessibilityStorageService` with both backends

**Files:**
- Create: `packages/accessibility_shared_preferences/lib/accessibility_shared_preferences.dart`,
  `packages/accessibility_shared_preferences/lib/src/data/services/shared_preferences_accessibility_storage_service.dart`,
  `packages/accessibility_shared_preferences/example/main.dart`
- Test: `packages/accessibility_shared_preferences/test/data/services/shared_preferences_accessibility_storage_service_test.dart`,
  `packages/accessibility_shared_preferences/test/public_api_test.dart`
- Modify: `.github/workflows/build.yml`

**Interfaces:**
- Consumes: `settingsFromPreferences`, `preferencesFromSettings`,
  `PreferencesKeys.all` from Task 3; `SharedPreferencesWithCache`,
  `SharedPreferencesWithCacheOptions`, `SharedPreferencesOptions`,
  `SharedPreferences` from `package:shared_preferences`.
- Produces: `SharedPreferencesAccessibilityStorageService({SharedPreferencesOptions options = const SharedPreferencesOptions()})`
  and `SharedPreferencesAccessibilityStorageService.legacy()`, both
  implementing `AccessibilityStorageService`. The spec's constructor took a
  `cacheOptions` parameter; it is replaced by `options` because the allow
  list must belong to the service (recorded in the spec by Task 6).

- [ ] **Step 1: Write the failing tests**

`packages/accessibility_shared_preferences/test/data/services/shared_preferences_accessibility_storage_service_test.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:shared_preferences_platform_interface/types.dart';

/// A 1.x install with a few changed values and both write-only keys.
const oneXValues = <String, Object>{
  PreferencesKeys.legacyFirstTimeOpened: false,
  PreferencesKeys.legacyThemeProfile: 'visionImpaired',
  PreferencesKeys.themeMode: 'light',
  PreferencesKeys.legacyEffectsAllowed: false,
  PreferencesKeys.textScaleFactor: 2.0,
  PreferencesKeys.lineHeight: -1.0,
  PreferencesKeys.letterSpacing: -1.0,
  PreferencesKeys.wordSpacing: -1.0,
  PreferencesKeys.isBold: true,
  PreferencesKeys.textAlign: 'none',
  PreferencesKeys.textColor: 0,
  PreferencesKeys.fontFamily: '',
  PreferencesKeys.backgroundColor: 0,
  PreferencesKeys.colorProfile: 'highSaturation',
};

const oneXSettings = AccessibilitySettings(
  themeMode: AccessibilityThemeMode.light,
  effectsMode: EffectsMode.disabled,
  textSettings: TextSettings(textScaleFactor: 2, isBold: true),
  colorSettings: ColorSettings(colorProfile: ColorProfileLevel.highSaturation),
);

/// A platform whose reads fail, to prove the cache backend can retry.
final class _FailingPlatform extends InMemorySharedPreferencesAsync {
  _FailingPlatform() : super.empty();

  @override
  Future<Map<String, Object>> getPreferences(
    GetPreferencesParameters parameters,
    SharedPreferencesOptions options,
  ) => Future.error(StateError('disk unavailable'));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferencesAccessibilityStorageService (cache backend)', () {
    late InMemorySharedPreferencesAsync platform;

    /// What the platform holds now, read through the plugin's own API.
    Future<Map<String, Object?>> stored() => SharedPreferencesAsync().getAll();

    setUp(() {
      platform = InMemorySharedPreferencesAsync.empty();
      SharedPreferencesAsyncPlatform.instance = platform;
    });

    test('reads null on a fresh install', () async {
      final service = SharedPreferencesAccessibilityStorageService();
      expect(await service.read(), isNull);
    });

    test('reads the 1.x values', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(oneXValues);
      final service = SharedPreferencesAccessibilityStorageService();
      expect(await service.read(), oneXSettings);
    });

    test('round-trips every field and removes unset keys', () async {
      final service = SharedPreferencesAccessibilityStorageService();
      await service.write(AccessibilitySettingsSamples.everythingSet);
      expect(await service.read(), AccessibilitySettingsSamples.everythingSet);
      await service.write(AccessibilitySettings.defaults);
      expect(await service.read(), AccessibilitySettings.defaults);
      final values = await stored();
      expect(values.keys, isNot(contains(PreferencesKeys.lineHeight)));
      expect(values.keys, isNot(contains(PreferencesKeys.textColor)));
      expect(values[PreferencesKeys.effectsMode], 'system');
    });

    test('writes effectsMode and leaves the 1.x boolean alone', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(oneXValues);
      final service = SharedPreferencesAccessibilityStorageService();
      await service.write(AccessibilitySettings.defaults);
      final values = await stored();
      expect(values[PreferencesKeys.effectsMode], 'system');
      expect(values[PreferencesKeys.legacyEffectsAllowed], false);
      expect(await service.read(), AccessibilitySettings.defaults);
    });

    test('sees values written by another instance', () async {
      final writer = SharedPreferencesAccessibilityStorageService();
      final reader = SharedPreferencesAccessibilityStorageService();
      expect(await reader.read(), isNull);
      await writer.write(AccessibilitySettingsSamples.seizureSafe);
      expect(await reader.read(), AccessibilitySettingsSamples.seizureSafe);
    });

    test('clear removes every package key and nothing else', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData({
            ...oneXValues,
            'someone_elses_key': 'kept',
          });
      final service = SharedPreferencesAccessibilityStorageService();
      await service.write(AccessibilitySettingsSamples.everythingSet);
      await service.clear();
      expect(await stored(), {'someone_elses_key': 'kept'});
      expect(await service.read(), isNull);
    });

    test('retries opening the store after a failure', () async {
      SharedPreferencesAsyncPlatform.instance = _FailingPlatform();
      final service = SharedPreferencesAccessibilityStorageService();
      await expectLater(service.read(), throwsStateError);
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(oneXValues);
      expect(await service.read(), oneXSettings);
    });

    test('forwards the platform options', () async {
      const options = SharedPreferencesOptions();
      final service = SharedPreferencesAccessibilityStorageService(
        options: options,
      );
      await service.write(AccessibilitySettings.defaults);
      expect(await service.read(), AccessibilitySettings.defaults);
    });
  });

  group('SharedPreferencesAccessibilityStorageService.legacy', () {
    /// What the platform holds now, read through the plugin's own API.
    Future<Map<String, Object?>> stored() async {
      final preferences = await SharedPreferences.getInstance();
      return {for (final key in preferences.getKeys()) key: preferences.get(key)};
    }

    setUp(() {
      SharedPreferences.setMockInitialValues(const {});
    });

    test('reads null on a fresh install', () async {
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      expect(await service.read(), isNull);
    });

    test('reads the 1.x values', () async {
      SharedPreferences.setMockInitialValues(oneXValues);
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      expect(await service.read(), oneXSettings);
    });

    test('round-trips every field and removes unset keys', () async {
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      await service.write(AccessibilitySettingsSamples.everythingSet);
      expect(await service.read(), AccessibilitySettingsSamples.everythingSet);
      await service.write(AccessibilitySettings.defaults);
      expect(await service.read(), AccessibilitySettings.defaults);
      final values = await stored();
      expect(values.keys, isNot(contains(PreferencesKeys.lineHeight)));
      expect(values.keys, isNot(contains(PreferencesKeys.fontFamily)));
      expect(values[PreferencesKeys.effectsMode], 'system');
    });

    test('clear removes every package key and nothing else', () async {
      SharedPreferences.setMockInitialValues({
        ...oneXValues,
        'someone_elses_key': 'kept',
      });
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      await service.clear();
      expect(await stored(), {'someone_elses_key': 'kept'});
      expect(await service.read(), isNull);
    });
  });

  group('the two backends', () {
    test('do not share storage', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
      SharedPreferences.setMockInitialValues(oneXValues);
      expect(
        await SharedPreferencesAccessibilityStorageService().read(),
        isNull,
      );
      expect(
        await SharedPreferencesAccessibilityStorageService.legacy().read(),
        oneXSettings,
      );
    });
  });
}
```

If `SharedPreferences.setMockInitialValues` does not reset the legacy
singleton between tests on the installed plugin version, add
`SharedPreferences.resetStatic();` (marked `@visibleForTesting` in the
plugin) at the start of the legacy `setUp` and report it. If
`shared_preferences_platform_interface.dart` or `types.dart` turn out to be
unnecessary imports (fatal `unused_import`), remove them.

`packages/accessibility_shared_preferences/test/public_api_test.dart`:

```dart
import 'dart:io';

import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the service and nothing else', () {
    final barrel = File('lib/accessibility_shared_preferences.dart')
        .readAsStringSync();
    expect(barrel, contains('show SharedPreferencesAccessibilityStorageService'));
    expect(barrel, isNot(contains('preferences_codec')));
    expect(barrel, isNot(contains('preferences_keys')));
  });

  test('the service is an AccessibilityStorageService', () {
    final AccessibilityStorageService service =
        SharedPreferencesAccessibilityStorageService();
    final AccessibilityStorageService legacy =
        SharedPreferencesAccessibilityStorageService.legacy();
    expect(service, isA<AccessibilityStorageService>());
    expect(legacy, isA<AccessibilityStorageService>());
  });
}
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `cd packages/accessibility_shared_preferences && flutter test`
Expected: compilation error, the service file does not exist.

- [ ] **Step 3: Write the barrel and the service**

`packages/accessibility_shared_preferences/lib/accessibility_shared_preferences.dart`:

```dart
/// Persists the accessibility settings with `shared_preferences`.
library;

export 'package:accessibility_shared_preferences/src/data/services/shared_preferences_accessibility_storage_service.dart'
    show SharedPreferencesAccessibilityStorageService;
```

`packages/accessibility_shared_preferences/lib/src/data/services/shared_preferences_accessibility_storage_service.dart`:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_codec.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the settings with `shared_preferences` under the 1.x keys, so
/// settings stored by `accessibility` 1.x survive the upgrade.
///
/// Reading translates the 1.x sentinels and the `hasNoEffects` boolean;
/// writing stores every field, removing the keys of unset fields, and
/// never touches the 1.x-only keys. [clear] removes every key this package
/// or 1.x ever wrote and nothing else.
final class SharedPreferencesAccessibilityStorageService
    implements AccessibilityStorageService {
  /// Backed by [SharedPreferencesWithCache], created on first use with an
  /// allow list limited to this package's keys.
  ///
  /// [options] selects the platform backend, for example the Android
  /// storage library. On Android this API stores its values in a different
  /// place than the legacy API; apps whose 1.x settings were written through
  /// `SharedPreferencesServiceLegacy` use [legacy] instead.
  SharedPreferencesAccessibilityStorageService({
    SharedPreferencesOptions options = const SharedPreferencesOptions(),
  }) : _backend = _CacheBackend(options);

  /// Backed by the legacy [SharedPreferences] API, which on Android stores
  /// its values where `accessibility` 1.x wrote them by default.
  SharedPreferencesAccessibilityStorageService.legacy()
    : _backend = const _LegacyBackend();

  final _PreferencesBackend _backend;

  @override
  Future<AccessibilitySettings?> read() async =>
      settingsFromPreferences(await _backend.readAll());

  @override
  Future<void> write(AccessibilitySettings settings) =>
      _backend.writeAll(preferencesFromSettings(settings));

  @override
  Future<void> clear() => _backend.removeAll(PreferencesKeys.all);
}

/// One `shared_preferences` API, reduced to what the service needs.
abstract interface class _PreferencesBackend {
  /// The stored values of every key in [PreferencesKeys.all].
  Future<Map<String, Object?>> readAll();

  /// Stores each value; a `null` value removes its key.
  Future<void> writeAll(Map<String, Object?> values);

  /// Removes [keys].
  Future<void> removeAll(Set<String> keys);
}

/// [SharedPreferencesWithCache] with an allow list of this package's keys.
final class _CacheBackend implements _PreferencesBackend {
  _CacheBackend(this._options);

  final SharedPreferencesOptions _options;
  Future<SharedPreferencesWithCache>? _preferences;

  /// Opens the store once; a failed attempt is forgotten so that the next
  /// call can try again.
  Future<SharedPreferencesWithCache> _open() async {
    try {
      return await (_preferences ??= SharedPreferencesWithCache.create(
        sharedPreferencesOptions: _options,
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: PreferencesKeys.all,
        ),
      ));
    } on Object {
      _preferences = null;
      rethrow;
    }
  }

  @override
  Future<Map<String, Object?>> readAll() async {
    final preferences = await _open();
    await preferences.reloadCache();
    return {for (final key in preferences.keys) key: preferences.get(key)};
  }

  @override
  Future<void> writeAll(Map<String, Object?> values) async {
    final preferences = await _open();
    for (final MapEntry(:key, :value) in values.entries) {
      switch (value) {
        case null:
          await preferences.remove(key);
        case final bool flag:
          await preferences.setBool(key, flag);
        case final int integer:
          await preferences.setInt(key, integer);
        case final double number:
          await preferences.setDouble(key, number);
        case final String text:
          await preferences.setString(key, text);
      }
    }
  }

  @override
  Future<void> removeAll(Set<String> keys) async {
    final preferences = await _open();
    for (final key in keys) {
      await preferences.remove(key);
    }
  }
}

/// The legacy [SharedPreferences] API.
final class _LegacyBackend implements _PreferencesBackend {
  const _LegacyBackend();

  @override
  Future<Map<String, Object?>> readAll() async {
    final preferences = await SharedPreferences.getInstance();
    return {
      for (final key in PreferencesKeys.all)
        if (preferences.containsKey(key)) key: preferences.get(key),
    };
  }

  @override
  Future<void> writeAll(Map<String, Object?> values) async {
    final preferences = await SharedPreferences.getInstance();
    for (final MapEntry(:key, :value) in values.entries) {
      switch (value) {
        case null:
          await preferences.remove(key);
        case final bool flag:
          await preferences.setBool(key, flag);
        case final int integer:
          await preferences.setInt(key, integer);
        case final double number:
          await preferences.setDouble(key, number);
        case final String text:
          await preferences.setString(key, text);
      }
    }
  }

  @override
  Future<void> removeAll(Set<String> keys) async {
    final preferences = await SharedPreferences.getInstance();
    for (final key in keys) {
      await preferences.remove(key);
    }
  }
}
```

The two `switch` statements have no `default` branch on purpose: the codec
only produces `bool`, `int`, `double`, `String` and `null`, and an
unreachable branch would be an uncovered line. A switch statement over
`Object?` without a default is legal Dart.

- [ ] **Step 4: Run the tests and the coverage gate**

Run: `cd packages/accessibility_shared_preferences && flutter test --coverage && dart ../../tool/check_coverage.dart coverage/lcov.info 100`
Expected: every test passes; `Line coverage: 100.00%`. If a line is
uncovered, list every `DA:<line>,0` in `coverage/lcov.info` and add a test
case to the existing files; never delete code to raise coverage.

Run: `dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed .`
Expected: clean.

- [ ] **Step 5: Write the example**

`packages/accessibility_shared_preferences/example/main.dart`:

```dart
// ignore_for_file: avoid_print

import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  print('Loaded: ${repository.settings.value}');
  await repository.save(
    repository.settings.value.withThemeProfile(ThemeProfileLevel.adhdFriendly),
  );
  print('Saved: ${repository.settings.value}');
  repository.dispose();
}
```

Check the core's `AccessibilitySettingsRepository` API names before
committing (`settings` is a `ValueListenable`, `save`, `withThemeProfile`);
if a name differs, use the core's name and report it.

Run: `cd packages/accessibility_shared_preferences && dart analyze --fatal-infos --fatal-warnings .`
Expected: clean.

- [ ] **Step 6: Add the CI matrix entry**

In `.github/workflows/build.yml`, append to `matrix.include`:

```yaml
          - package: accessibility_shared_preferences
            coverage_gate: 100
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
            test_command: flutter test --coverage
```

- [ ] **Step 7: Dry run and commit**

Run: `cd packages/accessibility_shared_preferences && dart pub publish --dry-run`
Expected: `Package has 0 warnings` (notes about `resolution: workspace` or
the unpublished `accessibility` dependency are acceptable).

```bash
git add packages/accessibility_shared_preferences .github/workflows/build.yml
```

```bash
git commit -m "feat(prefs): add SharedPreferencesAccessibilityStorageService with cache and legacy backends"
```

---

### Task 5: `accessibility_font_andika` package

**Files:**
- Create: `packages/accessibility_font_andika/pubspec.yaml`,
  `packages/accessibility_font_andika/analysis_options.yaml`,
  `packages/accessibility_font_andika/.pubignore`,
  `packages/accessibility_font_andika/LICENSE`,
  `packages/accessibility_font_andika/CHANGELOG.md`,
  `packages/accessibility_font_andika/README.md`,
  `packages/accessibility_font_andika/lib/accessibility_font_andika.dart`,
  `packages/accessibility_font_andika/lib/fonts/{Andika-Regular,Andika-Bold,Andika-Italic,Andika-BoldItalic}.ttf` (from `master`),
  `packages/accessibility_font_andika/lib/fonts/OFL.txt` (from `master`),
  `packages/accessibility_font_andika/example/main.dart`
- Test: `packages/accessibility_font_andika/test/andika_font_test.dart`
- Modify: `pubspec.yaml` (root: `workspace:` list), `.github/workflows/build.yml`

**Interfaces:**
- Consumes: `AccessibleFont(family, package)` and `qualifiedFamily` from
  `package:accessibility`.
- Produces: `AndikaFont.font`, an `AccessibleFont` whose `qualifiedFamily` is
  `packages/accessibility_font_andika/Andika`; apps pass it in
  `AccessibilitySettingsViewModel(accessibleFonts: [AndikaFont.font])`.

- [ ] **Step 1: Bring the font files over from 1.x**

```bash
git checkout master -- lib/fonts
```

```bash
mkdir -p packages/accessibility_font_andika/lib && mv lib/fonts packages/accessibility_font_andika/lib/fonts && rm -rf lib
```

```bash
git reset -q -- lib
```

Expected: `ls packages/accessibility_font_andika/lib/fonts` lists
`Andika-Bold.ttf Andika-BoldItalic.ttf Andika-Italic.ttf Andika-Regular.ttf OFL.txt`;
no `lib` at the repository root.

- [ ] **Step 2: Create the package files**

`packages/accessibility_font_andika/pubspec.yaml`:

```yaml
name: accessibility_font_andika
description: The Andika font (SIL Open Font License), a typeface designed for readability, packaged as an accessible font for the accessibility package family.
version: 2.0.0
repository: https://github.com/RubenCesario/accessibility/tree/master/packages/accessibility_font_andika
issue_tracker: https://github.com/RubenCesario/accessibility/issues
topics:
  - accessibility
  - a11y
  - font
  - typography
resolution: workspace

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

dependencies:
  accessibility: ^2.0.0
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  fonts:
    - family: Andika
      fonts:
        - asset: lib/fonts/Andika-Regular.ttf
        - asset: lib/fonts/Andika-Bold.ttf
          weight: 700
        - asset: lib/fonts/Andika-Italic.ttf
          style: italic
        - asset: lib/fonts/Andika-BoldItalic.ttf
          weight: 700
          style: italic
```

`packages/accessibility_font_andika/analysis_options.yaml`:

```yaml
include: ../../analysis_options.yaml
```

`packages/accessibility_font_andika/.pubignore`:

```
analysis_options.yaml
coverage/
```

Copy the licence of the package code: `cp LICENSE packages/accessibility_font_andika/LICENSE`.
Then append to that file, after the MIT text:

```

---

The Andika font files under `lib/fonts/` are Copyright (c) SIL
International and licensed under the SIL Open Font License, Version 1.1,
reproduced in `lib/fonts/OFL.txt`. They are shipped unmodified.
```

`packages/accessibility_font_andika/CHANGELOG.md`:

```markdown
## 2.0.0

* Initial release: the four Andika faces (regular, bold, italic, bold
  italic) extracted from `accessibility` 1.x, with `AndikaFont.font` to
  register them as an accessible font.
```

`packages/accessibility_font_andika/README.md`:

```markdown
# accessibility_font_andika

The [Andika](https://software.sil.org/andika/) typeface, designed by SIL
for readability, packaged for the accessibility package family. The four
faces (regular, bold, italic, bold italic) ship unmodified under the SIL
Open Font License.

## Usage

```dart
final viewModel = AccessibilitySettingsViewModel(
  repository: repository,
  accessibleFonts: const [AndikaFont.font],
);
```

The settings panels then offer the font, and the theme applies it when the
user enables it. Outside the family, the family name is
`AndikaFont.font.qualifiedFamily`.
```

`packages/accessibility_font_andika/lib/accessibility_font_andika.dart`:

```dart
import 'package:accessibility/accessibility.dart';

/// The Andika font shipped by this package.
abstract final class AndikaFont {
  /// The font to register in the accessibility settings ViewModel.
  static const font = AccessibleFont(
    family: 'Andika',
    package: 'accessibility_font_andika',
  );
}
```

- [ ] **Step 3: Register the package**

Add `- packages/accessibility_font_andika` to the root `workspace:` list
(after `accessibility_shared_preferences`).

Run: `flutter pub get`
Expected: resolves.

- [ ] **Step 4: Write the failing test**

`packages/accessibility_font_andika/test/andika_font_test.dart`:

```dart
import 'dart:convert';
import 'dart:io';

import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the constant names the packaged family', () {
    expect(AndikaFont.font.family, 'Andika');
    expect(AndikaFont.font.package, 'accessibility_font_andika');
    expect(
      AndikaFont.font.qualifiedFamily,
      'packages/accessibility_font_andika/Andika',
    );
  });

  test('the four faces are declared and bundled', () async {
    final manifest =
        jsonDecode(await rootBundle.loadString('FontManifest.json'))
            as List<Object?>;
    final entry = manifest.cast<Map<String, Object?>>().singleWhere(
      (family) => (family['family']! as String).endsWith('Andika'),
    );
    final fonts = (entry['fonts']! as List<Object?>)
        .cast<Map<String, Object?>>();
    expect(fonts, hasLength(4));
    for (final font in fonts) {
      final asset = font['asset']! as String;
      final data = await rootBundle.load(asset);
      expect(data.lengthInBytes, greaterThan(0), reason: asset);
    }
  });

  test('the Open Font License ships with the fonts', () {
    final licence = File('lib/fonts/OFL.txt').readAsStringSync();
    expect(licence, contains('SIL OPEN FONT LICENSE'));
    expect(licence, contains('Reserved Font Names "Andika"'));
  });
}
```

- [ ] **Step 5: Run the test**

Run: `cd packages/accessibility_font_andika && flutter test`
Expected: all three tests pass. The manifest entry's `family` is `Andika`
when the package under test is the root of the build and
`packages/accessibility_font_andika/Andika` in a consumer, hence
`endsWith`. If `FontManifest.json` is not served by the test asset bundle
on the installed Flutter, report the exact error and replace the second
test with one that parses `pubspec.yaml` (`package:yaml` is not a
dependency; read the file as text and assert the four `asset:` lines) and
asserts each listed file exists with a size greater than zero.

- [ ] **Step 6: Write the example**

`packages/accessibility_font_andika/example/main.dart`:

```dart
import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const ExampleApp());

/// Renders a line in Andika outside the accessibility family.
final class ExampleApp extends StatelessWidget {
  /// Creates the example app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
    color: const Color(0xFF6750A4),
    builder: (context, child) => Center(
      child: Text(
        'Andika is designed for readability.',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontFamily: AndikaFont.font.qualifiedFamily,
          fontSize: 24,
          color: const Color(0xFF1C1B1F),
        ),
      ),
    ),
  );
}
```

- [ ] **Step 7: Add the CI matrix entry**

In `.github/workflows/build.yml`, append to `matrix.include`:

```yaml
          - package: accessibility_font_andika
            coverage_gate: 0
            # Depends on the unpublished 2.0.0 core until the release.
            pana: false
            test_command: flutter test --coverage
```

- [ ] **Step 8: Verify, dry run and commit**

Run: `cd packages/accessibility_font_andika && dart analyze --fatal-infos --fatal-warnings . && dart format --set-exit-if-changed . && dart pub publish --dry-run`
Expected: clean; `Package has 0 warnings`.

```bash
git add pubspec.yaml .github/workflows/build.yml packages/accessibility_font_andika
```

```bash
git commit -m "feat(font): add accessibility_font_andika with the four Andika faces"
```

---

### Task 6: Documentation alignment and full verification

**Files:**
- Modify: `docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md`
  (sections 7, 8, 16.2), root `pubspec.yaml` only if a script is missing

**Interfaces:**
- Produces: the spec aligned with the delivered API; every melos script
  green on the whole workspace.

- [ ] **Step 1: Align the spec**

In section 7, replace the constructor line

```dart
  SharedPreferencesAccessibilityStorageService({SharedPreferencesWithCacheOptions? cacheOptions});
```

with

```dart
  SharedPreferencesAccessibilityStorageService({SharedPreferencesOptions options = const SharedPreferencesOptions()});
```

and add after the code block's first bullet: "The allow list belongs to the
service, so callers pass platform `SharedPreferencesOptions` (for example
the Android backend) rather than cache options."

In section 7, replace `Sentinels are translated on read (`-1.0` -> `null`,
`0` -> `null`, `''` -> `null`).` with `Sentinels are translated on read (any
negative spacing or height -> `null`, `0` colour -> `null`, `''` family ->
`null`).`

In section 8, replace the first bullet with: "ARB files live in `lib/l10n/`
with the 1.x names (`app_<locale>.arb`); the keys are renamed to
lowerCamelCase so the generated getters are idiomatic Dart
(`read_more` -> `readMore`). `flutter gen-l10n` writes
`AccessibilityLocalizations` to `lib/src/generated/` with deferred loading
kept for web, and `tool/strip_l10n_delegates.dart` removes the
`flutter_localizations` import and the `localizationsDelegates` list from
the output (melos script `gen-l10n`). Generated files are committed."

In section 8, replace "Untranslated entries are reported by the existing
`untranslated-messages-file` mechanism." with "The three keys are translated
in every locale; `untranslated_messages.json` must stay `{}`, enforced by a
test."

In section 8, replace "If the 3.47 generator still emits it, the melos
`gen-l10n` script strips it after generation." with "Flutter 3.44's
generator still emits it (verified 2026-09-07); the melos `gen-l10n` script
strips it after generation."

In section 16.2, add a row after the `context.l10na` row:

```
| `l10na.read_more` and the other snake_case keys | `AccessibilityLocalizations.of(context).readMore`, lowerCamelCase |
```

- [ ] **Step 2: Commit**

```bash
git add docs/superpowers/specs/2026-09-04-accessibility-2-0-monorepo-design.md
```

```bash
git commit -m "docs: align the spec with the delivered support packages"
```

- [ ] **Step 3: Full verification**

```bash
flutter pub get
dart run melos run gen-l10n
git status --porcelain
dart run melos run format
dart run melos run analyze
dart run melos run test:coverage
dart run melos run coverage:check
```

Expected: `git status --porcelain` prints nothing after `gen-l10n`
(regeneration is idempotent on the committed ARBs); every script green;
`accessibility`, `accessibility_testing`, `flutter_accessibility` and
`accessibility_shared_preferences` at 100.00%. Report the test count of
every package and the coverage lines. Tell the user the branch
`feat/localizations-shared-preferences-font` is ready for its pull request
into `release/2.0`.

---

## Self-review against the spec

- **Section 3 / 3.1:** three packages with the declared dependencies
  (`accessibility_localizations` on `flutter` and `intl`;
  `accessibility_shared_preferences` on `accessibility` and
  `shared_preferences`; `accessibility_font_andika` on `flutter` and
  `accessibility`); the storage adapter knows nothing about widgets
  (architecture test, Task 3); no `flutter_localizations` dependency
  (architecture test, Task 2).
- **Section 4:** the service lives under `lib/src/data/services` (Tasks 3
  and 4).
- **Section 7:** both constructors and backends (Task 4); the 1.x keys
  unchanged and `effectsMode` new (Task 3); the `hasNoEffects` mapping
  `true -> enabled`, `false -> disabled`, absent -> `system` (Task 3 tests);
  sentinels on read, removal on write (Task 3); `themeProfileSetting` and
  `isFirstTimeOpened` ignored on read and removed by `clear()` (Tasks 3 and
  4); `read()` null when no settings key exists (Task 3); `clear()` removes
  only the package's keys (Task 4 tests); tests with the in-memory
  implementations of `shared_preferences_platform_interface` for both
  backends (Task 4); constructor parameter renamed to `options` (Task 6).
- **Section 8:** ARBs in `lib/l10n/`, generated class in
  `lib/src/generated/`, deferred loading, committed output (Task 1); public
  API `of`, `delegate`, `supportedLocales` (Task 1 barrel, Task 2 tests);
  the three new keys (Task 1); the `flutter_localizations` strip (Task 1);
  the two tests of the spec plus the architecture test (Task 2); keys
  renamed to lowerCamelCase (Task 1, recorded in the spec by Task 6).
- **Section 9:** the four unmodified TTFs and `OFL.txt` under
  `lib/fonts/`, the `AndikaFont.font` constant, the asset and
  `qualifiedFamily` test (Task 5).
- **Section 14:** 100% gate on `accessibility_shared_preferences` only;
  tests without a gate on the other two (CI `coverage_gate: 0`, Task 2).
- **Section 15:** workspace list extended, `gen-l10n` melos script,
  `coverage:check` scope, CI matrix entries with the Flutter test command
  (Tasks 1 to 5).
- **Section 16.2:** stored settings survive the upgrade through the key
  mapping (Task 3 tests on the 1.x fixtures); the rename table gains the
  key-case row (Task 6).
- **Items to verify (section 20):** `gen-l10n` still emits the
  `flutter_localizations` delegates on Flutter 3.44 (verified in the SDK
  template on 2026-09-07; recorded in the spec by Task 6).
