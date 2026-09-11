import 'package:accessibility_cupertino/accessibility_cupertino.dart';
import 'package:cupertino_example/pages/settings_page.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

const _sample =
    'The quick brown fox jumps over the lazy dog. Sphinx of black quartz, '
    'judge my vow. Pack my box with five dozen liquor jugs.';

/// The home page: sample content that reacts to the settings, and links to
/// the three settings pages.
final class HomePage extends StatelessWidget {
  /// Creates the page.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    final titleStyle = CupertinoTheme.of(context).textTheme.navTitleTextStyle;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(l10n.accessibility)),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Sample content', style: titleStyle),
            const AccessibleSizedBox.fromHeight(height: 8),
            const AccessibleText(_sample),
            const AccessibleSizedBox.fromHeight(height: 16),
            const TextRawMagnifier(child: AccessibleText(_sample)),
            const AccessibleSizedBox.fromHeight(height: 16),
            const CupertinoReadMoreText(text: '$_sample $_sample $_sample'),
            const AccessibleSizedBox.fromHeight(height: 16),
            EffectsBuilder(
              builder: (context, {required effectsEnabled, child}) => Row(
                spacing: 8,
                children: [
                  Icon(
                    effectsEnabled
                        ? CupertinoIcons.sparkles
                        : CupertinoIcons.eye_slash,
                  ),
                  Expanded(
                    child: AccessibleText(
                      effectsEnabled
                          ? 'Effects are enabled: transitions animate.'
                          : 'Effects are disabled: pages appear in place.',
                    ),
                  ),
                ],
              ),
            ),
            const AccessibleSizedBox.fromHeight(height: 24),
            CupertinoListSection.insetGrouped(
              header: Text('Settings pages', style: titleStyle),
              children: [
                for (final variant in SettingsVariant.values)
                  CupertinoListTile.notched(
                    leading: Icon(variant.icon),
                    title: Text(variant.title),
                    subtitle: Text(variant.subtitle),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () => Navigator.of(
                      context,
                    ).pushNamed('/settings/${variant.name}'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
