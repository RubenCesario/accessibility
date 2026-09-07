import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/accessible_text_style.dart';
import 'package:flutter_accessibility/src/ui/text/widgets/accessible_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

Text rendered(WidgetTester tester) => tester.widget<Text>(find.byType(Text));

void main() {
  group('AccessibleText', () {
    testWidgets('renders the ambient text style when settings are default', (
      tester,
    ) async {
      await pumpScoped(tester, const AccessibleText('hello'));
      final text = rendered(tester);
      expect(text.data, 'hello');
      expect(text.style?.fontSize, 14);
      expect(text.style?.color, const Color(0xFF000000));
      expect(text.textAlign, isNull);
    });

    testWidgets('merges the given style over the ambient one', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello', style: TextStyle(fontSize: 20)),
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 20);
      expect(text.style?.color, const Color(0xFF000000));
    });

    testWidgets('leaves scale, spacing, weight and family to the theme', (
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
        fonts: const [AccessibleFont(family: 'Andika', package: 'font_andika')],
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 14);
      expect(text.style?.fontWeight, isNull);
      expect(text.style?.letterSpacing, isNull);
      expect(text.style?.color, const Color(0xFF000000));
      expect(text.style?.fontFamily, isNull);
      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('follows an ambient style that applies the settings once', (
      tester,
    ) async {
      const settings = TextSettings(textScaleFactor: 2, isBold: true);
      await pumpScoped(
        tester,
        const AccessibleText('hello'),
        initial: const AccessibilitySettings(textSettings: settings),
        textStyle: kTestTextStyle.applyTextSettings(settings),
      );
      final text = rendered(tester);
      expect(text.style?.fontSize, 28);
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('textColor overrides the ambient colour', (tester) async {
      await pumpScoped(
        tester,
        const AccessibleText('hello', textColor: Color(0xFFABCDEF)),
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
          strutStyle: StrutStyle(fontSize: 12),
          locale: Locale('it'),
          textScaler: TextScaler.linear(1.2),
          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
          ),
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
      expect(text.strutStyle, const StrutStyle(fontSize: 12));
      expect(text.locale, const Locale('it'));
      expect(text.textScaler, const TextScaler.linear(1.2));
      expect(
        text.textHeightBehavior,
        const TextHeightBehavior(applyHeightToFirstAscent: false),
      );
    });
  });
}
