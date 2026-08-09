import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('Yuopni navigation switches pages', (WidgetTester tester) async {
    await tester.pumpWidget(const YuopniApp());

    expect(find.text('🎬 Movie Feed'), findsOneWidget);
    expect(find.text('📱 Reels'), findsNothing);

    await tester.tap(find.text('Reels'));
    await tester.pump();

    expect(find.text('🎬 Movie Feed'), findsNothing);
    expect(find.text('📱 Reels'), findsOneWidget);
  });
}
