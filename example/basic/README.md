# Basic Example

This is the simplest example showing how to use the `accessibility` package in a Flutter application. It demonstrates the most straightforward way to integrate accessibility features with minimal setup.

## Overview

The `basic` example shows:

- **Simple accessibility setup** with default package components
- **Essential accessibility pages** (complete, custom, and recommended settings)
- **Basic theme configuration** with color schemes and text themes
- **Navigation between different accessibility settings**

## Project Structure

### Core Files

- **`main.dart`** - Application entry point with accessibility initialization
- **`constants/theme/color_schemes.dart`** - Basic color scheme definitions
- **`view/pages/home_page.dart`** - Main page with navigation to settings
- **`view/pages/complete_settings_page.dart`** - Full accessibility settings page
- **`view/pages/custom_settings_page.dart`** - Custom accessibility settings
- **`view/pages/recommended_settings_page.dart`** - Recommended accessibility settings

## Key Features

- **Default accessibility widgets** from the package
- **Theme switching** (light, dark, high contrast)
- **Text customization** (scale, weight, spacing)
- **Color profile management** (normal, high contrast)
- **Settings persistence** using SharedPreferences

## Usage

### Running the Example

```bash
cd example/basic
flutter run
```

### Basic Setup

The example shows the essential setup required for any accessibility-enabled app:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPreferences service
  final sharedPreferencesService = SharedPreferencesServiceWithCache(
    await createSharedPreferencesWithCache(),
  );
  
  // Load accessibility settings
  final accessibilitySettings = 
      await sharedPreferencesService.getLocalStorageAccessibilitySettings();
  
  // Configure themes
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: kLightColorScheme,
    darkColorScheme: kDarkColorScheme,
    highContrastLightColorScheme: kHighConstrastLightColorScheme,
    highContrastDarkColorScheme: kHighConstrastDarkColorScheme,
    textTheme: kTextThemeMergableEnglishLike2021,
  );
  
  // Initialize accessibility
  runApp(
    AccessibilityInitializer(
      sharedPreferencesService: sharedPreferencesService,
      accessibilitySettingsCollection: accessibilitySettings,
      child: MyApp(appThemes: appThemes),
    ),
  );
}
```

## Navigation

The app provides simple navigation between different accessibility settings pages:

1. **Complete Settings** - All available accessibility options
2. **Custom Settings** - Customized accessibility controls  
3. **Recommended Settings** - Suggested accessibility configurations

## Learning Outcomes

This basic example teaches you:

1. **Essential setup** for accessibility in Flutter apps
2. **Using default accessibility widgets** from the package
3. **Theme configuration** with accessibility considerations
4. **Settings persistence** and initialization
5. **Basic navigation** between accessibility pages

## Next Steps

After understanding this basic example:

- Explore `with_multiple_languages` for internationalization features
- Check `with_custom_ui` for creating custom accessibility controls
- Review the main package documentation for advanced features

This example serves as the foundation for understanding how to integrate accessibility features into any Flutter application.
