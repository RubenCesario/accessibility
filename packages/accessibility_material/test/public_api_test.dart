import 'dart:io';

import 'package:accessibility_material/accessibility_material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the package API and the re-exports', () {
    final barrel = File('lib/accessibility_material.dart').readAsStringSync();
    for (final name in [
      'AccessibleThemeData',
      'AccessibleThemes',
      'AccessibleThemeBuilder',
      'AccessibleThemesWidgetBuilder',
      'AccessiblePageTransitionsTheme',
      'AccessibilitySettingsPanel',
      'RestoreSettingsButton',
      'ReadMoreText',
    ]) {
      expect(barrel, contains(name), reason: name);
    }
    expect(
      barrel,
      contains(
        "export 'package:flutter_accessibility/flutter_accessibility.dart';",
      ),
    );
    expect(barrel, contains('show AccessibilityLocalizations'));
    expect(barrel, isNot(contains("export 'package:material_ui")));
    expect(barrel, isNot(contains("import 'package:material_ui")));
  });

  test('the re-exported names resolve', () {
    expect(AccessibilitySettings.defaults.isDefault, isTrue);
    expect(AccessibilityLocalizations.supportedLocales, isNotEmpty);
    expect(
      const AccessibilitySettingsPanel().style,
      AccessibilitySettingsStyle.standard,
    );
  });
}
