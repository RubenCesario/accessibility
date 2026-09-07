import 'package:accessibility/src/domain/models/effects_mode.dart';
import 'package:test/test.dart';

void main() {
  group('EffectsMode.resolve', () {
    test('system follows the OS reduce-motion signal', () {
      expect(EffectsMode.system.resolve(systemReducesMotion: false), isTrue);
      expect(EffectsMode.system.resolve(systemReducesMotion: true), isFalse);
    });

    test('enabled ignores the OS signal', () {
      expect(EffectsMode.enabled.resolve(systemReducesMotion: true), isTrue);
      expect(EffectsMode.enabled.resolve(systemReducesMotion: false), isTrue);
    });

    test('disabled ignores the OS signal', () {
      expect(EffectsMode.disabled.resolve(systemReducesMotion: true), isFalse);
      expect(EffectsMode.disabled.resolve(systemReducesMotion: false), isFalse);
    });
  });
}
