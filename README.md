<p align="center">
<img src="https://raw.githubusercontent.com/RubenCesario/accessibility/master/screenshots/logo.webp" height="100" alt="Flutter Accessibility Package" />
</p>

<p align="center">

[![build](https://github.com/RubenCesario/accessibility/actions/workflows/build.yml/badge.svg)](https://github.com/RubenCesario/accessibility/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/RubenCesario/accessibility/graph/badge.svg?token=45AFWZ3YYS)](https://codecov.io/gh/RubenCesario/accessibility) 
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
<a href="https://pub.dev/packages/accessibility"><img src="https://img.shields.io/badge/pub.dev-1.1.0-blue.svg" alt="Pub"></a>
<a href="https://pub.dev/documentation/accessibility/latest/accessibility/"><img src="https://img.shields.io/badge/documentation-100%25-brown.svg" alt="Documentation"></a> 
<a href="https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html"><img src="https://img.shields.io/badge/languages-80%2B-orange.svg" alt="Languages"></a>
<a href="https://github.com/RubenCesario/accessibility/tree/master/test"><img src="https://img.shields.io/badge/tests-1500+-green.svg" alt="Test"></a>  
</p>

# Flutter Accessibility Package

An all-in-one solution to enhance your project with accessibility features. Available in 80+ languages. 100% documented.

This package implements accessibility features according to the [WCAG 2.1 AA guidelines](https://www.w3.org/TR/WCAG21/), focusing on:

- [1.4.3 Contrast (Minimum)](https://www.w3.org/TR/WCAG21/#contrast-minimum)
- [1.4.4 Resize Text](https://www.w3.org/TR/WCAG21/#resize-text)
- [1.4.12 Text Spacing](https://www.w3.org/TR/WCAG21/#text-spacing)

Check out the [Live web demo](https://rubencesario.github.io/accessibility/).

## Features

- **Text Settings**
  - Text scale factor
  - Line height
  - Letter spacing
  - Word spacing
  - Font weight
  - Text alignment

- **Color Settings**
  - Text color customization
  - Background color customization
  - Color profiles for different user needs

- **Theme Settings**
  - Light/dark mode
  - High contrast themes
  - Complex effect mode toggle
  - Accessibility-enhanced theme presets

- **Persistence Support**
  - Settings are saved between sessions
  - Easy restoration of default settings

- **Internationalization Support**
  - Multiple language support
  - Localized accessibility settings

## Usage

Wrap your app with `AccessibilityInitializer` and pass down your `AppThemes` instance:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferencesWithCache = await createSharedPreferencesWithCache();
  final sharedPreferencesService = SharedPreferencesServiceWithCache(
    sharedPreferencesWithCache,
  ); // or else if you use legacy SharedPreferences
  // const sharedPreferencesService = SharedPreferencesServiceLegacy();
  final accessibilitySettings =
      await sharedPreferencesService.getLocalStorageAccessibilitySettings();

  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme:               // your light color scheme
    darkColorScheme:                // your dark color scheme
    textTheme:                      // your text theme
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

Replace your `MaterialApp` or `MaterialApp.router` with `AccessibleMaterialApp` or `AccessibleMaterialApp.router`:

```dart
  @override
  Widget build(BuildContext context) => AccessibleMaterialApp.router(
    title: 'Accessibility Example',
    routerConfig: _router,
    // [appThemes] is the [AppThemes] class provided in the main function
    theme: appThemes.lightTheme,
    darkTheme: appThemes.darkTheme,
    // ... other MaterialApp properties
  );
```

If you want to use the `CupertinoApp` or `WidgetsApp` variants check the `AccessibleMaterialApp` Widget to find out how to create an accessible version of them.

### Adding accessibility features

You can add a complete accessibility settings panel as a body of a Scaffold using the `AccessibilitySettings` Widget:

```dart
 const Scaffold(body: AccessibilitySettings()),
```

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="https://raw.githubusercontent.com/RubenCesario/accessibility/refs/heads/master/screenshots/settings_one.webp" width="200" alt="Accessibility settings section - top view"/>
            </td>            
            <td style="text-align: center">
                <img src="https://raw.githubusercontent.com/RubenCesario/accessibility/refs/heads/master/screenshots/settings_two.webp" width="200" alt="Accessibility settings section - middle view"/>
            </td>
            <td style="text-align: center">
                <img src="https://raw.githubusercontent.com/RubenCesario/accessibility/refs/heads/master/screenshots/settings_three.webp" width="200" alt="Accessibility settings section - bottom view"/>
            </td>
        </tr>
    </table>
</div>

If you have a subtree with complex animations, consider adding a Widget
that reacts to the effects allowed setting, to manage whether or not use the animations:

```dart
const EffectsSettingListenableBuilder(
  builder: (context, effectsEnabled, child) => // your widget based on the effectsEnabled value
)
```

By default all pages transitions of the application will listen to the current effects setting, removing the transition animations if the effects are disabled.

### Custom behavior

This section is intended only for users who want to have more control over the package.

#### App initialization

For more granular control of the app initialization you can use `ThemeSettingsBuilder` instead of the premade `AccessibleMaterialApp`.

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
      // your custom logic to create theme data
      // instead of AccessibleThemeData...
      return MaterialApp(),
    },
  );
```

#### Customizing the accessibility settings

The `AccessibilitySettings` Widget uses the recommended configuration by default.
You can customise it by passing a custom `AccessibilitySettingsConfiguration`, but be aware that all `Text` Widgets of your application will **NOT** be affected by the `TextAlign` setting. If you want to use the `TextAlign` settings you should use the `AccessibleText` Widget instead.

```dart
// Instead of const Text('Hello World')
const AccessibleText('Hello World')
```

#### Custom UI of the accessibility settings

To add your custom UI of the accessibility settings use only the following providers:

- `AccessibilitySettingsInherited` to access and modify the current state of the accessibility settings
- `SharedPreferencesInherited` to access and modify the current state of local storage settings

Check the `/example/with_custom_ui/` folder for a complete implementation example showing how to add your custom UI to change accessibility settings.

## Example

Check the `/example` folder for a complete implementation example showing how to integrate accessibility features into your Flutter application.