import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that changes the text color for accessibility.
class TextColorButton extends StatelessWidget {
  /// Creates a [TextColorButton].
  const TextColorButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_color_text),
    label: const Text('Change text color'),
    onPressed: () async {
      const newColor = Colors.red;
      AccessibilitySettingsInherited.of(
        context,
      ).updateTextColorSettings(newColor);
      // Note: below there is a storage method from the package, but you
      // can use any storage method you want.
      await SharedPreferencesInherited.of(
        context,
      ).storeTextColorSetting(newSetting: newColor.toARGB32());
    },
  );
}
