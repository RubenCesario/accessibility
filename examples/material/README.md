# Material example

The `accessibility_material` example: a `MaterialApp.router` (go_router)
whose themes follow the accessibility settings, a home page with sample
content, and three settings pages (complete with a style switch, a custom
subset with its own palette, the panel as it comes). Settings persist
through `accessibility_shared_preferences`; the Andika font is registered
through `accessibility_font_andika`.

It is the live demo: https://rubencesario.github.io/accessibility/material/

Run it with `flutter run -d chrome` from this folder (after
`flutter pub get` at the repository root).

## What to look at

- `lib/main.dart`: the blocking start-up (`await repository.load()` before
  `runApp`), the `AccessibilityScope`, and `AccessibleThemeBuilder` feeding
  `MaterialApp.router`. The app provides its own high-contrast colour
  schemes, so it applies the settings to those two themes itself with
  `AccessibleThemeData.from`; an app without them passes the builder's
  `highContrastLight` / `highContrastDark` instead.
- `lib/pages/home_page.dart`: `AccessibleText`, `TextRawMagnifier`,
  `ReadMoreText`, `AccessibleSizedBox` and `EffectsBuilder`.
- `lib/pages/settings_page.dart`: `AccessibilitySettingsPanel` in both
  styles and with an `AccessibilitySettingsConfiguration`.
- `test/accessibility_guidelines_test.dart`: every page passes the labelled
  tap-target, tap-target size and text-contrast guidelines with the
  defaults and with every setting active.
