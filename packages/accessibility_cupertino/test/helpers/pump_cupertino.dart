import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

/// Pumps [child] inside a `CupertinoPageScaffold` of a `CupertinoApp` under
/// an [AccessibilityScope], with the Cupertino and accessibility
/// translations loaded, and returns the ViewModel so tests can invoke
/// commands.
///
/// The repository is backed by [service] (a
/// [FakeAccessibilityStorageService] holding [initial] by default) and is
/// loaded before the first frame. [theme] replaces the default theme.
/// [disableAnimations] and [highContrast] set the media query flags.
Future<AccessibilitySettingsViewModel> pumpCupertino(
  WidgetTester tester,
  Widget child, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  List<AccessibleFont> fonts = const [],
  bool disableAnimations = false,
  bool highContrast = false,
  CupertinoThemeData? theme,
  AccessibilityStorageService? service,
}) async {
  final repository = AccessibilitySettingsRepository(
    service: service ?? FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(
    repository: repository,
    accessibleFonts: fonts,
  );
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  await tester.pumpWidget(
    AccessibilityScope(
      viewModel: viewModel,
      child: MediaQuery(
        data: MediaQueryData(
          size: tester.view.physicalSize / tester.view.devicePixelRatio,
          disableAnimations: disableAnimations,
          highContrast: highContrast,
        ),
        child: CupertinoApp(
          theme: theme,
          localizationsDelegates: const [
            ...GlobalCupertinoLocalizations.delegates,
            AccessibilityLocalizations.delegate,
          ],
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          home: CupertinoPageScaffold(child: child),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return viewModel;
}
