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
  theme. Because the theme packages (or a custom UI, through
  `applyTextSettings`) already apply the text settings to every text style,
  `AccessibleText` never scales text itself: it only applies alignment and
  colour, and the ambient style carries the rest.

## Installation

```bash
flutter pub add flutter_accessibility
```

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
`accessibility_material` or `accessibility_cupertino`. With no design system
at all, the app applies the text settings once, on its root
`DefaultTextStyle`, and reads colours from the settings itself, as
`examples/custom_ui/lib/main.dart` does:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const ExampleApp(),
    ),
  );
}

/// A design-system-free app on `package:flutter/widgets.dart`.
///
/// The text settings apply once, on the root `DefaultTextStyle`; the
/// colours come from [Palette]; the settings screen is hand-made.
final class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
    title: 'Accessible custom UI',
    color: const Color(0xFF5B3FA0),
    builder: (context, child) => AccessibilitySettingsBuilder(
      builder: (context, settings, child) {
        final palette = Palette.of(context, settings);
        return DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: palette.text,
          ).applyTextSettings(settings.textSettings),
          child: ColoredBox(color: palette.background, child: child),
        );
      },
      child: const SettingsScreen(),
    ),
  );
}
```

## See also

- The family: <https://github.com/RubenCesario/accessibility#readme>
- Migrating from 1.x: <https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md>
