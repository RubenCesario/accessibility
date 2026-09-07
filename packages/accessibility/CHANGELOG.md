## 2.0.0

### Breaking changes
* `accessibility` is now the pure Dart core of a package family. Widgets,
  Material and Cupertino UI, `shared_preferences` persistence, translations
  and the Andika font moved to sibling packages. See the migration guide
  in the repository (`docs/migration/1.x-to-2.0.md`).
* Settings are one immutable `AccessibilitySettings` value; nullable fields
  replace the `-1.0`, `0` and `''` sentinels.
* `ThemeMode` is replaced by `AccessibilityThemeMode`, `effectsAllowed` by
  the tri-state `EffectsMode`, `textAlignMode` strings by `TextAlignMode`.
* `SharedPreferencesService` is replaced by the three-method
  `AccessibilityStorageService`; persistence is owned by
  `AccessibilitySettingsRepository`.

## 1.4.0

### Features
* Add an alternative, opt-in **card-based settings UI**, selectable via the new `style` parameter on `AccessibilitySettings` (`AccessibilitySettingsStyle.standard` — the default — or `AccessibilitySettingsStyle.cards`). The card style presents the theme profiles as a segmented selector, the theme/effects/bold/accessible-font settings as toggle cards, the text ranges (font size, word/letter spacing, line height) as stepper cards and text alignment as a segmented card — all sharing the same state and configuration, and verified against the tap-target, labelling and text-contrast accessibility guidelines

### Bug Fixes
* Fix the font size slider announcing the wrong accessibility label ("letter spacing")

### Accessibility
* Restore WCAG 1.4.11-compliant non-text contrast on switches and sliders by removing the low-contrast inactive tracks and white slider thumbs in favour of the accessible Material 3 defaults
* Guarantee a minimum 48x48 touch target for the colour swatches and the colour picker's back/clear actions
* Mark settings section titles as headers for screen-reader navigation
* Announce each switch row (title, subtitle and state) as a single element
* Expose the selected state of colour swatches and a position value on the colour-profile selector
* Announce the expanded/collapsed state of the "Show info" sections
* Remove an incorrect button role from the accessible-font switch

### Testing
* Add accessibility-guideline widget tests (labelled tap targets, tap-target size and text contrast) covering the settings screen

## 1.3.0

### Features
* Add an accessible font setting that applies the **Andika** typeface (SIL Open Font License) across the whole application for improved readability
* Add automatic per-script `fontFamilyFallback` so scripts the accessible font does not cover (e.g. Arabic, Hebrew, CJK, Indic) gracefully fall back to the app/system font instead of rendering missing glyphs
* Add the `TextFontFamilySettingsItem` toggle to the built-in `AccessibilitySettings` panel, gated by the new `showTextFontFamilySetting` flag on `AccessibilitySettingsConfiguration`
* Add a `FontFamilyButton` to the custom UI example showing how to toggle the accessible font from your own UI

### Improvements
* Allocate the fallback light/dark `ThemeData` once in `AccessibleMaterialApp` instead of on every rebuild

## 1.2.1

### Refactoring
* Removed visibleForTesting annotation from library file

## 1.2.0

### Features
* Add async version of the `AccessibilityInitializer`

### Bug Fixes
* Fixed providing custom TextTheme make accessibility settings not working
* Fixed AppBar text doesn't change when accessibility settings does

### Documentation
* Update main README Feature and Usage sections
* Update example README with minimal setup example

## 1.1.1

### Bug Fixes
* Fix screenshots paths for generated docs
* Remove InputDecorationThemeData for now, due to pub analysis environment not up to date

## 1.1.0

### Features
* Add comprehensive internationalization support with 80+ languages
* Add multiple example projects (basic, custom UI, multi-language)
* Add accessible theme data with enhanced theme switching capabilities

### Improvements
* Enhanced accessibility settings with proper semantic labeling
* Improved theme profile descriptions and localization

### Bug Fixes
* Remove incorrect semantic count from components
* Fix not exposed ThemeSettingsBuilder and SharedPreferencesInherited

### Documentation
* Add comprehensive documentation for new features
* Update README with setup and usage examples
* Add documentation for multiple example folders

### Testing
* Add comprehensive localization tests for all supported languages
* Add tests for accessible theme data
* Add tests for multi-language example
* Update existing tests to support deferred localizations

### Refactoring
* Wrap settings group with safe area
* Make text of read more button expandable
* Apply linting fixes and code style improvements
* Remove unused code and optimize examples

## 1.0.0

* Initial release
