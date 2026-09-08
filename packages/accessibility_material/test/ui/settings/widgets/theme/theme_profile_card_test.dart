import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_profile_card.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_material.dart';

void main() {
  testWidgets('ThemeProfileCard applies its profile and highlights it', (
    tester,
  ) async {
    final viewModel = await pumpMaterial(
      tester,
      const ThemeProfileCard(level: ThemeProfileLevel.adhdFriendly),
    );
    expect(
      tester
          .getSemantics(find.bySemanticsLabel('ADHD-friendly profile'))
          .flagsCollection
          .isSelected
          .toBoolOrNull(),
      isFalse,
    );
    await tester.tap(find.bySemanticsLabel('ADHD-friendly profile'));
    await tester.pumpAndSettle();
    expect(viewModel.settings, AccessibilitySettingsSamples.adhdFriendly);
    expect(
      tester
          .getSemantics(find.bySemanticsLabel('ADHD-friendly profile'))
          .flagsCollection
          .isSelected
          .toBoolOrNull(),
      isTrue,
    );
  });

  testWidgets('the none card restores the default profile', (tester) async {
    final viewModel = await pumpMaterial(
      tester,
      const ThemeProfileCard(level: ThemeProfileLevel.none),
      initial: AccessibilitySettingsSamples.seizureSafe,
    );
    await tester.tap(find.bySemanticsLabel('Default profile'));
    await tester.pumpAndSettle();
    expect(viewModel.settings.matchingThemeProfile, ThemeProfileLevel.none);
  });
}
