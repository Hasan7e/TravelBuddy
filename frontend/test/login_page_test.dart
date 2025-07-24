import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travelbuddy/pages/login_page.dart';

void main() {
  testWidgets('LoginPage renders correctly and validates inputs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify login & register buttons
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Register'), findsOneWidget);

    // Type into Email field
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Email'),
      'invalidEmail',
    );

    // Tap login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Check validation error
    expect(find.text('Enter a valid email'), findsOneWidget);

    // Enter valid email & password
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Email'),
      'test@example.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Password'),
      'password123',
    );

    // Tap login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();
  });
}
