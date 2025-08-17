import 'package:flutter/widgets.dart';

/// {@template LocaleInherited}
/// A provider of the locale of the application.
///
/// It is used to provide the current locale of the application
/// configuration of the application to its children.
/// {@endtemplate}
@immutable
final class LocaleInherited extends InheritedNotifier<ValueNotifier<Locale?>> {
  /// {@macro LocaleInherited}
  LocaleInherited({required super.child, Locale? locale, super.key})
    : super(notifier: ValueNotifier<Locale?>(locale));

  /// The locale of the application.
  ValueNotifier<Locale?> get locale => notifier!;

  /// Returns the closest [LocaleInherited]
  /// instance that encloses the given context.
  static LocaleInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<LocaleInherited>();
    assert(result != null, 'No LocaleInherited found in context');
    return result!;
  }
}
