import 'package:flutter_test/flutter_test.dart';

import 'accessibility_settings_inherited_test.dart'
    as accessibility_settings_inherited;
import 'accessibility_settings_inherited_test.dart'
    as shared_preferences_inherited;
import 'accessibility_settings_inherited_test.dart' as theme_profile_test;
import 'models/settings/color/color_profile_test.dart' as color_profile_test;
import 'models/settings/color/color_settings_test.dart' as color_settings_test;
import 'models/settings/text/text_settings_test.dart' as text_settings_test;
import 'models/themes/app_themes_test.dart' as app_themes_test;

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
    group(
      'AppThemes Unit Tests',
      app_themes_test.main,
    );
    group(
      'ColorProfile Unit Tests',
      color_profile_test.main,
    );
    group(
      'ColorSettings Unit Tests',
      color_settings_test.main,
    );
    group(
      'ThemeProfile Unit Tests',
      theme_profile_test.main,
    );
    group(
      'TextSettings Unit Tests',
      text_settings_test.main,
    );
  });
}
