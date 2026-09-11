# Custom UI example

The `flutter_accessibility` example: a design-system-free app on
`package:flutter/widgets.dart` only, with no Material or Cupertino. It is
the "custom UI" entry point the docs link to, for apps that do not use
`accessibility_material` or `accessibility_cupertino`.

- The root `WidgetsApp.builder` applies the text settings once, on the
  root `DefaultTextStyle`, with `TextStyle.applyTextSettings`; nothing
  else in the tree re-applies the scale, spacing, weight or family.
- Colours come from the settings (theme mode, background override,
  colour profile) through `Palette`, in `lib/palette.dart`. A chosen
  background may be the opposite brightness of the theme mode, so when
  the user has set one and left the text colour alone the palette derives
  its text (and the other surfaces) from that background's luminance
  rather than from the theme mode, and the page stays readable.
- The settings screen (`lib/pages/settings_screen.dart`) is a `Wrap` of
  hand-made `SettingButton`s (`lib/widgets/setting_button.dart`), each a
  labelled 48 dp tap target that cycles or steps its setting through the
  `AccessibilitySettingsViewModel` commands.
- `EffectsBuilder` reports whether effects are enabled.

Run it with `flutter run -d chrome` from this folder (after
`flutter pub get` at the repository root).

## What to look at

- `lib/main.dart`: the blocking start-up (`await repository.load()`
  before `runApp`), the `AccessibilityScope`, and the
  `AccessibilitySettingsBuilder` feeding the root `DefaultTextStyle` and
  `ColoredBox`.
- `lib/palette.dart`: how a design-system-free app resolves its colours
  from the settings, the way the theme packages do it.
- `lib/widgets/setting_button.dart`: a labelled, 48 dp tap target built
  with `Semantics` and `AccessibleText` directly, without a design
  system's button widget.
- `lib/pages/settings_screen.dart`: every setting exposed as a
  `SettingButton`, plus `EffectsBuilder`.
- `test/settings_screen_test.dart`: every button drives its setting
  through the ViewModel, and the root text style and background follow
  the settings.
- `test/accessibility_guidelines_test.dart`: the app passes the labelled
  tap-target, tap-target size and text-contrast guidelines with the
  defaults, with every setting active, in dark mode, and with a black
  background chosen under the light theme mode.
