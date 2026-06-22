import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:flutter/material.dart';

/// Card variant of the effects (reduce motion) setting.
///
/// Shares the shape and height of the text-align cards. The card is
/// highlighted when effects are reduced, mirroring the standard switch, and the
/// icon (eye vs eye-off) conveys the state without relying on colour alone.
final class EffectsCard extends SettingsItem {
  /// Creates an [EffectsCard].
  const EffectsCard({super.key});

  @override
  State<EffectsCard> createState() => _EffectsCardState();
}

class _EffectsCardState extends State<EffectsCard> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _settingsInherited.effectsAllowed,
        builder: (_, effectsAllowed, __) {
          final isReduced = !effectsAllowed;
          return SettingsItemCard(
            icon: isReduced ? Icons.motion_photos_off : Icons.motion_photos_on,
            title: context.l10na.effects,
            minHeight: kSettingsCardMinHeight,
            isHighlighted: isReduced,
            onTap: () async {
              final newValue = !_settingsInherited.effectsAllowed.value;
              _settingsInherited.effectsAllowed.value = newValue;
              await _prefsInherited.storeEffectsAllowedSetting(
                newSetting: newValue,
              );
            },
          );
        },
      );
}
