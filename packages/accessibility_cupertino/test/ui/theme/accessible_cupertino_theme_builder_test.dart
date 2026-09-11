import 'package:accessibility_cupertino/src/ui/theme/accessible_cupertino_theme_builder.dart';
import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

const andika = AccessibleFont(
  family: 'Andika',
  package: 'accessibility_font_andika',
);

Future<(AccessibilitySettingsViewModel, List<CupertinoThemeData>)> pumpBuilder(
  WidgetTester tester, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  CupertinoThemeData? theme,
  bool? highContrast,
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
  final seen = <CupertinoThemeData>[];
  Widget builder = AccessibleCupertinoThemeBuilder(
    theme: theme,
    builder: (context, theme) {
      seen.add(theme);
      return CupertinoApp(
        theme: theme,
        localizationsDelegates: const [
          ...GlobalCupertinoLocalizations.delegates,
          AccessibilityLocalizations.delegate,
        ],
        supportedLocales: AccessibilityLocalizations.supportedLocales,
        home: const CupertinoPageScaffold(child: Text('home')),
      );
    },
  );
  if (highContrast != null) {
    builder = MediaQuery(
      data: MediaQueryData(highContrast: highContrast),
      child: builder,
    );
  }
  await tester.pumpWidget(
    AccessibilityScope(viewModel: viewModel, child: builder),
  );
  await tester.pumpAndSettle();
  return (viewModel, seen);
}

void main() {
  group('AccessibleCupertinoThemeBuilder', () {
    testWidgets('yields a theme reflecting the settings', (tester) async {
      final (_, seen) = await pumpBuilder(
        tester,
        initial: const AccessibilitySettings(
          themeMode: AccessibilityThemeMode.dark,
          textSettings: TextSettings(textScaleFactor: 2, fontFamily: 'Andika'),
          colorSettings: ColorSettings(
            colorProfile: ColorProfileLevel.monochrome,
          ),
        ),
      );
      final theme = seen.last;
      expect(theme.brightness, Brightness.dark);
      expect(theme.textTheme.textStyle.fontSize, 34);
      expect(
        theme.textTheme.textStyle.fontFamily,
        'packages/accessibility_font_andika/Andika',
      );
      expect(
        HSLColor.fromColor(
          (theme.primaryColor as CupertinoDynamicColor).color,
        ).saturation,
        0,
      );
    });

    testWidgets('uses the given theme and rebuilds on settings changes', (
      tester,
    ) async {
      const seed = CupertinoThemeData(primaryColor: Color(0xFF00FF00));
      final (viewModel, seen) = await pumpBuilder(tester, theme: seed);
      final before = seen.length;
      expect(seen.last.primaryColor, const Color(0xFF00FF00));
      await viewModel.setTextScaleFactor(1.5);
      await tester.pumpAndSettle();
      expect(seen.length, greaterThan(before));
      expect(seen.last.textTheme.textStyle.fontSize, 25.5);
    });

    testWidgets('forces high contrast from the media query', (tester) async {
      final (_, seen) = await pumpBuilder(tester, highContrast: true);
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(
        (seen.last.primaryColor as CupertinoDynamicColor).color,
        CupertinoColors.systemBlue.color.withColorProfile(profile),
      );
      final (_, normal) = await pumpBuilder(tester, highContrast: false);
      expect(normal.last.primaryColor, CupertinoColors.systemBlue);
    });

    testWidgets('follows the platform contrast without a media query', (
      tester,
    ) async {
      final (_, seen) = await pumpBuilder(tester);
      expect(seen.last.primaryColor, CupertinoColors.systemBlue);
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(highContrast: true);
      addTearDown(
        tester.platformDispatcher.clearAccessibilityFeaturesTestValue,
      );
      await tester.pumpAndSettle();
      final profile = ColorProfile.fromLevel(ColorProfileLevel.highContrast);
      expect(
        (seen.last.primaryColor as CupertinoDynamicColor).color,
        CupertinoColors.systemBlue.color.withColorProfile(profile),
      );
    });

    testWidgets('resolves the theme inside the app', (tester) async {
      late BuildContext captured;
      final repository = AccessibilitySettingsRepository(
        service: FakeAccessibilityStorageService(
          initial: const AccessibilitySettings(
            themeMode: AccessibilityThemeMode.dark,
          ),
        ),
      );
      await repository.load();
      final viewModel = AccessibilitySettingsViewModel(repository: repository);
      addTearDown(() {
        viewModel.dispose();
        repository.dispose();
      });
      await tester.pumpWidget(
        AccessibilityScope(
          viewModel: viewModel,
          child: AccessibleCupertinoThemeBuilder(
            builder: (context, theme) => CupertinoApp(
              theme: theme,
              home: Builder(
                builder: (context) {
                  captured = context;
                  return const SizedBox();
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(CupertinoTheme.brightnessOf(captured), Brightness.dark);
      // scaffoldBackgroundColor stays a CupertinoDynamicColor even once
      // resolved, so it can never equal a plain Color by object identity;
      // compare the effective ARGB value instead.
      expect(
        CupertinoTheme.of(captured).scaffoldBackgroundColor.toARGB32(),
        CupertinoColors.systemBackground.darkColor.toARGB32(),
      );
    });
  });
}
