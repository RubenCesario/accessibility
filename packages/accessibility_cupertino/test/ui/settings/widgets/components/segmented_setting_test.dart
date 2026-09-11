import 'package:accessibility_cupertino/src/ui/settings/widgets/components/segmented_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('SegmentedSetting fits a 375 px row at text scale 2', (
    tester,
  ) async {
    await pumpCupertino(
      tester,
      Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(2)),
          child: SizedBox(
            width: 375,
            child: SegmentedSetting<int>(
              title: 'Mode',
              icon: CupertinoIcons.gear,
              segments: const {1: 'One', 2: 'Two', 3: 'Three'},
              selected: 1,
              onSelected: (_) {},
            ),
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    // The doubled text is 26 px tall, so the 44 dp tap-target floor still
    // sets the segment height and nothing overflows.
    expect(tester.getSize(find.text('Two')).height, 26);
    expect(
      tester
          .getSize(
            find
                .ancestor(of: find.text('Two'), matching: find.byType(SizedBox))
                .first,
          )
          .height,
      kMinInteractiveDimensionCupertino,
    );
  });

  testWidgets('SegmentedSetting reports the tapped value', (tester) async {
    final log = <int>[];
    await pumpCupertino(
      tester,
      SegmentedSetting<int>(
        title: 'Mode',
        icon: CupertinoIcons.gear,
        segments: const {1: 'One', 2: 'Two', 3: 'Three'},
        selected: 1,
        onSelected: log.add,
      ),
    );
    expect(find.text('Mode'), findsOneWidget);
    await tester.tap(find.text('Three'));
    await tester.pumpAndSettle();
    expect(log, [3]);
    expect(tester.getSize(find.text('Two')).height, lessThan(44));
    expect(
      tester
          .getSize(
            find
                .ancestor(of: find.text('Two'), matching: find.byType(SizedBox))
                .first,
          )
          .height,
      44,
    );
  });
}
