import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A showcase widget demonstrating NavigationDrawer with accessibility theming.
class NavigationDrawerShowcase extends StatelessWidget {
  /// Creates a [NavigationDrawerShowcase].
  const NavigationDrawerShowcase({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Navigation Drawer', style: context.textTheme.titleMedium),
      const SizedBox(height: 8),
      ElevatedButton.icon(
        icon: const Icon(Icons.menu),
        label: const Text('Open Drawer from dialog'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder:
                (context) => Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  child: const NavigationDrawer(
                    children: [
                      DrawerHeader(child: Text('Drawer Header')),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.settings),
                        label: Text('Settings'),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.info),
                        label: Text('About'),
                      ),
                    ],
                  ),
                ),
          );
        },
      ),
    ],
  );
}
