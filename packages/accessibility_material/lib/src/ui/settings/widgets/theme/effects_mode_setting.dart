import 'package:accessibility_material/src/ui/core/panel_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/components/tri_state_setting.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:material_ui/material_ui.dart';

/// Effects following the system, always on or always off.
final class EffectsModeSetting extends StatelessWidget {
  /// Creates the setting.
  const EffectsModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TriStateSetting<EffectsMode>(
      title: l10n.effects,
      icon: Icons.remove_red_eye,
      segments: [
        ButtonSegment(
          value: EffectsMode.system,
          icon: const Icon(Icons.motion_photos_auto),
          label: Text(l10n.effectsModeSystem),
          tooltip: l10n.effectsModeSystem,
        ),
        ButtonSegment(
          value: EffectsMode.enabled,
          icon: const Icon(Icons.motion_photos_on),
          label: Text(l10n.effectsModeEnabled),
          tooltip: l10n.effectsModeEnabled,
        ),
        ButtonSegment(
          value: EffectsMode.disabled,
          icon: const Icon(Icons.motion_photos_off),
          label: Text(l10n.effectsModeDisabled),
          tooltip: l10n.effectsModeDisabled,
        ),
      ],
      selected: AccessibilityScope.settingsOf(context).effectsMode,
      onSelected: AccessibilityScope.of(context).setEffectsMode,
    );
  }
}
