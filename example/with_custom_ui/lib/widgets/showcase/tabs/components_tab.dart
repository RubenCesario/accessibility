import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:with_custom_ui/widgets/showcase/data_table_showcase.dart';
import 'package:with_custom_ui/widgets/showcase/date_time_picker_showcase.dart';
import 'package:with_custom_ui/widgets/showcase/navigation_drawer_showcase.dart';
import 'package:with_custom_ui/widgets/showcase/other_components_showcase.dart';
import 'package:with_custom_ui/widgets/showcase/segmented_button_showcase.dart';
import 'package:with_custom_ui/widgets/showcase/toggle_buttons_showcase.dart';

/// A tab widget that displays various UI components for accessibility testing.
class ComponentsTab extends StatelessWidget {
  /// Creates a [ComponentsTab].
  const ComponentsTab({super.key});

  static const _separator = SizedBox(height: 16);
  static const _largeSeparator = SizedBox(height: 48);

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Text('Button Components', style: context.textTheme.titleLarge),
      _separator,
      const Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ElevatedButton(onPressed: null, child: Text('ElevatedButton')),
          OutlinedButton(onPressed: null, child: Text('OutlinedButton')),
          TextButton(onPressed: null, child: Text('TextButton')),
          FilledButton(onPressed: null, child: Text('FilledButton')),
        ],
      ),
      _largeSeparator,
      Text('Input Components', style: context.textTheme.titleLarge),
      _separator,
      const TextField(
        decoration: InputDecoration(
          labelText: 'Label Text',
          hintText: 'Hint text here',
          helperText: 'Helper text',
          border: OutlineInputBorder(),
        ),
      ),
      _separator,
      const TextField(
        decoration: InputDecoration(
          labelText: 'Error Example',
          errorText: 'Error text example',
          border: OutlineInputBorder(),
        ),
      ),
      _largeSeparator,
      Text('List & Card Components', style: context.textTheme.titleLarge),
      _separator,
      const ListTile(
        leading: Icon(Icons.person),
        title: Text('ListTile Title'),
        subtitle: Text('ListTile subtitle text'),
        trailing: Icon(Icons.arrow_forward),
      ),
      const Divider(),
      const ListTile(
        leading: Icon(Icons.settings),
        title: Text('Another ListTile'),
        subtitle: Text('With different content'),
        trailing: Text('Trailing text'),
      ),
      _separator,
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          Chip(
            label: const Text('Chip 1'),
            labelStyle: context.textTheme.titleSmall,
          ),
          const Chip(label: Text('Chip 2')),
          const Chip(label: Text('Chip 3')),
        ],
      ),
      _separator,
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card Title', style: context.textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text(
                'This is card content text that should inherit theme styles.',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Action 1')),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Action 2'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      _separator,
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => _showCustomDialog(context),
              child: const Text('Show Dialog'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: () => _showCustomSnackBar(context),
              child: const Text('Show SnackBar'),
            ),
          ),
        ],
      ),
      _separator,
      const Tooltip(
        message: 'This is a tooltip with custom text styling',
        child: Icon(Icons.help_outline),
      ),
      _largeSeparator,
      Text('Advanced Button Components', style: context.textTheme.titleLarge),
      _separator,
      const SegmentedButtonShowcase(),
      _separator,
      const ToggleButtonsShowcase(),
      _largeSeparator,
      Text('Data & Picker Components', style: context.textTheme.titleLarge),
      _separator,
      const DataTableShowcase(),
      _separator,
      const DateTimePickerShowcase(),
      _largeSeparator,
      Text('Navigation Components', style: context.textTheme.titleLarge),
      _separator,
      const NavigationDrawerShowcase(),
      _largeSeparator,
      const OtherComponentsShowcase(),
    ],
  );

  void _showCustomDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Dialog Title'),
            content: const Text(
              'This is dialog content text that '
              'should inherit accessibility settings.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a SnackBar with accessible text styling'),
        action: SnackBarAction(label: 'Action', onPressed: () {}),
      ),
    );
  }
}
