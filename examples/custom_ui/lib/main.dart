import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:custom_ui_example/pages/settings_screen.dart';
import 'package:custom_ui_example/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AccessibilitySettingsRepository(
    service: SharedPreferencesAccessibilityStorageService(),
  );
  await repository.load();
  runApp(
    AccessibilityScope(
      viewModel: AccessibilitySettingsViewModel(repository: repository),
      child: const ExampleApp(),
    ),
  );
}

/// A design-system-free app on `package:flutter/widgets.dart`.
///
/// The text settings apply once, on the root `DefaultTextStyle`; the
/// colours come from [Palette]; the settings screen is hand-made.
final class ExampleApp extends StatelessWidget {
  /// Creates the app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
    title: 'Accessible custom UI',
    color: const Color(0xFF5B3FA0),
    builder: (context, child) => AccessibilitySettingsBuilder(
      builder: (context, settings, child) {
        final palette = Palette.of(context, settings);
        return DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: palette.text,
          ).applyTextSettings(settings.textSettings),
          child: ColoredBox(color: palette.background, child: child),
        );
      },
      child: const SettingsScreen(),
    ),
  );
}
