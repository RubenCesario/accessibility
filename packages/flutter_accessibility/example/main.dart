import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Keeps the settings in memory; a real app uses
/// `accessibility_shared_preferences` or its own adapter.
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

/// A design-system-free app: the text settings apply once, through a
/// `DefaultTextStyle` built with `applyTextSettings`. The theme packages do
/// the same on their text themes.
final class ExampleApp extends StatelessWidget {
  /// Creates the example app.
  const ExampleApp({super.key});

  static const _baseStyle = TextStyle(fontSize: 16, color: Color(0xFF1C1B1F));

  @override
  Widget build(BuildContext context) => WidgetsApp(
    color: const Color(0xFF6750A4),
    builder: (context, child) => AccessibilitySettingsBuilder(
      builder: (context, settings, child) => DefaultTextStyle(
        style: _baseStyle.applyTextSettings(
          settings.textSettings,
          font: AccessibilityScope.of(context).activeFont,
        ),
        child: child!,
      ),
      child: const ExamplePage(),
    ),
  );
}

/// Shows the settings in use and a control that changes them.
final class ExamplePage extends StatelessWidget {
  /// Creates the page.
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AccessibilityScope.of(context);
    return ColoredBox(
      color: const Color(0xFFFFFBFE),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AccessibleText('This text follows the settings.'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => viewModel.setTextScaleFactor(
                viewModel.settings.textSettings.textScaleFactor >= 2 ? 1 : 2,
              ),
              child: const AccessibleText('Tap to toggle 2x text'),
            ),
            EffectsBuilder(
              builder: (context, {required effectsEnabled, child}) =>
                  AccessibleText(effectsEnabled ? 'Effects on' : 'Effects off'),
            ),
          ],
        ),
      ),
    );
  }
}
