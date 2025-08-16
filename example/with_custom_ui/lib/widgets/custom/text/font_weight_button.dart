import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that toggles font weight between normal and bold.
class FontWeightButton extends StatelessWidget {
  /// Creates a [FontWeightButton].
  const FontWeightButton({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
    valueListenable: AccessibilitySettingsInherited.of(context).textSettings,
    builder: (_, textSettings, __) => ElevatedButton.icon(
      icon: Icon(
        textSettings.isFontWeightBold
            ? Icons.format_bold
            : Icons.format_bold_outlined,
      ),
      label: const Text('Change font weight'),
      onPressed: () async {
        final newFontWeight = !textSettings.isFontWeightBold;
        AccessibilitySettingsInherited.of(
          context,
        ).updateFontWeightSetting(newSetting: newFontWeight);
        await SharedPreferencesInherited.of(
          context,
        ).storeTextFontWeightSetting(newSetting: newFontWeight);
      },
    ),
  );
}
