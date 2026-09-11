import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_languages_example/locale/locale_scope.dart';

void main() {
  testWidgets('LocaleScope rebuilds dependents when the locale changes', (
    tester,
  ) async {
    final notifier = ValueNotifier<Locale?>(null);
    addTearDown(notifier.dispose);
    var builds = 0;
    late Locale? seen;
    await tester.pumpWidget(
      LocaleScope(
        notifier: notifier,
        child: Builder(
          builder: (context) {
            builds++;
            seen = LocaleScope.of(context).value;
            return const SizedBox();
          },
        ),
      ),
    );
    expect(builds, 1);
    expect(seen, isNull);
    notifier.value = const Locale('it', 'IT');
    await tester.pump();
    expect(builds, 2);
    expect(seen, const Locale('it', 'IT'));
  });

  testWidgets('LocaleScope.of asserts without a scope', (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      Builder(
        builder: (context) {
          captured = context;
          return const SizedBox();
        },
      ),
    );
    expect(() => LocaleScope.of(captured), throwsAssertionError);
  });
}
