# Multiple Languages Example

This example demonstrates how to use the `accessibility` package with multiple language support in a Flutter application. It showcases internationalization (i18n) features combined with accessibility settings.

## Overview

The `with_multiple_languages` example extends the basic accessibility functionality by adding:

- **Multi-language support** with locale switching
- **Dynamic language selection** through an interactive UI
- **Accessibility-compliant** language switching components
- **Comprehensive testing** for all components

## Project Structure

### Core Components

#### **Constants**
- **`constants/data/country.dart`** - Defines all supported countries and locales with flag emojis
- **`constants/theme/color_schemes.dart`** - Material Design 3 color schemes for light/dark themes

#### **Models**
- **`models/country.dart`** - Country model implementing the `Displayable` interface for UI representation

#### **Interfaces**
- **`interfaces/displayable.dart`** - Interface for objects that can be displayed in UI components

#### **View Components**

##### **Providers**
- **`view/providers/locale_inherited.dart`** - InheritedWidget for managing locale state across the widget tree

##### **Widgets**
- **`view/widgets/dropdown_menu_dialog.dart`** - Filterable dialog for selecting items from a list
- **`view/widgets/locale_icon_button.dart`** - Icon button that opens the language selection dialog

##### **Pages**
- **`view/pages/home_page.dart`** - Main application page with language switching functionality
- **`view/pages/complete_settings_page.dart`** - Full accessibility settings page
- **`view/pages/custom_settings_page.dart`** - Custom accessibility settings implementation
- **`view/pages/recommended_settings_page.dart`** - Recommended accessibility settings

#### **Main Application**
- **`main.dart`** - Application entry point with theme configuration and routing

## Key Features

### 1. **Language Selection**
- **81 supported languages** with country flags and native names
- **Searchable dropdown** with real-time filtering
- **Alphabetically sorted** country list for easy navigation
- **Persistent locale state** using InheritedWidget pattern

### 2. **Accessibility Integration**
- **Semantic labels** for all interactive elements
- **Screen reader support** with proper ARIA labels
- **High contrast themes** for visual accessibility
- **Keyboard navigation** support
- **Tap target guidelines** compliance (44x44 minimum)

### 3. **UI Components**
- **FilterableListDialog** - Reusable dialog with search functionality
- **LocaleIconButton** - Accessible language switcher
- **AccessibleText** widgets throughout the UI
- **Material Design 3** theming with accessibility considerations

### 4. **Testing Coverage**
Comprehensive test suite covering:
- **Unit tests** for models and constants
- **Widget tests** for all UI components
- **Integration tests** for user interactions
- **Accessibility tests** following Flutter guidelines

## Usage

### Running the Example

```bash
cd example/with_multiple_languages
flutter run
```

### Key Interactions

1. **Language Selection**: Tap the flag icon in the app bar to open the language selector
2. **Search Languages**: Type in the search field to filter available languages
3. **Select Language**: Tap on any language to switch the app locale
4. **Accessibility Settings**: Navigate through different settings pages to customize accessibility options

### Code Examples

#### Using LocaleInherited Provider
```dart
// Wrap your app with LocaleInherited
LocaleInherited(
  locale: const Locale('en', 'US'),
  child: MyApp(),
)

// Access locale anywhere in the widget tree
final localeProvider = LocaleInherited.of(context);
final currentLocale = localeProvider.locale.value;
```

#### Creating Filterable Dialogs
```dart
// Show a filterable dialog
final selectedCountry = await showDialog<Country>(
  context: context,
  builder: (context) => FilterableListDialog<Country>(
    title: 'Select Language',
    entries: allCountries,
    initialValue: currentCountry,
  ),
);
```

## Architecture Patterns

### 1. **InheritedWidget Pattern**
- Efficient state management for locale data
- Automatic widget rebuilding on locale changes
- Clean separation of concerns

### 2. **Interface-Based Design**
- `Displayable` interface for consistent UI representation
- Extensible architecture for new displayable types

### 3. **Provider Pattern**
- Centralized locale management
- Reactive UI updates

### 4. **Accessibility-First Design**
- Semantic labels on all interactive elements
- High contrast theme support
- Screen reader compatibility

## Testing Strategy

The example includes comprehensive tests:

- **Model Tests**: Verify data integrity and equality
- **Widget Tests**: Test UI components and interactions
- **Integration Tests**: End-to-end user workflows
- **Accessibility Tests**: Compliance with accessibility guidelines

Run tests with:
```bash
flutter test
```

## Dependencies

This example uses the `accessibility` package along with:
- `flutter_localizations` for internationalization
- `go_router` for navigation
- Standard Flutter testing framework

## Learning Outcomes

After exploring this example, you'll understand:

1. **How to implement multi-language support** with accessibility in mind
2. **Creating reusable, accessible UI components**
3. **Managing application state** with InheritedWidget
4. **Testing accessibility features** comprehensively
5. **Following Material Design 3** accessibility guidelines
6. **Building filterable, searchable dialogs**
7. **Implementing proper semantic labeling**

This example serves as a comprehensive reference for building accessible, internationalized Flutter applications.
