import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A showcase widget demonstrating ToggleButtons with accessibility theming.
class ToggleButtonsShowcase extends StatefulWidget {
  /// Creates a [ToggleButtonsShowcase].
  const ToggleButtonsShowcase({super.key});

  @override
  State<ToggleButtonsShowcase> createState() => _ToggleButtonsShowcaseState();
}

class _ToggleButtonsShowcaseState extends State<ToggleButtonsShowcase> {
  final List<bool> _isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Toggle Buttons', style: context.textTheme.titleMedium),
      const SizedBox(height: 8),
      ToggleButtons(
        isSelected: _isSelected,
        onPressed: (index) {
          setState(() {
            _isSelected[index] = !_isSelected[index];
          });
        },
        children: const [
          Icon(Icons.format_bold),
          Icon(Icons.format_italic),
          Icon(Icons.format_underlined),
        ],
      ),
    ],
  );
}
