import 'package:flutter/widgets.dart';

/// An extension that provides methods to transform an [Iterable] of [Widget].
extension IterableTransformations on Iterable<Widget> {
  /// Returns a new iterable with a [separator] inserted between each [Widget].
  ///
  /// This method is useful when you can't build a [ListView] in your
  /// widget tree. Otherwise, consider using [ListView.separated] constructor.
  Iterable<Widget> withSeparatorBetweenWidgets({
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
