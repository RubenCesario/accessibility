import 'dart:async';

import 'package:accessibility_localizations/accessibility_localizations.dart';
import 'package:accessibility_material/src/ui/settings/widgets/status_card.dart';
import 'package:accessibility_testing/accessibility_testing.dart';
import 'package:flutter_accessibility/flutter_accessibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/pump_material.dart';

/// A service whose read completes only when the test says so.
final class SlowService implements AccessibilityStorageService {
  final Completer<AccessibilitySettings?> reads = Completer();

  @override
  Future<AccessibilitySettings?> read() => reads.future;

  @override
  Future<void> write(AccessibilitySettings settings) async {}

  @override
  Future<void> clear() async {}
}

void main() {
  group('StatusCard', () {
    testWidgets('renders nothing once loaded', (tester) async {
      await pumpMaterial(tester, const StatusCard());
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('shows the progress while loading', (tester) async {
      final service = SlowService();
      final repository = AccessibilitySettingsRepository(service: service);
      final viewModel = AccessibilitySettingsViewModel(repository: repository);
      addTearDown(() {
        viewModel.dispose();
        repository.dispose();
      });
      await tester.pumpWidget(
        AccessibilityScope(
          viewModel: viewModel,
          child: const MaterialApp(
            localizationsDelegates: [
              ...GlobalMaterialLocalizations.delegates,
              AccessibilityLocalizations.delegate,
            ],
            supportedLocales: AccessibilityLocalizations.supportedLocales,
            home: Scaffold(body: StatusCard()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Card), findsNothing);
      final load = viewModel.load();
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading the accessibility settings…'), findsOneWidget);
      service.reads.complete(null);
      await load;
      await tester.pump();
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('shows the failure and retries on request', (tester) async {
      final service = FakeAccessibilityStorageService(
        readError: Exception('disk'),
      );
      final viewModel = await pumpMaterial(
        tester,
        const StatusCard(),
        service: service,
      );
      expect(viewModel.status, isA<AccessibilitySettingsLoadFailed>());
      expect(
        find.text('The accessibility settings could not be loaded.'),
        findsOneWidget,
      );
      expect(service.calls.where((call) => call == 'read'), hasLength(1));
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(service.calls.where((call) => call == 'read'), hasLength(2));
      expect(viewModel.status, isA<AccessibilitySettingsLoadFailed>());
    });
  });
}
