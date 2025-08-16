import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that increases line height for better text readability.
class LineHeightButton extends StatelessWidget {
  /// Creates a [LineHeightButton].
  const LineHeightButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_line_spacing_outlined),
    label: const Text('Increase Line Height'),
    onPressed: () async {
      const newHeight = 2.0;
      AccessibilitySettingsInherited.of(
        context,
      ).updateLineHeightSetting(newHeight);
      // Note: Storage method may vary - using existing pattern
      // await SharedPreferencesInherited.of(context)
      //     .storeTextLineHeightSetting(newSetting: newHeight);
    },
  );
}
