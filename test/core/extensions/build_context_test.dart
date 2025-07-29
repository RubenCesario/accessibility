import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/core/l10n/generated/app_localizations.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BuildContextControls extension', () {
    testWidgets('isDarkMode returns true for dark theme', (tester) async {
      bool? isDarkMode;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Builder(
            builder: (context) {
              isDarkMode = context.isDarkMode;
              return const Placeholder();
            },
          ),
        ),
      );
      expect(isDarkMode, isTrue);
    });

    testWidgets('isDarkMode returns false for light theme', (tester) async {
      bool? isDarkMode;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Builder(
            builder: (context) {
              isDarkMode = context.isDarkMode;
              return const Placeholder();
            },
          ),
        ),
      );

      expect(isDarkMode, isFalse);
    });

    testWidgets('l10na returns AccessibilityLocalizations instance',
        (tester) async {
      AccessibilityLocalizations? localizations;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates:
              AccessibilityLocalizations.localizationsDelegates,
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              localizations = context.l10na;
              return const Placeholder();
            },
          ),
        ),
      );
      expect(localizations, isNotNull);
      expect(localizations, isA<AccessibilityLocalizations>());
    });

    testWidgets('orientation returns portrait when height > width',
        (tester) async {
      Orientation? orientation;

      tester.view.physicalSize = const Size(500, 1000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              orientation = context.orientation;
              return const Placeholder();
            },
          ),
        ),
      );
      expect(orientation, equals(Orientation.portrait));
    });

    testWidgets('orientation returns landscape when width > height',
        (tester) async {
      Orientation? orientation;

      // Simulate landscape mode with wider display
      tester.view.physicalSize = const Size(1000, 500);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              orientation = context.orientation;
              return const Placeholder();
            },
          ),
        ),
      );

      expect(orientation, equals(Orientation.landscape));
    });

    testWidgets('colorScheme returns current theme ColorScheme',
        (tester) async {
      ColorScheme? colorScheme;
      final customColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(colorScheme: customColorScheme),
          home: Builder(
            builder: (context) {
              colorScheme = context.colorScheme;
              return const Placeholder();
            },
          ),
        ),
      );

      expect(colorScheme, isNotNull);
      expect(colorScheme?.primary, equals(customColorScheme.primary));
    });

    testWidgets('textTheme returns current theme TextTheme', (tester) async {
      TextTheme? textTheme;
      const customTextTheme = TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(textTheme: customTextTheme),
          home: Builder(
            builder: (context) {
              textTheme = context.textTheme;
              return const Placeholder();
            },
          ),
        ),
      );

      expect(textTheme, isNotNull);
      expect(
        textTheme?.bodyLarge?.fontSize,
        equals(customTextTheme.bodyLarge?.fontSize),
      );
    });

    testWidgets('isAccessibleNavigationEnabled returns MediaQuery value',
        (tester) async {
      bool? isAccessibleNavigationEnabled;

      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(accessibleNavigation: true),
            child: Builder(
              builder: (context) {
                isAccessibleNavigationEnabled =
                    context.isAccessibleNavigationEnabled;
                return const Placeholder();
              },
            ),
          ),
        ),
      );

      expect(isAccessibleNavigationEnabled, isTrue);
    });

    testWidgets('a11yConfig returns configuration from inherited widget',
        (tester) async {
      const config = AccessibilitySettingsConfiguration.all;
      AccessibilitySettingsConfiguration? retrievedConfig;

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilitySettingsConfigurationInherited(
            configuration: config,
            child: Builder(
              builder: (context) {
                retrievedConfig = context.a11yConfig;
                return const Placeholder();
              },
            ),
          ),
        ),
      );

      expect(retrievedConfig, isNotNull);
      expect(retrievedConfig, equals(config));
    });
  });
}
