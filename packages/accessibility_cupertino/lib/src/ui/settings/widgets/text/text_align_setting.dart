import 'package:accessibility_cupertino/src/ui/core/panel_localizations.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/components/settings_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// Left, centre or right alignment as three check-mark tiles under a
/// title; tapping the active one clears the override.
final class TextAlignSetting extends StatelessWidget {
  /// Creates the setting.
  const TextAlignSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = AccessibilityScope.settingsOf(
      context,
    ).textSettings.textAlign;
    final viewModel = AccessibilityScope.of(context);
    final check = Icon(
      CupertinoIcons.check_mark,
      color: CupertinoTheme.of(context).primaryColor,
    );
    final options = [
      (TextAlignMode.left, CupertinoIcons.text_alignleft, l10n.alignLeft),
      (TextAlignMode.center, CupertinoIcons.text_aligncenter, l10n.alignCenter),
      (TextAlignMode.right, CupertinoIcons.text_alignright, l10n.alignRight),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsTile(
          title: l10n.textAlignment,
          icon: CupertinoIcons.text_justify,
        ),
        for (final (mode, icon, label) in options)
          SettingsTile(
            title: label,
            icon: icon,
            selected: current == mode,
            trailing: current == mode ? check : null,
            onTap: () => viewModel.setTextAlign(
              current == mode ? TextAlignMode.none : mode,
            ),
          ),
      ],
    );
  }
}
