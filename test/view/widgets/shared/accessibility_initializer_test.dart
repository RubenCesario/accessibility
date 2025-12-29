import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/services/shared_preferences_service.dart';
import 'package:accessibility/src/services/shared_preferences_service_no_op.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessibility_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import '../../../resources/models/fake_shared_preferences_async.dart';

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

  group('AccessibilityInitializer.async', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      final store = FakeSharedPreferencesAsync();
      SharedPreferencesAsyncPlatform.instance = store;
    });

    tearDown(() {
      SharedPreferencesAsyncPlatform.instance = null;
    });

    testWidgets('renders child widget after initialization', (tester) async {
      const childKey = Key('async-child');

      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Async Child', key: childKey),
          ),
        ),
      );

      // Initially renders with default settings
      expect(find.byType(SharedPreferencesInherited), findsOneWidget);
      expect(find.byType(AccessibilitySettingsInherited), findsOneWidget);

      await tester.pumpAndSettle();

      // After initialization completes
      expect(find.byKey(childKey), findsOneWidget);
      expect(find.text('Async Child'), findsOneWidget);
    });

    testWidgets('shows custom loading widget when provided and waiting',
        (tester) async {
      const loadingKey = Key('loading-widget');

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilityInitializer.async(
            loadingBuilder: (context) => const CircularProgressIndicator(
              key: loadingKey,
            ),
            child: const Text('Child'),
          ),
        ),
      );

      // Should show loading widget initially
      expect(find.byKey(loadingKey), findsOneWidget);
    });

    testWidgets('provides SharedPreferencesInherited to descendants',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Test'),
          ),
        ),
      );

      expect(find.byType(SharedPreferencesInherited), findsOneWidget);
    });

    testWidgets('provides AccessibilitySettingsInherited to descendants',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Test'),
          ),
        ),
      );

      expect(find.byType(AccessibilitySettingsInherited), findsOneWidget);
    });

    testWidgets('uses default settings initially before future completes',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Test'),
          ),
        ),
      );

      // Before future completes, should use default settings
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      expect(settingsInherited.themeMode.value, equals(ThemeMode.system));
      expect(settingsInherited.effectsAllowed.value, isFalse);
      expect(
        settingsInherited.textSettings.value,
        equals(TextSettings.defaultSettings),
      );
      expect(
        settingsInherited.colorSettings.value,
        equals(ColorSettings.defaultSettings),
      );
    });

    testWidgets('updates settings after successful initialization',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Test'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // After initialization, settings should be available
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      expect(settingsInherited, isNotNull);
    });

    testWidgets('does not block app when loadingBuilder is not provided',
        (tester) async {
      const childKey = Key('child-widget');

      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Child', key: childKey),
          ),
        ),
      );

      // Child should be visible immediately using default no-op service
      expect(find.byKey(childKey), findsOneWidget);
    });

    testWidgets('SharedPreferencesServiceNoOp can be used as fallback',
        (tester) async {
      const noOpService = SharedPreferencesServiceNoOp();

      // Verify that the no-op service returns expected defaults
      final settings = await noOpService.getLocalStorageAccessibilitySettings();
      expect(settings, equals(a11yDefaultSettings));
    });

    testWidgets('accepts cacheOptions parameter', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            cacheOptions: SharedPreferencesWithCacheOptions(),
            child: Text('Test'),
          ),
        ),
      );

      expect(find.byType(AccessibilityInitializer), findsOneWidget);
    });

    testWidgets(
        'completes async initialization and updates components from snapshot',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Test'),
          ),
        ),
      );

      // Pump to allow the future to start
      await tester.pump();

      // Pump multiple frames to ensure future completes
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      // After async initialization, verify providers are present
      expect(find.byType(SharedPreferencesInherited), findsOneWidget);
      expect(find.byType(AccessibilitySettingsInherited), findsOneWidget);

      // Verify child is rendered
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('updates _components when snapshot.data is available',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AccessibilityInitializer.async(
            child: Text('Initialized'),
          ),
        ),
      );

      // Allow initialization to complete
      await tester.pumpAndSettle();

      // Verify child widget is rendered with initialized components
      expect(find.text('Initialized'), findsOneWidget);

      // Get the settings inherited widget to verify it has values
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // After async init completes, settings should be available
      expect(settingsInherited.themeMode.value, isNotNull);
      expect(settingsInherited.effectsAllowed.value, isNotNull);
    });
  });
}
