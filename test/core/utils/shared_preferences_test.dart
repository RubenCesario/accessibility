import 'package:accessibility/src/core/utils/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import '../../resources/models/fake_shared_preferences_async.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('createSharedPreferencesWithCache', () {
    setUp(() {
      final store = FakeSharedPreferencesAsync();
      SharedPreferencesAsyncPlatform.instance = store;
    });

    tearDown(() {
      SharedPreferencesAsyncPlatform.instance = null;
    });

    test(
        'should create SharedPreferencesWithCache '
        'instance with default options', () async {
      final result = await createSharedPreferencesWithCache();
      expect(result, isA<SharedPreferencesWithCache>());
    });

    test(
        'should create SharedPreferencesWithCache '
        'instance with custom options', () async {
      const customOptions = SharedPreferencesWithCacheOptions();
      final result = await createSharedPreferencesWithCache(
        cacheOptions: customOptions,
      );
      expect(result, isA<SharedPreferencesWithCache>());
    });
    test('should pass correct options to SharedPreferencesWithCache.create',
        () async {
      const customOptions =
          SharedPreferencesWithCacheOptions(allowList: {'key1', 'key2'});
      final prefs = await createSharedPreferencesWithCache(
        cacheOptions: customOptions,
      );
      await prefs.setString('key1', 'value1');
      await prefs.setString('key2', 'value2');
      expect(prefs.setString('key3', 'value3'), throwsArgumentError);
      expect(prefs.getString('key1'), 'value1');
      expect(prefs.getString('key2'), 'value2');
    });
  });
}
