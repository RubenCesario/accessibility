## 2.0.0

* Initial release, extracted from `accessibility` 1.x:
  `SharedPreferencesAccessibilityStorageService`, an
  `AccessibilityStorageService` on `SharedPreferencesWithCache` (default) or
  on the legacy `SharedPreferences` API (`.legacy()`), reading the 1.x keys
  and sentinels so stored settings survive the upgrade, and storing the new
  `effectsMode` value with a fallback on the 1.x `hasNoEffects` boolean.
