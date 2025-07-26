import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/constants/storage_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/color_picker.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to manage the
/// pages background color of the application.
final class ColorPagesBackgroundSettingsItem extends SettingsItem {
  /// Creates an [ColorPagesBackgroundSettingsItem] Widget.
  const ColorPagesBackgroundSettingsItem({super.key});

  @override
  State<ColorPagesBackgroundSettingsItem> createState() =>
      _ColorPagesBackgroundSettingsItemState();
}

class _ColorPagesBackgroundSettingsItemState
    extends State<ColorPagesBackgroundSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  ValueChanged<Color>? _onShadeColorChange() => (selectedChoice) async {
        _settingsInherited.updatePagesBackgroundColorSettings(selectedChoice);
        await _prefsInherited.storePagesBackgroundColorSetting(
          newSetting: selectedChoice.toARGB32(),
        );
      };

  ValueChanged<ColorSwatch<int>?>? _onMainColorChange() =>
      (selectedChoice) async {
        final color = selectedChoice?.toARGB32() ??
            LocalStorageDefaultValues.noColorSelected;
        _settingsInherited.updatePagesBackgroundColorSettings(Color(color));
        await _prefsInherited.storePagesBackgroundColorSetting(
          newSetting: color,
        );
      };

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ColorSettings>(
        valueListenable: _settingsInherited.colorSettings,
        builder: (_, colorSettings, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.small),
          child: ColorPicker(
            colors: context.a11yConfig.pagesBackgroundColorCandidates,
            allowPickingColorShades:
                context.a11yConfig.pagesBackgroundColorAllowPickingShades,
            selectedColorValue: colorSettings.pagesBackgroundColorValue,
            onShadeColorChange: _onShadeColorChange(),
            onMainColorChange: _onMainColorChange(),
          ),
        ),
      );
}
