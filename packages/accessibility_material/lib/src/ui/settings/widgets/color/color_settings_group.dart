import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/settings_item_container.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:material_ui/material_ui.dart';

/// The colour group, identical in both styles.
final class ColorSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const ColorSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final configuration = PanelScope.of(context).configuration;
    return SettingsGroup(
      title: l10n.colorAdjustment,
      separator: const SizedBox.shrink(),
      settings: [
        if (configuration.showColorProfileSetting)
          const SettingsItemContainer(
            widthFactor: 0.75,
            child: ColorProfileSetting(),
          ),
        if (configuration.showTextColorSetting)
          SettingsItemContainer(
            title: l10n.adjustTextColors,
            child: const TextColorSetting(),
          ),
        if (configuration.showBackgroundColorSetting)
          SettingsItemContainer(
            title: l10n.adjustBackgroundColors,
            child: const BackgroundColorSetting(),
          ),
      ],
    );
  }
}
