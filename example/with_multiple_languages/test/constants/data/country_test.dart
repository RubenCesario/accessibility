import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/constants/data/country.dart';

void main() {
  group('Country Constants', () {
    group('defaultLocale', () {
      test('should be English US locale', () {
        expect(defaultLocale, equals(const Locale('en', 'US')));
        expect(defaultLocale.languageCode, equals('en'));
        expect(defaultLocale.countryCode, equals('US'));
      });
    });

    group('allCountries', () {
      test('should not be empty', () {
        expect(allCountries, isNotEmpty);
      });

      test('should contain expected number of countries', () {
        expect(allCountries.length, equals(81));
      });

      test('should contain English country', () {
        final englishCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'en',
        );
        expect(englishCountry.name, equals('English'));
        expect(englishCountry.countryCode, equals('GB'));
        expect(englishCountry.flagEmoji, equals('🇬🇧'));
      });

      test('should contain German country', () {
        final germanCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'de',
        );
        expect(germanCountry.name, equals('German'));
        expect(germanCountry.countryCode, equals('DE'));
        expect(germanCountry.flagEmoji, equals('🇩🇪'));
      });

      test('should contain French country', () {
        final frenchCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'fr',
        );
        expect(frenchCountry.name, equals('French'));
        expect(frenchCountry.countryCode, equals('FR'));
        expect(frenchCountry.flagEmoji, equals('🇫🇷'));
      });

      test('should contain Spanish country', () {
        final spanishCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'es',
        );
        expect(spanishCountry.name, equals('Spanish Castilian'));
        expect(spanishCountry.countryCode, equals('ES'));
        expect(spanishCountry.flagEmoji, equals('🇪🇸'));
      });

      test('should contain Japanese country', () {
        final japaneseCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'ja',
        );
        expect(japaneseCountry.name, equals('Japanese'));
        expect(japaneseCountry.countryCode, equals('JP'));
        expect(japaneseCountry.flagEmoji, equals('🇯🇵'));
      });

      test('should contain Chinese country', () {
        final chineseCountry = allCountries.firstWhere(
          (country) => country.languageCode == 'zh',
        );
        expect(chineseCountry.name, equals('Chinese'));
        expect(chineseCountry.countryCode, equals('CN'));
        expect(chineseCountry.flagEmoji, equals('🇨🇳'));
      });

      test('should have all countries with valid language codes', () {
        for (final country in allCountries) {
          expect(country.languageCode, isNotEmpty);
          expect(country.languageCode.length, greaterThanOrEqualTo(2));
        }
      });

      test('should have all countries with valid country codes', () {
        for (final country in allCountries) {
          expect(country.countryCode, isNotEmpty);
          expect(country.countryCode.length, greaterThanOrEqualTo(2));
        }
      });

      test('should have all countries with names', () {
        for (final country in allCountries) {
          expect(country.name, isNotEmpty);
        }
      });

      test('should have all countries with flag emojis', () {
        for (final country in allCountries) {
          expect(country.flagEmoji, isNotEmpty);
        }
      });

      test('should have unique language codes', () {
        final languageCodes =
            allCountries.map((country) => country.languageCode).toSet();
        expect(languageCodes.length, equals(allCountries.length));
      });

      test('should be immutable list', () {
        expect(() => allCountries.clear(), throwsUnsupportedError);
      });

      test('should contain first country as Afrikaans', () {
        final firstCountry = allCountries.first;
        expect(firstCountry.languageCode, equals('af'));
        expect(firstCountry.countryCode, equals('ZA'));
        expect(firstCountry.name, equals('Afrikaans'));
        expect(firstCountry.flagEmoji, equals('🇿🇦'));
      });

      test('should contain last country as Zulu', () {
        final lastCountry = allCountries.last;
        expect(lastCountry.languageCode, equals('zu'));
        expect(lastCountry.countryCode, equals('ZA'));
        expect(lastCountry.name, equals('Zulu'));
        expect(lastCountry.flagEmoji, equals('🇿🇦'));
      });
    });
  });
}
