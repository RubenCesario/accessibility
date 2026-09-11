import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/background_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_profile_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/color/text_color_setting.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_section.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// The colour group, identical in both styles.
final class ColorSettingsGroup extends StatelessWidget {
  /// Creates the group.
  const ColorSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    return SettingsSection(
      title: context.l10n.colorAdjustment,
      settings: [
        if (configuration.showColorProfileSetting) const ColorProfileSetting(),
        if (configuration.showTextColorSetting) const TextColorSetting(),
        if (configuration.showBackgroundColorSetting)
          const BackgroundColorSetting(),
      ],
    );
  }
}
