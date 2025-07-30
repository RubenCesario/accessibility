import 'package:accessibility/src/view/widgets/components/circle_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CircleColor', () {
    late Color testColor;
    late bool isSelected;
    late ValueSetter<Color> onColorSetCallback;
    late int callbackCount;

    setUp(() {
      testColor = Colors.red;
      isSelected = false;
      callbackCount = 0;
      onColorSetCallback = (color) {
        callbackCount++;
        expect(color, equals(testColor));
      };
    });

    testWidgets('renders correctly with default settings', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: CircleColor(
          color: testColor,
          iconSelected: Icons.check,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(CircleColor), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);

      // Check that the CircleAvatar has the correct color
      final circleAvatar =
          tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(circleAvatar.backgroundColor, equals(testColor));

      // When not selected, no icon should be visible
      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('displays selection icon when selected', (tester) async {
      isSelected = true;
      final testWidget = buildDefaultTestWidget(
        child: CircleColor(
          color: testColor,
          isSelected: isSelected,
          iconSelected: Icons.check,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the icon is displayed when selected
      expect(find.byType(Icon), findsOneWidget);

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.icon, equals(Icons.check));
    });

    testWidgets('calls onColorSet callback when tapped', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: CircleColor(
          color: testColor,
          onColorSet: onColorSetCallback,
          iconSelected: Icons.check,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Initially the callback should not have been called
      expect(callbackCount, equals(0));

      // Tap the circle
      await tester.tap(find.byType(CircleColor));
      await tester.pumpAndSettle();

      // Check that the callback was called
      expect(callbackCount, equals(1));
    });

    testWidgets('uses specified circle size', (tester) async {
      const testSize = 50.0;
      final testWidget = buildDefaultTestWidget(
        child: CircleColor(
          color: testColor,
          circleSize: testSize,
          iconSelected: Icons.check,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the CircleAvatar has the correct size
      final circleAvatar =
          tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(circleAvatar.radius, equals(testSize / 2));
    });
  });
}
