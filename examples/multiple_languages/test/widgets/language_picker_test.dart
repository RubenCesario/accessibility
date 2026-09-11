import 'package:accessibility_material/accessibility_material.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:multiple_languages_example/locale/country.dart';
import 'package:multiple_languages_example/locale/locale_scope.dart';
import 'package:multiple_languages_example/widgets/language_picker.dart';

Future<ValueNotifier<Locale?>> pumpPicker(WidgetTester tester) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(repository: repository);
  final locale = ValueNotifier<Locale?>(null);
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
    locale.dispose();
  });
  await tester.pumpWidget(
    AccessibilityScope(
      viewModel: viewModel,
      child: LocaleScope(
        notifier: locale,
        child: MaterialApp(
          localizationsDelegates: const [
            ...GlobalMaterialLocalizations.delegates,
            AccessibilityLocalizations.delegate,
          ],
          supportedLocales: AccessibilityLocalizations.supportedLocales,
          home: Scaffold(appBar: AppBar(actions: const [LanguagePicker()])),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return locale;
}

void main() {
  test('sortedCountries is sorted by name and complete', () {
    final names = LanguagePicker.sortedCountries.map((c) => c.name).toList();
    expect(names, [...names]..sort());
    expect(LanguagePicker.sortedCountries, hasLength(allCountries.length));
  });

  test('every country locale is among the supported locales', () {
    final supported = AccessibilityLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .toSet();
    for (final country in allCountries) {
      expect(supported, contains(country.languageCode), reason: country.name);
    }
  });

  testWidgets('opens the dialog, filters and sets the locale', (tester) async {
    final locale = await pumpPicker(tester);
    await tester.tap(find.byTooltip('Language'));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'ital');
    await tester.pumpAndSettle();
    expect(find.textContaining('Italian'), findsOneWidget);
    await tester.tap(find.textContaining('Italian'));
    await tester.pumpAndSettle();
    expect(locale.value, const Locale('it', 'IT'));
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('marks the current locale as selected', (tester) async {
    final locale = await pumpPicker(tester);
    // The copied list's English entry is 'en'-'GB', not 'en'-'US'
    // (defaultLocale); see country.dart.
    locale.value = const Locale('en', 'GB');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Language'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'English');
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
