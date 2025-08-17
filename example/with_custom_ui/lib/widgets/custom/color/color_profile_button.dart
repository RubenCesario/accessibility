import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that cycles through different color profile levels.
class ColorProfileButton extends StatelessWidget {
  /// Creates a [ColorProfileButton].
  const ColorProfileButton({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ColorSettings>(
    valueListenable: AccessibilitySettingsInherited.of(context).colorSettings,
    builder:
        (_, colorSettings, __) => ElevatedButton.icon(
          icon: const Icon(Icons.palette),
          label: Text('Color Profile: ${colorSettings.colorProfileLevel.name}'),
          onPressed: () async {
            // Toggle between available color profile levels
            final currentIndex = ColorProfileLevel.values.indexOf(
              colorSettings.colorProfileLevel,
            );
            final nextIndex =
                (currentIndex + 1) % ColorProfileLevel.values.length;
            final newLevel = ColorProfileLevel.values[nextIndex];
            AccessibilitySettingsInherited.of(
              context,
            ).updateColorProfileLevel(newColorProfileLevelName: newLevel.name);
            // Note: below there is a storage method from the package, but you
            // can use any storage method you want.
            await SharedPreferencesInherited.of(
              context,
            ).storeColorProfileSetting(newSetting: newLevel.name);
          },
        ),
  );
}
