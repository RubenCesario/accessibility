import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that increases word spacing for better text readability.
class WordSpacingButton extends StatelessWidget {
  /// Creates a [WordSpacingButton].
  const WordSpacingButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_line_spacing),
    label: const Text('Increase Word Spacing'),
    onPressed: () async {
      const newSpacing = 4.0;
      AccessibilitySettingsInherited.of(
        context,
      ).updateWordSpacingSetting(newSpacing);
      // Note: Storage method may vary - using existing pattern
      // await SharedPreferencesInherited.of(context)
      //     .storeTextWordSpacingSetting(newSetting: newSpacing);
    },
  );
}
