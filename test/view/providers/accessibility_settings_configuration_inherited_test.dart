import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilitySettingsConfigurationInherited', () {
    late AccessibilitySettingsConfiguration configuration;
    late Widget testWidget;

    setUp(() {
      configuration = AccessibilitySettingsConfiguration.recommended;
      testWidget = MaterialApp(
        home: AccessibilitySettingsConfigurationInherited(
          configuration: configuration,
          child: const Scaffold(
            body: Text('Test'),
          ),
        ),
      );
    });

    testWidgets('should provide configuration to children', (tester) async {
      await tester.pumpWidget(testWidget);
      final context = tester.element(find.text('Test'));
      final provider = AccessibilitySettingsConfigurationInherited.of(context);

      expect(provider.configuration, equals(configuration));
    });

    testWidgets('should provide access to configuration properties',
        (tester) async {
      await tester.pumpWidget(testWidget);
      final context = tester.element(find.text('Test'));
      final provider = AccessibilitySettingsConfigurationInherited.of(context);

      expect(provider.configuration.showThemeSettingsGroup, isTrue);
      expect(
        provider.configuration.showTextAlignSetting,
        isFalse,
      ); // Recommended config has this false
      expect(provider.configuration.showThemeProfileSeizureSafe, isTrue);
    });

    testWidgets(
        'updateShouldNotify should return true when configuration changes',
        (tester) async {
      const oldWidget = AccessibilitySettingsConfigurationInherited(
        configuration: AccessibilitySettingsConfiguration.recommended,
        child: SizedBox(),
      );

      const newWidget = AccessibilitySettingsConfigurationInherited(
        configuration: AccessibilitySettingsConfiguration.all,
        child: SizedBox(),
      );

      // Should return true because configurations are different
      expect(newWidget.updateShouldNotify(oldWidget), isTrue);
    });

    testWidgets(
        'updateShouldNotify should return false when configuration is the same',
        (tester) async {
      const oldWidget = AccessibilitySettingsConfigurationInherited(
        configuration: AccessibilitySettingsConfiguration.recommended,
        child: SizedBox(),
      );

      const newWidget = AccessibilitySettingsConfigurationInherited(
        configuration: AccessibilitySettingsConfiguration.recommended,
        child: SizedBox(),
      );

      // Should return false because configurations are the same
      expect(newWidget.updateShouldNotify(oldWidget), isFalse);
    });

    testWidgets('should throw assertion error when not found in context',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Text('No provider')));
      final context = tester.element(find.text('No provider'));

      expect(
        () => AccessibilitySettingsConfigurationInherited.of(context),
        throwsAssertionError,
      );
    });

    testWidgets('should be immutable', (tester) async {
      final instance = AccessibilitySettingsConfigurationInherited(
        configuration: configuration,
        child: const SizedBox(),
      );

      expect(
        instance.runtimeType.toString(),
        'AccessibilitySettingsConfigurationInherited',
      );

      // This test is somewhat redundant as the class
      // is marked with @immutable at compile time
      // but it's good to document the expectation
      expect(
        () {
          // Attempt to modify a final field would cause a compile-time error
          // This is just checking that we can access the configuration but
          // not modify it
          final config = instance.configuration;
          expect(config, isNotNull);
        },
        isNot(throwsException),
      );
    });

    testWidgets(
        'configuration getter should return the same instance '
        'passed to constructor', (tester) async {
      const specificConfig = AccessibilitySettingsConfiguration.all;

      const widget = AccessibilitySettingsConfigurationInherited(
        configuration: specificConfig,
        child: SizedBox(),
      );

      expect(widget.configuration, same(specificConfig));
    });
  });
}
