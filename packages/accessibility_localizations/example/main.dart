import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const ExampleApp());

/// A design-system-free app that shows one translated string.
final class ExampleApp extends StatelessWidget {
  /// Creates the example app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
    color: const Color(0xFF6750A4),
    localizationsDelegates: const [AccessibilityLocalizations.delegate],
    supportedLocales: AccessibilityLocalizations.supportedLocales,
    builder: (context, child) => Center(
      child: Text(
        AccessibilityLocalizations.of(context).accessibilitySettings,
        style: const TextStyle(fontSize: 24, color: Color(0xFF1C1B1F)),
      ),
    ),
  );
}
