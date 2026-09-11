# accessibility_testing

Test doubles for code built on the `accessibility` package.

## Installation

```bash
dart pub add dev:accessibility_testing
```

## Usage

- `FakeAccessibilityStorageService`: an in-memory
  `AccessibilityStorageService` that records every call and can be told to
  throw on `read`, `write` or `clear`.
- `AccessibilitySettingsSamples`: ready-made `AccessibilitySettings`
  values, one per theme profile preset plus one with every field set.

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:test/test.dart';

void main() {
  test('loads the stored settings', () async {
    final service = FakeAccessibilityStorageService(
      initial: AccessibilitySettingsSamples.visionImpaired,
    );
    final repository = AccessibilitySettingsRepository(service: service);
    await repository.load();
    expect(
      repository.settings.value,
      AccessibilitySettingsSamples.visionImpaired,
    );
    expect(service.calls, ['read']);
    repository.dispose();
  });
}
```

See `example/main.dart` in this package for a plain Dart walkthrough.

## See also

- The family: <https://github.com/RubenCesario/accessibility#readme>
- Migrating from 1.x: <https://github.com/RubenCesario/accessibility/blob/master/docs/migration/1.x-to-2.0.md>
