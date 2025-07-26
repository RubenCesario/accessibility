import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to manage the
/// font weight of all text of the application.
final class TextFontWeightSettingsItem extends SettingsItem {
  /// Creates an [TextFontWeightSettingsItem] Widget.
  const TextFontWeightSettingsItem({super.key});

  @override
  State<TextFontWeightSettingsItem> createState() =>
      _TextFontWeightSettingsItemState();
}

class _TextFontWeightSettingsItemState
    extends State<TextFontWeightSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settingsInherited.textSettings,
        builder: (_, textSettings, __) => Semantics(
          label: context.l10na.toggle_font_weight,
          child: Switch.adaptive(
            inactiveTrackColor: Colors.grey.withValues(alpha: 0.2),
            value: textSettings.isFontWeightBold,
            onChanged: (value) {
              _settingsInherited.updateFontWeightSetting(newSetting: value);
              _prefsInherited.storeTextFontWeightSetting(
                newSetting: value,
              );
            },
          ),
        ),
      );
}
