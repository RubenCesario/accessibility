import 'package:flutter/widgets.dart';

/// An extension that provides a method to separate a list of [Widget]
/// by a copy of another [Widget].
///
/// This extension is useful when you can't build a [ListView] in your
/// widget tree. Otherwise, consider using [ListView.separated] constructor.
extension SeparatedBy on List<Widget> {
  /// Returns a new list with a [separator] inserted between each [Widget].
  ///
  /// This method is useful when you can't build a [ListView] in your
  /// widget tree. Otherwise, consider using [ListView.separated] constructor.
  List<Widget> withSeparatorBetweenWidgets({
    required Widget separator,
  }) =>
      length < 2
          ? this
          : (List<Widget>.from(
              expand(
                (widget) => [widget, separator],
              ),
            )..removeLast());
}
