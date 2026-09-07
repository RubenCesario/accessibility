# flutter_accessibility

The Flutter widgets layer of the accessibility package family. It depends on
`package:flutter/widgets.dart` only, so it works with Material, Cupertino or
a custom design system. It re-exports `package:accessibility`.

- `AccessibilitySettingsViewModel`: a `ChangeNotifier` over the core
  repository, exposing the settings, the load status and commands.
- `AccessibilityScope`: provides the ViewModel to the widget tree.
- `AccessibilitySettingsBuilder` and `EffectsBuilder`: rebuild on changes;
  `EffectsBuilder` also honours the OS reduce-motion setting.
- `AccessibleText`, `AccessibleWidgetBuilder`, `AccessibleSizedBox`,
  `AccessibleHeight`, `TextRawMagnifier`, `CollapsibleText`: widgets that
  follow the settings without a design-system theme.

## Usage

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(service: myStorage);
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const MyApp(),
    ),
  );
}

// Anywhere below the scope:
final settings = AccessibilityScope.settingsOf(context); // rebuilds on change
AccessibilityScope.of(context).setTextScaleFactor(1.5);  // a command
```

For a ready-made settings panel and theme integration use
`accessibility_material` or `accessibility_cupertino`.
