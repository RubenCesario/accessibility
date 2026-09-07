import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:test/test.dart';

void main() {
  group('FakeAccessibilityStorageService', () {
    test('starts empty and records reads', () async {
      final service = FakeAccessibilityStorageService();
      expect(await service.read(), isNull);
      expect(service.stored, isNull);
      expect(service.calls, ['read']);
    });

    test('returns the initial value and keeps writes', () async {
      const initial = AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
      );
      final service = FakeAccessibilityStorageService(initial: initial);
      expect(await service.read(), initial);
      const written = AccessibilitySettings(effectsMode: EffectsMode.disabled);
      await service.write(written);
      expect(service.stored, written);
      expect(await service.read(), written);
      await service.clear();
      expect(service.stored, isNull);
      expect(service.calls, ['read', 'write', 'read', 'clear']);
    });

    test('throws the injected errors and still records the call', () async {
      final service = FakeAccessibilityStorageService(
        readError: Exception('read'),
        writeError: Exception('write'),
        clearError: Exception('clear'),
      );
      await expectLater(service.read(), throwsException);
      await expectLater(
        service.write(AccessibilitySettings.defaults),
        throwsException,
      );
      await expectLater(service.clear(), throwsException);
      expect(service.calls, ['read', 'write', 'clear']);
      expect(service.stored, isNull);
    });

    test('errors can be injected after construction', () async {
      final service = FakeAccessibilityStorageService()
        ..writeError = Exception('late');
      await expectLater(
        service.write(AccessibilitySettings.defaults),
        throwsException,
      );
      service.writeError = null;
      await service.write(AccessibilitySettings.defaults);
      expect(service.stored, AccessibilitySettings.defaults);
    });
  });
}
