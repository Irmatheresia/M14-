import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pert_14/main.dart';

void main() {
  testWidgets('Test Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());
    expect(find.text('COUNTER'), findsOneWidget);
    expect(find.text('Dec'), findsOneWidget);
    expect(find.text('Kurang'), findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Inc'), findsOneWidget);
    expect(find.text('Tambah'), findsNothing);
    expect(find.text('REVERSE TEXT'), findsOneWidget);
    expect(find.text('Reverse'), findsOneWidget);
  });

  testWidgets('Test Counter', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byKey(Key("btnInc")));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.widgetWithText(ElevatedButton, 'Dec'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Dec'));
    await tester.pump();
    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('Test Reverse Text', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());
    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Back End Flutter');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reverse'));
    await tester.pump();
    expect(find.text('rettulF dnE kcaB'), findsOneWidget);
  });
}
