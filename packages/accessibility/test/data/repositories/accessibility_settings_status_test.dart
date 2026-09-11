import 'package:accessibility/src/data/repositories/accessibility_settings_status.dart';
import 'package:test/test.dart';

void main() {
  group('AccessibilitySettingsStatus', () {
    test('const statuses are canonical', () {
      expect(
        const AccessibilitySettingsIdle(),
        same(const AccessibilitySettingsIdle()),
      );
      expect(
        const AccessibilitySettingsLoading(),
        same(const AccessibilitySettingsLoading()),
      );
      expect(
        const AccessibilitySettingsLoaded(),
        same(const AccessibilitySettingsLoaded()),
      );
    });

    test('LoadFailed carries the error and describes it', () {
      final error = Exception('disk');
      final status = AccessibilitySettingsLoadFailed(error, StackTrace.current);
      expect(status.error, same(error));
      expect(status.toString(), contains('disk'));
    });

    test('is exhaustively switchable', () {
      String describe(AccessibilitySettingsStatus status) => switch (status) {
        AccessibilitySettingsIdle() => 'idle',
        AccessibilitySettingsLoading() => 'loading',
        AccessibilitySettingsLoaded() => 'loaded',
        AccessibilitySettingsLoadFailed() => 'failed',
      };
      expect(describe(const AccessibilitySettingsIdle()), 'idle');
      expect(describe(const AccessibilitySettingsLoading()), 'loading');
      expect(describe(const AccessibilitySettingsLoaded()), 'loaded');
      expect(
        describe(
          AccessibilitySettingsLoadFailed(Exception(), StackTrace.empty),
        ),
        'failed',
      );
    });
  });
}
