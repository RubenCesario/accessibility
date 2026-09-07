import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/effects_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  Widget subject() => EffectsBuilder(
    builder: (context, {required effectsEnabled, child}) =>
        Column(children: [Text(effectsEnabled ? 'on' : 'off'), child!]),
    child: const SizedBox(key: Key('child')),
  );

  testWidgets('EffectsBuilder follows the OS signal in system mode', (
    tester,
  ) async {
    await pumpScoped(tester, subject(), disableAnimations: true);
    expect(find.text('off'), findsOneWidget);
    expect(find.byKey(const Key('child')), findsOneWidget);
  });

  testWidgets('EffectsBuilder follows the explicit modes', (tester) async {
    final viewModel = await pumpScoped(
      tester,
      subject(),
      disableAnimations: true,
    );
    await viewModel.setEffectsMode(EffectsMode.enabled);
    await tester.pump();
    expect(find.text('on'), findsOneWidget);
    await viewModel.setEffectsMode(EffectsMode.disabled);
    await tester.pump();
    expect(find.text('off'), findsOneWidget);
  });

  testWidgets('EffectsBuilder is on by default without reduce motion', (
    tester,
  ) async {
    await pumpScoped(tester, subject());
    expect(find.text('on'), findsOneWidget);
  });
}
