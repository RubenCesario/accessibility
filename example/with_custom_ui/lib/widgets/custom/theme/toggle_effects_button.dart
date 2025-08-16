import 'package:flutter/material.dart';

/// A button widget that demonstrates effects toggle functionality.
class ToggleEffectsButton extends StatelessWidget {
  /// Creates a [ToggleEffectsButton].
  const ToggleEffectsButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.animation),
    label: const Text('Toggle Effects (Demo)'),
    onPressed: () {
      // This is a demo button - effects are handled internally by the package
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Effects toggle - handled by package')),
      );
    },
  );
}
