/// @docImport 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_page_route.dart';
library;

import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_transition_mixin.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A [CupertinoPage] whose route honours the effects mode, for the pages
/// API of [Navigator]; see [AccessibleCupertinoPageRoute].
final class AccessibleCupertinoPage<T> extends CupertinoPage<T> {
  /// Creates the page; the parameters are those of [CupertinoPage].
  const AccessibleCupertinoPage({
    required super.child,
    super.maintainState,
    super.title,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.canPop,
    super.onPopInvoked,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => _AccessiblePageBasedRoute<T>(
    page: this,
    allowSnapshotting: allowSnapshotting,
  );
}

/// The page-based counterpart of [AccessibleCupertinoPageRoute], reading
/// its content and options from the page so they follow page updates.
final class _AccessiblePageBasedRoute<T> extends PageRoute<T>
    with
        CupertinoRouteTransitionMixin<T>,
        AccessibleCupertinoTransitionMixin<T> {
  _AccessiblePageBasedRoute({
    required AccessibleCupertinoPage<T> page,
    super.allowSnapshotting,
  }) : super(settings: page);

  AccessibleCupertinoPage<T> get _page =>
      settings as AccessibleCupertinoPage<T>;

  @override
  DelegatedTransitionBuilder? get delegatedTransition =>
      fullscreenDialog ? null : CupertinoPageTransition.delegatedTransition;

  @override
  Widget buildContent(BuildContext context) => _page.child;

  @override
  String? get title => _page.title;

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}
