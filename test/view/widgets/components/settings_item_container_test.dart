import 'package:accessibility/src/view/widgets/components/settings_item_container.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const testTitle = 'Test Container Title';

  late Widget testWidget;

  setUp(() {
    testWidget = buildDefaultTestWidget(
      child: const SettingsItemContainer(
        title: testTitle,
        setting: MockSettingsItem(),
      ),
    );
  });

  group('SettingsItemContainer', () {
    testWidgets('renders correctly with title and setting', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(SettingsItemContainer), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders correctly without title', (tester) async {
      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: const SettingsItemContainer(
            setting: MockSettingsItem(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the widget renders without a title
      expect(find.byType(SettingsItemContainer), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('applies width factor correctly', (tester) async {
      const testWidthFactor = 0.5;
      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: const SettingsItemContainer(
            setting: MockSettingsItem(),
            widthFactor: testWidthFactor,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check that the width factor is applied
      final fractionallySizedBox = tester.widget<FractionallySizedBox>(
        find.byType(FractionallySizedBox),
      );

      expect(fractionallySizedBox.widthFactor, equals(testWidthFactor));
    });

    testWidgets('applies width factor correctly with title', (tester) async {
      const testWidthFactor = 0.75;

      final testWidget = buildDefaultTestWidget(
        child: const SettingsItemContainer(
          title: testTitle,
          setting: MockSettingsItem(),
          widthFactor: testWidthFactor,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the width factor is applied
      final fractionallySizedBox = tester.widget<FractionallySizedBox>(
        find.byType(FractionallySizedBox),
      );

      expect(fractionallySizedBox.widthFactor, equals(testWidthFactor));
    });

    testWidgets('uses accessible text for title', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify accessible text widget is used for title
      expect(find.byType(AccessibleText), findsOneWidget);

      final accessibleText = tester.widget<AccessibleText>(
        find.byType(AccessibleText),
      );
      expect(accessibleText.data, equals(testTitle));
    });

    testWidgets('setting is wrapped in padding', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the setting is wrapped in padding
      expect(
        find.ancestor(
          of: find.byType(MockSettingsItem),
          matching: find.byType(Padding),
        ),
        findsOneWidget,
      );
    });
  });
}
