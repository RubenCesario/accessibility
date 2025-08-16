import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AccessibleMaterialApp with Router configuration', () {
    late Widget testApp;
    final mockRouterDelegate = MockRouterDelegate();
    final mockRouteInformationParser = MockRouteInformationParser();
    final mockRouteInformationProvider = MockRouteInformationProvider();
    final mockBackButtonDispatcher = MockBackButtonDispatcher();
    final mockRouterConfig = RouterConfig<Object>(
      routerDelegate: mockRouterDelegate,
      routeInformationParser: mockRouteInformationParser,
      routeInformationProvider: mockRouteInformationProvider,
      backButtonDispatcher: mockBackButtonDispatcher,
    );

    testWidgets('renders with RouterDelegate and related configs',
        (tester) async {
      testApp = AccessibilitySettingsInherited(
        viewModel:
            AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
          accessibilitySettingsCollection: (
            effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
            themeMode: ThemeMode.system,
            textSettings: TextSettings.defaultSettings,
            colorSettings: ColorSettings.defaultSettings,
          ),
        ),
        child: AccessibleMaterialApp.router(
          routerDelegate: mockRouterDelegate,
          routeInformationParser: mockRouteInformationParser,
          routeInformationProvider: mockRouteInformationProvider,
          backButtonDispatcher: mockBackButtonDispatcher,
          title: 'Test App',
          color: Colors.blue,
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
          ],
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
        ),
      );

      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

      // Verify the app built successfully with router configuration
      expect(find.byType(AccessibleMaterialApp), findsOneWidget);

      // Verify the title is applied
      expect(
        find.text('Test App'),
        findsNothing,
      ); // Title isn't displayed in the widget tree
    });

    testWidgets('renders with RouterConfig', (tester) async {
      testApp = AccessibilitySettingsInherited(
        viewModel:
            AccessibilitySettingsViewModel.fromAccessibilitySettingsCollection(
          accessibilitySettingsCollection: (
            effectsAllowed: LocalStorageDefaultValues.effectsAllowedDefault,
            themeMode: ThemeMode.system,
            textSettings: TextSettings.defaultSettings,
            colorSettings: ColorSettings.defaultSettings,
          ),
        ),
        child: AccessibleMaterialApp.router(
          routerConfig: mockRouterConfig,
          title: 'Test App with RouterConfig',
          highContrastTheme: ThemeData.light(useMaterial3: true),
          highContrastDarkTheme: ThemeData.dark(useMaterial3: true),
        ),
      );

      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

      // Verify the app built successfully with router configuration
      expect(find.byType(AccessibleMaterialApp), findsOneWidget);

      // Verify that no exceptions occurred during build
      expect(tester.takeException(), isNull);
    });
  });
}

// Mock classes needed for testing
class MockRouterDelegate extends RouterDelegate<Object> with ChangeNotifier {
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Text('Mock Router Content'));

  @override
  Future<void> setNewRoutePath(Object configuration) async {}

  @override
  Object? get currentConfiguration => null;

  @override
  Future<bool> popRoute() async => true;
}

class MockRouteInformationParser extends RouteInformationParser<Object> {
  @override
  Future<Object> parseRouteInformation(
    RouteInformation routeInformation,
  ) async =>
      Object();

  @override
  RouteInformation? restoreRouteInformation(Object configuration) =>
      RouteInformation(uri: Uri.parse('/'));
}

class MockRouteInformationProvider extends RouteInformationProvider
    with ChangeNotifier {
  @override
  RouteInformation get value => RouteInformation(uri: Uri.parse('/'));
}

class MockBackButtonDispatcher extends BackButtonDispatcher {}
