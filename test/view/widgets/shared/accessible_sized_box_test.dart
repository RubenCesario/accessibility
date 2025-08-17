// ignore_for_file: avoid_redundant_argument_values

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

  group('constructor comprehensive coverage', () {
    group('minimal parameters', () {
      test('constructor with only required height parameter', () {
        const widget = AccessibleSizedBox.fromHeight(height: 100);

        expect(widget.height, equals(100));
        expect(widget.heightInLandscape, isNull);
        expect(widget.child, isNull);
        expect(widget.width, isNull);
        expect(widget.extraHeightPortraitMultiplier, equals(1.0));
        expect(widget.extraHeightLandscapeMultiplier, equals(1.0));
        expect(widget.key, isNull);
      });

      testWidgets('minimal constructor renders correctly', (tester) async {
        const widget = AccessibleSizedBox.fromHeight(height: 50);
        final testWidget = buildDefaultTestWidget(child: widget);

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byType(AccessibleSizedBox), findsOneWidget);
        expect(find.byType(SizedBox), findsWidgets);
      });
    });

    group('all parameters provided', () {
      test('constructor with all optional parameters', () {
        const testKey = Key('test_accessible_sized_box');
        const childWidget = Text('Test Child');

        const widget = AccessibleSizedBox.fromHeight(
          key: testKey,
          height: 200,
          heightInLandscape: 150,
          width: 300,
          extraHeightPortraitMultiplier: 2.5,
          extraHeightLandscapeMultiplier: 1.8,
          child: childWidget,
        );

        expect(widget.key, equals(testKey));
        expect(widget.height, equals(200));
        expect(widget.heightInLandscape, equals(150));
        expect(widget.child, equals(childWidget));
        expect(widget.width, equals(300));
        expect(widget.extraHeightPortraitMultiplier, equals(2.5));
        expect(widget.extraHeightLandscapeMultiplier, equals(1.8));
      });

      testWidgets('full constructor renders correctly', (tester) async {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          heightInLandscape: 80,
          width: 200,
          extraHeightPortraitMultiplier: 1.5,
          extraHeightLandscapeMultiplier: 1.2,
          child: Icon(Icons.star),
        );

        final testWidget = buildDefaultTestWidget(child: widget);
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byType(AccessibleSizedBox), findsOneWidget);
        expect(find.byIcon(Icons.star), findsOneWidget);
      });
    });

    group('null parameter handling and defaults', () {
      test('explicit null values trigger default behavior', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          heightInLandscape: null,
          child: null,
          width: null,
          extraHeightPortraitMultiplier: null,
          extraHeightLandscapeMultiplier: null,
        );

        expect(widget.height, equals(100));
        expect(widget.heightInLandscape, isNull);
        expect(widget.child, isNull);
        expect(widget.width, isNull);
        expect(widget.extraHeightPortraitMultiplier, equals(1.0));
        expect(widget.extraHeightLandscapeMultiplier, equals(1.0));
      });

      test('default multiplier values are applied correctly', () {
        const widget1 = AccessibleSizedBox.fromHeight(
          height: 100,
          extraHeightPortraitMultiplier: null,
        );
        const widget2 = AccessibleSizedBox.fromHeight(
          height: 100,
          extraHeightLandscapeMultiplier: null,
        );

        expect(widget1.extraHeightPortraitMultiplier, equals(1.0));
        expect(widget2.extraHeightLandscapeMultiplier, equals(1.0));
      });
    });

    group('edge cases and extreme values', () {
      test('zero height value', () {
        const widget = AccessibleSizedBox.fromHeight(height: 0);
        expect(widget.height, equals(0));
      });

      test('very small height values', () {
        const widget = AccessibleSizedBox.fromHeight(height: 0.1);
        expect(widget.height, equals(0.1));
      });

      test('very large height values', () {
        const widget = AccessibleSizedBox.fromHeight(height: 10000);
        expect(widget.height, equals(10000));
      });

      test('zero multiplier values', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          extraHeightPortraitMultiplier: 0,
          extraHeightLandscapeMultiplier: 0,
        );

        expect(widget.extraHeightPortraitMultiplier, equals(0));
        expect(widget.extraHeightLandscapeMultiplier, equals(0));
      });

      test('very large multiplier values', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          extraHeightPortraitMultiplier: 100,
          extraHeightLandscapeMultiplier: 50.5,
        );

        expect(widget.extraHeightPortraitMultiplier, equals(100.0));
        expect(widget.extraHeightLandscapeMultiplier, equals(50.5));
      });

      test('fractional multiplier values', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          extraHeightPortraitMultiplier: 0.5,
          extraHeightLandscapeMultiplier: 0.25,
        );

        expect(widget.extraHeightPortraitMultiplier, equals(0.5));
        expect(widget.extraHeightLandscapeMultiplier, equals(0.25));
      });

      test('zero width and landscape height', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          width: 0,
          heightInLandscape: 0,
        );

        expect(widget.width, equals(0));
        expect(widget.heightInLandscape, equals(0));
      });
    });

    group('different child widget types', () {
      test('constructor with Text child', () {
        const childWidget = Text('Sample Text');
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          child: childWidget,
        );

        expect(widget.child, equals(childWidget));
        expect(widget.child, isA<Text>());
      });

      test('constructor with Icon child', () {
        const childWidget = Icon(Icons.home);
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          child: childWidget,
        );

        expect(widget.child, equals(childWidget));
        expect(widget.child, isA<Icon>());
      });

      test('constructor with Container child', () {
        const childWidget = SizedBox(width: 50, height: 50);
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          child: childWidget,
        );

        expect(widget.child, equals(childWidget));
        expect(widget.child, isA<SizedBox>());
      });

      test('constructor with complex nested child', () {
        const childWidget = Column(
          children: [
            Text('Title'),
            Icon(Icons.star),
            SizedBox(height: 10),
          ],
        );
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          child: childWidget,
        );

        expect(widget.child, equals(childWidget));
        expect(widget.child, isA<Column>());
      });
    });

    group('key parameter variations', () {
      test('constructor with ValueKey', () {
        const testKey = ValueKey('test_value');
        const widget = AccessibleSizedBox.fromHeight(
          key: testKey,
          height: 100,
        );

        expect(widget.key, equals(testKey));
      });

      test('constructor with ObjectKey', () {
        final testObject = Object();
        final testKey = ObjectKey(testObject);
        final widget = AccessibleSizedBox.fromHeight(
          key: testKey,
          height: 100,
        );

        expect(widget.key, equals(testKey));
      });

      test('constructor with GlobalKey', () {
        final testKey = GlobalKey();
        final widget = AccessibleSizedBox.fromHeight(
          key: testKey,
          height: 100,
        );

        expect(widget.key, equals(testKey));
      });
    });

    group('parameter combinations', () {
      test('height with width only', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          width: 200,
        );

        expect(widget.height, equals(100));
        expect(widget.width, equals(200));
        expect(widget.heightInLandscape, isNull);
        expect(widget.child, isNull);
      });

      test('height with landscape height only', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          heightInLandscape: 80,
        );

        expect(widget.height, equals(100));
        expect(widget.heightInLandscape, equals(80));
        expect(widget.width, isNull);
        expect(widget.child, isNull);
      });

      test('height with multipliers only', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 100,
          extraHeightPortraitMultiplier: 1.5,
          extraHeightLandscapeMultiplier: 2,
        );

        expect(widget.height, equals(100));
        expect(widget.extraHeightPortraitMultiplier, equals(1.5));
        expect(widget.extraHeightLandscapeMultiplier, equals(2.0));
        expect(widget.width, isNull);
        expect(widget.heightInLandscape, isNull);
      });

      test('all combinations with different values', () {
        const widget = AccessibleSizedBox.fromHeight(
          height: 120,
          heightInLandscape: 90,
          width: 250,
          extraHeightPortraitMultiplier: 1.8,
          extraHeightLandscapeMultiplier: 1.3,
          child: Text('Combined Test'),
        );

        expect(widget.height, equals(120));
        expect(widget.heightInLandscape, equals(90));
        expect(widget.width, equals(250));
        expect(widget.child, isA<Text>());
        expect(widget.extraHeightPortraitMultiplier, equals(1.8));
        expect(widget.extraHeightLandscapeMultiplier, equals(1.3));
      });
    });
  });
}
