## 2.0.0

* Initial release, with full parity to `accessibility_material`, built on
  `cupertino_ui`: `AccessibleCupertinoThemeBuilder` and
  `AccessibleCupertinoThemeData` apply the settings to the app's theme
  (brightness from the theme mode, high contrast from the OS),
  `AccessibleCupertinoPageRoute` and `AccessibleCupertinoPage` honour the
  effects mode, and `CupertinoAccessibilitySettingsPanel` offers the
  settings in the standard and the inset-grouped (cards) style, driven by
  the `flutter_accessibility` ViewModel.
