import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/widgets/shared/effects_setting_listenable_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../resources/widgets/base_tester.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('EffectsSettingListenableBuilder', () {
    const effectsEnabledKey = Key('effects-enabled');
    const effectsDisabledKey = Key('effects-disabled');

    Widget buildTestWidget() => buildDefaultTestWidget(
          child: EffectsSettingListenableBuilder(
            builder: (context, effectsAllowed, _) => effectsAllowed
                ? const Text('Effects Enabled', key: effectsEnabledKey)
                : const Text('Effects Disabled', key: effectsDisabledKey),
          ),
        );

    testWidgets('renders with default effects setting', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      // By default, effects are allowed
      expect(find.byKey(effectsEnabledKey), findsOneWidget);
      expect(find.byKey(effectsDisabledKey), findsNothing);
    });

    testWidgets('responds to effects setting changes', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.firstElement(find.byType(EffectsSettingListenableBuilder)),
      );

      // Change effects to disabled
      settings.effectsAllowed.value = false;
      await tester.pump();

      // Should now show "effects disabled"
      expect(find.byKey(effectsDisabledKey), findsOneWidget);
      expect(find.byKey(effectsEnabledKey), findsNothing);

      // Change effects back to enabled
      settings.effectsAllowed.value = true;
      await tester.pump();

      // Should show "effects enabled" again
      expect(find.byKey(effectsEnabledKey), findsOneWidget);
      expect(find.byKey(effectsDisabledKey), findsNothing);
    });

    testWidgets('passes child widget to builder', (tester) async {
      const childKey = Key('child-widget');
      final childWidget = Container(key: childKey);

      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: EffectsSettingListenableBuilder(
            builder: (context, effectsAllowed, child) => Column(
              children: [
                if (effectsAllowed)
                  const Text('Effects Enabled', key: effectsEnabledKey)
                else
                  const Text('Effects Disabled', key: effectsDisabledKey),
                if (child != null) child,
              ],
            ),
            child: childWidget,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should render both the effects text and child widget
      expect(find.byKey(effectsEnabledKey), findsOneWidget);
      expect(find.byKey(childKey), findsOneWidget);
    });

    testWidgets('maintains builder state through effects changes',
        (tester) async {
      // Create a stateful widget to use within our builder
      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: EffectsSettingListenableBuilder(
            builder: (context, effectsAllowed, _) => StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  if (effectsAllowed)
                    const Text('Effects Enabled', key: effectsEnabledKey)
                  else
                    const Text('Effects Disabled', key: effectsDisabledKey),
                  const Text('Counter: 1', key: Key('counter')),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Both texts should be visible initially
      expect(find.byKey(effectsEnabledKey), findsOneWidget);
      expect(find.byKey(const Key('counter')), findsOneWidget);

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.firstElement(find.byType(EffectsSettingListenableBuilder)),
      );

      // Change effects setting
      settings.effectsAllowed.value = false;
      await tester.pump();

      // Effects text should change but counter should remain
      expect(find.byKey(effectsDisabledKey), findsOneWidget);
      expect(find.byKey(const Key('counter')), findsOneWidget);
    });

    testWidgets('rebuilds only when effects setting changes', (tester) async {
      var buildCount = 0;

      await tester.pumpWidget(
        buildDefaultTestWidget(
          child: EffectsSettingListenableBuilder(
            builder: (context, effectsAllowed, _) {
              buildCount++;
              return effectsAllowed
                  ? const Text('Effects Enabled', key: effectsEnabledKey)
                  : const Text('Effects Disabled', key: effectsDisabledKey);
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      final initialBuildCount = buildCount;
      expect(initialBuildCount, greaterThan(0));

      // Get the accessibility settings to modify them
      final settings = AccessibilitySettingsInherited.of(
        tester.firstElement(find.byType(EffectsSettingListenableBuilder)),
      );

      // Change unrelated settings (not effects)
      settings.textSettings.value = settings.textSettings.value.copyWith(
        textScaleFactor: 1.5,
      );
      await tester.pump();

      // Build count should not change since only text settings were modified
      expect(buildCount, equals(initialBuildCount));

      // Now change effects setting
      settings.effectsAllowed.value = false;
      await tester.pump();

      // Build count should increase
      expect(buildCount, greaterThan(initialBuildCount));
    });
  });
}
