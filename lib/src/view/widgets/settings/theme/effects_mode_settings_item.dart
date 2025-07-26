import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:flutter/material.dart';

/// This setting item is responsible to show the setting about the theme mode.
final class EffectsAllowedSettingsItem extends SettingsItem {
  /// Creates an [EffectsAllowedSettingsItem] Widget.
  const EffectsAllowedSettingsItem({super.key});

  @override
  State<EffectsAllowedSettingsItem> createState() =>
      _EffectsAllowedSettingsState();
}

class _EffectsAllowedSettingsState extends State<EffectsAllowedSettingsItem> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  Future<void> _storeEffectsAllowed(bool newSetting) async =>
      _prefsInherited.storeEffectsAllowedSetting(
        newSetting: newSetting,
      );

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _settingsInherited.effectsAllowed,
        builder: (_, effectsAllowed, __) => Semantics(
          label: context.l10na.toggle_effects_mode,
          child: Switch.adaptive(
            inactiveTrackColor: Colors.grey.withValues(alpha: 0.2),
            value: !effectsAllowed,
            onChanged: (_) async {
              _settingsInherited.effectsAllowed.value =
                  !_settingsInherited.effectsAllowed.value;
              await _storeEffectsAllowed(
                _settingsInherited.effectsAllowed.value,
              );
            },
          ),
        ),
      );
}
