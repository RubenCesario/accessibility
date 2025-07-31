[![build](https://github.com/RubenCesario/accessibility/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/RubenCesario/accessibility/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/RubenCesario/accessibility/graph/badge.svg?token=45AFWZ3YYS)](https://codecov.io/gh/RubenCesario/accessibility)

# Flutter Accessibility Package

An all-in-one solution to enhance your project with accessibility features.

This package implements accessibility features according to the [WCAG 2.1 AA guidelines](https://www.w3.org/TR/WCAG21/).

## Features

- **Text Accessibility Settings**
  - Text scale factor
  - Line height
  - Letter spacing
  - Word spacing
  - Font weight (bold)
  - Text alignment

- **Color Accessibility Settings**
  - Text color customization
  - Background color customization
  - Color profiles for different user needs

- **Theme Accessibility**
  - Light/dark mode
  - High contrast themes
  - Effects mode toggle

- **Predefined Theme Profiles**
  - Default theme settings
  - Accessibility-enhanced theme presets

- **Persistent Settings**
  - Settings are saved between sessions
  - Easy restoration of default settings

- **Internationalization Support**
  - Multiple language support
  - Localized accessibility settings

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  accessibility: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Setup

Wrap your app with `AccessibilityInitializer` and pass down your `AppThemes` instance:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferencesWithCache = await createSharedPreferencesWithCache();
  final sharedPreferencesService = SharedPreferencesServiceWithCache(
    sharedPreferencesWithCache,
  );
  // or else if you use legacy SharedPreferences
  // const sharedPreferencesService = SharedPreferencesServiceLegacy();
  final accessibilitySettings =
      await sharedPreferencesService.getLocalStorageAccessibilitySettings();
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: // your light color scheme
    darkColorScheme: // your dark color scheme
    highContrastLightColorScheme: // your high contrast light color scheme
    highContrastDarkColorScheme: // your high contrast dark color scheme
    textTheme: // your text theme
  ); // or use AppThemes() default constructor for finer control
  runApp(
    AccessibilityInitializer(
      sharedPreferencesService: sharedPreferencesService,
      accessibilitySettingsCollection: accessibilitySettings,
      child: MyApp(appThemes: appThemes),
    ),
  );
}
```

### Apply Accessibility Settings to Your App

Replace your `MaterialApp` or `MaterialApp.router` with `AccessibleMaterialApp` or `AccessibleMaterialApp.router`:

```dart
  @override
  Widget build(BuildContext context) => AccessibleMaterialApp.router(
    title: 'Accessibility Example',
    routerConfig: _router,
    // [appThemes] is the [AppThemes] class provided in the main function
    theme: appThemes.lightTheme,
    highContrastTheme: appThemes.lightHighContrastTheme,
    darkTheme: appThemes.darkTheme,
    highContrastDarkTheme: appThemes.darkHighContrastTheme,
    // ... other MaterialApp properties
  );
```

For more granular control you can use `ThemeSettingsBuilder` instead of the premade `AccessibleMaterialApp`.

```dart
  @override
  Widget build(BuildContext context) => ThemeSettingsBuilder(
    builder: (
      context,
      themeMode,
      colorSettings,
      textSettings, {
      required effectsEnabled,
    }) {
      // your custom logic...
      return MaterialApp(),
    },
  );
```

### Using Accessible Components

#### Accessibility Settings Panel

Add a complete accessibility settings panel wherever you like using the `AccessibilitySettings` Widget:

```dart
const AccessibilitySettings()
```

By default this Widget uses the recommended configuration.
You can customise it by passing a custom `AccessibilitySettingsConfiguration`.
Be aware that all `Text` Widgets of your application will **NOT** be affected by the `TextAlign` settings.

If you want to use the `TextAlign` settings you should use the `AccessibleText` Widget instead.

```dart
// Instead of Text('Hello World')
const AccessibleText('Hello World')
```

To add a restore settings button:

```dart
const RestoreSettingsButton()
```

To defines a subtree that reacts to the effects allowed setting:

```dart
const EffectsSettingListenableBuilder(
  builder: (context, effectsEnabled, child) => child, // your widget
)
```

To use your custom UI create your Widgets and use directly the provider methods:

- `AccessibilitySettingsInherited` to access and modify the current state of the accessibility settings
- `SharedPreferencesInherited` to access and modify the current state of local storage settings

## Compliance

This package implements accessibility features according to the WCAG 2.1 AA guidelines, focusing on:

- [1.4.3 Contrast (Minimum)](https://www.w3.org/TR/WCAG21/#contrast-minimum)
- [1.4.4 Resize Text](https://www.w3.org/TR/WCAG21/#resize-text)
- [1.4.12 Text Spacing](https://www.w3.org/TR/WCAG21/#text-spacing)

## Example

Check the `/example` folder for a complete implementation example showing how to integrate accessibility features into your Flutter application.

## License

This package is available under the [BSD 3-clause LICENSE](LICENSE) file in this repository.
