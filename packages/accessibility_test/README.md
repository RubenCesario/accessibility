# accessibility_test

Test doubles for code built on the `accessibility` package.

- `FakeAccessibilityStorageService`: an in-memory
  `AccessibilityStorageService` that records every call and can be told to
  throw on `read`, `write` or `clear`.
- `AccessibilitySettingsSamples`: ready-made `AccessibilitySettings`
  values, one per theme profile preset plus one with every field set.

```dart
import 'package:accessibility/accessibility.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

void main() {
  test('loads the stored settings', () async {
    final service = FakeAccessibilityStorageService(
      initial: AccessibilitySettingsSamples.visionImpaired,
    );
    final repository = AccessibilitySettingsRepository(service: service);
    await repository.load();
    expect(repository.settings.value, AccessibilitySettingsSamples.visionImpaired);
    expect(service.calls, ['read']);
  });
}
```
