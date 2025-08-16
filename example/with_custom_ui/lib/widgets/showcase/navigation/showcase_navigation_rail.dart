import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A custom navigation rail widget for the accessibility showcase.
class ShowcaseNavigationRail extends StatefulWidget {
  /// Creates a [ShowcaseNavigationRail].
  const ShowcaseNavigationRail({super.key});

  @override
  State<ShowcaseNavigationRail> createState() => _ShowcaseNavigationRailState();
}

class _ShowcaseNavigationRailState extends State<ShowcaseNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => NavigationRail(
    selectedIndex: _selectedIndex,
    onDestinationSelected: (index) => setState(() => _selectedIndex = index),
    labelType: NavigationRailLabelType.all,
    selectedLabelTextStyle: context.textTheme.titleSmall,
    unselectedLabelTextStyle: context.textTheme.titleSmall,
    destinations: const [
      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
      NavigationRailDestination(
        icon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
      NavigationRailDestination(icon: Icon(Icons.info), label: Text('Info')),
    ],
  );
}
