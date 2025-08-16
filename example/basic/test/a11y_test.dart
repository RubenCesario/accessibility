import 'package:accessibility/accessibility.dart';
import 'package:basic/constants/theme/color_schemes.dart';
import 'package:basic/view/pages/complete_settings_page.dart';
import 'package:basic/view/pages/custom_settings_page.dart';
import 'package:basic/view/pages/home_page.dart';
import 'package:basic/view/pages/recommended_settings_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final appThemes = AppThemes.fromColorSchemes(
    lightColorScheme: kLightColorScheme,
    darkColorScheme: kDarkColorScheme,
    highContrastLightColorScheme: kHighConstrastLightColorScheme,
    highContrastDarkColorScheme: kHighConstrastDarkColorScheme,
    textTheme: kTextThemeMergableEnglishLike2021,
  );
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService.createMockService();
  final accessibilitySettings =
      await sharedPreferencesService.getLocalStorageAccessibilitySettings();
  group('Accessibility tests', () {
    testWidgets('HomePage - Follows a11y guidelines', (tester) async {
      final semanticHandle = tester.ensureSemantics();
      await tester.pumpWidget(
        AccessibilityInitializer(
          accessibilitySettingsCollection: accessibilitySettings,
          sharedPreferencesService: sharedPreferencesService,
          child: AccessibleMaterialApp(
            theme: appThemes.lightTheme,
            highContrastTheme: appThemes.lightHighContrastTheme,
            darkTheme: appThemes.darkTheme,
            highContrastDarkTheme: appThemes.darkHighContrastTheme,
            home: const HomePage(title: 'Accessibility Example'),
          ),
        ),
      );

      // Wait for localization to fully load
      await tester.pumpAndSettle();

      // Checks that tappable nodes have a minimum size of 48 by 48 pixels
      // for Android.
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

      // Checks that tappable nodes have a minimum size of 44 by 44 pixels
      // for iOS.
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));

      // Checks that touch targets with a tap or long press action are labeled.
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

      // Checks whether semantic nodes meet the minimum text contrast levels.
      // The recommended text contrast is 3:1 for larger text
      // (18 point and above regular).
      await expectLater(tester, meetsGuideline(textContrastGuideline));

      // Ensure all timers complete before disposing
      await tester.pumpAndSettle();
      semanticHandle.dispose();
    });

    testWidgets('Complete Settings Page - Follows a11y guidelines', (
      tester,
    ) async {
      final semanticHandle = tester.ensureSemantics();
      await tester.pumpWidget(
        AccessibilityInitializer(
          accessibilitySettingsCollection: accessibilitySettings,
          sharedPreferencesService: sharedPreferencesService,
          child: AccessibleMaterialApp(
            theme: appThemes.lightTheme,
            highContrastTheme: appThemes.lightHighContrastTheme,
            darkTheme: appThemes.darkTheme,
            highContrastDarkTheme: appThemes.darkHighContrastTheme,
            home: const CompleteSettingsPage(),
          ),
        ),
      );

      // Wait for localization to fully load
      await tester.pumpAndSettle();

      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      await expectLater(tester, meetsGuideline(textContrastGuideline));

      // Ensure all timers complete before disposing
      await tester.pumpAndSettle();
      semanticHandle.dispose();
    });
  });

  testWidgets('Recommended Settings Page - Follows a11y guidelines', (
    tester,
  ) async {
    final semanticHandle = tester.ensureSemantics();
    await tester.pumpWidget(
      AccessibilityInitializer(
        accessibilitySettingsCollection: accessibilitySettings,
        sharedPreferencesService: sharedPreferencesService,
        child: AccessibleMaterialApp(
          theme: appThemes.lightTheme,
          highContrastTheme: appThemes.lightHighContrastTheme,
          darkTheme: appThemes.darkTheme,
          highContrastDarkTheme: appThemes.darkHighContrastTheme,
          home: const RecommendedSettingsPage(),
        ),
      ),
    );

    // Wait for localization to fully load
    await tester.pumpAndSettle();

    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));

    // Ensure all timers complete before disposing
    await tester.pumpAndSettle();
    semanticHandle.dispose();
  });

  testWidgets('Custom Settings Page - Follows a11y guidelines', (tester) async {
    final semanticHandle = tester.ensureSemantics();
    await tester.pumpWidget(
      AccessibilityInitializer(
        accessibilitySettingsCollection: accessibilitySettings,
        sharedPreferencesService: sharedPreferencesService,
        child: AccessibleMaterialApp(
          theme: appThemes.lightTheme,
          highContrastTheme: appThemes.lightHighContrastTheme,
          darkTheme: appThemes.darkTheme,
          highContrastDarkTheme: appThemes.darkHighContrastTheme,
          home: const CustomSettingsPage(),
        ),
      ),
    );

    // Wait for localization to fully load
    await tester.pumpAndSettle();

    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));

    // Ensure all timers complete before disposing
    await tester.pumpAndSettle();
    semanticHandle.dispose();
  });
}
