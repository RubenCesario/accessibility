import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/color_picker.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to manage the
/// text color of the application.
final class ColorTextSettingsItem extends SettingsItem {
  /// Creates an [ColorTextSettingsItem] Widget.
  const ColorTextSettingsItem({super.key});

  @override
  State<ColorTextSettingsItem> createState() => _ColorTextSettingsItemState();
}

class _ColorTextSettingsItemState extends State<ColorTextSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  /// The callback when the shade color is changed.
  void Function(Color)? _onColorChange() => (selectedChoice) async {
        _settingsInherited.updateTextColorSettings(selectedChoice);
        await _prefsInherited.storeTextColorSetting(
          newSetting: selectedChoice.toARGB32(),
        );
      };

  /// The callback when the main color is changed.
  void Function(ColorSwatch<int>?)? _onMainColorChange() =>
      (selectedChoice) async {
        final color = selectedChoice?.toARGB32() ??
            LocalStorageDefaultValues.noColorSelected;
        _settingsInherited.updateTextColorSettings(Color(color));
        await _prefsInherited.storeTextColorSetting(
          newSetting: color,
        );
      };

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settingsInherited.textSettings,
        builder: (_, textSettings, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.small),
          child: ColorPicker(
            colors: context.a11yConfig.textColorCandidates,
            allowPickingColorShades:
                context.a11yConfig.textColorAllowPickingShades,
            selectedColorValue: textSettings.color,
            onShadeColorChange: _onColorChange(),
            onMainColorChange: _onMainColorChange(),
          ),
        ),
      );
}
