import 'dart:io';

import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the barrel exports the whole public API', () {
    final barrel = File('lib/flutter_accessibility.dart').readAsStringSync();
    for (final name in [
      'AccessibilitySettingsViewModel',
      'AccessibilityScope',
      'AccessibilitySettingsBuilder',
      'EffectsBuilder',
      'AccessibilitySettingsConfiguration',
      'AccessibilitySettingsStyle',
      'AccessibleColor',
      'AccessibleText',
      'AccessibleTextStyle',
      'AccessibleWidgetBuilder',
      'AccessibleSizedBox',
      'AccessibleHeight',
      'CollapsibleText',
      'CollapsibleToggleBuilder',
      'kDefaultColorCandidates',
      'TextRawMagnifier',
    ]) {
      expect(barrel, contains(name), reason: name);
    }
    expect(
      barrel,
      contains("export 'package:accessibility/accessibility.dart'"),
    );
    expect(barrel, isNot(contains('package:listen')));
  });

  testWidgets('the view model works with Flutter listenable widgets', (
    tester,
  ) async {
    final repository = AccessibilitySettingsRepository(
      service: FakeAccessibilityStorageService(),
    );
    final viewModel = AccessibilitySettingsViewModel(repository: repository);
    addTearDown(() {
      viewModel.dispose();
      repository.dispose();
    });
    final Listenable asListenable = viewModel;
    final ChangeNotifier asNotifier = viewModel;
    expect(asListenable, same(asNotifier));
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) =>
              Text('bold ${viewModel.settings.textSettings.isBold}'),
        ),
      ),
    );
    expect(find.text('bold false'), findsOneWidget);
    await viewModel.setBold(value: true);
    await tester.pump();
    expect(find.text('bold true'), findsOneWidget);
  });
}
