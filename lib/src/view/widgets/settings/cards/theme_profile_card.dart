import 'package:accessibility/src/core/constants/sizes_config.dart';
import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/models/settings/text/text_settings.dart';
import 'package:accessibility/src/models/settings/theme/theme_profile.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_card.dart';
import 'package:flutter/material.dart';

/// A single-choice card representing one [ThemeProfileLevel].
///
/// Used in the cards UI as a segmented selector: tapping a card applies its
/// profile and only the active profile is highlighted.
final class ThemeProfileCard extends SettingsItem {
  /// The profile level this card represents.
  final ThemeProfileLevel level;

  /// The icon shown on the card.
  final IconData icon;

  /// Creates a [ThemeProfileCard].
  const ThemeProfileCard({
    required this.level,
    required this.icon,
    super.key,
  });

  @override
  State<ThemeProfileCard> createState() => _ThemeProfileCardState();
}

class _ThemeProfileCardState extends State<ThemeProfileCard> {
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  bool _isSelected(
    TextSettings text,
    ColorSettings color, {
    required bool effectsAllowed,
  }) {
    final profile = ThemeProfile.fromLevel(widget.level);
    return profile.textSettings == text &&
        profile.colorSettings == color &&
        profile.effectsAllowed == effectsAllowed;
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<TextSettings>(
        valueListenable: _settingsInherited.textSettings,
        builder: (_, textSettings, __) => ValueListenableBuilder<ColorSettings>(
          valueListenable: _settingsInherited.colorSettings,
          builder: (_, colorSettings, ___) => ValueListenableBuilder<bool>(
            valueListenable: _settingsInherited.effectsAllowed,
            builder: (_, effectsAllowed, ____) => SettingsItemCard(
              icon: widget.icon,
              minHeight: kSettingsCardMinHeight,
              title: context.l10na.theme_profile(widget.level.name),
              isHighlighted: _isSelected(
                textSettings,
                colorSettings,
                effectsAllowed: effectsAllowed,
              ),
              onTap: () async {
                _settingsInherited.applyThemeProfile(widget.level);
                await _prefsInherited.storeThemeProfileSetting(
                  newSetting: widget.level.name,
                );
              },
            ),
          ),
        ),
      );
}
