# Custom UI Example

This example demonstrates how to create custom accessibility widgets using the `accessibility` package instead of relying on the built-in components. It showcases how to build your own UI controls for accessibility settings while maintaining full compliance with accessibility standards.

## Overview

The `with_custom_ui` example shows how to:

- **Create custom accessibility controls** that replace the default package widgets
- **Build reusable UI components** for accessibility settings management
- **Implement showcase screens** demonstrating various Flutter widgets with accessibility features
- **Maintain accessibility compliance** while using custom designs

## Project Structure

### Core Components

#### **Main Application**
- **`main.dart`** - Application entry point with accessibility initialization and tabbed navigation

#### **Custom Widgets** (`widgets/custom/`)

##### **Color Controls**
- **`color/background_color_button.dart`** - Custom button for changing background colors
- **`color/color_profile_button.dart`** - Button to cycle through color profile levels (normal, high contrast, etc.)
- **`color/text_color_button.dart`** - Custom control for text color adjustments

##### **Text Controls**
- **`text/font_weight_button.dart`** - Custom button for adjusting font weight settings
- **`text/letter_spacing_button.dart`** - Control for letter spacing adjustments
- **`text/line_height_button.dart`** - Button for line height modifications
- **`text/text_scale_factor_button.dart`** - Custom text scaling control
- **`text/word_spacing_button.dart`** - Word spacing adjustment button

##### **Theme Controls**
- **`theme/restore_settings_button.dart`** - Custom button to restore default accessibility settings
- **`theme/theme_mode_button.dart`** - Button for switching between light/dark/system themes
- **`theme/toggle_effects_button.dart`** - Control for enabling/disabling visual effects

#### **Showcase Widgets** (`widgets/showcase/`)

##### **Component Showcases**
- **`data_table_showcase.dart`** - Demonstrates accessible data tables
- **`date_time_picker_showcase.dart`** - Shows accessible date/time pickers
- **`navigation_drawer_showcase.dart`** - Navigation drawer with accessibility features
- **`other_components_showcase.dart`** - Various other accessible components
- **`segmented_button_showcase.dart`** - Accessible segmented button controls
- **`toggle_buttons_showcase.dart`** - Toggle button accessibility examples

##### **Navigation Components**
- **`navigation/showcase_navigation_bar.dart`** - Custom accessible navigation bar
- **`navigation/[other_nav_components]`** - Additional navigation examples

##### **Tab Components**
- **`tabs/components_tab.dart`** - Tab showcasing various UI components
- **`tabs/controls_tab.dart`** - Tab with accessibility control examples
- **`tabs/navigation_tab.dart`** - Navigation-focused tab content

## Key Features

### 1. **Custom Accessibility Controls**
- **Replacement widgets** for all standard accessibility package components
- **Consistent design language** across all custom controls
- **Full accessibility compliance** with semantic labels and proper focus management
- **ValueListenableBuilder integration** for reactive UI updates

### 2. **Comprehensive Widget Showcase**
- **Interactive examples** of accessible Flutter widgets
- **Real-world usage patterns** for common UI components
- **Accessibility best practices** demonstrated through working code
- **Visual feedback** for accessibility setting changes

### 3. **Tabbed Interface**
- **Components Tab**: Showcases various UI components with accessibility features
- **Controls Tab**: Demonstrates custom accessibility control widgets
- **Navigation Tab**: Shows accessible navigation patterns

### 4. **Accessibility Features**
- **Color profile management** (normal, high contrast, inverted)
- **Text customization** (scale, weight, spacing, line height)
- **Theme switching** (light, dark, system)
- **Visual effects control** (animations, transitions)
- **Settings persistence** using SharedPreferences

## Usage

### Running the Example

```bash
cd example/with_custom_ui
flutter run
```

### Key Interactions

1. **Navigate between tabs** to explore different accessibility features
2. **Use custom controls** in the Controls tab to modify accessibility settings
3. **Observe real-time changes** in the Components tab as settings are adjusted
4. **Test navigation patterns** in the Navigation tab

### Important Note

⚠️ **Manual TextStyle Configuration Required**: Some widgets require manual configuration of their `textStyle` properties to react to color changes from accessibility settings. When creating custom widgets, ensure you explicitly apply color settings from `AccessibilitySettingsInherited` to text elements that should respond to color profile changes (normal, high contrast, inverted colors).

### Code Examples

#### Creating Custom Accessibility Controls

```dart
class ColorProfileButton extends StatelessWidget {
  const ColorProfileButton({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ColorSettings>(
    valueListenable: AccessibilitySettingsInherited.of(context).colorSettings,
    builder: (_, colorSettings, __) => ElevatedButton.icon(
      icon: const Icon(Icons.palette),
      label: Text('Color Profile: ${colorSettings.colorProfileLevel.name}'),
      onPressed: () async {
        // Custom logic to cycle through color profiles
        final currentIndex = ColorProfileLevel.values.indexOf(
          colorSettings.colorProfileLevel,
        );
        final nextIndex = (currentIndex + 1) % ColorProfileLevel.values.length;
        
        await AccessibilitySettingsInherited.of(context)
            .colorSettings
            .updateColorProfileLevel(ColorProfileLevel.values[nextIndex]);
      },
    ),
  );
}
```

#### Using AccessibilitySettingsInherited

```dart
// Access accessibility settings anywhere in the widget tree
final accessibilitySettings = AccessibilitySettingsInherited.of(context);

// Listen to specific setting changes
ValueListenableBuilder<TextSettings>(
  valueListenable: accessibilitySettings.textSettings,
  builder: (context, textSettings, child) {
    return Text(
      'Sample Text',
      style: TextStyle(
        fontSize: 16 * textSettings.textScaleFactor,
        fontWeight: textSettings.fontWeight,
        letterSpacing: textSettings.letterSpacing,
      ),
    );
  },
)
```

## Architecture Patterns

### 1. **Custom Widget Pattern**
- Replace default accessibility package widgets with custom implementations
- Maintain consistent API while providing custom UI/UX
- Preserve all accessibility functionality

### 2. **Showcase Pattern**
- Demonstrate accessibility features through interactive examples
- Provide real-world usage scenarios
- Show before/after effects of accessibility settings

### 3. **ValueListenable Integration**
- Reactive UI updates when accessibility settings change
- Efficient rebuilding of only affected widgets
- Clean separation between data and presentation

### 4. **Tabbed Organization**
- Logical grouping of related functionality
- Easy navigation between different feature sets
- Scalable structure for adding new examples

## Custom Widget Development

### Creating Your Own Controls

1. **Extend StatelessWidget** or **StatefulWidget**
2. **Use ValueListenableBuilder** to listen to accessibility settings
3. **Access settings** via `AccessibilitySettingsInherited.of(context)`
4. **Update settings** through the appropriate setting objects
5. **Maintain accessibility** with proper semantic labels and focus management

### Best Practices to follow

- **Consistent styling** across all custom controls
- **Proper semantic labeling** for screen readers
- **Keyboard navigation support**
- **Visual feedback** for state changes
- **Error handling** for setting updates

## Dependencies

This example uses the `accessibility` package along with:
- Standard Flutter Material Design components
- SharedPreferences for settings persistence
- ValueListenable for reactive programming

## Learning Outcomes

After exploring this example, you'll understand:

1. **How to create custom accessibility controls** that replace package defaults
2. **Building reactive UIs** with ValueListenableBuilder and accessibility settings
3. **Implementing comprehensive widget showcases** for testing accessibility features
4. **Maintaining accessibility compliance** in custom widgets
5. **Organizing complex accessibility examples** with tabbed interfaces
6. **Integrating accessibility settings** throughout an application
7. **Creating reusable accessibility components** for your own projects

This example serves as a comprehensive guide for developers who want to customize the appearance and behavior of accessibility controls while maintaining full accessibility compliance and functionality.
