import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A button widget that toggles the accessible font on and off.
class FontFamilyButton extends StatelessWidget {
  /// Creates a [FontFamilyButton].
  const FontFamilyButton({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
    valueListenable: AccessibilitySettingsInherited.of(context).textSettings,
    builder:
        (_, textSettings, __) => ElevatedButton.icon(
          icon: Icon(
            textSettings.isAccessibleFontEnabled
                ? Icons.font_download
                : Icons.font_download_outlined,
          ),
          label: const Text('Toggle accessible font'),
          onPressed: () async {
            final settings = AccessibilitySettingsInherited.of(context)
              ..updateFontFamilySetting(
                useAccessibleFont: !textSettings.isAccessibleFontEnabled,
              );
            // Note: below there is a storage method from the package, but you
            // can use any storage method you want. After the update the
            // resulting family is 'Andika' when enabled and '' when disabled.
            await SharedPreferencesInherited.of(
              context,
            ).storeTextFontFamilySetting(
              newSetting: settings.textSettings.value.fontFamily,
            );
          },
        ),
  );
}
