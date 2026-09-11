## 2.0.0

* Initial release of the widgets layer extracted from `accessibility` 1.x:
  `AccessibilitySettingsViewModel`, `AccessibilityScope`,
  `AccessibilitySettingsBuilder`, `EffectsBuilder`, `AccessibilitySettingsStyle`
  and the shared panel configuration, and the accessible widgets
  (`AccessibleText`, `AccessibleTextStyle`, `AccessibleWidgetBuilder`,
  `AccessibleSizedBox`, `AccessibleHeight`, `TextRawMagnifier`,
  `CollapsibleText`, `AccessibleColor`), built on `widgets.dart` only.
* `AccessibilityScope.statusOf` exposes the load status with a dependency,
  for the status card of the settings panels.
* `kDefaultColorCandidates`, the 19-swatch palette the panels use when no
  colour candidates are configured, built on `painting` only.

Migrating from 1.x: see [`docs/migration/1.x-to-2.0.md`](https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md).
