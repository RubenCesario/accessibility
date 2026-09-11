import 'package:accessibility/accessibility.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';

/// Exposes an [AccessibilitySettingsViewModel] to the widget tree.
///
/// Place it above the app's root widget. Widgets read the ViewModel with
/// [of] (to invoke commands), the settings with [settingsOf] and the load
/// status with [statusOf] (to rebuild on changes).
final class AccessibilityScope
    extends InheritedNotifier<AccessibilitySettingsViewModel> {
  /// Creates a scope providing [viewModel] to [child].
  const AccessibilityScope({
    required AccessibilitySettingsViewModel viewModel,
    required super.child,
    super.key,
  }) : super(notifier: viewModel);

  /// The ViewModel above [context], without registering a dependency.
  ///
  /// Use it to invoke commands. Asserts when no scope is found.
  static AccessibilitySettingsViewModel of(BuildContext context) {
    final viewModel = maybeOf(context);
    assert(viewModel != null, 'No AccessibilityScope found above this widget');
    return viewModel!;
  }

  /// The ViewModel above [context], or `null` when there is no scope.
  static AccessibilitySettingsViewModel? maybeOf(BuildContext context) =>
      context.getInheritedWidgetOfExactType<AccessibilityScope>()?.notifier;

  /// The current settings, registering a dependency so the caller rebuilds
  /// whenever they change. Asserts when no scope is found.
  static AccessibilitySettings settingsOf(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AccessibilityScope>();
    assert(scope != null, 'No AccessibilityScope found above this widget');
    return scope!.notifier!.settings;
  }

  /// The current load status, registering a dependency so the caller
  /// rebuilds whenever it changes. Asserts when no scope is found.
  static AccessibilitySettingsStatus statusOf(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AccessibilityScope>();
    assert(scope != null, 'No AccessibilityScope found above this widget');
    return scope!.notifier!.status;
  }

  /// Whether effects are enabled, resolving [EffectsMode.system] against the
  /// OS reduce-motion signal (`MediaQuery.disableAnimationsOf`).
  ///
  /// Registers dependencies on both the scope and the media query.
  static bool effectsEnabledOf(BuildContext context) => settingsOf(context)
      .effectsMode
      .resolve(systemReducesMotion: MediaQuery.disableAnimationsOf(context));
}
