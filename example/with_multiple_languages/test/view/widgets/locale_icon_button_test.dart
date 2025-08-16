import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/constants/data/country.dart';
import 'package:with_multiple_languages/models/country.dart';
import 'package:with_multiple_languages/view/providers/locale_inherited.dart';
import 'package:with_multiple_languages/view/widgets/dropdown_menu_dialog.dart';
import 'package:with_multiple_languages/view/widgets/locale_icon_button.dart';

import '../../resources/widgets/base_tester.dart';

void main() {
  group('LocaleIconButton', () {
    Widget createTestWidget({Locale? initialLocale}) => buildDefaultTestWidget(
      child: LocaleInherited(
        locale: initialLocale,
        child: const LocaleIconButton(),
      ),
    );

    group('Widget Structure', () {
      testWidgets('should create LocaleIconButton widget', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();
        expect(find.byType(LocaleIconButton), findsOneWidget);
      });

      testWidgets('should display IconButton', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('should display flag icon', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.emoji_flags_outlined), findsOneWidget);
      });

      testWidgets('should have correct semantic label', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.bySemanticsLabel('Change language'), findsOneWidget);
      });
    });

    group('Static Properties', () {
      test('should have sorted countries list', () {
        final sortedCountries = LocaleIconButton.sortedCountries.toList();

        expect(sortedCountries, isNotEmpty);
        expect(sortedCountries.length, equals(allCountries.length));

        // Check if sorted alphabetically by name
        for (var i = 0; i < sortedCountries.length - 1; i++) {
          expect(
            sortedCountries[i].name.compareTo(sortedCountries[i + 1].name),
            lessThanOrEqualTo(0),
          );
        }
      });

      test('should contain all countries from allCountries', () {
        final sortedCountries = LocaleIconButton.sortedCountries.toSet();
        final originalCountries = allCountries.toSet();

        expect(sortedCountries, equals(originalCountries));
      });

      test('should have Albanian as first country alphabetically', () {
        final firstCountry = LocaleIconButton.sortedCountries.first;
        expect(firstCountry.name, equals('Afrikaans'));
      });
    });

    group('Dialog Interaction', () {
      testWidgets('should show dialog when button is tapped', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(find.byType(FilterableListDialog<Country>), findsOneWidget);
      });

      testWidgets('should show dialog with correct title', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(find.text('Change language'), findsOneWidget);
      });

      testWidgets('should pass sorted countries to dialog', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final dialog = tester.widget<FilterableListDialog<Country>>(
          find.byType(FilterableListDialog<Country>),
        );

        expect(
          dialog.entries.length,
          equals(LocaleIconButton.sortedCountries.length),
        );
      });

      testWidgets('should show current country as initial value', (
        tester,
      ) async {
        const initialLocale = Locale('fr', 'FR');
        await tester.pumpWidget(createTestWidget(initialLocale: initialLocale));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final dialog = tester.widget<FilterableListDialog<Country>>(
          find.byType(FilterableListDialog<Country>),
        );

        final expectedCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'fr',
        );
        expect(dialog.initialValue, equals(expectedCountry));
      });

      testWidgets('should handle null current locale', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final dialog = tester.widget<FilterableListDialog<Country>>(
          find.byType(FilterableListDialog<Country>),
        );

        expect(dialog.initialValue, isNull);
      });

      testWidgets('should handle locale with no matching country', (
        tester,
      ) async {
        const initialLocale = Locale('xx', 'XX'); // Non-existent locale
        await tester.pumpWidget(createTestWidget(initialLocale: initialLocale));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final dialog = tester.widget<FilterableListDialog<Country>>(
          find.byType(FilterableListDialog<Country>),
        );

        expect(dialog.initialValue, isNull);
      });
    });

    group('Locale Changes', () {
      testWidgets('should update locale when country is selected', (
        tester,
      ) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        // Get the LocaleInherited widget
        final localeInheritedElement = tester.element(
          find.byType(LocaleInherited),
        );
        final localeInherited =
            localeInheritedElement.widget as LocaleInherited;

        // Open dialog
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        // Select the first available country
        //(should be Afrikaans based on sorting)
        final firstListTile = find.byType(ListTile).first;
        await tester.tap(firstListTile);
        await tester.pumpAndSettle();

        // The locale should be updated to the first country (Afrikaans)
        expect(localeInherited.locale.value, equals(const Locale('af', 'ZA')));
      });

      testWidgets('should not change locale when dialog is cancelled', (
        tester,
      ) async {
        const initialLocale = Locale('en', 'US');
        await tester.pumpWidget(createTestWidget(initialLocale: initialLocale));
        await tester.pumpAndSettle();

        final localeInheritedElement = tester.element(
          find.byType(LocaleInherited),
        );
        final localeInherited =
            localeInheritedElement.widget as LocaleInherited;

        // Open dialog
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        // Close dialog without selecting
        await tester.tap(find.text('Close Dialog'));
        await tester.pumpAndSettle();

        expect(localeInherited.locale.value, equals(initialLocale));
      });

      testWidgets('should handle multiple locale changes', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        final localeInheritedElement = tester.element(
          find.byType(LocaleInherited),
        );
        final localeInherited =
            localeInheritedElement.widget as LocaleInherited;

        // First change - select second country in the list
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        final listTiles = find.byType(ListTile);
        await tester.tap(listTiles.at(1)); // Select second country
        await tester.pumpAndSettle();

        final firstLocale = localeInherited.locale.value;
        expect(firstLocale, isNotNull);

        // Second change - select third country in the list
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        await tester.tap(listTiles.at(2)); // Select third country
        await tester.pumpAndSettle();

        final secondLocale = localeInherited.locale.value;
        expect(secondLocale, isNotNull);
        expect(secondLocale, isNot(equals(firstLocale))); // Should be different
      });
    });

    group('Button Styling', () {
      testWidgets('should have correct button style', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        final iconButton = tester.widget<IconButton>(find.byType(IconButton));
        expect(iconButton.style, isNotNull);
      });

      testWidgets('should use theme colors', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              colorScheme: const ColorScheme.light(onPrimary: Colors.red),
            ),
            home: Scaffold(
              body: LocaleInherited(child: const LocaleIconButton()),
            ),
          ),
        );

        final iconButton = tester.widget<IconButton>(find.byType(IconButton));
        final buttonStyle = iconButton.style;

        expect(buttonStyle?.foregroundColor?.resolve({}), equals(Colors.red));
      });
    });

    group('Accessibility', () {
      testWidgets('should have proper semantic properties', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        final iconButton = tester.widget<IconButton>(find.byType(IconButton));
        final icon = iconButton.icon as Icon;

        expect(icon.semanticLabel, equals('Change language'));
      });

      testWidgets('should be accessible via semantics', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.bySemanticsLabel('Change language'), findsOneWidget);
      });
    });

    group('Performance', () {
      test('should compute sorted countries only once', () {
        // Access the static property multiple times
        final firstAccess = LocaleIconButton.sortedCountries;
        final secondAccess = LocaleIconButton.sortedCountries;

        // Should be the same instance (computed once)
        expect(identical(firstAccess, secondAccess), isTrue);
      });
    });

    group('Integration', () {
      testWidgets('should work with real country data', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        // Should show some countries
        // (virtualized list may not render all at once)
        expect(find.byType(ListTile), findsWidgets);

        // Verify the dialog is using the correct data source
        final dialog = tester.widget<FilterableListDialog<Country>>(
          find.byType(FilterableListDialog<Country>),
        );
        expect(dialog.entries.length, equals(allCountries.length));

        // Check that some specific countries are present in the visible area
        // Note: Due to virtualization, not all countries
        // may be rendered initially
        final visibleListTiles = find.byType(ListTile);
        expect(visibleListTiles, findsWidgets);
      });

      testWidgets('should filter countries correctly', (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        // Search for "German"
        await tester.enterText(find.byType(TextField), 'German');
        await tester.pumpAndSettle();

        expect(find.text('🇩🇪 German'), findsOneWidget);
        expect(find.text('🇺🇸 English'), findsNothing);
      });
    });
  });
}
