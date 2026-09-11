# Multiple languages example

The `accessibility_material` example with a language switcher over the
80+ bundled translations: a `MaterialApp.router` (go_router) whose themes
follow the accessibility settings, a home page with sample content and a
language picker in its app bar, and the same three settings pages as the
Material example (complete with a style switch, a custom subset with its
own palette, the panel as it comes). Settings persist through
`accessibility_shared_preferences`; the Andika font is registered through
`accessibility_font_andika`.

Run it with `flutter run -d chrome` from this folder (after
`flutter pub get` at the repository root).

## What to look at

- `lib/locale/country.dart`: `Country`, `defaultLocale`, and `allCountries`
  — one entry per bundled translation, migrated from the 1.x
  `with_multiple_languages` example.
- `lib/locale/locale_scope.dart`: `LocaleScope`, an `InheritedNotifier` that
  holds the app's `ValueNotifier<Locale?>` and rebuilds its dependents
  when the locale changes.
- `lib/widgets/language_picker.dart`: `LanguagePicker`, an app-bar button
  that opens a searchable, alphabetically sorted list of the `Country`
  list and sets the notifier held by `LocaleScope`.
- `lib/main.dart`: `ExampleApp` is a `StatefulWidget` that owns the
  `ValueNotifier<Locale?>`, wraps it in `LocaleScope`, and rebuilds
  `MaterialApp.router` through a `ValueListenableBuilder` whenever the
  locale changes. `localeListResolutionCallback` first looks for an exact
  match among `AccessibilityLocalizations.supportedLocales`, then falls
  back to any supported locale with the same language code, and finally
  to `defaultLocale`. Unlike the Material example, this app has no colour
  schemes of its own for the high-contrast themes, so it passes
  `AccessibleThemeBuilder`'s own `highContrastLight` / `highContrastDark`
  straight through, the other option the Material README describes.
- `test/accessibility_guidelines_test.dart`: every page passes the
  labelled tap-target, tap-target size and text-contrast guidelines with
  the defaults, with every setting active except the user text colour and
  background colour overrides — the theme layer does not reconcile either
  override with every surface it did not reach (`AccessibleThemeData.from`
  applies the text colour to every component foreground but the
  background colour only to the scaffold and dialogs), so a clash there is
  the user's own choice to revert, not something this example can fix —
  and in a right-to-left locale (`ar`), so the guideline checks hold under
  both text directions. The right-to-left run of the custom settings page
  skips only the text-contrast guideline: Flutter's
  `textContrastGuideline` reports a false positive on the "Effects" row at
  that scroll offset in RTL, bucketing the segmented control's overlay
  tint as the text colour; the same page passes the contrast check in LTR
  and in the other two scenarios.
