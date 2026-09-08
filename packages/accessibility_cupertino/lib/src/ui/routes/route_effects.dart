import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Whether effects are enabled above [context], without registering
/// dependencies, for routes that need the answer outside of a build.
///
/// Resolves [EffectsMode.system] against the nearest media query's
/// reduce-motion flag; `true` without an [AccessibilityScope].
bool routeEffectsEnabled(BuildContext context) {
  final viewModel = AccessibilityScope.maybeOf(context);
  if (viewModel == null) {
    return true;
  }
  final reducesMotion =
      context
          .getInheritedWidgetOfExactType<MediaQuery>()
          ?.data
          .disableAnimations ??
      false;
  return viewModel.settings.effectsMode.resolve(
    systemReducesMotion: reducesMotion,
  );
}
