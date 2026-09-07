import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/accessible_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

const andika = AccessibleFont(family: 'Andika', package: 'font_andika');

Text rendered(WidgetTester tester) => tester.widget<Text>(find.byType(Text));

void main() {
  group('AccessibleText', () {
    testWidgets('renders the default text style when settings are default', (
      tester,
    ) async {
      await pumpScoped(tester, const AccessibleText('hello'));
      final text = rendered(tester);
      expect(text.data, 'hello');
      expect(text.style?.fontSize, 14);
      expect(text.style?.color, const Color(0xFF000000));
      expect(text.textAlign, isNull);
    });

    testWidgets('merges the given style over the default one', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello', style: TextStyle(fontSize: 20)),
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 20);
      expect(text.style?.color, const Color(0xFF000000));
    });

    testWidgets('applies the text settings and the registered font', (
      tester,
    ) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello'),
        initial: const AccessibilitySettings(
          textSettings: TextSettings(
            textScaleFactor: 2,
            isBold: true,
            letterSpacing: 1,
            color: 0xFF112233,
            fontFamily: 'Andika',
            textAlign: TextAlignMode.center,
          ),
        ),
        fonts: const [andika],
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 28);
      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.letterSpacing, 1);
      expect(text.style?.color, const Color(0xFF112233));
      expect(text.style?.fontFamily, 'packages/font_andika/Andika');
      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('textColor wins over the settings colour', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello', textColor: Color(0xFFABCDEF)),
        initial: const AccessibilitySettings(
          textSettings: TextSettings(color: 0xFF112233),
        ),
      );
      expect(rendered(tester).style?.color, const Color(0xFFABCDEF));
    });

    testWidgets('the settings alignment wins over the widget alignment', (
      tester,
    ) async {
      final viewModel = await pumpScoped(
        tester,
        const AccessibleText('hello', textAlign: TextAlign.right),
      );
      expect(rendered(tester).textAlign, TextAlign.right);
      await viewModel.setTextAlign(TextAlignMode.justify);
      await tester.pump();
      expect(rendered(tester).textAlign, TextAlign.justify);
    });

    testWidgets('forwards the remaining Text parameters', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText(
          'hello',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          semanticsLabel: 'greeting',
          semanticsIdentifier: 'id',
          textDirection: TextDirection.rtl,
          textWidthBasis: TextWidthBasis.longestLine,
          selectionColor: Color(0xFF00FF00),
        ),
      );
      final text = rendered(tester);
      expect(text.maxLines, 2);
      expect(text.overflow, TextOverflow.ellipsis);
      expect(text.softWrap, isFalse);
      expect(text.semanticsLabel, 'greeting');
      expect(text.semanticsIdentifier, 'id');
      expect(text.textDirection, TextDirection.rtl);
      expect(text.textWidthBasis, TextWidthBasis.longestLine);
      expect(text.selectionColor, const Color(0xFF00FF00));
    });

    testWidgets('rebuilds when the settings change', (tester) async {
      final viewModel = await pumpScoped(tester, const AccessibleText('hi'));
      await viewModel.setTextScaleFactor(1.5);
      await tester.pump();
      expect(rendered(tester).style?.fontSize, 21);
    });
  });
}
