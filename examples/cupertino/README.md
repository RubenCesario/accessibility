# Cupertino example

The `accessibility_cupertino` example: a `CupertinoApp` whose theme follows
the accessibility settings and whose `onGenerateRoute` returns
`AccessibleCupertinoPageRoute`s honouring the effects mode, a home page with
sample content, and three settings pages (complete with a style switch, a
custom subset with its own palette, the panel as it comes). Settings
persist through `accessibility_shared_preferences`; the Andika font is
registered through `accessibility_font_andika`.

It is the live demo: https://rubencesario.github.io/accessibility/cupertino/

Run it with `flutter run -d chrome` from this folder (after
`flutter pub get` at the repository root).

## What to look at

- `lib/main.dart`: the blocking start-up (`await repository.load()` before
  `runApp`), the `AccessibilityScope`, and `AccessibleCupertinoThemeBuilder`
  feeding `CupertinoApp`, whose `onGenerateRoute` returns
  `AccessibleCupertinoPageRoute`s.
- `lib/pages/home_page.dart`: `AccessibleText`, `TextRawMagnifier`,
  `CupertinoReadMoreText`, `AccessibleSizedBox` and `EffectsBuilder`.
- `lib/pages/settings_page.dart`: `CupertinoAccessibilitySettingsPanel` in
  both the list and the grouped styles, and with an
  `AccessibilitySettingsConfiguration`.
- `test/accessibility_guidelines_test.dart`: every page passes the labelled
  tap-target, tap-target size and text-contrast guidelines with the
  defaults, with every setting active except the user text colour and
  background colour overrides — the theme layer does not reconcile either
  override with every surface it did not reach
  (`AccessibleCupertinoThemeData.from` applies the text colour to every
  text style but the background colour only to the page scaffold), so a
  clash there is the user's own choice to revert, not something this
  example can fix — and in dark mode.
