import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsItemCard', () {
    const testTitle = 'Test Setting';
    const testIcon = Icons.settings;
    late int onTapCount;

    setUp(() {
      onTapCount = 0;
    });

    VoidCallback onTap() => () {
          onTapCount++;
        };

    testWidgets('renders correctly with title and icon', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemCard(
          title: testTitle,
          icon: testIcon,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(SettingsItemCard), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('calls onTap callback when tapped', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: SettingsItemCard(
          title: testTitle,
          icon: testIcon,
          onTap: onTap(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Initially the callback should not have been called
      expect(onTapCount, equals(0));

      // Tap the card
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Check that the callback was called
      expect(onTapCount, equals(1));
    });

    testWidgets('displays highlighted state correctly', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemCard(
          title: testTitle,
          icon: testIcon,
          isHighlighted: true,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the Card widget to check its color
      final card = tester.widget<Card>(find.byType(Card));

      // In highlighted state, card should use primary color
      expect(card.color, isNotNull);

      // Check that the text also uses highlighted style
      final textWidget = tester.widget<AccessibleText>(
        find.descendant(
          of: find.byType(SettingsItemCard),
          matching: find.byType(AccessibleText),
        ),
      );
      expect(textWidget.textColor, isNotNull);
    });

    testWidgets('uses proper semantics', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemCard(
          title: testTitle,
          icon: testIcon,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check semantics
      final semantics = tester.getSemantics(
        find
            .descendant(
              of: find.byType(SettingsItemCard),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.label, equals(testTitle));
    });

    testWidgets('renders without icon', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemCard(
          title: testTitle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify title is present but no icon
      expect(
        find.descendant(
          of: find.byType(SettingsItemCard),
          matching: find.byType(AccessibleText),
        ),
        findsOneWidget,
      );
      expect(
        find.byType(Icon),
        findsOneWidget,
      ); // Icon will still be present but with null icon data

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.icon, isNull);
    });
  });
}
