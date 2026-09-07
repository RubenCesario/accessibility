import 'package:accessibility/src/domain/models/json_reading.dart';
import 'package:test/test.dart';

void main() {
  group('json reading helpers', () {
    const json = <String, Object?>{
      'aDouble': 1.5,
      'anInt': 2,
      'aBool': true,
      'aString': 'x',
      'aMap': <String, Object?>{'k': 1},
      'aDynamicMap': <dynamic, dynamic>{'k': 1},
      'aMixedKeyMap': <dynamic, dynamic>{'k': 1, 2: 'two'},
      'aNull': null,
    };

    test('readDouble accepts num and rejects the rest', () {
      expect(readDouble(json, 'aDouble'), 1.5);
      expect(readDouble(json, 'anInt'), 2.0);
      expect(readDouble(json, 'aString'), isNull);
      expect(readDouble(json, 'aNull'), isNull);
      expect(readDouble(json, 'missing'), isNull);
    });

    test('readInt accepts int only', () {
      expect(readInt(json, 'anInt'), 2);
      expect(readInt(json, 'aDouble'), isNull);
      expect(readInt(json, 'missing'), isNull);
    });

    test('readBool accepts bool only', () {
      expect(readBool(json, 'aBool'), isTrue);
      expect(readBool(json, 'aString'), isNull);
    });

    test('readString accepts String only', () {
      expect(readString(json, 'aString'), 'x');
      expect(readString(json, 'anInt'), isNull);
    });

    test('readMap accepts maps with string keys only', () {
      expect(readMap(json, 'aMap'), {'k': 1});
      expect(readMap(json, 'aString'), isNull);
    });

    test('readMap accepts a Map<dynamic, dynamic>', () {
      expect(readMap(json, 'aDynamicMap'), {'k': 1});
    });

    test('readMap drops entries whose key is not a String', () {
      expect(readMap(json, 'aMixedKeyMap'), {'k': 1});
    });
  });
}
