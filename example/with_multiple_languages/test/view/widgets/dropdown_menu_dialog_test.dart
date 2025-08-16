import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/interfaces/displayable.dart';
import 'package:with_multiple_languages/models/country.dart';
import 'package:with_multiple_languages/view/widgets/dropdown_menu_dialog.dart';

import '../../resources/widgets/base_tester.dart';

/// Test implementation of [Displayable] for testing purposes.
class TestDisplayableItem implements Displayable {
  const TestDisplayableItem(this._displayName);

  final String _displayName;

  @override
  String get displayName => _displayName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestDisplayableItem && other._displayName == _displayName;

  @override
  int get hashCode => _displayName.hashCode;
}

void main() {
  group('FilterableListDialog', () {
    const testEntries = [
      TestDisplayableItem('Apple'),
      TestDisplayableItem('Banana'),
      TestDisplayableItem('Cherry'),
      TestDisplayableItem('Date'),
      TestDisplayableItem('Elderberry'),
    ];

    const testCountries = [
      Country(
        languageCode: 'en',
        countryCode: 'US',
        name: 'English',
        flagEmoji: '🇺🇸',
      ),
      Country(
        languageCode: 'fr',
        countryCode: 'FR',
        name: 'French',
        flagEmoji: '🇫🇷',
      ),
      Country(
        languageCode: 'de',
        countryCode: 'DE',
        name: 'German',
        flagEmoji: '🇩🇪',
      ),
    ];

    Widget createTestWidget({
      required Iterable<Displayable> entries,
      Displayable? initialValue,
      String title = 'Test Dialog',
    }) => buildDefaultTestWidget(
      child: FilterableListDialog<Displayable>(
        title: title,
        entries: entries,
        initialValue: initialValue,
      ),
    );

    group('Constructor', () {
      testWidgets('should create with required parameters', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();
        expect(find.byType(FilterableListDialog<Displayable>), findsOneWidget);
      });

      testWidgets('should display correct title', (tester) async {
        const testTitle = 'Select Item';
        await tester.pumpWidget(
          createTestWidget(entries: testEntries, title: testTitle),
        );
        await tester.pumpAndSettle();
        expect(find.text(testTitle), findsOneWidget);
      });

      testWidgets('should handle empty entries list', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: []));
        await tester.pumpAndSettle();

        expect(find.byType(FilterableListDialog<Displayable>), findsOneWidget);
        expect(find.byType(ListTile), findsNothing);
      });
    });

    group('UI Elements', () {
      testWidgets('should display all required UI components', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        expect(find.byType(Dialog), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
        expect(find.text('Close Dialog'), findsOneWidget);
        expect(find.byIcon(Icons.search), findsOneWidget);
        expect(find.byIcon(Icons.clear), findsOneWidget);
      });

      testWidgets('should display all entries as ListTiles', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        expect(find.byType(ListTile), findsNWidgets(testEntries.length));

        for (final entry in testEntries) {
          expect(find.text(entry.displayName), findsOneWidget);
        }
      });

      testWidgets('should show check icon for initial value', (tester) async {
        const initialValue = TestDisplayableItem('Banana');
        await tester.pumpWidget(
          createTestWidget(entries: testEntries, initialValue: initialValue),
        );
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.check), findsOneWidget);
      });

      testWidgets('should not show check icon when no initial value', (
        tester,
      ) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.check), findsNothing);
      });
    });

    group('Search Functionality', () {
      testWidgets('should filter entries based on search input', (
        tester,
      ) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        // Initially all entries should be visible
        expect(find.byType(ListTile), findsNWidgets(testEntries.length));

        // Enter search text
        await tester.enterText(find.byType(TextField), 'a');
        await tester.pump();

        // Should show entries containing 'a': Apple, Banana, Date
        expect(find.text('Apple'), findsOneWidget);
        expect(find.text('Banana'), findsOneWidget);
        expect(find.text('Date'), findsOneWidget);
        expect(find.text('Cherry'), findsNothing);
        expect(find.text('Elderberry'), findsNothing);
      });

      testWidgets('should be case insensitive', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField), 'APPLE');
        await tester.pump();

        expect(find.text('Apple'), findsOneWidget);
        expect(find.byType(ListTile), findsOneWidget);
      });

      testWidgets('should show all entries when search is cleared', (
        tester,
      ) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        // Filter entries
        await tester.enterText(find.byType(TextField), 'a');
        await tester.pump();
        expect(find.byType(ListTile), findsNWidgets(3));

        // Clear search
        await tester.tap(find.byIcon(Icons.clear));
        await tester.pump();

        expect(find.byType(ListTile), findsNWidgets(testEntries.length));
      });

      testWidgets('should handle no matching results', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField), 'xyz123nonexistent');
        await tester.pumpAndSettle();
        expect(find.byType(ListTile), findsNothing);
      });

      testWidgets('should work with country entries', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testCountries));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField).first, 'en');
        await tester.pumpAndSettle();

        expect(find.text('🇺🇸 English'), findsOneWidget);
        expect(find.text('🇫🇷 French'), findsOneWidget); // Contains 'en'
        expect(find.text('🇩🇪 German'), findsNothing);
      });
    });

    group('User Interactions', () {
      testWidgets('should close dialog when close button is tapped', (
        tester,
      ) async {
        await tester.pumpWidget(
          buildDefaultTestWidget(
            child: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed:
                        () => showDialog<Displayable>(
                          context: context,
                          builder:
                              (context) =>
                                  const FilterableListDialog<Displayable>(
                                    title: 'Test',
                                    entries: testEntries,
                                  ),
                        ),
                    child: const Text('Open Dialog'),
                  ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Open Dialog'));
        await tester.pumpAndSettle();

        expect(find.byType(FilterableListDialog<Displayable>), findsOneWidget);

        await tester.tap(find.text('Close Dialog'));
        await tester.pumpAndSettle();

        expect(find.byType(FilterableListDialog<Displayable>), findsNothing);
      });

      testWidgets('should return selected item when ListTile is tapped', (
        tester,
      ) async {
        Displayable? selectedItem;

        await tester.pumpWidget(
          buildDefaultTestWidget(
            child: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () async {
                      selectedItem = await showDialog<Displayable>(
                        context: context,
                        builder:
                            (context) =>
                                const FilterableListDialog<Displayable>(
                                  title: 'Test',
                                  entries: testEntries,
                                ),
                      );
                    },
                    child: const Text('Open Dialog'),
                  ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Open Dialog'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Cherry'));
        await tester.pumpAndSettle();

        expect(selectedItem, equals(const TestDisplayableItem('Cherry')));
      });

      testWidgets('should handle text field submission', (tester) async {
        Displayable? selectedItem;

        await tester.pumpWidget(
          buildDefaultTestWidget(
            child: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () async {
                      selectedItem = await showDialog<Displayable>(
                        context: context,
                        builder:
                            (context) =>
                                const FilterableListDialog<Displayable>(
                                  title: 'Test',
                                  entries: testEntries,
                                ),
                      );
                    },
                    child: const Text('Open Dialog'),
                  ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Open Dialog'));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField), 'apple');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(selectedItem, equals(const TestDisplayableItem('Apple')));
      });

      testWidgets('should not submit when no matching entries', (tester) async {
        Displayable? selectedItem;

        await tester.pumpWidget(
          buildDefaultTestWidget(
            child: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () async {
                      selectedItem = await showDialog<Displayable>(
                        context: context,
                        builder:
                            (context) =>
                                const FilterableListDialog<Displayable>(
                                  title: 'Test',
                                  entries: testEntries,
                                ),
                      );
                    },
                    child: const Text('Open Dialog'),
                  ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Open Dialog'));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField), 'xyz');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(selectedItem, isNull);
        expect(find.byType(FilterableListDialog<Displayable>), findsOneWidget);
      });

      testWidgets('should not submit when search text is empty', (
        tester,
      ) async {
        Displayable? selectedItem;

        await tester.pumpWidget(
          buildDefaultTestWidget(
            child: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () async {
                      selectedItem = await showDialog<Displayable>(
                        context: context,
                        builder:
                            (context) =>
                                const FilterableListDialog<Displayable>(
                                  title: 'Test',
                                  entries: testEntries,
                                ),
                      );
                    },
                    child: const Text('Open Dialog'),
                  ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Open Dialog'));
        await tester.pumpAndSettle();

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(selectedItem, isNull);
        expect(find.byType(FilterableListDialog<Displayable>), findsOneWidget);
      });
    });

    group('Initial Value Handling', () {
      testWidgets(
        'should populate text field with initial value display name',
        (tester) async {
          const initialValue = TestDisplayableItem('Banana');
          await tester.pumpWidget(
            createTestWidget(entries: testEntries, initialValue: initialValue),
          );
          await tester.pumpAndSettle();
          final textField = tester.widget<TextField>(find.byType(TextField));
          expect(textField.controller?.text, equals('Banana'));
        },
      );

      testWidgets('should handle null initial value', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();
        final textField = tester.widget<TextField>(find.byType(TextField));
        expect(textField.controller?.text, isEmpty);
      });
    });

    group('Accessibility', () {
      testWidgets('should have proper semantic labels', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();

        // Check for search icon with semantic label
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon && widget.semanticLabel == 'Search a country',
          ),
          findsOneWidget,
        );

        // Check for clear icon with semantic label
        expect(
          find.byWidgetPredicate(
            (widget) => widget is Icon && widget.semanticLabel == 'Clear text',
          ),
          findsOneWidget,
        );

        expect(find.bySemanticsLabel('Current country selected'), findsNothing);
      });

      testWidgets('should show current selection semantic label', (
        tester,
      ) async {
        const initialValue = TestDisplayableItem('Apple');
        const entriesWithInitialValue = [
          initialValue, // Use the same instance
          TestDisplayableItem('Banana'),
          TestDisplayableItem('Cherry'),
        ];
        await tester.pumpWidget(
          createTestWidget(
            entries: entriesWithInitialValue,
            initialValue: initialValue,
          ),
        );
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.semanticLabel == 'Current country selected',
          ),
          findsOneWidget,
        );
      });

      testWidgets('should use AccessibleText widgets', (tester) async {
        await tester.pumpWidget(createTestWidget(entries: testEntries));
        await tester.pumpAndSettle();
        expect(find.byType(AccessibleText), findsWidgets);
      });
    });
  });
}
