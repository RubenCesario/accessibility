import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_mode_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_cupertino.dart';

void main() {
  testWidgets('ThemeModeSetting sets the theme mode', (tester) async {
    final viewModel = await pumpCupertino(tester, const ThemeModeSetting());
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.system);
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.dark);
    await tester.tap(find.text('Light'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.light);
    await tester.tap(find.text('System'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.themeMode, AccessibilityThemeMode.system);
  });
}
