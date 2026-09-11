## 2.0.0

* Initial release, extracted from `accessibility` 1.x: the 81 translations of
  the settings panels as `AccessibilityLocalizations`, with keys renamed to
  lowerCamelCase, three new keys for the settings load status
  (`settingsLoading`, `settingsLoadFailed`, `retry`), and only this
  package's own delegate (add the Material or Cupertino delegates yourself).
* Six keys for the tri-state theme and effects controls: `themeModeSystem`,
  `themeModeLight`, `themeModeDark`, `effectsModeSystem`,
  `effectsModeEnabled`, `effectsModeDisabled`.

Migrating from 1.x: see [`docs/migration/1.x-to-2.0.md`](https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md).
