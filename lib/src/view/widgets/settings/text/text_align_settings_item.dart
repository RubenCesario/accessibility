import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/utils/parser.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to align the
/// text of the application.
final class TextAlignSettingsItem extends SettingsItem {
  /// The title of the settings item.
  final String title;

  /// The icon of the settings item.
  final IconData icon;

  /// The setting this Widget will apply.
  final TextAlign textAlignSetting;

  /// Creates an [TextAlignSettingsItem] Widget.
  const TextAlignSettingsItem({
    required this.title,
    required this.icon,
    required this.textAlignSetting,
    super.key,
  });

  @override
  State<TextAlignSettingsItem> createState() => _TextAlignSettingsItemState();
}

class _TextAlignSettingsItemState extends State<TextAlignSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  bool _isSettingsItemSelected(String? textAlignMode) =>
      textAlignMode != null &&
      textAlignMode != LocalStorageDefaultValues.textAlignmentDefault &&
      parseTextAlign(textAlignMode) == widget.textAlignSetting;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settingsInherited.textSettings,
        builder: (_, textSettings, __) => SettingsItemCard(
          icon: widget.icon,
          title: widget.title,
          isHighlighted: _isSettingsItemSelected(
            textSettings.textAlignMode,
          ),
          onTap: () async {
            final newTextAlign =
                _isSettingsItemSelected(textSettings.textAlignMode)
                    ? LocalStorageDefaultValues.textAlignmentDefault
                    : widget.textAlignSetting.name;
            _settingsInherited.updateTextAlignSetting(newTextAlign);
            await _prefsInherited.storeTextAlignmentSetting(
              newSetting: newTextAlign,
            );
          },
        ),
      );
}
