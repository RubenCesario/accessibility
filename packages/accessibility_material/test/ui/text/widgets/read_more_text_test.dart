import 'package:accessibility_material/src/ui/text/widgets/read_more_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/pump_material.dart';

const longText =
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word';

void main() {
  testWidgets('ReadMoreText toggles between more and less', (tester) async {
    await pumpMaterial(
      tester,
      const SizedBox(width: 200, child: ReadMoreText(text: longText)),
    );
    expect(find.text('Show info'), findsOneWidget);
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    expect(find.text('Hide info'), findsOneWidget);
    expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
  });

  testWidgets('ReadMoreText shows short text without a button', (tester) async {
    await pumpMaterial(tester, const ReadMoreText(text: 'short'));
    expect(find.byType(TextButton), findsNothing);
  });
}
