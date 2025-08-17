import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that changes the pages background color.
class BackgroundColorButton extends StatelessWidget {
  /// Creates a [BackgroundColorButton].
  const BackgroundColorButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_color_fill),
    label: const Text('Change pages background color'),
    onPressed: () async {
      const newColor = Colors.orange;
      AccessibilitySettingsInherited.of(
        context,
      ).updatePagesBackgroundColorSettings(newColor);
      // Note: below there is a storage method from the package, but you
      // can use any storage method you want.
      await SharedPreferencesInherited.of(
        context,
      ).storePagesBackgroundColorSetting(newSetting: newColor.toARGB32());
    },
  );
}
