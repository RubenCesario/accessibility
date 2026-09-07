import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/text_raw_magnifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  testWidgets('TextRawMagnifier shows a magnifier while long-pressing', (
    tester,
  ) async {
    await pumpScoped(
      tester,
      const Center(
        child: TextRawMagnifier(
          borderColor: Color(0xFFFF0000),
          child: Text('magnify me'),
        ),
      ),
    );
    expect(find.byType(RawMagnifier), findsNothing);
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('magnify me')),
    );
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    expect(find.byType(RawMagnifier), findsOneWidget);
    final before = tester.getTopLeft(find.byType(RawMagnifier));
    await gesture.moveBy(const Offset(20, 10));
    await tester.pump();
    final after = tester.getTopLeft(find.byType(RawMagnifier));
    expect(after.dx, closeTo(before.dx + 20, 0.5));
    expect(after.dy, closeTo(before.dy + 10, 0.5));
    await gesture.up();
    await tester.pump();
    expect(find.byType(RawMagnifier), findsNothing);
  });

  testWidgets('TextRawMagnifier uses the default text colour as border', (
    tester,
  ) async {
    await pumpScoped(
      tester,
      const Center(child: TextRawMagnifier(child: Text('magnify me'))),
    );
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('magnify me')),
    );
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    final magnifier = tester.widget<RawMagnifier>(find.byType(RawMagnifier));
    final shape = magnifier.decoration.shape as RoundedRectangleBorder;
    expect(shape.side.color, const Color(0xFF000000));
    await gesture.up();
    await tester.pump();
  });
}
