import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// Which settings page to show.
enum SettingsVariant {
  /// Every setting, with a switch between the two styles.
  complete(
    CupertinoIcons.slider_horizontal_3,
    'Complete',
    'Every setting, in the standard or the cards style',
  ),

  /// A hand-picked subset with a custom palette.
  custom(
    CupertinoIcons.paintbrush,
    'Custom',
    'A subset with its own colour palette',
  ),

  /// The panel with its defaults.
  recommended(
    CupertinoIcons.checkmark_seal,
    'Recommended',
    'The panel as it comes',
  );

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
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text(widget.variant.title),
      trailing: widget.variant == SettingsVariant.complete
          ? CupertinoSlidingSegmentedControl<AccessibilitySettingsStyle>(
              groupValue: _style,
              // No vertical padding: paired with _SegmentLabel's 44 dp
              // height, this keeps the control exactly as tall as the nav
              // bar's fixed 44 dp row, so its 44 dp tap targets fit without
              // overflowing it.
              padding: const EdgeInsets.symmetric(horizontal: 3),
              children: const {
                AccessibilitySettingsStyle.standard: _SegmentLabel('List'),
                AccessibilitySettingsStyle.cards: _SegmentLabel('Grouped'),
              },
              onValueChanged: (style) {
                if (style != null) {
                  setState(() => _style = style);
                }
              },
            )
          : null,
    ),
    child: switch (widget.variant) {
      SettingsVariant.complete => CupertinoAccessibilitySettingsPanel(
        style: _style,
        configuration: AccessibilitySettingsConfiguration(
          onRestoreSettings: () => showCupertinoDialog<void>(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              content: Text(
                AccessibilityLocalizations.of(context).theSettingsHaveBeenReset,
              ),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
      SettingsVariant.custom => const CupertinoAccessibilitySettingsPanel(
        configuration: AccessibilitySettingsConfiguration(
          showThemeProfileAdhdFriendly: false,
          showColorProfileSetting: false,
          showBackgroundColorSetting: false,
          showWordSpacingSetting: false,
          showLetterSpacingSetting: false,
          textColorCandidates: [
            ColorSwatch<int>(0xFFF44336, {500: Color(0xFFF44336)}),
            ColorSwatch<int>(0xFF4CAF50, {500: Color(0xFF4CAF50)}),
            ColorSwatch<int>(0xFF2196F3, {500: Color(0xFF2196F3)}),
            ColorSwatch<int>(0xFF9E9E9E, {500: Color(0xFF9E9E9E)}),
          ],
          textColorAllowPickingShades: false,
        ),
      ),
      SettingsVariant.recommended =>
        const CupertinoAccessibilitySettingsPanel(),
    },
  );
}

/// A segment's label, at least a 44 dp tap target tall: the same technique
/// `accessibility_cupertino`'s own segmented settings use, since
/// `CupertinoSlidingSegmentedControl` otherwise sizes each segment to its
/// text alone.
final class _SegmentLabel extends StatelessWidget {
  const _SegmentLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: kMinInteractiveDimensionCupertino,
    child: Center(child: Text(text)),
  );
}
