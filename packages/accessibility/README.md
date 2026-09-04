# accessibility

Pure Dart core of the accessibility package family: the settings models,
the `AccessibilitySettingsRepository` (single source of truth) and the
`AccessibilityStorageService` contract that persistence adapters implement.

This package has no Flutter dependency. Use it directly to build your own
settings UI on any design system, or pick a sibling package:

| Package | Purpose |
|---|---|
| `flutter_accessibility` | ViewModel, scope and builders for Flutter widgets |
| `accessibility_material` | Material theme builder and settings panel |
| `accessibility_cupertino` | Cupertino theme builder and settings panel |
| `accessibility_shared_preferences` | Persistence on `shared_preferences` |
| `accessibility_localizations` | The settings strings in 80+ languages |
| `accessibility_font_andika` | The Andika accessible font as an asset |
| `accessibility_test` | Fake service and fixtures for tests |

## Usage

```dart
import 'package:accessibility/accessibility.dart';

final repository = AccessibilitySettingsRepository(service: myStorageService);
await repository.load();
repository.settings.addListener(() => print(repository.settings.value));
await repository.save(
  repository.settings.value.copyWith(
    textSettings: const TextSettings(textScaleFactor: 1.5),
  ),
);
```

`AccessibilitySettings` is immutable; `copyWith`, `withThemeProfile` and
`withNextColorProfile` produce new values. `toJson` and `fromJson` exist for
storage adapters.
