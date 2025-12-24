# Examples

This folder contains some examples to show how the `accessibility` package could be used. In particular:

  - the `basic/` example teach you how to use the `accessibility` package in the most simple way;
  - the `with_multiple_languages/` example teach you how to use the `accessibility` package to support multiple languages;
  - the `with_custom_ui/` example teach you how to use the `accessibility` package to use your Widgets instead of the package ones to change accessibility settings. Inside the `widgets/custom/` folder you can find the custom widgets used in the example to change accessibility settings.

## Minimal Setup

Below you can see an example of a minimal setup to use the `accessibility` package:

```dart
import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

void main() {
  final appThemes = AppThemes(
    lightTheme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
  );
  runApp(AccessibilityInitializer.async(child: MyApp(appThemes: appThemes)));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appThemes, super.key});
  final AppThemes appThemes;

  @override
  Widget build(BuildContext context) => AccessibleMaterialApp(
    theme: appThemes.lightTheme,
    darkTheme: appThemes.darkTheme,
    home: Scaffold(
      appBar: AppBar(title: const Text('Accessibility Settings')),
      body: const AccessibilitySettings(),
    ),
  );
}
```
