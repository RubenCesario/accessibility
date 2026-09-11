import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/segmented_setting.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Effects following the system, always on or always off.
final class EffectsModeSetting extends StatelessWidget {
  /// Creates the setting.
  const EffectsModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SegmentedSetting<EffectsMode>(
      title: l10n.effects,
      icon: CupertinoIcons.eye,
      segments: {
        EffectsMode.system: l10n.effectsModeSystem,
        EffectsMode.enabled: l10n.effectsModeEnabled,
        EffectsMode.disabled: l10n.effectsModeDisabled,
      },
      selected: AccessibilityScope.settingsOf(context).effectsMode,
      onSelected: AccessibilityScope.of(context).setEffectsMode,
    );
  }
}
