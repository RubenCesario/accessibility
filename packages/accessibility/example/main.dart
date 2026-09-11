// ignore_for_file: avoid_print

import 'package:accessibility/accessibility.dart';

/// Stores the settings in memory; a real app uses
/// `accessibility_shared_preferences` or its own adapter.
final class InMemoryStorage implements AccessibilityStorageService {
  AccessibilitySettings? _value;

  @override
  Future<AccessibilitySettings?> read() async => _value;

  @override
  Future<void> write(AccessibilitySettings settings) async {
    _value = settings;
  }

  @override
  Future<void> clear() async {
    _value = null;
  }
}

Future<void> main() async {
  final repository = AccessibilitySettingsRepository(
    service: InMemoryStorage(),
  );
  await repository.load();
  repository.settings.addListener(() {
    print('Settings changed: ${repository.settings.value}');
  });
  await repository.save(
    repository.settings.value.withThemeProfile(
      ThemeProfileLevel.visionImpaired,
    ),
  );
  print('Matching profile: ${repository.settings.value.matchingThemeProfile}');
  print('JSON: ${repository.settings.value.toJson()}');
  repository.dispose();
}
