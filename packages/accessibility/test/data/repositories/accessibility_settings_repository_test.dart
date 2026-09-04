import 'dart:async';

import 'package:accessibility/src/data/repositories/accessibility_settings_repository.dart';
import 'package:accessibility/src/data/repositories/accessibility_settings_status.dart';
import 'package:accessibility/src/data/services/accessibility_storage_service.dart';
import 'package:accessibility/src/domain/models/accessibility_settings.dart';
import 'package:accessibility/src/domain/models/accessibility_theme_mode.dart';
import 'package:accessibility_test/accessibility_test.dart';
import 'package:test/test.dart';

/// A service whose read completes only when the test says so.
final class _GatedService implements AccessibilityStorageService {
  final Completer<AccessibilitySettings?> readCompleter = Completer();

  @override
  Future<AccessibilitySettings?> read() => readCompleter.future;

  @override
  Future<void> write(AccessibilitySettings settings) async {}

  @override
  Future<void> clear() async {}
}

void main() {
  const stored = AccessibilitySettings(themeMode: AccessibilityThemeMode.dark);
  const chosen = AccessibilitySettings(themeMode: AccessibilityThemeMode.light);

  group('AccessibilitySettingsRepository', () {
    test('starts with the initial value and the idle status', () {
      final repository = AccessibilitySettingsRepository(initial: chosen);
      expect(repository.settings.value, chosen);
      expect(repository.status.value, isA<AccessibilitySettingsIdle>());
      repository.dispose();
    });

    test('defaults the initial value', () {
      final repository = AccessibilitySettingsRepository();
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test('load without a service is loaded immediately', () async {
      final repository = AccessibilitySettingsRepository();
      await repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test(
      'load applies the stored value and reports loading then loaded',
      () async {
        final service = FakeAccessibilityStorageService(initial: stored);
        final repository = AccessibilitySettingsRepository(service: service);
        final statuses = <AccessibilitySettingsStatus>[];
        repository.status.addListener(
          () => statuses.add(repository.status.value),
        );
        await repository.load();
        expect(repository.settings.value, stored);
        expect(statuses, [
          isA<AccessibilitySettingsLoading>(),
          isA<AccessibilitySettingsLoaded>(),
        ]);
        expect(service.calls, ['read']);
        repository.dispose();
      },
    );

    test('load keeps the current value when nothing is stored', () async {
      final service = FakeAccessibilityStorageService();
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: chosen,
      );
      await repository.load();
      expect(repository.settings.value, chosen);
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      repository.dispose();
    });

    test('load failure keeps the value and reports the error', () async {
      final error = Exception('disk');
      final service = FakeAccessibilityStorageService(readError: error);
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: chosen,
      );
      await repository.load();
      expect(repository.settings.value, chosen);
      final status = repository.status.value;
      expect(status, isA<AccessibilitySettingsLoadFailed>());
      expect((status as AccessibilitySettingsLoadFailed).error, same(error));
      repository.dispose();
    });

    test('load can be retried after a failure', () async {
      final service = FakeAccessibilityStorageService(
        initial: stored,
        readError: Exception('disk'),
      );
      final repository = AccessibilitySettingsRepository(service: service);
      await repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoadFailed>());
      service.readError = null;
      await repository.load();
      expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
      expect(repository.settings.value, stored);
      repository.dispose();
    });

    test('save updates synchronously, notifies once, then writes', () async {
      final service = FakeAccessibilityStorageService();
      final repository = AccessibilitySettingsRepository(service: service);
      var notifications = 0;
      repository.settings.addListener(() => notifications++);
      final pending = repository.save(chosen);
      expect(repository.settings.value, chosen);
      expect(notifications, 1);
      await pending;
      expect(service.stored, chosen);
      expect(service.calls, ['write']);
      repository.dispose();
    });

    test('save with an equal value does not notify', () async {
      final repository = AccessibilitySettingsRepository(initial: chosen);
      var notifications = 0;
      repository.settings.addListener(() => notifications++);
      await repository.save(chosen);
      expect(notifications, 0);
      repository.dispose();
    });

    test('save propagates write errors but keeps the value', () async {
      final service = FakeAccessibilityStorageService(
        writeError: Exception('full'),
      );
      final repository = AccessibilitySettingsRepository(service: service);
      await expectLater(repository.save(chosen), throwsException);
      expect(repository.settings.value, chosen);
      repository.dispose();
    });

    test(
      'clear restores the defaults, notifies and clears the service',
      () async {
        final service = FakeAccessibilityStorageService(initial: stored);
        final repository = AccessibilitySettingsRepository(
          service: service,
          initial: stored,
        );
        var notifications = 0;
        repository.settings.addListener(() => notifications++);
        await repository.clear();
        expect(repository.settings.value, AccessibilitySettings.defaults);
        expect(notifications, 1);
        expect(service.stored, isNull);
        expect(service.calls, ['clear']);
        repository.dispose();
      },
    );

    test('clear propagates errors but keeps the defaults', () async {
      final service = FakeAccessibilityStorageService(
        initial: stored,
        clearError: Exception('locked'),
      );
      final repository = AccessibilitySettingsRepository(
        service: service,
        initial: stored,
      );
      await expectLater(repository.clear(), throwsException);
      expect(repository.settings.value, AccessibilitySettings.defaults);
      repository.dispose();
    });

    test(
      'a save during an in-flight load wins over the loaded value',
      () async {
        final service = _GatedService();
        final repository = AccessibilitySettingsRepository(service: service);
        final loading = repository.load();
        expect(repository.status.value, isA<AccessibilitySettingsLoading>());
        await repository.save(chosen);
        service.readCompleter.complete(stored);
        await loading;
        expect(repository.settings.value, chosen);
        expect(repository.status.value, isA<AccessibilitySettingsLoaded>());
        repository.dispose();
      },
    );

    test(
      'a clear during an in-flight load wins over the loaded value',
      () async {
        final service = _GatedService();
        final repository = AccessibilitySettingsRepository(
          service: service,
          initial: chosen,
        );
        final loading = repository.load();
        await repository.clear();
        service.readCompleter.complete(stored);
        await loading;
        expect(repository.settings.value, AccessibilitySettings.defaults);
        repository.dispose();
      },
    );

    test('dispose releases the listenables', () {
      final repository = AccessibilitySettingsRepository()..dispose();
      expect(
        () => repository.settings.addListener(() {}),
        throwsA(isA<Error>()),
      );
    });
  });
}
