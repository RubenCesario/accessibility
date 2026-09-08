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

## Regenerating the translations

The generated code under `lib/src/generated/` is committed. Regenerate it
with `dart run melos run gen-l10n` from the repository root: it runs
`flutter gen-l10n` with the options set in that script, strips the
`flutter_localizations` delegates that `flutter gen-l10n` adds, and formats
the result. There is deliberately no `l10n.yaml` in this package, because
with one present `flutter pub get` would regenerate the file without the
strip.
