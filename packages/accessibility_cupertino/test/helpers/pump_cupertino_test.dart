import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_cupertino.dart';

void main() {
  testWidgets('pumpCupertino provides the scope, the theme and the strings', (
    tester,
  ) async {
    late BuildContext captured;
    await pumpCupertino(
      tester,
      Builder(
        builder: (context) {
          captured = context;
          return Text(AccessibilityLocalizations.of(context).accessibility);
        },
      ),
    );
    expect(find.text('Accessibility'), findsOneWidget);
    expect(CupertinoTheme.of(captured).primaryColor, isNotNull);
    expect(CupertinoLocalizations.of(captured).alertDialogLabel, 'Alert');
  });

  testWidgets('pumpCupertino forwards the media query flags', (tester) async {
    late BuildContext captured;
    await pumpCupertino(
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
