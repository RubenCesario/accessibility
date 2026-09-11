## 2.0.0

* Initial release, with full parity to `accessibility_material`, built on
  `cupertino_ui`: `AccessibleCupertinoThemeBuilder` and
  `AccessibleCupertinoThemeData` apply the settings to the app's theme
  (brightness from the theme mode, high contrast from the OS),
  `AccessibleCupertinoPageRoute` and `AccessibleCupertinoPage` honour the
  effects mode, and `CupertinoAccessibilitySettingsPanel` offers the
  settings in the standard and the inset-grouped (cards) style, driven by
  the `flutter_accessibility` ViewModel.
* `CupertinoRestoreSettingsButton` and `CupertinoReadMoreText`, the
  panel's building blocks, exposed for custom screens.
* The panel is tested against Flutter's `textContrastGuideline`,
  `labeledTapTargetGuideline` and `iOSTapTargetGuideline`, in both
  styles, with the defaults and with every setting active.
* Depend on `cupertino_icons` directly: the panel's icons (`CupertinoIcons`)
  need the glyph font that package ships, which neither `cupertino_ui` nor
  this package declared on its own.

### Known limitations

`AccessibleCupertinoThemeData.from` applies a user-chosen text colour to
every text style but applies the background colour override only to the
page scaffold, so either override on its own can leave a pair unreadable:
a text colour can clash with a surface the background never reached, and
a background override picked under the opposite brightness leaves the
theme's own foreground unreadable on the page background, inside the
standard-style panel too. Both are the user's own choice to revert. A
follow-up will derive the foreground from a chosen background and extend
the override to the other surfaces.

Migrating from 1.x: see [`docs/migration/1.x-to-2.0.md`](https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md).
