import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that increases letter spacing for better text readability.
class LetterSpacingButton extends StatelessWidget {
  /// Creates a [LetterSpacingButton].
  const LetterSpacingButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.text_fields),
    label: const Text('Increase Letter Spacing'),
    onPressed: () async {
      const newSpacing = 2.0;
      AccessibilitySettingsInherited.of(
        context,
      ).updateLetterSpacingSetting(newSpacing);
      // Note: Storage method may vary - using existing pattern
      // await SharedPreferencesInherited.of(context)
      //     .storeTextLetterSpacingSetting(newSetting: newSpacing);
    },
  );
}
