import 'package:accessibility_material/src/ui/settings/widgets/components/stepper_settings_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('StepperSettingsCard steps within the range', (tester) async {
    final log = <double>[];
    Widget card(double value) => StepperSettingsCard(
      icon: Icons.format_size,
      title: 'Size',
      value: value,
      min: 1,
      max: 2,
      divisions: 4,
      decrementLabel: 'Less',
      incrementLabel: 'More',
      onChanged: log.add,
    );
    // find.byTooltip locates the RawTooltip wrapper rather than the
    // IconButton itself, so the buttons are found by their icon instead.
    final decrement = find.widgetWithIcon(IconButton, Icons.remove);
    final increment = find.widgetWithIcon(IconButton, Icons.add);
    await pumpMaterial(tester, card(1));
    expect(tester.widget<IconButton>(decrement).onPressed, isNull);
    await tester.tap(increment);
    expect(log, [1.25]);
    await pumpMaterial(tester, card(2));
    expect(tester.widget<IconButton>(increment).onPressed, isNull);
    await tester.tap(decrement);
    expect(log.last, 1.75);
    final values = tester
        .widgetList<Semantics>(
          find.descendant(
            of: find.byType(StepperSettingsCard),
            matching: find.byType(Semantics),
          ),
        )
        .map((widget) => widget.properties.value);
    expect(values, contains('5/5'));
  });
}
