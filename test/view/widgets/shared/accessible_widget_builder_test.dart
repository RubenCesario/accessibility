import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AccessibleWidgetBuilder', () {
    const regularChild = Text('Regular Child', key: Key('regular-child'));
    const accessibleChild =
        Text('Accessible Child', key: Key('accessible-child'));

    testWidgets('shows regular child with default settings', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleWidgetBuilder(
          accessibleChild: accessibleChild,
          child: regularChild,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // With default settings, should show regular child
      expect(find.byKey(const Key('regular-child')), findsOneWidget);
      expect(find.byKey(const Key('accessible-child')), findsNothing);
    });

    testWidgets(
        'shows accessible child when accessibility settings are enabled',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleWidgetBuilder(
          accessibleChild: accessibleChild,
          child: regularChild,
        ),
      );

      await tester.pumpWidget(testWidget);

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(AccessibleWidgetBuilder)),
      );

      // Change to non-default settings
      settings.textSettings.value = const TextSettings(
        textScaleFactor: 1.5, // Changed from default
        textAlignMode: 'left',
        lineHeight: 1,
      );

      await tester.pump();

      // Should now show the accessible child
      expect(find.byKey(const Key('accessible-child')), findsOneWidget);
      expect(find.byKey(const Key('regular-child')), findsNothing);
    });

    testWidgets('falls back to regular child if accessibleChild is null',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleWidgetBuilder(
          child: regularChild,
          // No accessibleChild provided
        ),
      );

      await tester.pumpWidget(testWidget);

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(AccessibleWidgetBuilder)),
      );

      // Change to non-default settings
      settings.textSettings.value = const TextSettings(
        textScaleFactor: 1.5, // Changed from default
        textAlignMode: 'left',
        lineHeight: 1,
      );

      await tester.pump();

      // Should still show the regular child since accessibleChild is null
      expect(find.byKey(const Key('regular-child')), findsOneWidget);
    });

    testWidgets('shows accessible child only in landscape when flag is set',
        (tester) async {
      // Set portrait orientation first
      tester.view.physicalSize = const Size(500, 1000);

      final testWidget = buildDefaultTestWidget(
        child: const AccessibleWidgetBuilder(
          accessibleChild: accessibleChild,
          showAccessibleChildOnlyOnLandscape: true,
          child: regularChild,
        ),
      );

      await tester.pumpWidget(testWidget);

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(AccessibleWidgetBuilder)),
      );

      // Change to non-default settings
      settings.textSettings.value = const TextSettings(
        textScaleFactor: 1.5, // Changed from default
        textAlignMode: 'left',
        lineHeight: 1,
      );

      await tester.pump();

      // In portrait, even with accessibility settings enabled,
      // should still show regular child
      expect(find.byKey(const Key('regular-child')), findsOneWidget);
      expect(find.byKey(const Key('accessible-child')), findsNothing);

      // Now change to landscape orientation
      tester.view.physicalSize = const Size(1000, 500);
      await tester.pumpAndSettle();

      // In landscape with accessibility settings enabled,
      // should show accessible child
      expect(find.byKey(const Key('accessible-child')), findsOneWidget);
      expect(find.byKey(const Key('regular-child')), findsNothing);

      // Reset orientation
      tester.view.resetPhysicalSize();
    });

    testWidgets('responds to accessibility settings changes', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const AccessibleWidgetBuilder(
          accessibleChild: accessibleChild,
          child: regularChild,
        ),
      );

      await tester.pumpWidget(testWidget);

      // Initially regular child is shown
      expect(find.byKey(const Key('regular-child')), findsOneWidget);

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.element(find.byType(AccessibleWidgetBuilder)),
      );

      // Change to non-default settings
      settings.textSettings.value = const TextSettings(
        textScaleFactor: 1.5, // Changed from default
        textAlignMode: 'left',
        lineHeight: 1,
      );

      await tester.pump();

      // Should now show accessible child
      expect(find.byKey(const Key('accessible-child')), findsOneWidget);

      // Change back to default settings
      settings.textSettings.value = TextSettings.defaultSettings;
      await tester.pump();

      // Should now show regular child again
      expect(find.byKey(const Key('regular-child')), findsOneWidget);
      expect(find.byKey(const Key('accessible-child')), findsNothing);
    });
  });
}
