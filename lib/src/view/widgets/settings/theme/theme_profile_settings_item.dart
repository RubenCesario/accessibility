import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to manage
/// the change of a profile mode.
final class ThemeProfileSettingsItem extends SettingsItem {
  /// The level of the theme profile to apply.
  final ThemeProfileLevel themeProfileLevel;

  /// Creates an [ThemeProfileSettingsItem] Widget.
  const ThemeProfileSettingsItem({
    required this.themeProfileLevel,
    super.key,
  });

  @override
  State<ThemeProfileSettingsItem> createState() => _ThemeProfileSettingsState();
}

class _ThemeProfileSettingsState extends State<ThemeProfileSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  /// Whether the current settings represent a theme profile.
  bool _isSettingsAThemeProfile(
    ThemeProfileLevel themeProfileLevel,
    TextSettings textSettings,
    ColorSettings colorSettings,
    bool effectsAllowed,
  ) {
    final themeProfile = ThemeProfile.fromLevel(themeProfileLevel);
    return themeProfile.textSettings == textSettings &&
        themeProfile.colorSettings == colorSettings &&
        themeProfile.effectsAllowed == effectsAllowed;
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settingsInherited.textSettings,
        builder: (_, textSettings, __) => ValueListenableBuilder<ColorSettings>(
          valueListenable: _settingsInherited.colorSettings,
          builder: (_, colorSettings, __) => ValueListenableBuilder<bool>(
            valueListenable: _settingsInherited.effectsAllowed,
            builder: (_, effectsAllowed, __) => Semantics(
              label: '${context.l10na.toggle_theme_profile} '
                  '${context.l10na.theme_profile(
                widget.themeProfileLevel.name,
              )}',
              child: Switch.adaptive(
                inactiveTrackColor: Colors.grey.withValues(alpha: 0.2),
                value: _isSettingsAThemeProfile(
                  widget.themeProfileLevel,
                  textSettings,
                  colorSettings,
                  effectsAllowed,
                ),
                onChanged: (isOn) async {
                  final themeProfileLevel =
                      isOn ? widget.themeProfileLevel : ThemeProfileLevel.none;
                  _settingsInherited.applyThemeProfile(themeProfileLevel);
                  await _prefsInherited.storeThemeProfileSetting(
                    newSetting: themeProfileLevel.name,
                  );
                },
              ),
            ),
          ),
        ),
      );
}
