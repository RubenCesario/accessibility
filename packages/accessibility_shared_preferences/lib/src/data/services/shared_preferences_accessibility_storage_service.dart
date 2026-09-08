import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_codec.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the settings with `shared_preferences` under the 1.x keys, so
/// settings stored by `accessibility` 1.x survive the upgrade.
///
/// Reading translates the 1.x sentinels and the `hasNoEffects` boolean;
/// writing stores every field, removing the keys of unset fields, and
/// never touches the 1.x-only keys. [clear] removes every key this package
/// or 1.x ever wrote and nothing else.
final class SharedPreferencesAccessibilityStorageService
    implements AccessibilityStorageService {
  /// Backed by [SharedPreferencesWithCache], created on first use with an
  /// allow list limited to this package's keys.
  ///
  /// [options] selects the platform backend, for example the Android
  /// storage library. On Android this API stores its values in a different
  /// place than the legacy API; apps whose 1.x settings were written through
  /// `SharedPreferencesServiceLegacy` use
  /// [SharedPreferencesAccessibilityStorageService.legacy] instead.
  SharedPreferencesAccessibilityStorageService({
    SharedPreferencesOptions options = const SharedPreferencesOptions(),
  }) : _backend = _CacheBackend(options);

  /// Backed by the legacy [SharedPreferences] API, which on Android stores
  /// its values where `accessibility` 1.x wrote them by default.
  SharedPreferencesAccessibilityStorageService.legacy()
    : _backend = const _LegacyBackend();

  final _PreferencesBackend _backend;

  @override
  Future<AccessibilitySettings?> read() async =>
      settingsFromPreferences(await _backend.readAll());

  @override
  Future<void> write(AccessibilitySettings settings) =>
      _backend.writeAll(preferencesFromSettings(settings));

  @override
  Future<void> clear() => _backend.removeAll(PreferencesKeys.all);
}

/// One `shared_preferences` API, reduced to what the service needs.
abstract interface class _PreferencesBackend {
  /// The stored values of every key in [PreferencesKeys.all].
  Future<Map<String, Object?>> readAll();

  /// Stores each value; a `null` value removes its key.
  Future<void> writeAll(Map<String, Object?> values);

  /// Removes [keys].
  Future<void> removeAll(Set<String> keys);
}

/// [SharedPreferencesWithCache] with an allow list of this package's keys.
final class _CacheBackend implements _PreferencesBackend {
  _CacheBackend(this._options);

  final SharedPreferencesOptions _options;
  Future<SharedPreferencesWithCache>? _preferences;

  /// Opens the store once; a failed attempt is forgotten so that the next
  /// call can try again.
  Future<SharedPreferencesWithCache> _open() async {
    try {
      return await (_preferences ??= SharedPreferencesWithCache.create(
        sharedPreferencesOptions: _options,
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: PreferencesKeys.all,
        ),
      ));
    } on Object {
      _preferences = null;
      rethrow;
    }
  }

  @override
  Future<Map<String, Object?>> readAll() async {
    final preferences = await _open();
    await preferences.reloadCache();
    return {for (final key in preferences.keys) key: preferences.get(key)};
  }

  @override
  Future<void> writeAll(Map<String, Object?> values) async {
    final preferences = await _open();
    for (final MapEntry(:key, :value) in values.entries) {
      switch (value) {
        case null:
          await preferences.remove(key);
        case final bool flag:
          await preferences.setBool(key, flag);
        case final int integer:
          await preferences.setInt(key, integer);
        case final double number:
          await preferences.setDouble(key, number);
        case final String text:
          await preferences.setString(key, text);
      }
    }
  }

  @override
  Future<void> removeAll(Set<String> keys) async {
    final preferences = await _open();
    for (final key in keys) {
      await preferences.remove(key);
    }
  }
}

/// The legacy [SharedPreferences] API.
final class _LegacyBackend implements _PreferencesBackend {
  const _LegacyBackend();

  @override
  Future<Map<String, Object?>> readAll() async {
    final preferences = await SharedPreferences.getInstance();
    return {
      for (final key in PreferencesKeys.all)
        if (preferences.containsKey(key)) key: preferences.get(key),
    };
  }

  @override
  Future<void> writeAll(Map<String, Object?> values) async {
    final preferences = await SharedPreferences.getInstance();
    for (final MapEntry(:key, :value) in values.entries) {
      switch (value) {
        case null:
          await preferences.remove(key);
        case final bool flag:
          await preferences.setBool(key, flag);
        case final int integer:
          await preferences.setInt(key, integer);
        case final double number:
          await preferences.setDouble(key, number);
        case final String text:
          await preferences.setString(key, text);
      }
    }
  }

  @override
  Future<void> removeAll(Set<String> keys) async {
    final preferences = await SharedPreferences.getInstance();
    for (final key in keys) {
      await preferences.remove(key);
    }
  }
}
