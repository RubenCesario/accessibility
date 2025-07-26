import 'package:shared_preferences/shared_preferences.dart';

/// Creates a [SharedPreferencesWithCache] instance.
///
/// If [cacheOptions] is not provided, it defaults to an empty
/// [SharedPreferencesWithCacheOptions] instance.
Future<SharedPreferencesWithCache> createSharedPreferencesWithCache({
  SharedPreferencesWithCacheOptions? cacheOptions,
}) async =>
    SharedPreferencesWithCache.create(
      cacheOptions: cacheOptions ?? const SharedPreferencesWithCacheOptions(),
    );
