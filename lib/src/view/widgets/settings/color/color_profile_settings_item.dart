import 'package:accessibility/src/core/extensions/build_context.dart';
import 'package:accessibility/src/interfaces/settings_item.dart';
import 'package:accessibility/src/models/settings/color/color_profile.dart';
import 'package:accessibility/src/models/settings/color/color_settings.dart';
import 'package:accessibility/src/view/providers/accessibility_settings_inherited.dart';
import 'package:accessibility/src/view/providers/shared_preferences_inherited.dart';
import 'package:accessibility/src/view/widgets/components/settings_item_multi_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart' show SemanticsService;

/// This setting item is responsible to manage the
/// color profile of the application.
final class ColorProfileSettingsItem extends SettingsItem {
  /// Creates an [ColorProfileSettingsItem] Widget.
  const ColorProfileSettingsItem({
    super.key,
  });

  @override
  State<ColorProfileSettingsItem> createState() =>
      _ColorProfileSettingsItemState();
}

class _ColorProfileSettingsItemState extends State<ColorProfileSettingsItem> {
  /// The provider of the application settings.
  late AccessibilitySettingsInherited _settingsInherited;
  late SharedPreferencesInherited _prefsInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsInherited = AccessibilitySettingsInherited.of(context);
    _prefsInherited = SharedPreferencesInherited.of(context);
  }

  String get _title => context.l10na.color_profile(
        ColorProfile.values
            .firstWhere(
              (profile) =>
                  profile.level ==
                  _settingsInherited.colorSettings.value.colorProfileLevel,
            )
            .level
            .name,
      );

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ColorSettings>(
        valueListenable: _settingsInherited.colorSettings,
        builder: (_, colorSettings, __) => Semantics(
          label: context.l10na.color_profile_changed_to + _title,
          button: true,
          child: SettingsItemMultiSelectionCard(
            selections: ColorProfile.values.length,
            startingSelectionsIndex: colorSettings.colorProfileLevel.index,
            icon: ColorProfile.values
                .firstWhere(
                  (profile) => profile.level == colorSettings.colorProfileLevel,
                )
                .icon,
            title: _title,
            onTap: () async {
              _settingsInherited.updateColorProfileLevel();
              await _prefsInherited.storeColorProfileSetting(
                newSetting: colorSettings.colorProfileLevel.name,
              );
              if (!context.mounted) {
                return;
              }
              await SemanticsService.sendAnnouncement(
                View.of(context),
                context.l10na.color_profile_changed_to + _title,
                Directionality.of(context),
              );
            },
          ),
        ),
      );
}
