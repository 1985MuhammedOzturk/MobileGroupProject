import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cafr/main.dart'; // Make sure the path is correct

void main() {
  testWidgets('CAFR app smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(CAFR());

    // Verify that the app starts with "Hello, CAFR!" text.
    expect(find.text('Hello, CAFR!'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Perform a tap action, if there's a button or interactive element.
    // For example, if there's a button that updates the counter or some text.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify the text has changed or the intended action occurred.
    // expect(find.text('1'), findsOneWidget);
  });
}
