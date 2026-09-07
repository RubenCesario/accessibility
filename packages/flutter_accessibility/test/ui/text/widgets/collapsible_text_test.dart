import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/collapsible_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

const longText =
    'word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word '
    'word word word word word word word word word word word word word word';

Widget subject(String text, {int maxLines = 3, double width = 200}) => Center(
  child: SizedBox(
    width: width,
    child: CollapsibleText(
      text: text,
      maxLines: maxLines,
      toggleBuilder: (context, {required expanded, required onToggle}) =>
          GestureDetector(
            onTap: onToggle,
            child: Text(expanded ? 'less' : 'more'),
          ),
    ),
  ),
);

Text body(WidgetTester tester) => tester.widget<Text>(
  find
      .descendant(of: find.byType(CollapsibleText), matching: find.byType(Text))
      .first,
);

void main() {
  group('CollapsibleText', () {
    testWidgets('shows short text in full without a toggle', (tester) async {
      await pumpScoped(tester, subject('short'));
      expect(find.text('short'), findsOneWidget);
      expect(find.text('more'), findsNothing);
      expect(body(tester).maxLines, isNull);
    });

    testWidgets('truncates long text and expands on toggle', (tester) async {
      await pumpScoped(tester, subject(longText));
      expect(body(tester).maxLines, 3);
      expect(body(tester).overflow, TextOverflow.ellipsis);
      expect(find.text('more'), findsOneWidget);
      await tester.tap(find.text('more'));
      await tester.pump();
      expect(body(tester).maxLines, isNull);
      expect(find.text('less'), findsOneWidget);
      await tester.tap(find.text('less'));
      await tester.pump();
      expect(body(tester).maxLines, 3);
    });

    testWidgets('leaves one line for the toggle in landscape', (tester) async {
      await pumpScoped(tester, subject(longText), size: const Size(800, 400));
      expect(body(tester).maxLines, 2);
      await pumpScoped(
        tester,
        subject(longText, maxLines: 1),
        size: const Size(800, 400),
      );
      expect(body(tester).maxLines, 1);
    });

    testWidgets('measures with the accessible style', (tester) async {
      // The test font renders every glyph as a fontSize-wide square, so at
      // 14px a 200px box holds 14 characters per line: 22 characters take
      // two lines, and at 3x (42px, 4 characters per line) six lines.
      final viewModel = await pumpScoped(
        tester,
        subject('fits in two lines here'),
      );
      expect(find.text('more'), findsNothing);
      await viewModel.setTextScaleFactor(3);
      await tester.pump();
      expect(find.text('more'), findsOneWidget);
    });

    test('rejects a non-positive maxLines', () {
      expect(
        () => CollapsibleText(
          text: 'x',
          maxLines: 0,
          toggleBuilder: (context, {required expanded, required onToggle}) =>
              const SizedBox(),
        ),
        throwsAssertionError,
      );
    });
  });
}
