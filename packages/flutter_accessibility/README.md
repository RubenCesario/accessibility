# flutter_accessibility

The Flutter widgets layer of the accessibility package family. It depends on
`package:flutter/widgets.dart` only, so it works with Material, Cupertino or
a custom design system. It re-exports `package:accessibility`.

- `AccessibilitySettingsViewModel`: a `ChangeNotifier` over the core
  repository, exposing the settings, the load status and commands.
- `AccessibilityScope`: provides the ViewModel to the widget tree.
- `AccessibilitySettingsBuilder` and `EffectsBuilder`: rebuild on changes;
  `EffectsBuilder` also honours the OS reduce-motion setting.
- `AccessibleTextStyle.applyTextSettings`: applies the text settings (scale,
  spacing, weight, family, colour) to a `TextStyle`. The theme packages apply
  it to their text themes; a custom design system applies it once on its
  root `DefaultTextStyle`, as `examples/custom_ui/lib/main.dart` does.
- `AccessibleText`, `AccessibleWidgetBuilder`, `AccessibleSizedBox`,
  `AccessibleHeight`, `TextRawMagnifier`, `CollapsibleText`: widgets that
  follow the settings alignment, colour and layout without a design-system
  theme. `AccessibleText` never scales text itself: the ambient style already
  does.

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
