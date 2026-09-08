import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_material/src/ui/theme/accessible_theme_builder.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Future<(AccessibilitySettingsViewModel, List<AccessibleThemes>)> pumpBuilder(
  WidgetTester tester, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  ThemeData? theme,
  ThemeData? darkTheme,
  Widget home = const Scaffold(body: Text('home')),
}) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(
    repository: repository,
    accessibleFonts: const [andika],
  );
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  final seen = <AccessibleThemes>[];
  await tester.pumpWidget(
    AccessibilityScope(
      viewModel: viewModel,
      child: AccessibleThemeBuilder(
        theme: theme,
        darkTheme: darkTheme,
        builder: (context, themes) {
          seen.add(themes);
          return MaterialApp(
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
            home: home,
          );
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return (viewModel, seen);
}

void main() {
  group('AccessibleThemeBuilder', () {
    testWidgets('yields four themes reflecting the settings', (tester) async {
      final (_, seen) = await pumpBuilder(
        tester,
        initial: const AccessibilitySettings(
          textSettings: TextSettings(textScaleFactor: 2, fontFamily: 'Andika'),
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final themes = seen.last;
      for (final theme in [
        themes.light,
        themes.dark,
        themes.highContrastLight,
        themes.highContrastDark,
      ]) {
        expect(theme.textTheme.bodyMedium?.fontSize, 28);
        expect(
          theme.textTheme.bodyMedium?.fontFamily,
          'packages/accessibility_font_andika/Andika',
        );
      }
      // Only the non-forced themes carry the monochrome profile: the
      // high-contrast themes force ColorProfileLevel.highContrast instead,
      // which never zeroes saturation (see AccessibleThemeData.from).
      for (final theme in [themes.light, themes.dark]) {
        expect(HSLColor.fromColor(theme.colorScheme.primary).saturation, 0);
      }
      expect(themes.light.brightness, Brightness.light);
      expect(themes.dark.brightness, Brightness.dark);
    });

    testWidgets('forces high contrast on the two high-contrast themes', (
      tester,
    ) async {
      final (_, seen) = await pumpBuilder(tester);
      final themes = seen.last;
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(
        themes.highContrastLight.colorScheme.primary,
        themes.light.colorScheme.primary.withColorProfile(profile),
      );
      expect(
        themes.highContrastDark.colorScheme.primary,
        themes.dark.colorScheme.primary.withColorProfile(profile),
      );
      expect(
        themes.light.colorScheme.primary,
        ThemeData.light().colorScheme.primary,
      );
    });

    testWidgets('maps the theme mode', (tester) async {
      final (viewModel, seen) = await pumpBuilder(tester);
      expect(seen.last.mode, ThemeMode.system);
      await viewModel.setThemeMode(AccessibilityThemeMode.dark);
      await tester.pumpAndSettle();
      expect(seen.last.mode, ThemeMode.dark);
      await viewModel.setThemeMode(AccessibilityThemeMode.light);
      await tester.pumpAndSettle();
      expect(seen.last.mode, ThemeMode.light);
    });

    testWidgets('uses the given themes and rebuilds on settings changes', (
      tester,
    ) async {
      final seed = ThemeData(colorSchemeSeed: const Color(0xFF00FF00));
      final (viewModel, seen) = await pumpBuilder(
        tester,
        theme: seed,
        darkTheme: ThemeData(
          colorSchemeSeed: const Color(0xFF00FF00),
          brightness: Brightness.dark,
        ),
      );
      final before = seen.length;
      expect(seen.last.light.colorScheme.primary, seed.colorScheme.primary);
      await viewModel.setTextScaleFactor(1.5);
      await tester.pumpAndSettle();
      expect(seen.length, greaterThan(before));
      expect(seen.last.light.textTheme.bodyMedium?.fontSize, 21);
      expect(seen.last.dark.textTheme.bodyMedium?.fontSize, 21);
    });

    testWidgets('navigates without a transition when effects are off', (
      tester,
    ) async {
      await pumpBuilder(
        tester,
        initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const Text('second')),
            ),
            child: const Text('go'),
          ),
        ),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.pump();
      expect(find.text('second'), findsOneWidget);
      expect(
        find.ancestor(
          of: find.text('second'),
          matching: find.byWidgetPredicate(
            (widget) => widget is FadeTransition || widget is SlideTransition,
          ),
        ),
        findsNothing,
      );
    });
  });
}
