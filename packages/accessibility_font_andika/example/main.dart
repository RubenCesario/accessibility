import 'package:accessibility_font_andika/accessibility_font_andika.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const ExampleApp());

/// Renders a line in Andika outside the accessibility family.
final class ExampleApp extends StatelessWidget {
  /// Creates the example app.
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
    color: const Color(0xFF6750A4),
    builder: (context, child) => Center(
      child: Text(
        'Andika is designed for readability.',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontFamily: AndikaFont.font.qualifiedFamily,
          fontSize: 24,
          color: const Color(0xFF1C1B1F),
        ),
      ),
    ),
  );
}
