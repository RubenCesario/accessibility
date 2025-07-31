import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessibility_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AccessibilityInitializer', () {
    late SharedPreferencesService mockSharedPreferencesService;
    late AccessibilitySettingsCollection accessibilitySettingsCollection;

    setUp(() {
      mockSharedPreferencesService =
          SharedPreferencesService.createMockService();

      // Setup default settings collection
      accessibilitySettingsCollection = (
        themeMode: ThemeMode.light,
        effectsAllowed: true,
        textSettings: TextSettings.defaultSettings,
        colorSettings: ColorSettings.defaultSettings,
      );
    });

    testWidgets('provides SharedPreferencesInherited to descendants',
        (tester) async {
      const testKey = Key('test-child');

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilityInitializer(
            sharedPreferencesService: mockSharedPreferencesService,
            accessibilitySettingsCollection: accessibilitySettingsCollection,
            child: const Text('Test Child', key: testKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SharedPreferencesInherited), findsOneWidget);
    });

    testWidgets('provides AccessibilitySettingsInherited to descendants',
        (tester) async {
      const testKey = Key('test-child');

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilityInitializer(
            sharedPreferencesService: mockSharedPreferencesService,
            accessibilitySettingsCollection: accessibilitySettingsCollection,
            child: const Text('Test Child', key: testKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AccessibilitySettingsInherited), findsOneWidget);
    });

    testWidgets('initializes with provided accessibility settings collection',
        (tester) async {
      // Create custom settings
      const customSettingsCollection = (
        themeMode: ThemeMode.dark,
        effectsAllowed: false,
        textSettings: TextSettings(
          textScaleFactor: 1.5,
          textAlignMode: 'center',
          lineHeight: 1.2,
        ),
        colorSettings: ColorSettings(
          pagesBackgroundColorValue: 0xff000000,
          colorProfileLevel: ColorProfileLevel.highContrast,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilityInitializer(
            sharedPreferencesService: mockSharedPreferencesService,
            accessibilitySettingsCollection: customSettingsCollection,
            child: const Text('Test Child'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      expect(settingsInherited.themeMode.value, ThemeMode.dark);
      expect(settingsInherited.effectsAllowed.value, false);
      expect(settingsInherited.textSettings.value.textScaleFactor, 1.5);
      expect(settingsInherited.textSettings.value.textAlignMode, 'center');
      expect(settingsInherited.textSettings.value.lineHeight, 1.2);
      expect(
        settingsInherited.colorSettings.value.pagesBackgroundColorValue,
        0xff000000,
      );
      expect(
        settingsInherited.colorSettings.value.colorProfileLevel,
        ColorProfileLevel.highContrast,
      );
    });

    testWidgets('renders child widget', (tester) async {
      const childKey = Key('custom-child');

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilityInitializer(
            sharedPreferencesService: mockSharedPreferencesService,
            accessibilitySettingsCollection: accessibilitySettingsCollection,
            child: const Text('Child Widget', key: childKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should render the child widget
      expect(find.byKey(childKey), findsOneWidget);
      expect(find.text('Child Widget'), findsOneWidget);
    });
  });
}
