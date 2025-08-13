import 'package:accessibility/accessibility.dart';
import 'package:accessibility/src/services/mock_shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SharedPreferencesInherited', () {
    late MockSharedPreferencesService mockService;
    late Widget testWidget;

    setUp(() {
      mockService = SharedPreferencesService.createMockService();
      testWidget = MaterialApp(
        home: SharedPreferencesInherited(
          sharedPreferencesService: mockService,
          child: const Scaffold(
            body: Text('Test'),
          ),
        ),
      );
    });

    tearDown(() {
      mockService.reset();
    });

    testWidgets('should restore default settings', (tester) async {
      await tester.pumpWidget(testWidget);
      final context = tester.element(find.text('Test'));
      final provider = SharedPreferencesInherited.of(context);
      const argToRestore = 99.0;
      const arg2ToRestore = 'highContrast';
      const arg3ToRestore = 'dark';
      const arg4ToRestore = true;
      await provider.storeLineHeightSetting(newSetting: argToRestore);
      await provider.storeColorProfileSetting(newSetting: arg2ToRestore);
      await provider.storeThemeModeSetting(newSetting: arg3ToRestore);
      await provider.storeEffectsAllowedSetting(newSetting: arg4ToRestore);
      await provider.restoreDefaultSettings();
      final result = await provider.getLocalStorageAccessibilitySettings();
      expect(result.colorSettings, equals(ColorSettings.defaultSettings));
      expect(
        result.textSettings,
        equals(TextSettings.defaultSettings),
      );
      expect(
        result.effectsAllowed,
        equals(LocalStorageDefaultValues.effectsAllowedDefault),
      );
      expect(
        result.themeMode.name,
        equals(LocalStorageDefaultValues.themeModeDefault),
      );
      expect(mockService.methodCalls, contains('restoreDefaultSettings'));
    });

    group('Theme mode settings', () {
      testWidgets('should store theme mode setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 'dark';
        final result =
            await provider.storeThemeModeSetting(newSetting: newSetting);
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeThemeModeSetting'));
      });

      testWidgets('should get theme mode setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        final result = await provider.getThemeModeSetting();
        expect(result, equals(LocalStorageDefaultValues.themeModeDefault));
        expect(mockService.methodCalls, contains('getThemeModeSetting'));
      });
    });

    group('Effects mode settings', () {
      testWidgets('should store effects mode setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = true;
        final result =
            await provider.storeEffectsAllowedSetting(newSetting: newSetting);
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeEffectsAllowedSetting'));
      });

      testWidgets('should get effects mode setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        final result = await provider.getEffectsAllowedSetting();
        expect(result, equals(LocalStorageDefaultValues.effectsAllowedDefault));
        expect(mockService.methodCalls, contains('getEffectsAllowedSetting'));
      });
    });

    group('Text settings', () {
      testWidgets('should store and get word spacing setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 2.5;
        await provider.storeWordSpacingSetting(newSetting: newSetting);
        final result = await provider.getWordSpacingSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeWordSpacingSetting'));
        expect(mockService.methodCalls, contains('getWordSpacingSetting'));
      });

      testWidgets('should store and get text alignment setting',
          (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 'right';
        await provider.storeTextAlignmentSetting(newSetting: newSetting);
        final result = await provider.getTextAlignmentSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeTextAlignmentSetting'));
        expect(mockService.methodCalls, contains('getTextAlignmentSetting'));
      });

      testWidgets('should store and get line height setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 1.8;
        await provider.storeLineHeightSetting(newSetting: newSetting);
        final result = await provider.getLineHeightSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeLineHeightSetting'));
        expect(mockService.methodCalls, contains('getLineHeightSetting'));
      });

      testWidgets('should store and get letter spacing setting',
          (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 1.2;
        await provider.storeLetterSpacingSetting(newSetting: newSetting);
        final result = await provider.getLetterSpacingSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeLetterSpacingSetting'));
        expect(mockService.methodCalls, contains('getLetterSpacingSetting'));
      });

      testWidgets('should store and get text scale factor setting',
          (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 1.3;
        await provider.storeTextScaleFactorSetting(newSetting: newSetting);
        final result = await provider.getTextScaleFactorSetting();
        expect(result, equals(newSetting));
        expect(
          mockService.methodCalls,
          contains('storeTextScaleFactorSetting'),
        );
        expect(mockService.methodCalls, contains('getTextScaleFactorSetting'));
      });

      testWidgets('should store and get text font weight setting',
          (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = true;
        await provider.storeTextFontWeightSetting(newSetting: newSetting);
        final result = await provider.getTextFontWeightSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeTextFontWeightSetting'));
        expect(mockService.methodCalls, contains('getTextFontWeightSetting'));
      });
    });

    group('Theme profile settings', () {
      testWidgets('should store theme profile setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 'seizureSafe';
        final result = await provider.storeThemeProfileSetting(
          newSetting: newSetting,
        );
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeThemeProfileSetting'));
      });

      testWidgets('should get theme profile setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        final result = await provider.getThemeProfileSetting();
        expect(result, equals(LocalStorageDefaultValues.themeProfileDefault));
        expect(mockService.methodCalls, contains('getThemeProfileSetting'));
      });

      testWidgets('should store and get theme profile setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 'adhdFriendly';
        await provider.storeThemeProfileSetting(newSetting: newSetting);
        final result = await provider.getThemeProfileSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeThemeProfileSetting'));
        expect(mockService.methodCalls, contains('getThemeProfileSetting'));
      });
    });

    group('Color settings', () {
      testWidgets('should store and get color profile setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 'highContrast';
        await provider.storeColorProfileSetting(newSetting: newSetting);
        final result = await provider.getColorProfileSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeColorProfileSetting'));
        expect(mockService.methodCalls, contains('getColorProfileSetting'));
      });

      testWidgets('should store and get text color setting', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 0xFF123456;
        await provider.storeTextColorSetting(newSetting: newSetting);
        final result = await provider.getTextColorSetting();
        expect(result, equals(newSetting));
        expect(mockService.methodCalls, contains('storeTextColorSetting'));
        expect(mockService.methodCalls, contains('getTextColorSetting'));
      });

      testWidgets('should store and get pages background color setting',
          (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        const newSetting = 0xFFABCDEF;
        await provider.storePagesBackgroundColorSetting(newSetting: newSetting);
        final result = await provider.getPagesBackgroundColorSetting();
        expect(result, equals(newSetting));
        expect(
          mockService.methodCalls,
          contains('storePagesBackgroundColorSetting'),
        );
        expect(
          mockService.methodCalls,
          contains('getPagesBackgroundColorSetting'),
        );
      });
    });

    group('App first time opened', () {
      testWidgets('should get is app first time opened', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        final result = await provider.getIsAppFirstTimeOpened();
        expect(result, isTrue);
        expect(mockService.methodCalls, contains('getIsAppFirstTimeOpened'));
      });

      testWidgets('should store is first time opened', (tester) async {
        await tester.pumpWidget(testWidget);
        final context = tester.element(find.text('Test'));
        final provider = SharedPreferencesInherited.of(context);
        final result = await provider.storeIsFirstTimeOpened();
        expect(result, isFalse);
        expect(mockService.methodCalls, contains('storeIsFirstTimeOpened'));
      });
    });

    testWidgets('should retrieve provider using of method', (tester) async {
      await tester.pumpWidget(testWidget);
      final context = tester.element(find.text('Test'));
      final provider = SharedPreferencesInherited.of(context);
      expect(provider, isNotNull);
      expect(provider, isA<SharedPreferencesInherited>());
    });

    testWidgets('updateShouldNotify should always return false',
        (tester) async {
      final oldWidget = SharedPreferencesInherited(
        sharedPreferencesService: mockService,
        child: const SizedBox(),
      );
      final newWidget = SharedPreferencesInherited(
        sharedPreferencesService: mockService,
        child: const SizedBox(),
      );
      expect(newWidget.updateShouldNotify(oldWidget), isFalse);
    });

    testWidgets('should throw assertion error when not found in context',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Text('No provider')));
      final context = tester.element(find.text('No provider'));
      expect(
        () => SharedPreferencesInherited.of(context),
        throwsAssertionError,
      );
    });
  });
}
