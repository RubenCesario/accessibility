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
