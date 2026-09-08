import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_page.dart';
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_page_route.dart';
import 'package:accessibility_cupertino/src/ui/routes/accessible_cupertino_transition_mixin.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_cupertino.dart';

const second = Text('second');

/// A button that pushes [route] when tapped.
Widget pusher(AccessibleCupertinoPageRoute<void> route) => Builder(
  builder: (context) => CupertinoButton(
    onPressed: () => Navigator.of(context).push(route),
    child: const Text('go'),
  ),
);

AccessibleCupertinoPageRoute<void> secondRoute() =>
    AccessibleCupertinoPageRoute<void>(
      builder: (_) => const CupertinoPageScaffold(child: second),
    );

void main() {
  group('AccessibleCupertinoPageRoute', () {
    testWidgets('slides in with the default duration when effects are on', (
      tester,
    ) async {
      final route = secondRoute();
      expect(
        route.transitionDuration,
        CupertinoRouteTransitionMixin.kTransitionDuration,
      );
      await pumpCupertino(tester, pusher(route));
      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(
        route.transitionDuration,
        CupertinoRouteTransitionMixin.kTransitionDuration,
      );
      expect(route.reverseTransitionDuration, route.transitionDuration);
      expect(tester.getTopLeft(find.byWidget(second)).dx, greaterThan(0));
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
    });

    testWidgets('appears in place without motion when effects are off', (
      tester,
    ) async {
      final route = secondRoute();
      await pumpCupertino(
        tester,
        pusher(route),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      expect(route.transitionDuration, Duration.zero);
      expect(route.reverseTransitionDuration, Duration.zero);
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
      // The transition widgets stay, so the back gesture keeps working.
      expect(find.byType(CupertinoPageTransition), findsWidgets);
      // The navigator may schedule a focus frame after the push; pump once
      // more before asserting the animation settled with no further frames.
      await tester.pump();
      expect(tester.binding.hasScheduledFrame, isFalse);
    });

    testWidgets('follows the OS reduce-motion signal', (tester) async {
      final route = secondRoute();
      await pumpCupertino(tester, pusher(route), disableAnimations: true);
      await tester.tap(find.text('go'));
      await tester.pump();
      expect(route.transitionDuration, Duration.zero);
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
    });

    testWidgets('pops without motion when effects are off', (tester) async {
      final route = secondRoute();
      await pumpCupertino(
        tester,
        pusher(route),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      Navigator.of(tester.element(find.byWidget(second))).pop();
      await tester.pump();
      await tester.pump();
      expect(find.byWidget(second), findsNothing);
      expect(find.text('go'), findsOneWidget);
    });

    testWidgets('behaves like CupertinoPageRoute without a scope', (
      tester,
    ) async {
      final route = secondRoute();
      await tester.pumpWidget(
        CupertinoApp(home: CupertinoPageScaffold(child: pusher(route))),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(
        route.transitionDuration,
        CupertinoRouteTransitionMixin.kTransitionDuration,
      );
      expect(tester.getTopLeft(find.byWidget(second)).dx, greaterThan(0));
    });

    testWidgets('keeps the fullscreen dialog transition', (tester) async {
      final route = AccessibleCupertinoPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const CupertinoPageScaffold(child: second),
      );
      await pumpCupertino(
        tester,
        pusher(route),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
      );
      await tester.tap(find.text('go'));
      await tester.pump();
      expect(find.byType(CupertinoFullscreenDialogTransition), findsOneWidget);
      expect(tester.getTopLeft(find.byWidget(second)).dy, 0);
    });
  });

  group('AccessibleCupertinoPage', () {
    Widget pages({required bool pushed, required void Function() onPop}) =>
        Navigator(
          pages: [
            const AccessibleCupertinoPage<void>(
              key: ValueKey('first'),
              child: CupertinoPageScaffold(child: Text('first')),
            ),
            if (pushed)
              const AccessibleCupertinoPage<void>(
                key: ValueKey('second'),
                title: 'Second',
                child: CupertinoPageScaffold(child: second),
              ),
          ],
          onDidRemovePage: (_) => onPop(),
        );

    testWidgets('creates a route with the accessible transition', (
      tester,
    ) async {
      late BuildContext captured;
      await pumpCupertino(
        tester,
        Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      );
      const page = AccessibleCupertinoPage<void>(
        title: 'Second',
        maintainState: false,
        fullscreenDialog: true,
        child: second,
      );
      final route = page.createRoute(captured);
      expect(route, isA<AccessibleCupertinoTransitionMixin<void>>());
      expect(route, isA<CupertinoRouteTransitionMixin<void>>());
      final cupertino = route as CupertinoRouteTransitionMixin<void>;
      expect(cupertino.title, 'Second');
      expect(route.settings, same(page));
      final pageRoute = route as PageRoute<void>;
      expect(pageRoute.maintainState, isFalse);
      expect(pageRoute.fullscreenDialog, isTrue);
      // The route class is private, so its debugLabel does not carry the
      // public AccessibleCupertinoPage name; assert on the label it does
      // report (still proves createRoute did not fall back to
      // cupertino_ui's own page-based route).
      expect(pageRoute.debugLabel, contains('AccessiblePageBasedRoute'));
    });

    testWidgets('shows the page in place when effects are off', (tester) async {
      var pushed = false;
      late StateSetter setPages;
      await pumpCupertino(
        tester,
        StatefulBuilder(
          builder: (context, setState) {
            setPages = setState;
            return pages(
              pushed: pushed,
              onPop: () => setState(() => pushed = false),
            );
          },
        ),
        initial: const AccessibilitySettings(effectsMode: EffectsMode.disabled),
      );
      setPages(() => pushed = true);
      await tester.pump();
      await tester.pump();
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
      expect(tester.binding.hasScheduledFrame, isFalse);
    });

    testWidgets('slides the page in when effects are on', (tester) async {
      var pushed = false;
      late StateSetter setPages;
      await pumpCupertino(
        tester,
        StatefulBuilder(
          builder: (context, setState) {
            setPages = setState;
            return pages(
              pushed: pushed,
              onPop: () => setState(() => pushed = false),
            );
          },
        ),
      );
      setPages(() => pushed = true);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(tester.getTopLeft(find.byWidget(second)).dx, greaterThan(0));
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(find.byWidget(second)).dx, 0);
    });
  });
}
