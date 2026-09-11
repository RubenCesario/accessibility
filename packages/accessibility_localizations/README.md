# accessibility_localizations

The translations of the accessibility settings panels, in 81 languages. Used
by `accessibility_material` and `accessibility_cupertino`; add it directly
only when you build your own settings screen with the same strings.

## Installation

```bash
flutter pub add accessibility_localizations
```

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

## Regenerating the translations

The generated code under `lib/src/generated/` is committed. Regenerate it
with `dart run melos run gen-l10n` from the repository root: it runs
`flutter gen-l10n` with the options set in that script, strips the
`flutter_localizations` delegates that `flutter gen-l10n` adds, and formats
the result. There is deliberately no `l10n.yaml` in this package, because
with one present `flutter pub get` would regenerate the file without the
strip.

## Testing

The delegate loads each locale through a deferred library
(`--use-deferred-loading`), and a deferred library does not load inside
`testWidgets`' fake-async zone. A test that pumps a locale other than the
first one it requests must preload it in `setUpAll`, outside that zone:

```dart
setUpAll(() async {
  await AccessibilityLocalizations.delegate.load(const Locale('ar'));
});
```

See `examples/multiple_languages/test/accessibility_guidelines_test.dart`
for the full pattern.

## See also

- The family: <https://github.com/RubenCesario/accessibility#readme>
- Migrating from 1.x: <https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md>
