import 'package:accessibility_material/src/ui/settings/widgets/components/color_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  group('ColorPicker', () {
    Widget picker(
      List<int?> log, {
      int? selected,
      bool allowPickingShades = true,
    }) => ColorPicker(
      colors: const [Colors.red, Colors.blue],
      selectedColorValue: selected,
      allowPickingShades: allowPickingShades,
      changeLabel: 'Change to',
      changeShadeLabel: 'Shade',
      onColorSelected: log.add,
    );

    testWidgets('reports a main colour and opens its shades', (tester) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log));
      await tester.tap(find.bySemanticsLabel('Change to Red'));
      await tester.pumpAndSettle();
      expect(log, [Colors.red.toARGB32()]);
      expect(find.bySemanticsLabel('Shade 500'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('reports a shade', (tester) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log, selected: Colors.red.toARGB32()));
      await tester.tap(find.bySemanticsLabel('Change to Red'));
      await tester.pumpAndSettle();
      await tester.tap(find.bySemanticsLabel('Shade 900'));
      await tester.pumpAndSettle();
      expect(log.last, Colors.red[900]!.toARGB32());
    });

    testWidgets('clears the selection with the close button', (tester) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log, selected: Colors.blue.toARGB32()));
      expect(find.byIcon(Icons.close), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(log, [null]);
    });

    testWidgets('stays on the main colours when shades are not allowed', (
      tester,
    ) async {
      final log = <int?>[];
      await pumpMaterial(tester, picker(log, allowPickingShades: false));
      await tester.tap(find.bySemanticsLabel('Change to Blue'));
      await tester.pumpAndSettle();
      expect(log, [Colors.blue.toARGB32()]);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.bySemanticsLabel('Change to Red'), findsOneWidget);
    });
  });
}
