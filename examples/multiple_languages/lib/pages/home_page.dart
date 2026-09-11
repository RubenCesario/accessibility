import 'package:accessibility_material/accessibility_material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:multiple_languages_example/pages/settings_page.dart';
import 'package:multiple_languages_example/widgets/language_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.accessibility),
        actions: const [LanguagePicker()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AccessibleText(l10n.accessibilitySettings),
          const AccessibleSizedBox.fromHeight(height: 8),
          const AccessibleText(_sample),
          const AccessibleSizedBox.fromHeight(height: 16),
          const TextRawMagnifier(child: AccessibleText(_sample)),
          const AccessibleSizedBox.fromHeight(height: 16),
          const ReadMoreText(text: '$_sample $_sample $_sample'),
          const AccessibleSizedBox.fromHeight(height: 16),
          EffectsBuilder(
            builder: (context, {required effectsEnabled, child}) => Row(
              spacing: 8,
              children: [
                Icon(
                  effectsEnabled ? Icons.animation : Icons.motion_photos_off,
                ),
                Expanded(
                  child: AccessibleText(
                    effectsEnabled
                        ? 'Effects are enabled: transitions animate.'
                        : 'Effects are disabled: transitions are skipped.',
                  ),
                ),
              ],
            ),
          ),
          const AccessibleSizedBox.fromHeight(height: 24),
          Text('Settings pages', style: Theme.of(context).textTheme.titleLarge),
          const AccessibleSizedBox.fromHeight(height: 8),
          for (final variant in SettingsVariant.values)
            ListTile(
              leading: Icon(variant.icon),
              title: Text(variant.title),
              subtitle: Text(variant.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/settings/${variant.name}'),
            ),
        ],
      ),
    );
  }
}
