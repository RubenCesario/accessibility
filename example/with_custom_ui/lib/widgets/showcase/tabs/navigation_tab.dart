import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:with_custom_ui/widgets/showcase/navigation/showcase_navigation_rail.dart';

/// A tab widget that displays navigation components for accessibility testing.
class NavigationTab extends StatelessWidget {
  /// Creates a [NavigationTab].
  const NavigationTab({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: Row(
          children: [
            const ShowcaseNavigationRail(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Navigation Components',
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const Text('• AppBar with title and tabs (top of screen)'),
                    const Text('• TabBar with tab labels (below AppBar)'),
                    const Text('• NavigationBar (bottom of screen)'),
                    const Text('• NavigationRail (left side of this tab)'),
                    const SizedBox(height: 16),
                    const Text(
                      'All navigation text inherits accessibility settings!',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
