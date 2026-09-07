import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/layout/accessible_height.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_scoped.dart';

Future<double> heightFor(
  WidgetTester tester, {
  required AccessibilitySettings settings,
  Size size = const Size(400, 800),
  double portrait = 1,
  double landscape = 1,
}) async {
  late double seen;
  await pumpScoped(
    tester,
    Builder(
      builder: (context) {
        seen = 100.0.makeHeightAccessible(
          context,
          extraPortraitMultiplier: portrait,
          extraLandscapeMultiplier: landscape,
        );
        return const SizedBox();
      },
    ),
    initial: settings,
    size: size,
  );
  return seen;
}

void main() {
  group('makeHeightAccessible', () {
    testWidgets('keeps the height for default settings', (tester) async {
      expect(
        await heightFor(tester, settings: AccessibilitySettings.defaults),
        100,
      );
    });

    testWidgets('grows with the scale factor above 1', (tester) async {
      expect(
        await heightFor(
          tester,
          settings: const AccessibilitySettings(
            textSettings: TextSettings(textScaleFactor: 2),
          ),
        ),
        closeTo(190, 0.001),
      );
    });

    testWidgets('grows with a line height above 1.5', (tester) async {
      expect(
        await heightFor(
          tester,
          settings: const AccessibilitySettings(
            textSettings: TextSettings(lineHeight: 2),
          ),
        ),
        closeTo(110, 0.001),
      );
    });

    testWidgets('applies the orientation multiplier only when scaled', (
      tester,
    ) async {
      expect(
        await heightFor(
          tester,
          settings: AccessibilitySettings.defaults,
          portrait: 2,
          landscape: 3,
        ),
        100,
      );
      const scaled = AccessibilitySettings(
        textSettings: TextSettings(textScaleFactor: 2),
      );
      expect(
        await heightFor(tester, settings: scaled, portrait: 2, landscape: 3),
        closeTo(380, 0.001),
      );
      expect(
        await heightFor(
          tester,
          settings: scaled,
          size: const Size(800, 400),
          portrait: 2,
          landscape: 3,
        ),
        closeTo(570, 0.001),
      );
    });

    testWidgets('rejects non-positive multipliers', (tester) async {
      await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            100.0.makeHeightAccessible(context, extraPortraitMultiplier: 0);
            return const SizedBox();
          },
        ),
      );
      expect(tester.takeException(), isAssertionError);
    });
  });
}
