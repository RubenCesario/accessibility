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
  locale changes. `localeListResolutionCallback` walks the preferred
  locales in order and settles each one before moving on: for a candidate
  it takes an exact match among
  `AccessibilityLocalizations.supportedLocales`, otherwise the first
  supported locale with the same language code, and only when neither
  exists does it try the next preferred locale; `defaultLocale` is the
  fallback when none of them resolves. Unlike the Material example, this
  app has no colour schemes of its own for the high-contrast themes, so
  it passes `AccessibleThemeBuilder`'s own `highContrastLight` /
  `highContrastDark` straight through, the other option the Material
  README describes.
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
  skips only the text-contrast guideline, and the cause is the sampling,
  not the page: the 400 px stepping lands the "Effects" row title
  straddling the bottom edge of the app bar, and Flutter's
  `textContrastGuideline` inflates its sample rectangle by 4 px, so it
  picks the Material 3 scrolled-under app-bar tint as the dominant dark
  colour instead of the page background (the "text size" group header
  fails the same way at the last offset). Since the failure depends on
  where the stepping happens to stop, a layout or string change can move
  it to another title or another page. The test proves the page itself:
  after the loop it scrolls the "Effects" title into the middle of the
  page, clear of the app-bar edge, and asserts the same contrast
  guideline in the same locale.
