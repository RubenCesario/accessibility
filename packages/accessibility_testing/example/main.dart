// ignore_for_file: avoid_print

import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';

/// Shows [FakeAccessibilityStorageService] driving an
/// [AccessibilitySettingsRepository] outside of a test, the way `test/`
/// files in this repository do.
Future<void> main() async {
  final service = FakeAccessibilityStorageService(
    initial: AccessibilitySettingsSamples.visionImpaired,
  );
  final repository = AccessibilitySettingsRepository(service: service);

  await repository.load();
  print('Loaded: ${repository.settings.value}');
  print('Calls recorded so far: ${service.calls}');

  await repository.save(
    repository.settings.value.copyWith(
      textSettings: repository.settings.value.textSettings.copyWith(
        textScaleFactor: 1.75,
      ),
    ),
  );
  print('Saved: ${repository.settings.value}');
  print('The fake now stores it directly: ${service.stored}');

  // A fake configured to fail never throws through the repository: `load`
  // keeps the settings already in memory and records the failure on
  // `status` instead.
  service.readError = Exception('offline');
  final failingRepository = AccessibilitySettingsRepository(service: service);
  await failingRepository.load();
  print('Status after a failing load: ${failingRepository.status.value}');
  print(
    'Settings kept the default: '
    '${failingRepository.settings.value == AccessibilitySettings.defaults}',
  );

  repository.dispose();
  failingRepository.dispose();
}
