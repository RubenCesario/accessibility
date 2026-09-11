import 'dart:io';

import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the package API and the re-exports', () {
    final barrel = File('lib/accessibility_cupertino.dart').readAsStringSync();
    for (final name in [
      'AccessibleCupertinoPage',
      'AccessibleCupertinoPageRoute',
      'CupertinoRestoreSettingsButton',
      'CupertinoAccessibilitySettingsPanel',
      'CupertinoReadMoreText',
      'AccessibleCupertinoThemeBuilder',
      'AccessibleCupertinoThemeWidgetBuilder',
      'AccessibleCupertinoThemeData',
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
    expect(barrel, isNot(contains("export 'package:cupertino_ui")));
    expect(barrel, isNot(contains("import 'package:cupertino_ui")));
  });

  test('the re-exported names resolve', () {
    expect(AccessibilitySettings.defaults.isDefault, isTrue);
    expect(AccessibilityLocalizations.supportedLocales, isNotEmpty);
    expect(
      const CupertinoAccessibilitySettingsPanel().style,
      AccessibilitySettingsStyle.standard,
    );
  });
}
