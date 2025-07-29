import 'package:accessibility/src/core/typedefs/accessibility_settings_collection.dart';
import 'package:accessibility/src/core/utils/accessible_height.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/view_models/accessibility_settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibleHeight', () {
    late TextSettings defaultTextSettings;
    late AccessibilitySettingsViewModel viewModel;
    late AccessibilitySettingsCollection accessibilitySettingsCollection;

    setUp(() {
      defaultTextSettings = TextSettings.defaultSettings;
      accessibilitySettingsCollection = (
        themeMode: ThemeMode.light,
        effectsAllowed: true,
        textSettings: defaultTextSettings,
        colorSettings: ColorSettings.defaultSettings,
      );
      viewModel =
          AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
        accessibilitySettingsCollection: accessibilitySettingsCollection,
      );
    });

    testWidgets(
        'should return unchanged height when '
        'accessibility settings are default', (tester) async {
      const testHeight = 100.0;
      late double resultHeight;

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilitySettingsInherited(
            viewModel: viewModel,
            child: Builder(
              builder: (context) {
                resultHeight = testHeight.makeHeightAccessible(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      expect(resultHeight, equals(testHeight));
    });

    testWidgets('should increase height when text scale factor is increased',
        (tester) async {
      const testHeight = 100.0;
      late double resultHeight;

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilitySettingsInherited(
            viewModel: viewModel,
            child: Builder(
              builder: (context) {
                viewModel.updateScaleFactorSetting(2);
                resultHeight = testHeight.makeHeightAccessible(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      expect(resultHeight, greaterThan(testHeight));
    });

    testWidgets('should increase height when line height is increased',
        (tester) async {
      const testHeight = 100.0;
      late double resultHeight;

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilitySettingsInherited(
            viewModel: viewModel,
            child: Builder(
              builder: (context) {
                viewModel.updateLineHeightSetting(2);
                resultHeight = testHeight.makeHeightAccessible(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      // Then
      expect(resultHeight, greaterThan(testHeight));
    });

    testWidgets('should apply extraPortraitMultiplier in portrait mode',
        (tester) async {
      const testHeight = 100.0;
      const extraMultiplier = 1.5;
      late double resultHeight;

      tester.view.physicalSize = const Size(400, 800);
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilitySettingsInherited(
            viewModel: viewModel,
            child: Builder(
              builder: (context) {
                viewModel.updateScaleFactorSetting(2);
                resultHeight = testHeight.makeHeightAccessible(
                  context,
                  extraPortraitMultiplier: extraMultiplier,
                );
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      const expectedMinHeight = testHeight * extraMultiplier;
      expect(resultHeight, greaterThanOrEqualTo(expectedMinHeight));
    });

    testWidgets('should apply extraLandscapeMultiplier in landscape mode',
        (tester) async {
      const testHeight = 100.0;
      const extraMultiplier = 1.5;
      late double resultHeight;

      tester.view.physicalSize = const Size(800, 400);
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: AccessibilitySettingsInherited(
            viewModel: viewModel,
            child: Builder(
              builder: (context) {
                viewModel.updateScaleFactorSetting(2);
                resultHeight = testHeight.makeHeightAccessible(
                  context,
                  extraLandscapeMultiplier: extraMultiplier,
                );
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      const expectedMinHeight = testHeight * extraMultiplier;
      expect(resultHeight, greaterThanOrEqualTo(expectedMinHeight));
    });

    test('should throw assertion error for invalid extraMultipliers', () {
      final mockContext = _MockBuildContext();
      expect(
        () =>
            100.0.makeHeightAccessible(mockContext, extraPortraitMultiplier: 0),
        throwsAssertionError,
      );
      expect(
        () => 100.0
            .makeHeightAccessible(mockContext, extraLandscapeMultiplier: -1),
        throwsAssertionError,
      );
    });
  });
}

// Mock BuildContext for assertion tests
class _MockBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
