import 'package:accessibility_cupertino/src/ui/settings/widgets/color/color_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/cupertino_restore_settings_button.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/text/text_settings_group.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/theme/theme_settings_group.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// The accessibility settings panel, Cupertino style.
///
/// A scrollable list of the settings groups (theme, colours, text) in the
/// requested [style], with the load status at the top and the restore
/// button at the bottom. Reads state through [AccessibilityScope] and
/// invokes the ViewModel commands; place it under an [AccessibilityScope]
/// and inside a `CupertinoPageScaffold` (or any box with bounded height).
final class CupertinoAccessibilitySettingsPanel extends StatelessWidget {
  /// Creates the panel.
  const CupertinoAccessibilitySettingsPanel({
    this.style = AccessibilitySettingsStyle.standard,
    this.configuration = const AccessibilitySettingsConfiguration(),
    super.key,
  });

  /// The visual style: plain list sections, or inset grouped ones.
  final AccessibilitySettingsStyle style;

  /// Which settings are shown and the colours offered.
  final AccessibilitySettingsConfiguration configuration;

  @override
  Widget build(BuildContext context) => PanelScope(
    configuration: configuration,
    style: style,
    child: const _PanelBody(),
  );
}

class _PanelBody extends StatelessWidget {
  const _PanelBody();

  @override
  Widget build(BuildContext context) {
    final configuration = PanelScope.of(context).configuration;
    return SafeArea(
      child: CustomScrollView(
        restorationId: 'cupertino_accessibility_settings_panel',
        slivers: [
          const SliverToBoxAdapter(child: StatusCard()),
          if (configuration.showThemeSettingsGroup)
            const SliverToBoxAdapter(child: ThemeSettingsGroup()),
          if (configuration.showColorSettingsGroup)
            const SliverToBoxAdapter(child: ColorSettingsGroup()),
          if (configuration.showTextSettingsGroup)
            const SliverToBoxAdapter(child: TextSettingsGroup()),
          const SliverToBoxAdapter(child: CupertinoRestoreSettingsButton()),
        ],
      ),
    );
  }
}
