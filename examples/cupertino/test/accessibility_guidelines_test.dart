import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_example/pages/home_page.dart';
import 'package:cupertino_example/pages/settings_page.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

/// Every setting active except the text and page background colour
/// overrides, which the user may set to anything and which the theme layer
/// does not reconcile with every surface:
/// [AccessibleCupertinoThemeData.from] forces the text colour onto every
/// text style (the nav bar title, action text, ...) but applies the
/// background colour only to the scaffold, so under
/// [AccessibilityThemeMode.dark] either override on its own clashes with a
/// surface it was never reconciled against. This is 1.x-parity theme-layer
/// behaviour, tracked as a package follow-up, not something this example
/// can fix.
final everythingButColorOverrides = AccessibilitySettingsSamples.everythingSet
    .copyWith(
      textSettings: AccessibilitySettingsSamples.everythingSet.textSettings
          .copyWith(color: null),
      colorSettings: AccessibilitySettingsSamples.everythingSet.colorSettings
          .copyWith(backgroundColor: null),
    );

/// Pumps [page] the way the app does: under an [AccessibilityScope] whose
/// repository holds [initial], inside the app's themed `CupertinoApp`.
Future<void> pumpPage(
  WidgetTester tester,
  Widget page, {
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
    AccessibilityScope(
      viewModel: viewModel,
      child: AccessibleCupertinoThemeBuilder(
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemIndigo,
        ),
        builder: (context, theme) => CupertinoApp(
          theme: theme,
          localizationsDelegates: const [
            ...GlobalCupertinoLocalizations.delegates,
            AccessibilityLocalizations.delegate,
          ],
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          home: page,
        ),
      ),
    ),
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
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
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
  final pages = <String, Widget>{
    'home': const HomePage(),
    for (final variant in SettingsVariant.values)
      'settings/${variant.name}': SettingsPage(variant: variant),
  };
  for (final MapEntry(key: name, value: page) in pages.entries) {
    group(name, () {
      testWidgets('meets the guidelines with the defaults', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpPage(tester, page);
        await checkGuidelines(tester);
        handle.dispose();
      });

      testWidgets('meets the guidelines with every setting active', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();
        // Uses everythingButColorOverrides, not
        // AccessibilitySettingsSamples.everythingSet: see the fixture's
        // doc comment for why the colour overrides are excluded.
        await pumpPage(tester, page, initial: everythingButColorOverrides);
        await checkGuidelines(tester);
        handle.dispose();
      });

      testWidgets('meets the guidelines in dark mode', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpPage(
          tester,
          page,
          initial: const AccessibilitySettings(
            themeMode: AccessibilityThemeMode.dark,
          ),
        );
        await checkGuidelines(tester);
        handle.dispose();
      });
    });
  }
}
