// ignore_for_file: avoid_print

import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  print('Loaded: ${repository.settings.value}');
  await repository.save(
    repository.settings.value.withThemeProfile(ThemeProfileLevel.adhdFriendly),
  );
  print('Saved: ${repository.settings.value}');
  repository.dispose();
}
