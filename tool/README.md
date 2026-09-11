# tool

Workspace scripts run by melos and CI. Each one is analysed with the root
lints (`dart analyze --fatal-infos --fatal-warnings tool`) and formatted
with `dart format tool`.

## `check_coverage.dart`

Fails when the line coverage of an LCOV file is below a minimum, or when
the report has no lines at all (an empty report is not 100% coverage).
Usage: `dart tool/check_coverage.dart <lcov.info> <minimum-percent>`.

## `strip_l10n_delegates.dart`

Removes the `flutter_localizations` import, the `localizationsDelegates`
list, and the generator's usage dartdoc that `flutter gen-l10n` writes
into the generated localizations class, so `accessibility_localizations`
exposes only its own delegate and does not point callers at a member or a
dependency it no longer has. Usage:
`dart tool/strip_l10n_delegates.dart <generated-file>`.

## `run_pana.dart`

Runs pana on a temporary copy of a workspace package, with
`resolution: workspace` and the unpublished `accessibility_testing` dev
dependency removed from the copy's pubspec so pana can resolve it as if
it were already published, then exits with pana's own exit code, which
is nonzero as soon as the package loses a single point
(`--exit-code-threshold 0`). Usage:
`dart run tool/run_pana.dart <package directory>`.
