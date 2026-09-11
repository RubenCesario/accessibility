import 'package:accessibility_cupertino/src/ui/text/widgets/cupertino_read_more_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_cupertino.dart';

const longText =
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word';

void main() {
  testWidgets('CupertinoReadMoreText toggles between more and less', (
    tester,
  ) async {
    await pumpCupertino(
      tester,
      const SizedBox(width: 200, child: CupertinoReadMoreText(text: longText)),
    );
    expect(find.text('Show info'), findsOneWidget);
    await tester.tap(find.byType(CupertinoButton));
    await tester.pumpAndSettle();
    expect(find.text('Hide info'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus_circle), findsOneWidget);
  });

  testWidgets('CupertinoReadMoreText shows short text without a button', (
    tester,
  ) async {
    await pumpCupertino(tester, const CupertinoReadMoreText(text: 'short'));
    expect(find.byType(CupertinoButton), findsNothing);
  });
}
