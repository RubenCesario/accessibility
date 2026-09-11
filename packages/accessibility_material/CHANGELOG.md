## 2.0.0

* Initial release, extracted from `accessibility` 1.x and rebuilt on
  `material_ui`: `AccessibleThemeBuilder` and `AccessibleThemeData` apply
  the settings to the app's themes (with high-contrast variants),
  `AccessiblePageTransitionsTheme` honours the effects mode, and
  `AccessibilitySettingsPanel` offers the settings in the standard and the
  cards style, driven by the `flutter_accessibility` ViewModel.
* `RestoreSettingsButton` and `ReadMoreText`, the panel's building blocks,
  exposed for custom screens.
* The panel is tested against Flutter's `textContrastGuideline`,
  `androidTapTargetGuideline` and `labeledTapTargetGuideline`, in both
  styles, with the defaults and with every setting active.

Migrating from 1.x: see [`docs/migration/1.x-to-2.0.md`](https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md).
