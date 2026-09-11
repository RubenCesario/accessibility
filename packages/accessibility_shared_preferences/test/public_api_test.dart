import 'dart:io';

import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the service and nothing else', () {
    final barrel = File(
      'lib/accessibility_shared_preferences.dart',
    ).readAsStringSync();
    expect(
      barrel,
      contains('show SharedPreferencesAccessibilityStorageService'),
    );
    expect(barrel, isNot(contains('preferences_codec')));
    expect(barrel, isNot(contains('preferences_keys')));
  });

  test('the service is an AccessibilityStorageService', () {
    final AccessibilityStorageService service =
        SharedPreferencesAccessibilityStorageService();
    final AccessibilityStorageService legacy =
        SharedPreferencesAccessibilityStorageService.legacy();
    expect(service, isA<AccessibilityStorageService>());
    expect(legacy, isA<AccessibilityStorageService>());
  });
}
