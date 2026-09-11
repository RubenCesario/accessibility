import 'package:flutter/widgets.dart';

/// The locale used before the user picks one.
const defaultLocale = Locale('en', 'US');

/// A language the app can switch to.
@immutable
final class Country {
  /// Creates a country.
  const Country({
    required this.languageCode,
    required this.countryCode,
    required this.name,
    required this.flagEmoji,
  });

  /// The ISO 639 language code.
  final String languageCode;

  /// The ISO 3166 country code.
  final String countryCode;

  /// The name shown in the picker.
  final String name;

  /// The flag shown before the name.
  final String flagEmoji;

  /// The locale of this country.
  Locale get locale => Locale(languageCode, countryCode);

  /// The flag and the name.
  String get displayName => '$flagEmoji $name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          other.languageCode == languageCode &&
          other.countryCode == countryCode &&
          other.name == name &&
          other.flagEmoji == flagEmoji;

  @override
  int get hashCode => Object.hash(languageCode, countryCode, name, flagEmoji);

  @override
  String toString() => 'Country($languageCode-$countryCode, $name)';
}

/// Every country the app offers, one per bundled translation.
const List<Country> allCountries = [
  Country(
    languageCode: 'af',
    countryCode: 'ZA',
    name: 'Afrikaans',
    flagEmoji: '🇿🇦',
  ),
  Country(
    languageCode: 'am',
    countryCode: 'AM',
    name: 'Amharic',
    flagEmoji: '🇦🇲',
  ),
  Country(
    languageCode: 'ar',
    countryCode: 'AE',
    name: 'Arabic',
    flagEmoji: '🇦🇪',
  ),
  Country(
    languageCode: 'as',
    countryCode: 'AS',
    name: 'Assamese',
    flagEmoji: '🇦🇸',
  ),
  Country(
    languageCode: 'az',
    countryCode: 'AZ',
    name: 'Azerbaijani',
    flagEmoji: '🇦🇿',
  ),
  Country(
    languageCode: 'be',
    countryCode: 'BE',
    name: 'Belarusian',
    flagEmoji: '🇧🇪',
  ),
  Country(
    languageCode: 'bg',
    countryCode: 'BG',
    name: 'Bulgarian',
    flagEmoji: '🇧🇬',
  ),
  Country(
    languageCode: 'bn',
    countryCode: 'BD',
    name: 'Bengali Bangla',
    flagEmoji: '🇧🇩',
  ),
  Country(
    languageCode: 'bo',
    countryCode: 'BO',
    name: 'Tibetan',
    flagEmoji: '🇧🇴',
  ),
  Country(
    languageCode: 'bs',
    countryCode: 'BS',
    name: 'Bosnian',
    flagEmoji: '🇧🇸',
  ),
  Country(
    languageCode: 'ca',
    countryCode: 'CA',
    name: 'Catalan Valencian',
    flagEmoji: '🇨🇦',
  ),
  Country(
    languageCode: 'cs',
    countryCode: 'CZ',
    name: 'Czech',
    flagEmoji: '🇨🇿',
  ),
  Country(
    languageCode: 'cy',
    countryCode: 'CY',
    name: 'Welsh',
    flagEmoji: '🇨🇾',
  ),
  Country(
    languageCode: 'da',
    countryCode: 'DK',
    name: 'Danish',
    flagEmoji: '🇩🇰',
  ),
  Country(
    languageCode: 'de',
    countryCode: 'DE',
    name: 'German',
    flagEmoji: '🇩🇪',
  ),
  Country(
    languageCode: 'el',
    countryCode: 'GR',
    name: 'Modern Greek',
    flagEmoji: '🇬🇷',
  ),
  Country(
    languageCode: 'en',
    countryCode: 'GB',
    name: 'English',
    flagEmoji: '🇬🇧',
  ),
  Country(
    languageCode: 'es',
    countryCode: 'ES',
    name: 'Spanish Castilian',
    flagEmoji: '🇪🇸',
  ),
  Country(
    languageCode: 'et',
    countryCode: 'EE',
    name: 'Estonian',
    flagEmoji: '🇪🇪',
  ),
  Country(
    languageCode: 'eu',
    countryCode: 'ES',
    name: 'Basque',
    flagEmoji: '🇪🇸',
  ),
  Country(
    languageCode: 'fa',
    countryCode: 'IR',
    name: 'Persian',
    flagEmoji: '🇮🇷',
  ),
  Country(
    languageCode: 'fi',
    countryCode: 'FI',
    name: 'Finnish',
    flagEmoji: '🇫🇮',
  ),
  Country(
    languageCode: 'fil',
    countryCode: 'PH',
    name: 'Filipino Pilipino',
    flagEmoji: '🇵🇭',
  ),
  Country(
    languageCode: 'fr',
    countryCode: 'FR',
    name: 'French',
    flagEmoji: '🇫🇷',
  ),
  Country(
    languageCode: 'gl',
    countryCode: 'GL',
    name: 'Galician',
    flagEmoji: '🇬🇱',
  ),
  Country(
    languageCode: 'gsw',
    countryCode: 'AC',
    name: 'Swiss German Alemannic Alsatian',
    flagEmoji: '🇦🇨',
  ),
  Country(
    languageCode: 'gu',
    countryCode: 'GU',
    name: 'Gujarati',
    flagEmoji: '🇬🇺',
  ),
  Country(
    languageCode: 'he',
    countryCode: 'IL',
    name: 'Hebrew',
    flagEmoji: '🇮🇱',
  ),
  Country(
    languageCode: 'hi',
    countryCode: 'IN',
    name: 'Hindi',
    flagEmoji: '🇮🇳',
  ),
  Country(
    languageCode: 'hr',
    countryCode: 'HR',
    name: 'Croatian',
    flagEmoji: '🇭🇷',
  ),
  Country(
    languageCode: 'hu',
    countryCode: 'HU',
    name: 'Hungarian',
    flagEmoji: '🇭🇺',
  ),
  Country(
    languageCode: 'hy',
    countryCode: 'AM',
    name: 'Armenian',
    flagEmoji: '🇦🇲',
  ),
  Country(
    languageCode: 'id',
    countryCode: 'ID',
    name: 'Indonesian',
    flagEmoji: '🇮🇩',
  ),
  Country(
    languageCode: 'is',
    countryCode: 'IS',
    name: 'Icelandic',
    flagEmoji: '🇮🇸',
  ),
  Country(
    languageCode: 'it',
    countryCode: 'IT',
    name: 'Italian',
    flagEmoji: '🇮🇹',
  ),
  Country(
    languageCode: 'ja',
    countryCode: 'JP',
    name: 'Japanese',
    flagEmoji: '🇯🇵',
  ),
  Country(
    languageCode: 'ka',
    countryCode: 'GE',
    name: 'Georgian',
    flagEmoji: '🇬🇪',
  ),
  Country(
    languageCode: 'kk',
    countryCode: 'KZ',
    name: 'Kazakh',
    flagEmoji: '🇰🇿',
  ),
  Country(
    languageCode: 'km',
    countryCode: 'KH',
    name: 'Khmer Central Khmer',
    flagEmoji: '🇰🇭',
  ),
  Country(
    languageCode: 'kn',
    countryCode: 'KN',
    name: 'Kannada',
    flagEmoji: '🇰🇳',
  ),
  Country(
    languageCode: 'ko',
    countryCode: 'KR',
    name: 'Korean',
    flagEmoji: '🇰🇷',
  ),
  Country(
    languageCode: 'ky',
    countryCode: 'KG',
    name: 'Kirghiz Kyrgyz',
    flagEmoji: '🇰🇬',
  ),
  Country(
    languageCode: 'lo',
    countryCode: 'LA',
    name: 'Lao',
    flagEmoji: '🇱🇦',
  ),
  Country(
    languageCode: 'lt',
    countryCode: 'LT',
    name: 'Lithuanian',
    flagEmoji: '🇱🇹',
  ),
  Country(
    languageCode: 'lv',
    countryCode: 'LV',
    name: 'Latvian',
    flagEmoji: '🇱🇻',
  ),
  Country(
    languageCode: 'mk',
    countryCode: 'MK',
    name: 'Macedonian',
    flagEmoji: '🇲🇰',
  ),
  Country(
    languageCode: 'ml',
    countryCode: 'ML',
    name: 'Malayalam',
    flagEmoji: '🇲🇱',
  ),
  Country(
    languageCode: 'mn',
    countryCode: 'MN',
    name: 'Mongolian',
    flagEmoji: '🇲🇳',
  ),
  Country(
    languageCode: 'mr',
    countryCode: 'MR',
    name: 'Marathi',
    flagEmoji: '🇲🇷',
  ),
  Country(
    languageCode: 'ms',
    countryCode: 'MS',
    name: 'Malay',
    flagEmoji: '🇲🇸',
  ),
  Country(
    languageCode: 'my',
    countryCode: 'MY',
    name: 'Burmese',
    flagEmoji: '🇲🇾',
  ),
  Country(
    languageCode: 'nb',
    countryCode: 'NB',
    name: 'Norwegian Bokmål',
    flagEmoji: '🇳🇴',
  ),
  Country(
    languageCode: 'ne',
    countryCode: 'NE',
    name: 'Nepali',
    flagEmoji: '🇳🇵',
  ),
  Country(
    languageCode: 'nl',
    countryCode: 'NL',
    name: 'Dutch Flemish',
    flagEmoji: '🇳🇱',
  ),
  Country(
    languageCode: 'no',
    countryCode: 'NO',
    name: 'Norwegian',
    flagEmoji: '🇳🇴',
  ),
  Country(
    languageCode: 'or',
    countryCode: 'OR',
    name: 'Oriya',
    flagEmoji: '🇴🇷',
  ),
  Country(
    languageCode: 'pa',
    countryCode: 'PA',
    name: 'Panjabi Punjabi',
    flagEmoji: '🇵🇦',
  ),
  Country(
    languageCode: 'pl',
    countryCode: 'PL',
    name: 'Polish',
    flagEmoji: '🇵🇱',
  ),
  Country(
    languageCode: 'ps',
    countryCode: 'PS',
    name: 'Pushto Pashto',
    flagEmoji: '🇵🇸',
  ),
  Country(
    languageCode: 'pt',
    countryCode: 'PT',
    name: 'Portuguese',
    flagEmoji: '🇵🇹',
  ),
  Country(
    languageCode: 'ro',
    countryCode: 'RO',
    name: 'Romanian Moldavian Moldovan',
    flagEmoji: '🇷🇴',
  ),
  Country(
    languageCode: 'ru',
    countryCode: 'RU',
    name: 'Russian',
    flagEmoji: '🇷🇺',
  ),
  Country(
    languageCode: 'si',
    countryCode: 'SI',
    name: 'Sinhala Sinhalese',
    flagEmoji: '🇸🇮',
  ),
  Country(
    languageCode: 'sk',
    countryCode: 'SK',
    name: 'Slovak',
    flagEmoji: '🇸🇰',
  ),
  Country(
    languageCode: 'sl',
    countryCode: 'SL',
    name: 'Slovenian',
    flagEmoji: '🇸🇮',
  ),
  Country(
    languageCode: 'sq',
    countryCode: 'SQ',
    name: 'Albanian',
    flagEmoji: '🇦🇱',
  ),
  Country(
    languageCode: 'sr',
    countryCode: 'SR',
    name: 'Serbian',
    flagEmoji: '🇸🇷',
  ),
  Country(
    languageCode: 'sv',
    countryCode: 'SV',
    name: 'Swedish',
    flagEmoji: '🇸🇪',
  ),
  Country(
    languageCode: 'sw',
    countryCode: 'SW',
    name: 'Swahili',
    flagEmoji: '🇸🇼',
  ),
  Country(
    languageCode: 'ta',
    countryCode: 'TA',
    name: 'Tamil',
    flagEmoji: '🇹🇦',
  ),
  Country(
    languageCode: 'te',
    countryCode: 'TE',
    name: 'Telugu',
    flagEmoji: '🇹🇪',
  ),
  Country(
    languageCode: 'th',
    countryCode: 'TH',
    name: 'Thai',
    flagEmoji: '🇹🇭',
  ),
  Country(
    languageCode: 'tl',
    countryCode: 'TL',
    name: 'Tagalog',
    flagEmoji: '🇹🇱',
  ),
  Country(
    languageCode: 'tr',
    countryCode: 'TR',
    name: 'Turkish',
    flagEmoji: '🇹🇷',
  ),
  Country(
    languageCode: 'ug',
    countryCode: 'UG',
    name: 'Uighur Uyghur',
    flagEmoji: '🇺🇬',
  ),
  Country(
    languageCode: 'uk',
    countryCode: 'UA',
    name: 'Ukrainian',
    flagEmoji: '🇺🇦',
  ),
  Country(
    languageCode: 'ur',
    countryCode: 'UR',
    name: 'Urdu',
    flagEmoji: '🇺🇷',
  ),
  Country(
    languageCode: 'uz',
    countryCode: 'UZ',
    name: 'Uzbek',
    flagEmoji: '🇺🇿',
  ),
  Country(
    languageCode: 'vi',
    countryCode: 'VI',
    name: 'Vietnamese',
    flagEmoji: '🇻🇳',
  ),
  Country(
    languageCode: 'zh',
    countryCode: 'CN',
    name: 'Chinese',
    flagEmoji: '🇨🇳',
  ),
  Country(
    languageCode: 'zu',
    countryCode: 'ZA',
    name: 'Zulu',
    flagEmoji: '🇿🇦',
  ),
];
