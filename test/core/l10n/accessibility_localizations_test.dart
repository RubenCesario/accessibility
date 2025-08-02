import 'package:accessibility/src/core/l10n/generated/app_localizations.dart';
import 'package:accessibility/src/core/l10n/generated/app_localizations_en.dart';
import 'package:accessibility/src/core/l10n/generated/app_localizations_it.dart';
import 'package:accessibility/src/core/l10n/localizations_delegate_mock.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('_AccessibilityLocalizationsDelegate', () {
    const delegate = AccessibilityLocalizationsDelegateMock();

    test('load should return correct localizations for English locale',
        () async {
      const locale = Locale('en');
      final localizations = await delegate.load(locale);
      expect(localizations, isA<AccessibilityLocalizationsEn>());
      expect(localizations.localeName, equals('en'));
    });

    test('load should return correct localizations for Italian locale',
        () async {
      const locale = Locale('it');
      final localizations = await delegate.load(locale);
      expect(localizations, isA<AccessibilityLocalizationsIt>());
      expect(localizations.localeName, equals('it'));
    });

    test('isSupported should return true for supported locales', () {
      const supportedLocales = [Locale('en'), Locale('it')];
      for (final locale in supportedLocales) {
        expect(delegate.isSupported(locale), isTrue);
      }
    });

    test('isSupported should return false for unsupported locales', () {
      const unsupportedLocales = [Locale('xx'), Locale('yy'), Locale('zz')];
      for (final locale in unsupportedLocales) {
        expect(delegate.isSupported(locale), isFalse);
      }
    });

    test('shouldReload should always return false', () {
      const oldDelegate = AccessibilityLocalizationsDelegateMock();
      expect(delegate.shouldReload(oldDelegate), isFalse);
    });
  });

  group('lookupAccessibilityLocalizations', () {
    test('should return correct implementation for supported locales', () {
      for (final locale in AccessibilityLocalizations.supportedLocales) {
        final localizations = lookupAccessibilityLocalizations(locale);
        expect(localizations, isA<AccessibilityLocalizations>());
        expect(localizations.runtimeType, equals(localizations.runtimeType));
      }
    });

    test('should throw FlutterError for unsupported locales', () {
      const unsupportedLocale = Locale('xx');
      expect(
        () => lookupAccessibilityLocalizations(unsupportedLocale),
        throwsA(
          isA<FlutterError>().having(
            (error) => error.message,
            'error message',
            contains(
              'AccessibilityLocalizations.delegate failed '
              'to load unsupported locale',
            ),
          ),
        ),
      );
    });
  });

  group('AccessibilityLocalizations', () {
    test('supportedLocales should contain expected locales', () {
      expect(
        AccessibilityLocalizations.supportedLocales,
        containsAll([
          const Locale('en'),
          const Locale('it'),
        ]),
      );
      expect(AccessibilityLocalizations.supportedLocales.length, equals(2));
    });

    test('localizationsDelegates should contain required delegates', () {
      const delegates = AccessibilityLocalizations.localizationsDelegates;
      expect(delegates, hasLength(4));
      expect(delegates[0], equals(AccessibilityLocalizations.delegate));
    });
  });
}
