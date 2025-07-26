import 'package:flutter_test/flutter_test.dart';

import 'accessibility_settings_inherited_test.dart'
    as accessibility_settings_inherited;
import 'accessibility_settings_inherited_test.dart'
    as shared_preferences_inherited;

/// Accessibility Test Suite
///
/// Running this file will execute all unit tests.
void main() {
  group('Test Suite', () {
    group(
      'AccessibilitySettingsInherited Unit Tests',
      accessibility_settings_inherited.main,
    );
    group(
      'SharedPreferencesInherited Unit Tests',
      shared_preferences_inherited.main,
    );
  });
}
