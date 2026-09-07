import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/layout/widgets/accessible_widget_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

const plain = SizedBox(key: Key('plain'));
const accessible = SizedBox(key: Key('accessible'));
const scaled = AccessibilitySettings(
  textSettings: TextSettings(textScaleFactor: 2),
);

// Mutable so the value below is not a compile-time constant: the point of
// the test that reads it is to exercise a genuine runtime constructor call.
Widget _runtimeChild = plain;

void main() {
  group('AccessibleWidgetBuilder', () {
    testWidgets('shows the child with default settings', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          child: plain,
        ),
      );
      expect(find.byKey(const Key('plain')), findsOneWidget);
    });

    testWidgets('shows the accessible child when text settings are set', (
      tester,
    ) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          child: plain,
        ),
        initial: scaled,
      );
      expect(find.byKey(const Key('accessible')), findsOneWidget);
    });

    testWidgets('falls back to the child without an accessible child', (
      tester,
    ) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(child: plain),
        initial: scaled,
      );
      expect(find.byKey(const Key('plain')), findsOneWidget);
    });

    testWidgets('landscape-only shows the accessible child in landscape only', (
      tester,
    ) async {
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          showAccessibleChildOnlyOnLandscape: true,
          child: plain,
        ),
        initial: scaled,
      );
      expect(find.byKey(const Key('plain')), findsOneWidget);
      await pumpScoped(
        tester,
        const AccessibleWidgetBuilder(
          accessibleChild: accessible,
          showAccessibleChildOnlyOnLandscape: true,
          child: plain,
        ),
        initial: scaled,
        size: const Size(800, 400),
      );
      expect(find.byKey(const Key('accessible')), findsOneWidget);
    });

    testWidgets('builds correctly without a const constructor call', (
      tester,
    ) async {
      await pumpScoped(tester, AccessibleWidgetBuilder(child: _runtimeChild));
      expect(find.byKey(const Key('plain')), findsOneWidget);
    });
  });
}
