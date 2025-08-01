import 'package:accessibility/src/core/constants/colors.dart';
import 'package:accessibility/src/core/extensions/colors.dart';
import 'package:accessibility/src/models/config/accessibility_settings_configuration.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_configuration_inherited.dart';
import 'package:accessibility/src/view/widgets/components/circle_color.dart';
import 'package:accessibility/src/view/widgets/components/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ColorPicker', () {
    late int mainColorCallCount;
    late ColorSwatch<int>? lastSelectedMainColor;
    late int shadeColorCallCount;
    late Color? lastSelectedShadeColor;

    setUp(() {
      mainColorCallCount = 0;
      lastSelectedMainColor = null;
      shadeColorCallCount = 0;
      lastSelectedShadeColor = null;
    });

    ValueChanged<ColorSwatch<int>?> onMainColorChange() => (color) {
          mainColorCallCount++;
          lastSelectedMainColor = color;
        };

    ValueChanged<Color> onShadeColorChange() => (color) {
          shadeColorCallCount++;
          lastSelectedShadeColor = color;
        };

    testWidgets('renders main color selection initially', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const ColorPicker(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(ColorPicker), findsOneWidget);

      // Should have multiple CircleColor widgets for material colors
      expect(find.byType(CircleColor), findsWidgets);

      // Should not have back button on initial state
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('shows selected main color', (tester) async {
      // Get a material color value to test with
      final testColorValue = kMaterialColors.first.toARGB32();

      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          selectedColorValue: testColorValue,
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should have a selected color (with check icon)
      expect(
        tester
            .widgetList<CircleColor>(find.byType(CircleColor))
            .where((widget) => widget.isSelected),
        isNotEmpty,
      );
    });

    testWidgets('shows shade selection when main color is selected',
        (tester) async {
      // Create widget without initial selection
      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Tap on the first color circle to select a main color
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Should have called the main color change callback
      expect(mainColorCallCount, equals(1));
      expect(lastSelectedMainColor, isNotNull);

      // Should now show a back button to return to main colors
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Should show shade colors
      expect(find.byType(CircleColor), findsWidgets);
    });

    testWidgets('can select a shade color', (tester) async {
      // Create widget without initial selection
      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Select a main color
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Now select a shade color
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Should have called the shade color change callback
      expect(shadeColorCallCount, equals(1));
      expect(lastSelectedShadeColor, isNotNull);
    });

    testWidgets('can return to main color selection', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Select a main color to go to shade selection
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Should show back button
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Tap back button to return to main colors
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Back button should now be gone
      expect(find.byIcon(Icons.arrow_back), findsNothing);

      // Should show main colors again
      expect(find.byType(CircleColor), findsWidgets);
    });

    testWidgets('can reset color selection', (tester) async {
      // Get a material color value to test with
      final testColorValue = kMaterialColors.first.toARGB32();

      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          selectedColorValue: testColorValue,
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should have a selected color and close button
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Tap close button to reset selection
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Should have called the main color change callback with null
      expect(mainColorCallCount, equals(1));
      expect(lastSelectedMainColor, isNull);
    });

    testWidgets('does not show shades when allowPickingColorShades is false',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          allowPickingColorShades: false,
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Select a main color
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Should still be in main color selection (no back button)
      expect(find.byIcon(Icons.arrow_back), findsNothing);

      // Should have called the main color change callback
      expect(mainColorCallCount, equals(1));
      expect(lastSelectedMainColor, isNotNull);
    });

    testWidgets('initializes with a shade color correctly', (tester) async {
      // Find a material color with shades
      final materialColorWithShades = kMaterialColors.firstWhere(
        (color) => color.colorShades.isNotEmpty,
      );

      // Get the shade color value to initialize with
      final shadeColorValue =
          materialColorWithShades.colorShades.first.toARGB32();

      final testWidget = buildDefaultTestWidget(
        child: AccessibilitySettingsConfigurationInherited(
          configuration: AccessibilitySettingsConfiguration.all,
          child: ColorPicker(
            selectedColorValue: shadeColorValue,
            onMainColorChange: onMainColorChange(),
            onShadeColorChange: onShadeColorChange(),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CircleColor).last);
      await tester.pumpAndSettle();

      // Should be in shade color selection mode (has back button)
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('handles reset when on main colors view', (tester) async {
      // Initialize with a main color
      final testColorValue = kMaterialColors.first.toARGB32();

      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          selectedColorValue: testColorValue,
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should show close button
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Tap close button to reset
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Should call main color change with null
      expect(mainColorCallCount, equals(1));
      expect(lastSelectedMainColor, isNull);

      // Close icon should be gone after reset
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('handles main color with no shades correctly', (tester) async {
      // Create a custom color list with a color that has no shades
      final colorWithNoShades = ColorSwatch<int>(
        Colors.purple.toARGB32(),
        const <int, Color>{},
      );

      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          colors: [colorWithNoShades],
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Select the color
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Should have called the main color change callback
      expect(mainColorCallCount, equals(1));
      expect(lastSelectedMainColor, isNotNull);

      // Should not switch to shade selection (no back button)
      // even though allowPickingColorShades is true by default
      expect(find.byIcon(Icons.arrow_back), findsNothing);

      // Should show the close icon to reset
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('selects matching color when initialized with color value',
        (tester) async {
      // Get a material color to test with
      final colorToSelect = kMaterialColors[1];
      final colorARGB = colorToSelect.toARGB32();

      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          selectedColorValue: colorARGB,
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find all CircleColor widgets
      final circleColors =
          tester.widgetList<CircleColor>(find.byType(CircleColor));

      // Verify that the correct color is selected (has isSelected=true)
      var foundSelectedColor = false;
      for (final widget in circleColors) {
        if (widget.isSelected) {
          expect(widget.color.toARGB32(), equals(colorARGB));
          foundSelectedColor = true;
          break;
        }
      }

      expect(
        foundSelectedColor,
        isTrue,
        reason: 'Should find a selected color matching the provided value',
      );
    });

    testWidgets(
        'stays in main colors view when selected color has empty shades',
        (tester) async {
      // Create a color with empty shades list
      final colorWithEmptyShades = ColorSwatch<int>(
        Colors.amber.toARGB32(),
        const <int, Color>{},
      );

      final testWidget = buildDefaultTestWidget(
        child: ColorPicker(
          colors: [colorWithEmptyShades],
          onMainColorChange: onMainColorChange(),
          onShadeColorChange: onShadeColorChange(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify initial state has no selected colors
      expect(
        tester
            .widgetList<CircleColor>(find.byType(CircleColor))
            .where((widget) => widget.isSelected),
        isEmpty,
      );

      // Select the color
      await tester.tap(find.byType(CircleColor).first);
      await tester.pumpAndSettle();

      // Should have called the main color change callback
      expect(mainColorCallCount, equals(1));
      expect(lastSelectedMainColor, isNotNull);

      // Even though allowPickingColorShades is true:
      // 1. Should not switch to shade selection (no back button)
      expect(find.byIcon(Icons.arrow_back), findsNothing);

      // 2. Should remain in main colors view due to empty shades list
      expect(find.byType(CircleColor), findsOneWidget);

      // 3. Should show the close icon for resetting
      expect(find.byIcon(Icons.close), findsOneWidget);
    });
  });
}
