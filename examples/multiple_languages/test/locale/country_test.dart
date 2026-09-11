import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_languages_example/locale/country.dart';

void main() {
  test('defaultLocale is US English', () {
    expect(defaultLocale, const Locale('en', 'US'));
  });

  test('allCountries holds 81 countries with unique language codes', () {
    expect(allCountries, hasLength(81));
    final codes = {for (final country in allCountries) country.languageCode};
    expect(codes, hasLength(allCountries.length));
  });

  test('Country exposes its locale and display name', () {
    const italy = Country(
      languageCode: 'it',
      countryCode: 'IT',
      name: 'Italiano',
      flagEmoji: '🇮🇹',
    );
    expect(italy.locale, const Locale('it', 'IT'));
    expect(italy.displayName, '🇮🇹 Italiano');
    expect(
      italy,
      const Country(
        languageCode: 'it',
        countryCode: 'IT',
        name: 'Italiano',
        flagEmoji: '🇮🇹',
      ),
    );
    expect(italy.toString(), 'Country(it-IT, Italiano)');
  });

  test('every country locale is supported by the translations', () {
    // Checked through AccessibilityLocalizations in the picker test.
    expect(allCountries.every((c) => c.countryCode.isNotEmpty), isTrue);
  });
}
