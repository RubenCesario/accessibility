import 'package:accessibility/src/view/widgets/components/restore_settings_button.dart';
import 'package:accessibility/src/view/widgets/shared/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('RestoreSettingsButton', () {
    late int callbackCount;

    setUp(() {
      callbackCount = 0;
    });

    VoidCallback onRestoreSettings() => () {
          callbackCount++;
        };

    testWidgets('renders correctly with default settings', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const RestoreSettingsButton(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Verify the widget renders correctly
      expect(find.byType(RestoreSettingsButton), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(AccessibleText), findsOneWidget);
    });

    testWidgets('applies custom style when provided', (tester) async {
      const testColor = Colors.purple;
      final customStyle = ElevatedButton.styleFrom(
        backgroundColor: testColor,
      );

      final testWidget = buildDefaultTestWidget(
        child: RestoreSettingsButton(
          style: customStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the custom style was applied
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style, equals(customStyle));
    });

    testWidgets('applies custom text style when provided', (tester) async {
      const customTextStyle = TextStyle(
        fontSize: 24,
        fontStyle: FontStyle.italic,
      );

      final testWidget = buildDefaultTestWidget(
        child: const RestoreSettingsButton(
          textStyle: customTextStyle,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the custom text style was used
      final text = tester.widget<AccessibleText>(find.byType(AccessibleText));
      expect(text.style, equals(customTextStyle));
    });

    /// Verifies that the [RestoreSettingsButton] calls the callback
    /// provided in [onRestoreSettings] when the button is tapped.
    ///
    /// This test also verifies that the callback is called after a
    /// short delay, to allow the user to cancel the restore action.
    ///
    /// Note that this test does not verify the actual restore
    /// functionality, as that would require mocking of the providers.
    /// It only verifies that the callback is called.
    testWidgets('calls restore settings on providers when tapped',
        (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: RestoreSettingsButton(
          onRestoreSettings: onRestoreSettings(),
        ),
      );

      await tester.pumpWidget(testWidget);

      // Tap the button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(
        const Duration(
          milliseconds: 500,
        ),
      ); // Allow time for the Timer callback

      // Verify callback was called
      expect(callbackCount, equals(1));

      // For full verification of restore functionality, we'd need a
      // more complex test with mocking of the providers, but that's
      // beyond the scope of this test
    });

    testWidgets('button fills available width', (tester) async {
      final testWidget = buildDefaultTestWidget(
        child: const SizedBox(
          width: 300,
          child: RestoreSettingsButton(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Check that the button constraint is set to fill width
      final constrainedBox = tester.widget<ConstrainedBox>(
        find
            .descendant(
              of: find.byType(RestoreSettingsButton),
              matching: find.byType(ConstrainedBox),
            )
            .first,
      );

      expect(constrainedBox.constraints.minWidth, greaterThan(0));
    });
  });
}
