import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_color_picker.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

// The full ten-shade red palette (the exact shade values Material's
// `Colors.red` uses) so its shades open with meaningful "Shade 500" /
// "Shade 900" semantics labels; `blue` is never opened for shades in these
// scenarios so a single-shade swatch is enough for it.
const ColorSwatch<int> red = ColorSwatch<int>(0xFFF44336, {
  50: Color(0xFFFFEBEE),
  100: Color(0xFFFFCDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFE57373),
  400: Color(0xFFEF5350),
  500: Color(0xFFF44336),
  600: Color(0xFFE53935),
  700: Color(0xFFD32F2F),
  800: Color(0xFFC62828),
  900: Color(0xFFB71C1C),
});
const ColorSwatch<int> blue = ColorSwatch<int>(0xFF2196F3, {
  500: Color(0xFF2196F3),
});

void main() {
  group('CupertinoColorPicker', () {
    Widget picker(
      List<int?> log, {
      int? selected,
      bool allowPickingShades = true,
    }) => CupertinoColorPicker(
      colors: const [red, blue],
      selectedColorValue: selected,
      allowPickingShades: allowPickingShades,
      changeLabel: 'Change to',
      changeShadeLabel: 'Shade',
      onColorSelected: log.add,
    );

    testWidgets('reports a main colour and opens its shades', (tester) async {
      final log = <int?>[];
      await pumpCupertino(tester, picker(log));
      await tester.tap(find.bySemanticsLabel('Change to Red'));
      await tester.pumpAndSettle();
      expect(log, [red.toARGB32()]);
      expect(find.bySemanticsLabel('Shade 500'), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.arrow_left), findsOneWidget);
    });

    testWidgets('reports a shade', (tester) async {
      final log = <int?>[];
      await pumpCupertino(tester, picker(log, selected: red.toARGB32()));
      await tester.tap(find.bySemanticsLabel('Change to Red'));
      await tester.pumpAndSettle();
      await tester.tap(find.bySemanticsLabel('Shade 900'));
      await tester.pumpAndSettle();
      expect(log.last, red[900]!.toARGB32());
    });

    testWidgets('clears the selection with the close button', (tester) async {
      final log = <int?>[];
      await pumpCupertino(tester, picker(log, selected: blue.toARGB32()));
      expect(find.byIcon(CupertinoIcons.xmark), findsOneWidget);
      await tester.tap(find.byIcon(CupertinoIcons.xmark));
      await tester.pumpAndSettle();
      expect(log, [null]);
    });

    testWidgets('stays on the main colours when shades are not allowed', (
      tester,
    ) async {
      final log = <int?>[];
      await pumpCupertino(tester, picker(log, allowPickingShades: false));
      await tester.tap(find.bySemanticsLabel('Change to Blue'));
      await tester.pumpAndSettle();
      expect(log, [blue.toARGB32()]);
      expect(find.byIcon(CupertinoIcons.arrow_left), findsNothing);
      expect(find.bySemanticsLabel('Change to Red'), findsOneWidget);
    });
  });
}
