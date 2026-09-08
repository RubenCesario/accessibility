import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// A [PageTransitionsTheme] that skips the transition when effects are off.
///
/// Effects are resolved with [AccessibilityScope.effectsEnabledOf] when the
/// route is built, so both the user's choice and the OS reduce-motion
/// signal are honoured. Without an [AccessibilityScope] above the route the
/// transition plays normally. The app's own [builders] are kept.
final class AccessiblePageTransitionsTheme extends PageTransitionsTheme {
  /// Creates the theme over [builders], Material's defaults when omitted.
  const AccessiblePageTransitionsTheme({super.builders});

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final hasScope = AccessibilityScope.maybeOf(context) != null;
    if (hasScope && !AccessibilityScope.effectsEnabledOf(context)) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
