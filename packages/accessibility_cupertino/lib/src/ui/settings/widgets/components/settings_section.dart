import 'package:accessibility_cupertino/src/ui/settings/widgets/panel_scope.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';

/// A titled group of settings: a plain list section in the standard
/// style, an inset grouped one in the cards style. Renders nothing when
/// there are no settings (a Cupertino section needs children or a header).
final class SettingsSection extends StatelessWidget {
  /// Creates a section of [settings], optionally titled.
  const SettingsSection({required this.settings, this.title, super.key});

  /// The settings, in order.
  final List<Widget> settings;

  /// The header shown above the section.
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (settings.isEmpty) {
      return const SizedBox.shrink();
    }
    final style =
        PanelScope.maybeOf(context)?.style ??
        AccessibilitySettingsStyle.standard;
    final header = title == null
        ? null
        : Semantics(header: true, child: Text(title!));
    return switch (style) {
      AccessibilitySettingsStyle.standard => CupertinoListSection(
        header: header,
        children: settings,
      ),
      AccessibilitySettingsStyle.cards => CupertinoListSection.insetGrouped(
        header: header,
        children: settings,
      ),
    };
  }
}
