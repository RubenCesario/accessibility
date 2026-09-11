import 'package:accessibility_material/accessibility_material.dart';
import 'package:material_ui/material_ui.dart';

/// Which settings page to show.
enum SettingsVariant {
  /// Every setting, with a switch between the two styles.
  complete(
    Icons.tune,
    'Complete',
    'Every setting, in the standard or the cards style',
  ),

  /// A hand-picked subset with a custom palette.
  custom(Icons.palette, 'Custom', 'A subset with its own colour palette'),

  /// The panel with its defaults.
  recommended(Icons.recommend, 'Recommended', 'The panel as it comes');

  const SettingsVariant(this.icon, this.title, this.subtitle);

  /// The icon of the link on the home page.
  final IconData icon;

  /// The title of the page.
  final String title;

  /// The explanation on the home page.
  final String subtitle;
}

/// A settings page in one of the [SettingsVariant]s.
final class SettingsPage extends StatefulWidget {
  /// Creates the page.
  const SettingsPage({required this.variant, super.key});

  /// Which page this is.
  final SettingsVariant variant;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AccessibilitySettingsStyle _style = AccessibilitySettingsStyle.standard;

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.variant.title),
        actions: [
          if (widget.variant == SettingsVariant.complete)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SegmentedButton<AccessibilitySettingsStyle>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(
                    value: AccessibilitySettingsStyle.standard,
                    icon: Icon(Icons.view_list),
                    tooltip: 'Standard style',
                  ),
                  ButtonSegment(
                    value: AccessibilitySettingsStyle.cards,
                    icon: Icon(Icons.grid_view),
                    tooltip: 'Cards style',
                  ),
                ],
                selected: {_style},
                onSelectionChanged: (selection) =>
                    setState(() => _style = selection.single),
              ),
            ),
        ],
      ),
      body: switch (widget.variant) {
        SettingsVariant.complete => AccessibilitySettingsPanel(
          style: _style,
          configuration: AccessibilitySettingsConfiguration(
            onRestoreSettings: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.theSettingsHaveBeenReset)),
            ),
          ),
        ),
        SettingsVariant.custom => const AccessibilitySettingsPanel(
          configuration: AccessibilitySettingsConfiguration(
            showThemeProfileAdhdFriendly: false,
            showColorProfileSetting: false,
            showBackgroundColorSetting: false,
            showWordSpacingSetting: false,
            showLetterSpacingSetting: false,
            textColorCandidates: [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.grey,
            ],
            textColorAllowPickingShades: false,
          ),
        ),
        SettingsVariant.recommended => const AccessibilitySettingsPanel(),
      },
    );
  }
}
