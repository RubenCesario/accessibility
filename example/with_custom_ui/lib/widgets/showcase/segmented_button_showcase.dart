import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A showcase widget demonstrating SegmentedButton with accessibility theming.
class SegmentedButtonShowcase extends StatefulWidget {
  /// Creates a [SegmentedButtonShowcase].
  const SegmentedButtonShowcase({super.key});

  @override
  State<SegmentedButtonShowcase> createState() =>
      _SegmentedButtonShowcaseState();
}

class _SegmentedButtonShowcaseState extends State<SegmentedButtonShowcase> {
  Set<String> _selectedOptions = {'option1'};

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Segmented Button', style: context.textTheme.titleMedium),
      const SizedBox(height: 8),
      SegmentedButton<String>(
        segments: const [
          ButtonSegment(value: 'option1', label: Text('Option 1')),
          ButtonSegment(value: 'option2', label: Text('Option 2')),
          ButtonSegment(value: 'option3', label: Text('Option 3')),
        ],
        selected: _selectedOptions,
        onSelectionChanged: (newSelection) {
          setState(() {
            _selectedOptions = newSelection;
          });
        },
        multiSelectionEnabled: true,
      ),
    ],
  );
}
