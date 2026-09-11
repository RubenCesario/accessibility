import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessibilityLocalizations', () {
    test('supports 81 distinct language-only locales including en and it', () {
      const locales = AccessibilityLocalizations.supportedLocales;
      expect(locales, hasLength(81));
      expect(locales.toSet(), hasLength(81));
      expect(locales.every((locale) => locale.countryCode == null), isTrue);
      expect(locales, contains(const Locale('en')));
      expect(locales, contains(const Locale('it')));
    });

    test('the delegate loads every supported locale', () async {
      for (final locale in AccessibilityLocalizations.supportedLocales) {
        expect(AccessibilityLocalizations.delegate.isSupported(locale), isTrue);
        final l10n = await AccessibilityLocalizations.delegate.load(locale);
        expect(l10n.localeName, locale.languageCode, reason: '$locale');
        expect(l10n.retry, isNotEmpty, reason: '$locale');
      }
    });

    test('the delegate rejects an unsupported locale and never reloads', () {
      expect(
        AccessibilityLocalizations.delegate.isSupported(const Locale('xx')),
        isFalse,
      );
      expect(
        AccessibilityLocalizations.delegate.shouldReload(
          AccessibilityLocalizations.delegate,
        ),
        isFalse,
      );
    });

    test('exposes the status card strings in English', () async {
      final l10n = await AccessibilityLocalizations.delegate.load(
        const Locale('en'),
      );
      expect(l10n.settingsLoading, 'Loading the accessibility settings…');
      expect(
        l10n.settingsLoadFailed,
        'The accessibility settings could not be loaded.',
      );
      expect(l10n.retry, 'Retry');
    });

    test('exposes the theme and effects mode labels in English', () async {
      final l10n = await AccessibilityLocalizations.delegate.load(
        const Locale('en'),
      );
      expect(l10n.themeModeSystem, 'System');
      expect(l10n.themeModeLight, 'Light');
      expect(l10n.themeModeDark, 'Dark');
      expect(l10n.effectsModeSystem, 'System');
      expect(l10n.effectsModeEnabled, 'On');
      expect(l10n.effectsModeDisabled, 'Off');
    });

    test('the select messages fall back for unknown arguments', () async {
      final l10n = await AccessibilityLocalizations.delegate.load(
        const Locale('en'),
      );
      expect(l10n.colorProfile('monochrome'), 'Monochrome');
      expect(l10n.colorProfile('unknown'), 'Normal');
      expect(l10n.themeProfile('seizureSafe'), 'Seizure safe');
      expect(l10n.themeProfile('unknown'), 'Theme profile not recognized');
      expect(l10n.color('cF44336'), 'Red');
      expect(l10n.color('unknown'), 'Color not recognized');
    });

    testWidgets('of(context) resolves through a Localizations widget', (
      tester,
    ) async {
      String? resolved;
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('it'),
          delegates: const [
            AccessibilityLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          child: Builder(
            builder: (context) {
              resolved = AccessibilityLocalizations.of(context).accessibility;
              return const SizedBox();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(resolved, 'Accessibilità');
    });
  });
}
