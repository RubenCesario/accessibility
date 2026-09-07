import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  group('AccessibilityScope', () {
    testWidgets('of returns the view model without a dependency', (
      tester,
    ) async {
      late BuildContext captured;
      var builds = 0;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            builds++;
            return const SizedBox();
          },
        ),
      );
      expect(AccessibilityScope.of(captured), same(viewModel));
      expect(AccessibilityScope.maybeOf(captured), same(viewModel));
      await viewModel.setBold(value: true);
      await tester.pump();
      expect(builds, 1);
    });

    testWidgets('settingsOf rebuilds the caller on change', (tester) async {
      var builds = 0;
      late AccessibilitySettings seen;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            builds++;
            seen = AccessibilityScope.settingsOf(context);
            return const SizedBox();
          },
        ),
      );
      expect(seen, AccessibilitySettings.defaults);
      await viewModel.setBold(value: true);
      await tester.pump();
      expect(builds, 2);
      expect(seen.textSettings.isBold, isTrue);
    });

    testWidgets('effectsEnabledOf resolves the mode against MediaQuery', (
      tester,
    ) async {
      late BuildContext captured;
      final viewModel = await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
        disableAnimations: true,
      );
      expect(AccessibilityScope.effectsEnabledOf(captured), isFalse);
      await viewModel.setEffectsMode(EffectsMode.enabled);
      await tester.pump();
      expect(AccessibilityScope.effectsEnabledOf(captured), isTrue);
      await viewModel.setEffectsMode(EffectsMode.disabled);
      await tester.pump();
      expect(AccessibilityScope.effectsEnabledOf(captured), isFalse);
    });

    testWidgets('effectsEnabledOf follows the system when not reduced', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpScoped(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      );
      expect(AccessibilityScope.effectsEnabledOf(captured), isTrue);
    });

    testWidgets('accessors assert without a scope', (tester) async {
      late BuildContext captured;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      );
      expect(AccessibilityScope.maybeOf(captured), isNull);
      expect(() => AccessibilityScope.of(captured), throwsAssertionError);
      expect(
        () => AccessibilityScope.settingsOf(captured),
        throwsAssertionError,
      );
    });
  });
}
