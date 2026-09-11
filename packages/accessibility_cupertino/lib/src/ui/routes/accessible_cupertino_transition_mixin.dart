import 'package:accessibility_cupertino/src/ui/routes/route_effects.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Makes a Cupertino route honour the effects mode.
///
/// When effects are off the route keeps Cupertino's transition widgets
/// (so the edge-swipe back gesture still works) but drives them with
/// completed animations, and its durations are zero, so neither this
/// route nor its neighbours move. The durations are resolved through the
/// navigator's context when the route is installed; the transition itself
/// follows the settings on every build. Without an [AccessibilityScope]
/// the route behaves like the original.
mixin AccessibleCupertinoTransitionMixin<T>
    on CupertinoRouteTransitionMixin<T> {
  bool get _effectsEnabled {
    final context = navigator?.context;
    return context == null || routeEffectsEnabled(context);
  }

  @override
  Duration get transitionDuration =>
      _effectsEnabled ? super.transitionDuration : Duration.zero;

  @override
  Duration get reverseTransitionDuration =>
      _effectsEnabled ? super.reverseTransitionDuration : Duration.zero;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final hasScope = AccessibilityScope.maybeOf(context) != null;
    if (!hasScope || AccessibilityScope.effectsEnabledOf(context)) {
      return super.buildTransitions(
        context,
        animation,
        secondaryAnimation,
        child,
      );
    }
    return super.buildTransitions(
      context,
      kAlwaysCompleteAnimation,
      kAlwaysDismissedAnimation,
      child,
    );
  }
}
