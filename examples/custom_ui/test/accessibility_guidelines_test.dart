import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:custom_ui_example/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

/// Pumps the app the way `main.dart` does, under an [AccessibilityScope]
/// whose repository holds [initial].
Future<void> pumpApp(
  WidgetTester tester, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
}) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(repository: repository);
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  await tester.pumpWidget(
    AccessibilityScope(viewModel: viewModel, child: const ExampleApp()),
  );
  await tester.pumpAndSettle();
}

/// Checks the three guidelines, scrolling the first scrollable by 400 px
/// until nothing moves, so every item is on screen at least once.
Future<void> checkGuidelines(WidgetTester tester) async {
  final scrollable = find.byType(Scrollable).first;
  var lastOffset = -1.0;
  for (var i = 0; i < 12; i++) {
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    final offset = tester.state<ScrollableState>(scrollable).position.pixels;
    if (offset == lastOffset) {
      return;
    }
    lastOffset = offset;
    await tester.drag(scrollable, const Offset(0, -400));
    await tester.pumpAndSettle();
  }
}

void main() {
  testWidgets('meets the guidelines with the defaults', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpApp(tester);
    await checkGuidelines(tester);
    handle.dispose();
  });

  testWidgets('meets the guidelines with every setting active', (tester) async {
    final handle = tester.ensureSemantics();
    // Unlike the themed examples, this app does not need to exclude the
    // text and page background colour overrides from the fixture:
    // Palette and the root DefaultTextStyle apply both consistently to
    // the one background/text pair, and SettingButton always passes an
    // explicit textColor, so the accent surfaces never pick up either
    // override. AccessibilitySettingsSamples.everythingSet passes as is.
    await pumpApp(tester, initial: AccessibilitySettingsSamples.everythingSet);
    await checkGuidelines(tester);
    handle.dispose();
  });

  testWidgets('meets the guidelines in dark mode', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpApp(
      tester,
      initial: const AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
      ),
    );
    await checkGuidelines(tester);
    handle.dispose();
  });

  testWidgets('meets the guidelines with a dark background in light mode', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    // The background override the settings screen offers reaches black,
    // which the user can pick while the theme mode is light: Palette
    // derives the whole colour set from the background's luminance, so
    // the page stays readable instead of drawing dark text on it.
    await pumpApp(
      tester,
      initial: const AccessibilitySettings(
        colorSettings: ColorSettings(backgroundColor: 0xFF000000),
      ),
    );
    await checkGuidelines(tester);
    handle.dispose();
  });
}
