import 'package:accessibility_material/src/ui/settings/widgets/components/restore_settings_button.dart';
import 'package:accessibility_material/src/ui/settings/widgets/panel_scope.dart';
import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_card_group.dart';
import 'package:accessibility_material/src/ui/settings/widgets/theme/theme_settings_standard_group.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// The accessibility settings panel.
///
/// A scrollable list of the settings groups (theme, colours, text) in the
/// requested [style], with the load status at the top and the restore
/// button at the bottom. Reads state through [AccessibilityScope] and
/// invokes the ViewModel commands; place it under an [AccessibilityScope]
/// and inside a `Scaffold` (or any box with bounded height).
final class AccessibilitySettingsPanel extends StatelessWidget {
  /// Creates the panel.
  const AccessibilitySettingsPanel({
    this.style = AccessibilitySettingsStyle.standard,
    this.configuration = const AccessibilitySettingsConfiguration(),
    super.key,
  });

  /// The visual style.
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
    final scope = PanelScope.of(context);
    final configuration = scope.configuration;
    return SafeArea(
      child: CustomScrollView(
        restorationId: 'accessibility_settings_panel',
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: StatusCard()),
          if (configuration.showThemeSettingsGroup)
            switch (scope.style) {
              AccessibilitySettingsStyle.standard =>
                const ThemeSettingsStandardGroup(),
              AccessibilitySettingsStyle.cards =>
                const ThemeSettingsCardGroup(),
            },
          // Task 8 adds the colour group here, gated by
          // configuration.showColorSettingsGroup.
          // Tasks 9 and 10 add the text group here, gated by
          // configuration.showTextSettingsGroup and switched on the style.
          const SliverToBoxAdapter(child: RestoreSettingsButton()),
        ],
      ),
    );
  }
}
