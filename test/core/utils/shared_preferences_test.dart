import 'package:accessibility/src/core/utils/shared_preferences.dart';
import 'package:flutter/services.dart' show MethodCall;
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences_platform_interface/types.dart';

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

base class FakeSharedPreferencesAsync extends SharedPreferencesAsyncPlatform {
  final InMemorySharedPreferencesAsync backend =
      InMemorySharedPreferencesAsync.empty();
  final List<MethodCall> log = <MethodCall>[];

  @override
  Future<bool> clear(
    ClearPreferencesParameters parameters,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('clear', <Object>[...?parameters.filter.allowList]));
    return backend.clear(parameters, options);
  }

  @override
  Future<bool?> getBool(String key, SharedPreferencesOptions options) {
    log.add(MethodCall('getBool', <String>[key]));
    return backend.getBool(key, options);
  }

  @override
  Future<double?> getDouble(String key, SharedPreferencesOptions options) {
    log.add(MethodCall('getDouble', <String>[key]));
    return backend.getDouble(key, options);
  }

  @override
  Future<int?> getInt(String key, SharedPreferencesOptions options) {
    log.add(MethodCall('getInt', <String>[key]));
    return backend.getInt(key, options);
  }

  @override
  Future<Set<String>> getKeys(
    GetPreferencesParameters parameters,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('getKeys', <String>[...?parameters.filter.allowList]));
    return backend.getKeys(parameters, options);
  }

  @override
  Future<Map<String, Object>> getPreferences(
    GetPreferencesParameters parameters,
    SharedPreferencesOptions options,
  ) {
    log.add(
      MethodCall(
        'getPreferences',
        <Object>[...?parameters.filter.allowList],
      ),
    );
    return backend.getPreferences(parameters, options);
  }

  @override
  Future<String?> getString(String key, SharedPreferencesOptions options) {
    log.add(MethodCall('getString', <String>[key]));
    return backend.getString(key, options);
  }

  @override
  Future<List<String>?> getStringList(
    String key,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('getStringList', <String>[key]));
    return backend.getStringList(key, options);
  }

  @override
  Future<bool> setBool(
    String key,
    bool value,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('setBool', <Object>[key, value]));
    return backend.setBool(key, value, options);
  }

  @override
  Future<bool> setDouble(
    String key,
    double value,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('setDouble', <Object>[key, value]));
    return backend.setDouble(key, value, options);
  }

  @override
  Future<bool> setInt(String key, int value, SharedPreferencesOptions options) {
    log.add(MethodCall('setInt', <Object>[key, value]));
    return backend.setInt(key, value, options);
  }

  @override
  Future<bool> setString(
    String key,
    String value,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('setString', <Object>[key, value]));
    return backend.setString(key, value, options);
  }

  @override
  Future<bool> setStringList(
    String key,
    List<String> value,
    SharedPreferencesOptions options,
  ) {
    log.add(MethodCall('setStringList', <Object>[key, value]));
    return backend.setStringList(key, value, options);
  }
}
