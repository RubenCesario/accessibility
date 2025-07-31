import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const baseHeight = 100.0;

  group('AccessibleSizedBox', () {
    testWidgets('renders correctly with basic configuration', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.byType(AccessibleSizedBox), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('applies width correctly when provided', (tester) async {
      const testWidth = 200.0;

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
          width: testWidth,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the inner SizedBox to check its width
      final sizedBox = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .last,
      );

      expect(sizedBox.width, equals(testWidth));
    });

    testWidgets('responds to text scale changes', (tester) async {
      // Create a device pixel ratio of 1.0 so we can predict exact sizes
      tester.view.devicePixelRatio = 1.0;

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the initial SizedBox to check height
      final initialSizedBox = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .last,
      );

      final initialHeight = initialSizedBox.height;

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(AccessibleSizedBox)),
      );

      // Update text settings to increase text scale factor
      settings.textSettings.value = settings.textSettings.value.copyWith(
        textScaleFactor: 2, // Double the text size
      );

      await tester.pump();

      // Get the SizedBox after text scale change
      final updatedSizedBox = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .last,
      );

      final updatedHeight = updatedSizedBox.height;

      // Height should be increased due to the text scale factor
      expect(updatedHeight, greaterThan(initialHeight!));
    });

    testWidgets('uses heightInLandscape when in landscape orientation',
        (tester) async {
      const landscapeHeight = 50.0;

      // Set landscape orientation
      tester.view.physicalSize = const Size(1000, 500);

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
          heightInLandscape: landscapeHeight,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // In landscape mode, the base height should be landscapeHeight
      // But the actual height will be multiplied by the accessible
      // height calculation.
      // So we can't check for an exact value,
      // but we can verify it's not using baseHeight.
      final sizedBox = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .last,
      );

      final actualHeight = sizedBox.height;
      expect(actualHeight, isNot(equals(baseHeight)));

      // Reset the physical size
      tester.view.resetPhysicalSize();
    });

    testWidgets('applies portrait multiplier correctly', (tester) async {
      const portraitMultiplier = 2.0;

      // Set portrait orientation
      tester.view.physicalSize = const Size(500, 1000);

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
          extraHeightPortraitMultiplier: portraitMultiplier,
          child: Text('With multiplier'),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Trigger a rebuild of the SizedBox applying the height multiplier
      settingsInherited.textSettings.value =
          settingsInherited.textSettings.value.copyWith(
        textScaleFactor: 1.5,
      );
      await tester.pump();

      // Find the inner SizedBox with multiplier
      final sizedBoxWithMultiplier = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      // Get the SizedBox with no multiplier for comparison
      final testWidgetNoMultiplier = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
          child: Text('Without multiplier'),
        ),
      );

      await tester.pumpWidget(testWidgetNoMultiplier);
      await tester.pumpAndSettle();

      // Find the inner SizedBox without multiplier
      final sizedBoxNoMultiplier = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      expect(
        sizedBoxWithMultiplier.height,
        greaterThan(sizedBoxNoMultiplier.height!),
      );
      tester.view.resetPhysicalSize();
    });

    testWidgets('applies landscape multiplier correctly', (tester) async {
      const landscapeMultiplier = 1.5;

      // Set landscape orientation
      tester.view.physicalSize = const Size(1000, 500);

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
          extraHeightLandscapeMultiplier: landscapeMultiplier,
          child: Text('With multiplier'),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Trigger a rebuild of the SizedBox applying the height multiplier
      settingsInherited.textSettings.value =
          settingsInherited.textSettings.value.copyWith(
        textScaleFactor: 1.5,
      );
      await tester.pump();

      // Find the inner SizedBox with multiplier
      final sizedBoxWithMultiplier = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      // Get the SizedBox with no multiplier for comparison
      final testWidgetNoMultiplier = buildDefaultTestWidget(
        child: const AccessibleSizedBox.fromHeight(
          height: baseHeight,
          child: Text('Without multiplier'),
        ),
      );

      await tester.pumpWidget(testWidgetNoMultiplier);
      await tester.pumpAndSettle();

      // Find the inner SizedBox without multiplier
      final sizedBoxNoMultiplier = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AccessibleSizedBox),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      expect(
        sizedBoxWithMultiplier.height,
        greaterThan(sizedBoxNoMultiplier.height!),
      );
      tester.view.resetPhysicalSize();
    });
  });
}
