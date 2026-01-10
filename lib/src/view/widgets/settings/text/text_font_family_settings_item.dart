import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to manage the
/// font family of all text of the application.
///
/// When enabled, the accessible font (Verdana) is applied
/// to improve readability for users with visual impairments.
final class TextFontFamilySettingsItem extends SettingsItem {
  /// Creates a [TextFontFamilySettingsItem] Widget.
  const TextFontFamilySettingsItem({super.key});

  @override
  State<TextFontFamilySettingsItem> createState() =>
      _TextFontFamilySettingsItemState();
}

class _TextFontFamilySettingsItemState
    extends State<TextFontFamilySettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  Future<void> _toggleAccessibleFont({required bool isEnabled}) async {
    _settingsInherited.updateFontFamilySetting(
      useAccessibleFont: isEnabled,
    );
    await _prefsInherited.storeTextFontFamilySetting(
      newSetting:
          isEnabled ? _settingsInherited.textSettings.value.fontFamily : '',
    );
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settingsInherited.textSettings,
        builder: (_, textSettings, __) {
          final isEnabled = textSettings.isAccessibleFontEnabled;
          return Semantics(
            label: isEnabled
                ? context.l10na.accessible_font_enabled
                : context.l10na.accessible_font_disabled,
            hint: context.l10na.toggle_accessible_font,
            toggled: isEnabled,
            button: true,
            child: Switch.adaptive(
              inactiveTrackColor: Colors.grey.withValues(alpha: 0.2),
              value: isEnabled,
              onChanged: (value) => _toggleAccessibleFont(isEnabled: value),
            ),
          );
        },
      );
}
