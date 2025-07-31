import 'package:accessibility/src/core/l10n/generated/app_localizations.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/theme_settings_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Widget testWidget;

  setUp(() {
    testWidget = buildDefaultTestWidget(
      child: const Scaffold(
        body: Text('Test Home'),
      ),
    );
  });

  group('AccessibleMaterialApp', () {
    testWidgets('renders MaterialApp with theme settings', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(ThemeSettingsBuilder), findsOneWidget);
      expect(find.text('Test Home'), findsOneWidget);
    });

    testWidgets('includes accessibility localizations', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Should have AccessibilityLocalizations available
      final BuildContext context = tester.element(find.text('Test Home'));
      expect(AccessibilityLocalizations.of(context), isNotNull);
    });

    testWidgets('applies theme based on theme mode', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final settingsInherited = tester.widget<AccessibilitySettingsInherited>(
        find.byType(AccessibilitySettingsInherited),
      );

      settingsInherited.themeMode.value = ThemeMode.dark;

      await tester.pumpAndSettle();
      final materialApp = tester.widget<MaterialApp>(
        find.byType(MaterialApp),
      );

      expect(materialApp.themeMode, equals(ThemeMode.dark));
    });
  });
}
