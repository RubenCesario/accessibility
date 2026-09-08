# accessibility_shared_preferences

The `shared_preferences` storage adapter of the accessibility package
family. It implements `AccessibilityStorageService` from the core package
and reads the keys written by `accessibility` 1.x, so users keep their
settings after the upgrade.

## Usage

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(/* AccessibilityScope(...) from flutter_accessibility */);
}
```

`SharedPreferencesAccessibilityStorageService()` uses
`SharedPreferencesWithCache`. Apps whose 1.x settings were written through
`SharedPreferencesServiceLegacy` use
`SharedPreferencesAccessibilityStorageService.legacy()` instead: on Android
the two APIs store their values in different places.
