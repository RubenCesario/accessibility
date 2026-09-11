import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:cupertino_example/pages/home_page.dart';
import 'package:cupertino_example/pages/settings_page.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(
        repository: repository,
        accessibleFonts: const [AndikaFont.font],
      ),
      child: const ExampleApp(),
    ),
  );
}

/// The example app: a `CupertinoApp` whose theme follows the accessibility
/// settings and whose routes honour the effects mode.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => AccessibleCupertinoThemeBuilder(
    theme: const CupertinoThemeData(primaryColor: CupertinoColors.systemIndigo),
    builder: (context, theme) => CupertinoApp(
      title: 'Accessible Cupertino app',
      theme: theme,
      localizationsDelegates: const [
        ...GlobalCupertinoLocalizations.delegates,
        AccessibilityLocalizations.delegate,
      ],
      supportedLocales: AccessibilityLocalizations.supportedLocales,
      onGenerateRoute: (settings) => AccessibleCupertinoPageRoute<void>(
        settings: settings,
        builder: (_) => pageFor(settings.name),
      ),
    ),
  );
}

/// The page for a route [name]: `/` is the home page,
/// `/settings/<variant>` a settings page.
Widget pageFor(String? name) {
  final variant = SettingsVariant.values.cast<SettingsVariant?>().firstWhere(
    (variant) => name == '/settings/${variant!.name}',
    orElse: () => null,
  );
  return variant == null ? const HomePage() : SettingsPage(variant: variant);
}
