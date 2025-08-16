import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A showcase widget demonstrating other components with accessibility theming.
class OtherComponentsShowcase extends StatelessWidget {
  /// Creates an [OtherComponentsShowcase].
  const OtherComponentsShowcase({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Other Components', style: context.textTheme.titleLarge),
      const SizedBox(height: 16),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          // Expansion Tile
          const ExpansionTile(
            title: Text('Expandable Item'),
            children: [
              ListTile(title: Text('Child item 1')),
              ListTile(title: Text('Child item 2')),
            ],
          ),
          // Badge
          Badge(
            label: Text(
              '3',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            backgroundColor: context.colorScheme.onPrimary,
            child: const Icon(Icons.notifications),
          ),
          // Banner
          MaterialBanner(
            content: const Text('This is a banner with accessible text'),
            actions: [
              TextButton(onPressed: () {}, child: const Text('Action')),
            ],
          ),
          // Dropdown Menu
          const DropdownMenu<String>(
            label: Text('Select Option'),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 'option1', label: 'Option 1'),
              DropdownMenuEntry(value: 'option2', label: 'Option 2'),
            ],
          ),
          // Floating Action Button with extended text
          FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Extended FAB'),
          ),

          // Search Bar
          SearchBar(
            hintText: 'Search here...',
            leading: const Icon(Icons.search),
            onChanged: (value) {},
          ),
          // Menu Anchor
          MenuAnchor(
            builder:
                (context, controller, child) => ElevatedButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  child: const Text('Menu'),
                ),
            menuChildren: [
              MenuItemButton(
                onPressed: () {},
                child: const Text('Menu Item 1'),
              ),
              MenuItemButton(
                onPressed: () {},
                child: const Text('Menu Item 2'),
              ),
              MenuItemButton(
                onPressed: () {},
                child: const Text('Menu Item 3'),
              ),
            ],
          ),
          // Popup Menu Button
          PopupMenuButton<String>(
            initialValue: 'item1',
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'item1',
                    child: Text('Menu Item 1'),
                  ),
                  const PopupMenuItem(
                    value: 'item2',
                    child: Text('Menu Item 2'),
                  ),
                ],
            child: const Text('Popup Menu'),
          ),
        ],
      ),
    ],
  );
}
