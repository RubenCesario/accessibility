import 'package:accessibility/accessibility.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_accessibility/src/ui/settings/view_model/accessibility_settings_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

const andika = AccessibleFont(family: 'Andika', package: 'font_andika');
const dyslexic = AccessibleFont(family: 'OpenDyslexic');

void main() {
  late FakeAccessibilityStorageService service;
  late AccessibilitySettingsRepository repository;
  late AccessibilitySettingsViewModel viewModel;
  late int notifications;

  setUp(() {
    service = FakeAccessibilityStorageService();
    repository = AccessibilitySettingsRepository(service: service);
    viewModel = AccessibilitySettingsViewModel(
      repository: repository,
      accessibleFonts: const [andika, dyslexic],
    );
    notifications = 0;
    viewModel.addListener(() => notifications++);
  });

  tearDown(() {
    viewModel.dispose();
    repository.dispose();
  });

  group('AccessibilitySettingsViewModel', () {
    test('is a Flutter ChangeNotifier exposing the repository state', () {
      expect(viewModel, isA<ChangeNotifier>());
      expect(viewModel.settings, AccessibilitySettings.defaults);
      expect(viewModel.status, isA<AccessibilitySettingsIdle>());
      expect(viewModel.accessibleFonts, [andika, dyslexic]);
      expect(viewModel.activeFont, isNull);
    });

    test('accessibleFonts is unmodifiable and defaults to empty', () {
      expect(
        () => viewModel.accessibleFonts.add(andika),
        throwsUnsupportedError,
      );
      final bare = AccessibilitySettingsViewModel(repository: repository);
      expect(bare.accessibleFonts, isEmpty);
      bare.dispose();
    });

    test(
      'load forwards to the repository and notifies on status change',
      () async {
        service.readError = Exception('disk');
        await viewModel.load();
        expect(viewModel.status, isA<AccessibilitySettingsLoadFailed>());
        // Each load reports Loading then Loaded/LoadFailed: two
        // notifications.
        expect(notifications, 2);
        service.readError = null;
        await viewModel.load();
        expect(viewModel.status, isA<AccessibilitySettingsLoaded>());
        expect(notifications, 4);
      },
    );

    test(
      'every command saves the expected settings and notifies once',
      () async {
        final cases =
            <String, (Future<void> Function(), AccessibilitySettings)>{
              'setThemeMode': (
                () => viewModel.setThemeMode(AccessibilityThemeMode.dark),
                const AccessibilitySettings(
                  themeMode: AccessibilityThemeMode.dark,
                ),
              ),
              'setEffectsMode': (
                () => viewModel.setEffectsMode(EffectsMode.disabled),
                const AccessibilitySettings(effectsMode: EffectsMode.disabled),
              ),
              'setTextScaleFactor': (
                () => viewModel.setTextScaleFactor(1.5),
                const AccessibilitySettings(
                  textSettings: TextSettings(textScaleFactor: 1.5),
                ),
              ),
              'setLineHeight': (
                () => viewModel.setLineHeight(2),
                const AccessibilitySettings(
                  textSettings: TextSettings(lineHeight: 2),
                ),
              ),
              'setLetterSpacing': (
                () => viewModel.setLetterSpacing(0.5),
                const AccessibilitySettings(
                  textSettings: TextSettings(letterSpacing: 0.5),
                ),
              ),
              'setWordSpacing': (
                () => viewModel.setWordSpacing(3),
                const AccessibilitySettings(
                  textSettings: TextSettings(wordSpacing: 3),
                ),
              ),
              'setBold': (
                () => viewModel.setBold(value: true),
                const AccessibilitySettings(
                  textSettings: TextSettings(isBold: true),
                ),
              ),
              'setTextAlign': (
                () => viewModel.setTextAlign(TextAlignMode.justify),
                const AccessibilitySettings(
                  textSettings: TextSettings(textAlign: TextAlignMode.justify),
                ),
              ),
              'setTextColor': (
                () => viewModel.setTextColor(0xFF112233),
                const AccessibilitySettings(
                  textSettings: TextSettings(color: 0xFF112233),
                ),
              ),
              'setFontFamily': (
                () => viewModel.setFontFamily('OpenDyslexic'),
                const AccessibilitySettings(
                  textSettings: TextSettings(fontFamily: 'OpenDyslexic'),
                ),
              ),
              'setBackgroundColor': (
                () => viewModel.setBackgroundColor(0xFFFFFFF0),
                const AccessibilitySettings(
                  colorSettings: ColorSettings(backgroundColor: 0xFFFFFFF0),
                ),
              ),
              'setColorProfile': (
                () => viewModel.setColorProfile(ColorProfileLevel.monochrome),
                const AccessibilitySettings(
                  colorSettings: ColorSettings(
                    colorProfile: ColorProfileLevel.monochrome,
                  ),
                ),
              ),
              'nextColorProfile': (
                viewModel.nextColorProfile,
                const AccessibilitySettings(
                  colorSettings: ColorSettings(
                    colorProfile: ColorProfileLevel.lowSaturation,
                  ),
                ),
              ),
              'applyThemeProfile': (
                () =>
                    viewModel.applyThemeProfile(ThemeProfileLevel.seizureSafe),
                AccessibilitySettingsSamples.seizureSafe,
              ),
            };
        for (final entry in cases.entries) {
          await repository.clear();
          notifications = 0;
          await entry.value.$1();
          expect(viewModel.settings, entry.value.$2, reason: entry.key);
          expect(service.stored, entry.value.$2, reason: entry.key);
          expect(notifications, 1, reason: entry.key);
        }
      },
    );

    test('nullable setters clear with null', () async {
      await viewModel.setLineHeight(2);
      await viewModel.setLetterSpacing(1);
      await viewModel.setWordSpacing(1);
      await viewModel.setTextColor(0xFF000000);
      await viewModel.setFontFamily('Andika');
      await viewModel.setBackgroundColor(0xFF000000);
      await viewModel.setLineHeight(null);
      await viewModel.setLetterSpacing(null);
      await viewModel.setWordSpacing(null);
      await viewModel.setTextColor(null);
      await viewModel.setFontFamily(null);
      await viewModel.setBackgroundColor(null);
      expect(viewModel.settings, AccessibilitySettings.defaults);
    });

    test('a command that does not change the value does not notify', () async {
      await viewModel.setTextScaleFactor(1);
      expect(notifications, 0);
    });

    test('restoreDefaults clears the repository', () async {
      await viewModel.setBold(value: true);
      notifications = 0;
      await viewModel.restoreDefaults();
      expect(viewModel.settings, AccessibilitySettings.defaults);
      expect(service.stored, isNull);
      expect(service.calls.last, 'clear');
      expect(notifications, 1);
    });

    test('activeFont resolves the registered font by family', () async {
      await viewModel.setFontFamily('Andika');
      expect(viewModel.activeFont, andika);
      await viewModel.setFontFamily('OpenDyslexic');
      expect(viewModel.activeFont, dyslexic);
      await viewModel.setFontFamily('Unknown');
      expect(viewModel.activeFont, isNull);
    });

    test(
      'setAccessibleFontEnabled toggles the first registered font',
      () async {
        await viewModel.setAccessibleFontEnabled(enabled: true);
        expect(viewModel.settings.textSettings.fontFamily, 'Andika');
        expect(viewModel.activeFont, andika);
        await viewModel.setAccessibleFontEnabled(enabled: false);
        expect(viewModel.settings.textSettings.fontFamily, isNull);
      },
    );

    test(
      'setAccessibleFontEnabled is a no-op without registered fonts',
      () async {
        final bare = AccessibilitySettingsViewModel(repository: repository);
        await bare.setAccessibleFontEnabled(enabled: true);
        expect(bare.settings, AccessibilitySettings.defaults);
        bare.dispose();
      },
    );

    test('dispose stops forwarding repository changes', () async {
      final own = AccessibilitySettingsRepository(service: service);
      final disposable = AccessibilitySettingsViewModel(repository: own);
      var count = 0;
      disposable
        ..addListener(() => count++)
        ..dispose();
      await own.save(
        const AccessibilitySettings(themeMode: AccessibilityThemeMode.light),
      );
      expect(count, 0);
      own.dispose();
    });
  });
}
