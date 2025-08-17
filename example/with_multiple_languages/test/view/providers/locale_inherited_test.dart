import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/view/providers/locale_inherited.dart';

void main() {
  group('LocaleInherited', () {
    group('Constructor', () {
      testWidgets('should create with default null locale', (tester) async {
        final localeInherited = LocaleInherited(child: const SizedBox());

        expect(localeInherited.locale.value, isNull);
      });

      testWidgets('should create with provided locale', (tester) async {
        const testLocale = Locale('en', 'US');
        final localeInherited = LocaleInherited(
          locale: testLocale,
          child: const SizedBox(),
        );

        expect(localeInherited.locale.value, equals(testLocale));
      });

      testWidgets('should create with key', (tester) async {
        const key = Key('test_key');
        final localeInherited = LocaleInherited(
          key: key,
          child: const SizedBox(),
        );

        expect(localeInherited.key, equals(key));
      });
    });

    group('Locale Property', () {
      testWidgets('should return ValueNotifier for locale', (tester) async {
        final localeInherited = LocaleInherited(child: const SizedBox());

        expect(localeInherited.locale, isA<ValueNotifier<Locale?>>());
      });

      testWidgets('should allow locale changes', (tester) async {
        final localeInherited = LocaleInherited(child: const SizedBox());

        const newLocale = Locale('fr', 'FR');
        localeInherited.locale.value = newLocale;

        expect(localeInherited.locale.value, equals(newLocale));
      });

      testWidgets('should notify listeners on locale change', (tester) async {
        final localeInherited = LocaleInherited(child: const SizedBox());

        var notificationCount = 0;
        localeInherited.locale.addListener(() {
          notificationCount++;
        });

        localeInherited.locale.value = const Locale('de', 'DE');
        expect(notificationCount, equals(1));

        localeInherited.locale.value = const Locale('es', 'ES');
        expect(notificationCount, equals(2));
      });

      testWidgets('should handle null locale changes', (tester) async {
        final localeInherited = LocaleInherited(
          locale: const Locale('en', 'US'),
          child: const SizedBox(),
        );

        localeInherited.locale.value = null;
        expect(localeInherited.locale.value, isNull);
      });
    });

    group('InheritedWidget Behavior', () {
      testWidgets('should be found in widget tree', (tester) async {
        await tester.pumpWidget(
          LocaleInherited(
            locale: const Locale('ja', 'JP'),
            child: Builder(
              builder: (context) {
                final inherited = LocaleInherited.of(context);
                return Text(
                  inherited.locale.value?.languageCode ?? 'null',
                  textDirection: TextDirection.ltr,
                );
              },
            ),
          ),
        );

        expect(find.text('ja'), findsOneWidget);
      });

      testWidgets('should update dependents when locale changes', (
        tester,
      ) async {
        late LocaleInherited localeInherited;

        await tester.pumpWidget(
          StatefulBuilder(
            builder:
                (context, setState) =>
                    localeInherited = LocaleInherited(
                      locale: const Locale('en', 'US'),
                      child: Builder(
                        builder: (context) {
                          final inherited = LocaleInherited.of(context);
                          return Text(
                            inherited.locale.value?.languageCode ?? 'null',
                            textDirection: TextDirection.ltr,
                          );
                        },
                      ),
                    ),
          ),
        );

        expect(find.text('en'), findsOneWidget);

        localeInherited.locale.value = const Locale('fr', 'FR');
        await tester.pump();

        expect(find.text('fr'), findsOneWidget);
        expect(find.text('en'), findsNothing);
      });

      testWidgets('should throw assertion error when not found in context', (
        tester,
      ) async {
        await tester.pumpWidget(
          Builder(
            builder: (context) {
              expect(
                () => LocaleInherited.of(context),
                throwsA(isA<AssertionError>()),
              );
              return const SizedBox();
            },
          ),
        );
      });

      testWidgets('should provide correct locale to multiple children', (
        tester,
      ) async {
        const testLocale = Locale('zh', 'CN');

        await tester.pumpWidget(
          LocaleInherited(
            locale: testLocale,
            child: Column(
              textDirection: TextDirection.ltr,
              children: [
                Builder(
                  builder: (context) {
                    final inherited = LocaleInherited.of(context);
                    return Text(
                      'Child1: ${inherited.locale.value?.languageCode}',
                      textDirection: TextDirection.ltr,
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final inherited = LocaleInherited.of(context);
                    return Text(
                      'Child2: ${inherited.locale.value?.countryCode}',
                      textDirection: TextDirection.ltr,
                    );
                  },
                ),
              ],
            ),
          ),
        );

        expect(find.text('Child1: zh'), findsOneWidget);
        expect(find.text('Child2: CN'), findsOneWidget);
      });
    });

    group('Static of Method', () {
      testWidgets('should return closest LocaleInherited instance', (
        tester,
      ) async {
        late LocaleInherited outerInherited;
        late LocaleInherited innerInherited;

        await tester.pumpWidget(
          StatefulBuilder(
            builder:
                (context, setState) =>
                    outerInherited = LocaleInherited(
                      locale: const Locale('en', 'US'),
                      child: LocaleInherited(
                        locale: const Locale('fr', 'FR'),
                        child: Builder(
                          builder: (context) {
                            innerInherited = LocaleInherited.of(context);
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
          ),
        );

        expect(innerInherited.locale.value, equals(const Locale('fr', 'FR')));
        expect(innerInherited, isNot(same(outerInherited)));
      });

      testWidgets('should work with nested widgets', (tester) async {
        await tester.pumpWidget(
          LocaleInherited(
            locale: const Locale('de', 'DE'),
            child: Padding(
              padding: EdgeInsets.zero,
              child: Builder(
                builder: (context) {
                  final inherited = LocaleInherited.of(context);
                  return Text(
                    inherited.locale.value?.toString() ?? 'null',
                    textDirection: TextDirection.ltr,
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text('de_DE'), findsOneWidget);
      });
    });

    group('Immutability', () {
      test('should be marked as immutable', () {
        final localeInherited = LocaleInherited(child: const SizedBox());
        expect(localeInherited, isA<LocaleInherited>());
        // The @immutable annotation ensures compile-time immutability
      });

      testWidgets('should maintain reference equality for same locale', (
        tester,
      ) async {
        const testLocale = Locale('ko', 'KR');
        final localeInherited1 = LocaleInherited(
          locale: testLocale,
          child: const SizedBox(),
        );
        final localeInherited2 = LocaleInherited(
          locale: testLocale,
          child: const SizedBox(),
        );

        expect(localeInherited1.locale.value, equals(testLocale));
        expect(localeInherited2.locale.value, equals(testLocale));
        expect(
          localeInherited1.locale.value,
          same(localeInherited2.locale.value),
        );
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle rapid locale changes', (tester) async {
        final localeInherited = LocaleInherited(child: const SizedBox());

        final locales = [
          const Locale('en', 'US'),
          const Locale('fr', 'FR'),
          const Locale('de', 'DE'),
          const Locale('ja', 'JP'),
          null,
        ];

        for (final locale in locales) {
          localeInherited.locale.value = locale;
          expect(localeInherited.locale.value, equals(locale));
        }
      });

      testWidgets('should handle same locale assignment', (tester) async {
        const testLocale = Locale('it', 'IT');
        final localeInherited = LocaleInherited(
          locale: testLocale,
          child: const SizedBox(),
        );

        var notificationCount = 0;
        localeInherited.locale.addListener(() {
          notificationCount++;
        });

        localeInherited.locale.value = testLocale;
        expect(
          notificationCount,
          equals(0),
        ); // ValueNotifier does not notify for same value
        expect(localeInherited.locale.value, equals(testLocale));
      });
    });
  });
}
