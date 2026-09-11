import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_switch_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('SettingsSwitchTile toggles from the switch and the row', (
    tester,
  ) async {
    final log = <bool>[];
    await pumpCupertino(
      tester,
      SettingsSwitchTile(
        title: 'Bold',
        subtitle: 'Heavier text',
        value: false,
        onChanged: log.add,
      ),
    );
    await tester.tap(find.byType(CupertinoSwitch));
    await tester.tap(find.text('Bold'));
    expect(log, [true, true]);
    final node = tester.getSemantics(find.byType(MergeSemantics).first);
    expect(node.label, contains('Bold'));
    expect(node.rect.height, greaterThanOrEqualTo(44));
  });
}
