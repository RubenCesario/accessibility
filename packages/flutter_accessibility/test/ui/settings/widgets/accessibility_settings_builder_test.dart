import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_settings_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_scoped.dart';

void main() {
  testWidgets('AccessibilitySettingsBuilder rebuilds with the settings', (
    tester,
  ) async {
    const passthrough = SizedBox(key: Key('child'));
    var builds = 0;
    final viewModel = await pumpScoped(
      tester,
      AccessibilitySettingsBuilder(
        builder: (context, settings, child) {
          builds++;
          return Column(
            children: [
              Text('scale ${settings.textSettings.textScaleFactor}'),
              child!,
            ],
          );
        },
        child: passthrough,
      ),
    );
    expect(find.text('scale 1.0'), findsOneWidget);
    expect(find.byKey(const Key('child')), findsOneWidget);
    await viewModel.setTextScaleFactor(2);
    await tester.pump();
    expect(find.text('scale 2.0'), findsOneWidget);
    expect(builds, 2);
  });
}
