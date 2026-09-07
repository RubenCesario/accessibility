import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/layout/widgets/accessible_sized_box.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

SizedBox box(WidgetTester tester) => tester.widget<SizedBox>(
  find
      .descendant(
        of: find.byType(AccessibleSizedBox),
        matching: find.byType(SizedBox),
      )
      .first,
);

void main() {
  group('AccessibleSizedBox', () {
    testWidgets('uses the height and width as given by default', (
      tester,
    ) async {
      await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(
          height: 50,
          width: 30,
          child: SizedBox(key: Key('child')),
        ),
      );
      expect(box(tester).height, 50);
      expect(box(tester).width, 30);
      expect(find.byKey(const Key('child')), findsOneWidget);
    });

    testWidgets('scales the height with the settings and rebuilds', (
      tester,
    ) async {
      final viewModel = await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(height: 50),
      );
      await viewModel.setTextScaleFactor(2);
      await tester.pump();
      expect(box(tester).height, closeTo(95, 0.001));
    });

    testWidgets('uses the landscape height in landscape', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(height: 50, heightInLandscape: 20),
        size: const Size(800, 400),
      );
      expect(box(tester).height, 20);
    });

    testWidgets('applies the extra multipliers when settings are active', (
      tester,
    ) async {
      await pumpScoped(
        tester,
        const AccessibleSizedBox.fromHeight(
          height: 50,
          extraHeightPortraitMultiplier: 2,
          extraHeightLandscapeMultiplier: 3,
        ),
        initial: const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2),
        ),
      );
      expect(box(tester).height, closeTo(190, 0.001));
    });
  });
}
