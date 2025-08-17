import 'package:flutter/material.dart';

/// A custom bottom navigation bar widget for the accessibility showcase.
class ShowcaseNavigationBar extends StatefulWidget {
  /// Creates a [ShowcaseNavigationBar].
  const ShowcaseNavigationBar({super.key});

  @override
  State<ShowcaseNavigationBar> createState() => _ShowcaseNavigationBarState();
}

class _ShowcaseNavigationBarState extends State<ShowcaseNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => NavigationBar(
    selectedIndex: _selectedIndex,
    onDestinationSelected: (index) => setState(() => _selectedIndex = index),
    destinations: const [
      NavigationDestination(icon: Icon(Icons.one_k), label: 'One'),
      NavigationDestination(icon: Icon(Icons.two_k), label: 'Two'),
      NavigationDestination(icon: Icon(Icons.three_k), label: 'Three'),
    ],
  );
}
