import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_transition_mixin.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A [CupertinoPageRoute] that honours the effects mode.
///
/// When effects are off (the user's choice, or the OS reduce-motion
/// signal in system mode) the page appears in place without motion and
/// the route's durations are zero; the edge-swipe back gesture keeps
/// working. Use it wherever the app would use [CupertinoPageRoute].
final class AccessibleCupertinoPageRoute<T> extends CupertinoPageRoute<T>
    with AccessibleCupertinoTransitionMixin<T> {
  /// Creates the route; the parameters are those of [CupertinoPageRoute].
  AccessibleCupertinoPageRoute({
    required super.builder,
    super.title,
    super.settings,
    super.requestFocus,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.barrierDismissible,
  });
}
