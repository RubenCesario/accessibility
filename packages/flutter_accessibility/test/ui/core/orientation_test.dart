import 'package:flutter/widgets.dart';
import 'package:flutter_accessibility/src/ui/core/orientation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<Orientation> orientationFor(WidgetTester tester, Size size) async {
    late Orientation seen;
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: size),
        child: Builder(
          builder: (context) {
            seen = orientationOf(context);
            return const SizedBox();
          },
        ),
      ),
    );
    return seen;
  }

  testWidgets('orientationOf derives the orientation from the size', (
    tester,
  ) async {
    expect(
      await orientationFor(tester, const Size(400, 800)),
      Orientation.portrait,
    );
    expect(
      await orientationFor(tester, const Size(800, 400)),
      Orientation.landscape,
    );
    expect(
      await orientationFor(tester, const Size(500, 500)),
      Orientation.portrait,
    );
  });
}
