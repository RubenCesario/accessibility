import 'package:accessibility_cupertino/src/ui/routes/route_effects.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_cupertino.dart';

Widget capture(void Function(BuildContext context) onBuild) => Builder(
  builder: (context) {
    onBuild(context);
    return const SizedBox();
  },
);

void main() {
  group('routeEffectsEnabled', () {
    testWidgets('is true by default', (tester) async {
      late BuildContext captured;
      await pumpCupertino(tester, capture((context) => captured = context));
      expect(routeEffectsEnabled(captured), isTrue);
    });

    testWidgets('is false when the user disabled effects', (tester) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        capture((context) => captured = context),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
      );
      expect(routeEffectsEnabled(captured), isFalse);
    });

    testWidgets('follows the OS reduce-motion signal in system mode', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        capture((context) => captured = context),
        disableAnimations: true,
      );
      expect(routeEffectsEnabled(captured), isFalse);
    });

    testWidgets('ignores the OS signal when effects are forced on', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        capture((context) => captured = context),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.enabled),
        disableAnimations: true,
      );
      expect(routeEffectsEnabled(captured), isTrue);
    });

    testWidgets('is true without a scope', (tester) async {
      late BuildContext captured;
      await tester.pumpWidget(
        CupertinoApp(home: capture((context) => captured = context)),
      );
      expect(routeEffectsEnabled(captured), isTrue);
    });
  });
}
