import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('the barrel does not re-export package:listen', () {
    final barrel = File('lib/accessibility.dart').readAsStringSync();
    expect(barrel, isNot(contains('package:listen')));
  });

  test('the barrel exports the repository', () {
    final barrel = File('lib/accessibility.dart').readAsStringSync();
    expect(barrel, contains('AccessibilitySettingsRepository'));
  });
}
