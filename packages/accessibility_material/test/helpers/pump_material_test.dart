import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'pump_material.dart';

void main() {
  testWidgets('pumpMaterial provides the scope, Material and the strings', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return Text(AccessibilityLocalizations.of(context).accessibility);
        },
      ),
    );
    expect(find.text('Accessibility'), findsOneWidget);
    expect(Theme.of(captured).useMaterial3, isTrue);
    expect(MaterialLocalizations.of(captured).okButtonLabel, 'OK');
  });

  testWidgets('pumpMaterial forwards the media query flags', (tester) async {
    late BuildContext captured;
    await pumpMaterial(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return const SizedBox();
        },
      ),
      disableAnimations: true,
      highContrast: true,
    );
    expect(MediaQuery.disableAnimationsOf(captured), isTrue);
    expect(MediaQuery.highContrastOf(captured), isTrue);
  });
}
