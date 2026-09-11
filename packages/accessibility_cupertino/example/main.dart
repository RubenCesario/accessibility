import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

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

/// A Cupertino app themed by the accessibility settings.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => AccessibleCupertinoThemeBuilder(
    builder: (context, theme) => CupertinoApp(
      theme: theme,
      localizationsDelegates: const [
        ...GlobalCupertinoLocalizations.delegates,
        AccessibilityLocalizations.delegate,
      ],
      supportedLocales: AccessibilityLocalizations.supportedLocales,
      onGenerateRoute: (settings) => AccessibleCupertinoPageRoute<void>(
        settings: settings,
        builder: (_) => switch (settings.name) {
          '/settings' => const SettingsPage(),
          _ => const HomePage(),
        },
      ),
    ),
  );
}

/// The home page, with a sample text and a link to the settings.
final class HomePage extends StatelessWidget {
  /// Creates the page.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(l10n.accessibility)),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const AccessibleText(
              'The quick brown fox jumps over the lazy dog.',
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: () => Navigator.of(context).pushNamed('/settings'),
              child: Text(l10n.accessibilitySettings),
            ),
          ],
        ),
      ),
    );
  }
}

/// The settings page, switching between the two panel styles.
final class SettingsPage extends StatefulWidget {
  /// Creates the page.
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _style = AccessibilitySettingsStyle.standard;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text(AccessibilityLocalizations.of(context).settings),
      trailing: CupertinoSlidingSegmentedControl<AccessibilitySettingsStyle>(
        groupValue: _style,
        children: const {
          AccessibilitySettingsStyle.standard: Text('List'),
          AccessibilitySettingsStyle.cards: Text('Grouped'),
        },
        onValueChanged: (style) {
          if (style != null) {
            setState(() => _style = style);
          }
        },
      ),
    ),
    child: CupertinoAccessibilitySettingsPanel(style: _style),
  );
}
