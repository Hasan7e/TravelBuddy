import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:travelbuddy/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full login flow test', (WidgetTester tester) async {
    // Start the app
    app.main();
    await tester.pumpAndSettle();

    // Tap on the login icon button (person icon)
    final loginIcon = find.byIcon(Icons.person);
    expect(loginIcon, findsOneWidget);
    await tester.tap(loginIcon);
    await tester.pumpAndSettle();

    // Now we are on the LoginPage
    final emailField = find.byType(TextFormField).at(0);
    final passwordField = find.byType(TextFormField).at(1);
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');

    // Fill email and password
    await tester.enterText(emailField, 'john@gmail.com');
    await tester.enterText(passwordField, 'Abcd12345');

    // Tap the Login button
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Verify if login success message or navigation occurred
    expect(find.text('Login successful!'), findsOneWidget);
  });
}
