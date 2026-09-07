import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';
import 'package:flutter_accessibility/src/ui/settings/widgets/accessibility_scope.dart';
import 'package:flutter_test/flutter_test.dart';

/// The default text style every pumped tree starts from.
const kTestTextStyle = TextStyle(fontSize: 14, color: Color(0xFF000000));

/// Pumps [child] under an [AccessibilityScope], a [MediaQuery], a
/// [Directionality] and a [DefaultTextStyle], with no design system.
///
/// Returns the ViewModel so tests can invoke commands. The repository is
/// backed by a [FakeAccessibilityStorageService] holding [initial] and is
/// loaded before the first frame.
Future<AccessibilitySettingsViewModel> pumpScoped(
  WidgetTester tester,
  Widget child, {
  AccessibilitySettings initial = AccessibilitySettings.defaults,
  List<AccessibleFont> fonts = const [],
  bool disableAnimations = false,
  Size size = const Size(400, 800),
  TextStyle textStyle = kTestTextStyle,
}) async {
  final repository = AccessibilitySettingsRepository(
    service: FakeAccessibilityStorageService(initial: initial),
  );
  await repository.load();
  final viewModel = AccessibilitySettingsViewModel(
    repository: repository,
    accessibleFonts: fonts,
  );
  addTearDown(() {
    viewModel.dispose();
    repository.dispose();
  });
  await tester.pumpWidget(
    AccessibilityScope(
      viewModel: viewModel,
      child: MediaQuery(
        data: MediaQueryData(size: size, disableAnimations: disableAnimations),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: DefaultTextStyle(style: textStyle, child: child),
        ),
      ),
    ),
  );
  return viewModel;
}
