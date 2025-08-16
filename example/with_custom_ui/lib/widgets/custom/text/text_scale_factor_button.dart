import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that increments the text scale factor for accessibility.
class TextScaleFactorButton extends StatelessWidget {
  /// Creates a [TextScaleFactorButton].
  const TextScaleFactorButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    icon: const Icon(Icons.format_size),
    label: const Text('Increment font size'),
    onPressed: () async {
      const newScaleFactor = 1.5;
      AccessibilitySettingsInherited.of(
        context,
      ).updateScaleFactorSetting(newScaleFactor);
      // Note: below there is a storage method from the package, but you
      // can use any storage method you want.
      await SharedPreferencesInherited.of(
        context,
      ).storeTextScaleFactorSetting(newSetting: newScaleFactor);
    },
  );
}
