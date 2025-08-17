import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AccessibleText', () {
    const testText = 'Test Text';
    const customColor = Colors.red;

    testWidgets('renders text correctly with default settings', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(testText),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the text is rendered
      expect(find.text(testText), findsOneWidget);

      // Verify it's an AccessibleText widget
      expect(find.byType(AccessibleText), findsOneWidget);
    });

    testWidgets('applies custom text color when provided', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(
          testText,
          textColor: customColor,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the underlying Text widget to check its style
      final textWidget = tester.widget<Text>(
        find.text(testText),
      );

      // The TextStyle should have our custom color
      expect(textWidget.style?.color, equals(customColor));
    });

    testWidgets('applies custom text style when provided', (tester) async {
      const customStyle = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(
          testText,
          style: customStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the underlying Text widget to check its style
      final textWidget = tester.widget<Text>(
        find.text(testText),
      );

      // The TextStyle should have our custom properties
      expect(textWidget.style?.fontSize, equals(customStyle.fontSize));
      expect(textWidget.style?.fontWeight, equals(customStyle.fontWeight));
    });

    testWidgets('applies text alignment when provided', (tester) async {
      const customAlign = TextAlign.center;

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(
          testText,
          textAlign: customAlign,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the underlying Text widget to check its alignment
      final textWidget = tester.widget<Text>(
        find.text(testText),
      );

      // The alignment should match what we provided
      expect(textWidget.textAlign, equals(customAlign));
    });

    testWidgets('responds to text settings changes', (tester) async {
      // Create widget with mock settings
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(testText),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(AccessibleText)),
      );

      // Initial text settings are default
      expect(settings.textSettings.value, equals(TextSettings.defaultSettings));

      // Update text settings to use right alignment
      settings.textSettings.value = settings.textSettings.value.copyWith(
        textAlignMode: 'right',
      );
      await tester.pump();

      // Find the underlying Text widget to check its alignment
      final textWidget = tester.widget<Text>(
        find.text(testText),
      );

      // The alignment should now be right
      expect(textWidget.textAlign, equals(TextAlign.right));
    });

    testWidgets('prioritizes provided textColor over style color',
        (tester) async {
      const styleColor = Colors.blue;
      const styleWithColor = TextStyle(color: styleColor);

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(
          testText,
          textColor: customColor,
          style: styleWithColor,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find the underlying Text widget to check its style
      final textWidget = tester.widget<Text>(
        find.text(testText),
      );

      // The TextStyle color should be the explicitly provided textColor
      // rather than the color in the style
      expect(textWidget.style?.color, equals(customColor));
      expect(textWidget.style?.color, isNot(equals(styleColor)));
    });

    testWidgets(
        'uses default textAlign when textSettings is '
        'not default but textAlignMode is default', (tester) async {
      // Create the test widget
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleText(
          testText,
          textAlign: TextAlign.center, // Custom alignment
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      // Update to non-default text settings but keep default align mode
      settingsInherited.textSettings.value = const TextSettings(
        textScaleFactor: 1.5, // Non-default value
        lineHeight: 1,
        letterSpacing: 0,
        wordSpacing: 0,
        color: 0xFF000000,
      );

      await tester.pump();

      // Find the underlying Text widget and check its alignment
      final textWidget = tester.widget<Text>(
        find.text(testText),
      );

      // Should use the provided TextAlign.center since textAlignMode is default
      expect(textWidget.textAlign, equals(TextAlign.center));
    });
  });
}
