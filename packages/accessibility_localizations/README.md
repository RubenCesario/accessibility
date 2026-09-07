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
