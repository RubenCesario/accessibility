import 'package:accessibility/accessibility.dart';
import 'package:accessibility_shared_preferences/accessibility_shared_preferences.dart';
import 'package:accessibility_shared_preferences/src/data/services/preferences_keys.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/types.dart';

/// A 1.x install with a few changed values and both write-only keys.
const oneXValues = <String, Object>{
  PreferencesKeys.legacyFirstTimeOpened: false,
  PreferencesKeys.legacyThemeProfile: 'visionImpaired',
  PreferencesKeys.themeMode: 'light',
  PreferencesKeys.legacyEffectsAllowed: false,
  PreferencesKeys.textScaleFactor: 2.0,
  PreferencesKeys.lineHeight: -1.0,
  PreferencesKeys.letterSpacing: -1.0,
  PreferencesKeys.wordSpacing: -1.0,
  PreferencesKeys.isBold: true,
  PreferencesKeys.textAlign: 'none',
  PreferencesKeys.textColor: 0,
  PreferencesKeys.fontFamily: '',
  PreferencesKeys.backgroundColor: 0,
  PreferencesKeys.colorProfile: 'highSaturation',
};

const oneXSettings = AccessibilitySettings(
  themeMode: AccessibilityThemeMode.light,
  effectsMode: EffectsMode.disabled,
  textSettings: TextSettings(textScaleFactor: 2, isBold: true),
  colorSettings: ColorSettings(colorProfile: ColorProfileLevel.highSaturation),
);

/// A platform whose reads fail, to prove the cache backend can retry.
final class _FailingPlatform extends InMemorySharedPreferencesAsync {
  _FailingPlatform() : super.empty();

  @override
  Future<Map<String, Object>> getPreferences(
    GetPreferencesParameters parameters,
    SharedPreferencesOptions options,
  ) => Future.error(StateError('disk unavailable'));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferencesAccessibilityStorageService (cache backend)', () {
    late InMemorySharedPreferencesAsync platform;

    /// What the platform holds now, read through the plugin's own API.
    Future<Map<String, Object?>> stored() => SharedPreferencesAsync().getAll();

    setUp(() {
      platform = InMemorySharedPreferencesAsync.empty();
      SharedPreferencesAsyncPlatform.instance = platform;
    });

    test('reads null on a fresh install', () async {
      final service = SharedPreferencesAccessibilityStorageService();
      expect(await service.read(), isNull);
    });

    test('reads the 1.x values', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(oneXValues);
      final service = SharedPreferencesAccessibilityStorageService();
      expect(await service.read(), oneXSettings);
    });

    test('round-trips every field and removes unset keys', () async {
      final service = SharedPreferencesAccessibilityStorageService();
      await service.write(AccessibilitySettingsSamples.everythingSet);
      expect(await service.read(), AccessibilitySettingsSamples.everythingSet);
      await service.write(AccessibilitySettings.defaults);
      expect(await service.read(), AccessibilitySettings.defaults);
      final values = await stored();
      expect(values.keys, isNot(contains(PreferencesKeys.lineHeight)));
      expect(values.keys, isNot(contains(PreferencesKeys.textColor)));
      expect(values[PreferencesKeys.effectsMode], 'system');
    });

    test('writes effectsMode and leaves the 1.x boolean alone', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(oneXValues);
      final service = SharedPreferencesAccessibilityStorageService();
      await service.write(AccessibilitySettings.defaults);
      final values = await stored();
      expect(values[PreferencesKeys.effectsMode], 'system');
      expect(values[PreferencesKeys.legacyEffectsAllowed], false);
      expect(await service.read(), AccessibilitySettings.defaults);
    });

    test('sees values written by another instance', () async {
      final writer = SharedPreferencesAccessibilityStorageService();
      final reader = SharedPreferencesAccessibilityStorageService();
      expect(await reader.read(), isNull);
      await writer.write(AccessibilitySettingsSamples.seizureSafe);
      expect(await reader.read(), AccessibilitySettingsSamples.seizureSafe);
    });

    test('clear removes every package key and nothing else', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData({
            ...oneXValues,
            'someone_elses_key': 'kept',
          });
      final service = SharedPreferencesAccessibilityStorageService();
      await service.write(AccessibilitySettingsSamples.everythingSet);
      await service.clear();
      expect(await stored(), {'someone_elses_key': 'kept'});
      expect(await service.read(), isNull);
    });

    test('retries opening the store after a failure', () async {
      SharedPreferencesAsyncPlatform.instance = _FailingPlatform();
      final service = SharedPreferencesAccessibilityStorageService();
      await expectLater(service.read(), throwsStateError);
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(oneXValues);
      expect(await service.read(), oneXSettings);
    });

    test('forwards the platform options', () async {
      final service = SharedPreferencesAccessibilityStorageService(
        // ignore: avoid_redundant_argument_values
        options: const SharedPreferencesOptions(),
      );
      await service.write(AccessibilitySettings.defaults);
      expect(await service.read(), AccessibilitySettings.defaults);
    });
  });

  group('SharedPreferencesAccessibilityStorageService.legacy', () {
    /// What the platform holds now, read through the plugin's own API.
    Future<Map<String, Object?>> stored() async {
      final preferences = await SharedPreferences.getInstance();
      return {
        for (final key in preferences.getKeys()) key: preferences.get(key),
      };
    }

    setUp(() {
      SharedPreferences.setMockInitialValues(const {});
    });

    test('reads null on a fresh install', () async {
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      expect(await service.read(), isNull);
    });

    test('reads the 1.x values', () async {
      SharedPreferences.setMockInitialValues(oneXValues);
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      expect(await service.read(), oneXSettings);
    });

    test('round-trips every field and removes unset keys', () async {
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      await service.write(AccessibilitySettingsSamples.everythingSet);
      expect(await service.read(), AccessibilitySettingsSamples.everythingSet);
      await service.write(AccessibilitySettings.defaults);
      expect(await service.read(), AccessibilitySettings.defaults);
      final values = await stored();
      expect(values.keys, isNot(contains(PreferencesKeys.lineHeight)));
      expect(values.keys, isNot(contains(PreferencesKeys.fontFamily)));
      expect(values[PreferencesKeys.effectsMode], 'system');
    });

    test('clear removes every package key and nothing else', () async {
      SharedPreferences.setMockInitialValues({
        ...oneXValues,
        'someone_elses_key': 'kept',
      });
      final service = SharedPreferencesAccessibilityStorageService.legacy();
      await service.clear();
      expect(await stored(), {'someone_elses_key': 'kept'});
      expect(await service.read(), isNull);
    });
  });

  group('the two backends', () {
    test('do not share storage', () async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
      SharedPreferences.setMockInitialValues(oneXValues);
      expect(
        await SharedPreferencesAccessibilityStorageService().read(),
        isNull,
      );
      expect(
        await SharedPreferencesAccessibilityStorageService.legacy().read(),
        oneXSettings,
      );
    });
  });
}
