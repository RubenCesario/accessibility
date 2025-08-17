import 'package:flutter_test/flutter_test.dart';
import 'package:with_multiple_languages/interfaces/displayable.dart';
import 'package:with_multiple_languages/models/country.dart';

void main() {
  group('Country Model', () {
    const testCountry = Country(
      languageCode: 'en',
      countryCode: 'US',
      name: 'English',
      flagEmoji: '🇺🇸',
    );

    group('Constructor', () {
      test('should create country with all required fields', () {
        expect(testCountry.languageCode, equals('en'));
        expect(testCountry.countryCode, equals('US'));
        expect(testCountry.name, equals('English'));
        expect(testCountry.flagEmoji, equals('🇺🇸'));
      });

      test('should be immutable', () {
        expect(testCountry, isA<Country>());
        // Country is final class, so all properties should be final
        expect(() => testCountry.languageCode, returnsNormally);
        expect(() => testCountry.countryCode, returnsNormally);
        expect(() => testCountry.name, returnsNormally);
        expect(() => testCountry.flagEmoji, returnsNormally);
      });
    });

    group('Displayable Interface', () {
      test('should implement Displayable interface', () {
        expect(testCountry, isA<Displayable>());
      });

      test('should return correct display name format', () {
        expect(testCountry.displayName, equals('🇺🇸 English'));
      });

      test('should format display name with flag emoji and name', () {
        const germanCountry = Country(
          languageCode: 'de',
          countryCode: 'DE',
          name: 'German',
          flagEmoji: '🇩🇪',
        );
        expect(germanCountry.displayName, equals('🇩🇪 German'));
      });

      test('should handle complex country names in display name', () {
        const complexCountry = Country(
          languageCode: 'gsw',
          countryCode: 'AC',
          name: 'Swiss German Alemannic Alsatian',
          flagEmoji: '🇦🇨',
        );
        expect(
          complexCountry.displayName,
          equals('🇦🇨 Swiss German Alemannic Alsatian'),
        );
      });
    });

    group('Equality', () {
      test('should be equal when all properties match', () {
        const country1 = Country(
          languageCode: 'fr',
          countryCode: 'FR',
          name: 'French',
          flagEmoji: '🇫🇷',
        );
        const country2 = Country(
          languageCode: 'fr',
          countryCode: 'FR',
          name: 'French',
          flagEmoji: '🇫🇷',
        );
        expect(country1, equals(country2));
        expect(country1 == country2, isTrue);
      });

      test('should not be equal when language codes differ', () {
        const country1 = Country(
          languageCode: 'en',
          countryCode: 'US',
          name: 'English',
          flagEmoji: '🇺🇸',
        );
        const country2 = Country(
          languageCode: 'fr',
          countryCode: 'US',
          name: 'English',
          flagEmoji: '🇺🇸',
        );
        expect(country1, isNot(equals(country2)));
        expect(country1 == country2, isFalse);
      });

      test('should not be equal when names differ', () {
        const country1 = Country(
          languageCode: 'en',
          countryCode: 'US',
          name: 'English',
          flagEmoji: '🇺🇸',
        );
        const country2 = Country(
          languageCode: 'en',
          countryCode: 'US',
          name: 'American English',
          flagEmoji: '🇺🇸',
        );
        expect(country1, isNot(equals(country2)));
        expect(country1 == country2, isFalse);
      });

      test('should not be equal when flag emojis differ', () {
        const country1 = Country(
          languageCode: 'en',
          countryCode: 'US',
          name: 'English',
          flagEmoji: '🇺🇸',
        );
        const country2 = Country(
          languageCode: 'en',
          countryCode: 'US',
          name: 'English',
          flagEmoji: '🇬🇧',
        );
        expect(country1, isNot(equals(country2)));
        expect(country1 == country2, isFalse);
      });

      test('should be equal to itself', () {
        expect(testCountry, equals(testCountry));
        expect(testCountry == testCountry, isTrue);
      });

      test('should not be equal to different type', () {
        expect(testCountry is String, isFalse);
        expect(testCountry is int, isFalse);
      });

      test('should handle identical objects', () {
        const country1 = Country(
          languageCode: 'ja',
          countryCode: 'JP',
          name: 'Japanese',
          flagEmoji: '🇯🇵',
        );
        const country2 = country1;
        expect(identical(country1, country2), isTrue);
        expect(country1 == country2, isTrue);
      });
    });

    group('Hash Code', () {
      test('should have same hash code for equal objects', () {
        const country1 = Country(
          languageCode: 'es',
          countryCode: 'ES',
          name: 'Spanish Castilian',
          flagEmoji: '🇪🇸',
        );
        const country2 = Country(
          languageCode: 'es',
          countryCode: 'ES',
          name: 'Spanish Castilian',
          flagEmoji: '🇪🇸',
        );
        expect(country1.hashCode, equals(country2.hashCode));
      });

      test('should have different hash codes for different objects', () {
        const country1 = Country(
          languageCode: 'zh',
          countryCode: 'CN',
          name: 'Chinese',
          flagEmoji: '🇨🇳',
        );
        const country2 = Country(
          languageCode: 'ja',
          countryCode: 'JP',
          name: 'Japanese',
          flagEmoji: '🇯🇵',
        );
        expect(country1.hashCode, isNot(equals(country2.hashCode)));
      });

      test('should be consistent across multiple calls', () {
        final hashCode1 = testCountry.hashCode;
        final hashCode2 = testCountry.hashCode;
        expect(hashCode1, equals(hashCode2));
      });
    });

    group('toString', () {
      test('should return formatted string representation', () {
        const expectedString =
            'Country(code: en, name: English, '
            'flagEmoji: 🇺🇸)';
        expect(testCountry.toString(), equals(expectedString));
      });

      test('should include all relevant information', () {
        const country = Country(
          languageCode: 'de',
          countryCode: 'DE',
          name: 'German',
          flagEmoji: '🇩🇪',
        );
        final stringRep = country.toString();
        expect(stringRep, contains('de'));
        expect(stringRep, contains('German'));
        expect(stringRep, contains('🇩🇪'));
        expect(stringRep, startsWith('Country('));
        expect(stringRep, endsWith(')'));
      });

      test('should handle special characters in name', () {
        const country = Country(
          languageCode: 'fil',
          countryCode: 'PH',
          name: 'Filipino Pilipino',
          flagEmoji: '🇵🇭',
        );
        final stringRep = country.toString();
        expect(stringRep, contains('Filipino Pilipino'));
      });
    });

    group('Properties', () {
      test('should have correct property types', () {
        expect(testCountry.languageCode, isA<String>());
        expect(testCountry.countryCode, isA<String>());
        expect(testCountry.name, isA<String>());
        expect(testCountry.flagEmoji, isA<String>());
      });

      test('should not allow null values', () {
        // This test ensures the constructor requires all fields
        expect(() => testCountry.languageCode, returnsNormally);
        expect(() => testCountry.countryCode, returnsNormally);
        expect(() => testCountry.name, returnsNormally);
        expect(() => testCountry.flagEmoji, returnsNormally);
      });
    });
  });
}
