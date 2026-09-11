import 'package:accessibility_cupertino/src/ui/core/panel_colors.dart';
import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// One setting row: a list tile in the standard style, a notched one in
/// the cards style, with an optional selected state for the semantics.
///
/// A tappable row also reads as a button. Secondary text is drawn with
/// [panelSecondaryTextColor], resolved against the context so it inverts
/// with the brightness.
final class SettingsTile extends StatelessWidget {
  /// Creates the tile.
  const SettingsTile({
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.additionalInfo,
    this.onTap,
    this.selected,
    super.key,
  });

  /// The setting name.
  final String title;

  /// The explanation under the name.
  final String? subtitle;

  /// The icon before the name.
  final IconData? icon;

  /// The widget at the end of the row.
  final Widget? trailing;

  /// The value shown before [trailing].
  final String? additionalInfo;

  /// Called when the row is tapped.
  final VoidCallback? onTap;

  /// Whether the row reads as selected; `null` leaves the semantics alone.
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    final style =
        PanelScope.maybeOf(context)?.style ??
        AccessibilitySettingsStyle.standard;
    final secondary = TextStyle(color: panelSecondaryTextColor(context));
    final leading = icon == null ? null : Icon(icon);
    final subtitleText = subtitle == null
        ? null
        : Text(subtitle!, style: secondary);
    final info = additionalInfo == null
        ? null
        : Text(additionalInfo!, style: secondary);
    final tile = switch (style) {
      AccessibilitySettingsStyle.standard => CupertinoListTile(
        title: Text(title),
        subtitle: subtitleText,
        leading: leading,
        trailing: trailing,
        additionalInfo: info,
        onTap: onTap,
      ),
      AccessibilitySettingsStyle.cards => CupertinoListTile.notched(
        title: Text(title),
        subtitle: subtitleText,
        leading: leading,
        trailing: trailing,
        additionalInfo: info,
        onTap: onTap,
      ),
    };
    if (selected == null && onTap == null) {
      return tile;
    }
    return Semantics(
      button: onTap == null ? null : true,
      selected: selected,
      child: tile,
    );
  }
}
