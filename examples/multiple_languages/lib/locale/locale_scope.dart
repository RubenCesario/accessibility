import 'package:flutter/widgets.dart';

/// Holds the app locale and rebuilds its dependents when it changes.
final class LocaleScope extends InheritedNotifier<ValueNotifier<Locale?>> {
  /// Creates the scope over [notifier].
  const LocaleScope({
    required ValueNotifier<Locale?> notifier,
    required super.child,
    super.key,
  }) : super(notifier: notifier);

  /// The locale notifier above [context]; asserts when there is none.
  static ValueNotifier<Locale?> of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'No LocaleScope found above this widget');
    return scope!.notifier!;
  }
}
