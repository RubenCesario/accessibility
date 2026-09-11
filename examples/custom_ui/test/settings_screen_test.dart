import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:custom_ui_example/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

Future<AccessibilitySettingsViewModel> pumpApp(
  WidgetTester tester, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
}) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(repository: repository);
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  await tester.pumpWidget(
    AccessibilityScope(viewModel: viewModel, child: const ExampleApp()),
  );
  await tester.pumpAndSettle();
  return viewModel;
}

void main() {
  testWidgets('every button drives its setting through the ViewModel', (
    tester,
  ) async {
    final viewModel = await pumpApp(tester);
    Future<void> tap(String label) async {
      // Later taps grow the text (scale, spacing, weight), which can push
      // a later button below the default test surface: scroll it into
      // view first, the way a user would, before tapping it.
      final finder = find.bySemanticsLabel(label);
      await tester.ensureVisible(finder);
      await tester.pumpAndSettle();
      await tester.tap(finder);
      await tester.pumpAndSettle();
    }

    await tap('Theme mode');
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.light);
    await tap('Effects');
    expect(viewModel.settings.effectsMode, EffectsMode.enabled);
    await tap('Text scale');
    expect(viewModel.settings.textSettings.textScaleFactor, 1.25);
    await tap('Line height');
    expect(viewModel.settings.textSettings.lineHeight, 1.5);
    await tap('Letter spacing');
    expect(viewModel.settings.textSettings.letterSpacing, 0.5);
    await tap('Word spacing');
    expect(viewModel.settings.textSettings.wordSpacing, 1);
    await tap('Bold text');
    expect(viewModel.settings.textSettings.isBold, isTrue);
    await tap('Text alignment');
    expect(
      viewModel.settings.textSettings.textAlign,
      isNot(TextAlignMode.none),
    );
    await tap('Text colour');
    expect(viewModel.settings.textSettings.color, 0xFFB3261E);
    await tap('Background colour');
    expect(viewModel.settings.colorSettings.backgroundColor, 0xFFFFF8E1);
    await tap('Colour profile');
    expect(
      viewModel.settings.colorSettings.colorProfile,
      isNot(ColorProfileLevel.normal),
    );
    await tap('Restore defaults');
    expect(viewModel.settings, AccessibilitySettings.defaults);
  });

  testWidgets('the root text style and background follow the settings', (
    tester,
  ) async {
    await pumpApp(
      tester,
      initial: const AccessibilitySettings(
        themeMode: AccessibilityThemeMode.dark,
        textSettings: TextSettings(textScaleFactor: 2, isBold: true),
        colorSettings: ColorSettings(backgroundColor: 0xFF000000),
      ),
    );
    final style = DefaultTextStyle.of(
      tester.element(find.text('Accessibility settings')),
    ).style;
    expect(style.fontSize, 32);
    expect(style.fontWeight, FontWeight.bold);
    final box = tester.widget<ColoredBox>(find.byType(ColoredBox).first);
    expect(box.color, const Color(0xFF000000));
  });
}
