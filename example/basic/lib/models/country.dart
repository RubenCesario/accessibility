import 'package:basic/interfaces/displayable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
/// Models a country.
final class Country implements Displayable {
  /// Creates a new [Country] instance.
  const Country({
    required this.languageCode,
    required this.name,
    required this.flagEmoji,
  });

  /// The ISO 639-1 language code.
  final String languageCode;

  /// The name of the country.
  final String name;

  /// The flag emoji of the country.
  final String flagEmoji;

  @override
  String get displayName => '$flagEmoji $name';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Country &&
        other.languageCode == languageCode &&
        other.name == name &&
        other.flagEmoji == flagEmoji;
  }

  @override
  int get hashCode =>
      languageCode.hashCode ^ name.hashCode ^ flagEmoji.hashCode;

  @override
  String toString() =>
      'Country(code: $languageCode, name: $name, flagEmoji: $flagEmoji)';
}
