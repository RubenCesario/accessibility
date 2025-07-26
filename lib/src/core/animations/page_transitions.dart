import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:flutter/material.dart'
    show Animation, BuildContext, PageRoute, PageTransitionsTheme, Widget;

/// {@template DependsOnEffectsSettingPageTransitionsTheme}
/// A [PageTransitionsTheme] that does not apply any transition
/// if the effects mode is disabled.
/// {@endtemplate}
class DependsOnEffectsSettingPageTransitionsTheme extends PageTransitionsTheme {
  /// {@macro DependsOnEffectsSettingPageTransitionsTheme}
  const DependsOnEffectsSettingPageTransitionsTheme();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final effectsEnabled =
        AccessibilitySettingsInherited.of(context).effectsAllowed.value;
    if (!effectsEnabled) {
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
