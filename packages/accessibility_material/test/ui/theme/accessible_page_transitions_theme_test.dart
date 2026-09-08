import 'package:accessibility_material/src/ui/theme/accessible_page_transitions_theme.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/pump_material.dart';

void main() {
  const child = SizedBox(key: Key('page'));

  Widget transition(BuildContext context) =>
      const AccessiblePageTransitionsTheme().buildTransitions(
        MaterialPageRoute<void>(builder: (_) => child),
        context,
        const AlwaysStoppedAnimation(0.5),
        const AlwaysStoppedAnimation(0),
        child,
      );

  Widget capture(void Function(BuildContext context) onBuild) => Builder(
    builder: (context) {
      onBuild(context);
      return const SizedBox();
    },
  );

  testWidgets('plays the transition when effects are enabled', (tester) async {
    late BuildContext captured;
    await pumpMaterial(tester, capture((context) => captured = context));
    expect(transition(captured), isNot(same(child)));
  });

  testWidgets('returns the page itself when effects are disabled', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      capture((context) => captured = context),
      initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
    );
    expect(transition(captured), same(child));
  });

  testWidgets('follows the OS reduce-motion signal in system mode', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      capture((context) => captured = context),
      disableAnimations: true,
    );
    expect(transition(captured), same(child));
  });

  testWidgets('plays the transition without a scope', (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(home: capture((context) => captured = context)),
    );
    expect(transition(captured), isNot(same(child)));
  });

  test('keeps the given builders', () {
    const theme = AccessiblePageTransitionsTheme(
      builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()},
    );
    expect(
      theme.builders[TargetPlatform.android],
      isA<ZoomPageTransitionsBuilder>(),
    );
  });
}
