import 'package:accessibility_material/accessibility_material.dart';
import 'package:material_ui/material_ui.dart';

/// Keeps the settings in memory; a real app uses
/// `accessibility_shared_preferences`.
final class InMemoryStorage implements AccessibilityStorageService {
  AccessibilitySettings? _value;

  @override
  Future<AccessibilitySettings?> read() async => _value;

  @override
  Future<void> write(AccessibilitySettings settings) async {
    _value = settings;
  }

  @override
  Future<void> clear() async {
    _value = null;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: InMemoryStorage(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const ExampleApp(),
    ),
  );
}

/// A Material app themed by the accessibility settings.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => AccessibleThemeBuilder(
    builder: (context, themes) => MaterialApp(
      theme: themes.light,
      darkTheme: themes.dark,
      highContrastTheme: themes.highContrastLight,
      highContrastDarkTheme: themes.highContrastDark,
      themeMode: themes.mode,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        AccessibilityLocalizations.delegate,
      ],
      supportedLocales: AccessibilityLocalizations.supportedLocales,
      home: const SettingsPage(),
    ),
  );
}

/// The settings panel in a scaffold, with a style switch in the app bar.
final class SettingsPage extends StatefulWidget {
  /// Creates the page.
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _style = AccessibilitySettingsStyle.standard;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AccessibilityLocalizations.of(context).accessibilitySettings),
      actions: [
        IconButton(
          tooltip: 'Switch style',
          icon: const Icon(Icons.dashboard_customize),
          onPressed: () => setState(
            () => _style = _style == AccessibilitySettingsStyle.standard
                ? AccessibilitySettingsStyle.cards
                : AccessibilitySettingsStyle.standard,
          ),
        ),
      ],
    ),
    body: AccessibilitySettingsPanel(style: _style),
  );
}
