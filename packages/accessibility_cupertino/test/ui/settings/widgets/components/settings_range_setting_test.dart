import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_icon_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_range_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  Widget setting(List<double> log, double value) => SettingsRangeSetting(
    title: 'Size',
    subtitle: 'Bigger or smaller',
    icon: CupertinoIcons.textformat_size,
    value: value,
    min: 1,
    max: 2,
    divisions: 4,
    incrementLabel: 'More',
    decrementLabel: 'Less',
    onChanged: log.add,
  );

  final decrement = find.byIcon(CupertinoIcons.minus);
  final increment = find.byIcon(CupertinoIcons.plus);

  group('SettingsRangeSetting', () {
    testWidgets('steps and slides in the standard style', (tester) async {
      final log = <double>[];
      await pumpCupertino(tester, setting(log, 1));
      expect(find.text('Bigger or smaller'), findsOneWidget);
      expect(find.bySemanticsLabel('Less'), findsOneWidget);
      expect(find.bySemanticsLabel('More'), findsOneWidget);
      await tester.tap(increment);
      expect(log, [1.25]);
      await tester.tap(decrement);
      expect(log.last, 1);
      // CupertinoSlider.hitTestSelf only accepts drags that start near the
      // thumb, not anywhere on the track; with value == min the thumb sits
      // at the track's left edge, not at the widget's geometric centre that
      // find.byType(...).drag() would use, so the drag starts there instead.
      final sliderRect = tester.getRect(find.byType(CupertinoSlider));
      await tester.dragFrom(
        Offset(sliderRect.left + 12, sliderRect.center.dy),
        const Offset(600, 0),
      );
      await tester.pumpAndSettle();
      expect(log.last, 2);
      expect(tester.getSize(find.byType(SettingsIconButton).first).height, 44);
    });

    testWidgets('names the slider with the title', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpCupertino(tester, setting(<double>[], 1));
      // The annotation cannot merge into the slider's own node, which
      // carries the value and the adjust actions, so it becomes its parent:
      // the slider reads as an unnamed value under a node named 'Size'.
      final slider = tester.getSemantics(find.byType(CupertinoSlider));
      expect(slider.label, isEmpty);
      expect(slider.parent?.label, 'Size');
      handle.dispose();
    });

    testWidgets('clamps an out-of-range value for display', (tester) async {
      final log = <double>[];
      await pumpCupertino(tester, setting(log, 5));
      expect(
        tester.widget<CupertinoSlider>(find.byType(CupertinoSlider)).value,
        2,
      );
      await tester.tap(decrement);
      expect(log, [1.75]);
    });

    testWidgets('steps with disabled ends in the cards style', (tester) async {
      final log = <double>[];
      Widget cards(double value) => PanelScope(
        configuration: const AccessibilitySettingsConfiguration(),
        style: AccessibilitySettingsStyle.cards,
        child: setting(log, value),
      );
      await pumpCupertino(tester, cards(1));
      expect(find.byType(CupertinoSlider), findsNothing);
      expect(find.text('1.00'), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.textformat_size), findsOneWidget);
      expect(
        tester
            .widget<SettingsIconButton>(
              find.widgetWithIcon(SettingsIconButton, CupertinoIcons.minus),
            )
            .onPressed,
        isNull,
      );
      await tester.tap(increment);
      expect(log, [1.25]);
      await pumpCupertino(tester, cards(2));
      expect(find.text('2.00'), findsOneWidget);
      expect(
        tester
            .widget<SettingsIconButton>(
              find.widgetWithIcon(SettingsIconButton, CupertinoIcons.plus),
            )
            .onPressed,
        isNull,
      );
      await tester.tap(decrement);
      expect(log.last, 1.75);
    });
  });
}
