import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travelbuddy/pages/flight_booking.dart';

void main() {
  testWidgets('FlightBookingPage UI and validation', (
    WidgetTester tester,
  ) async {
    // Load the FlightBookingPage widget
    await tester.pumpWidget(MaterialApp(home: FlightBookingPage()));

    // Check if the main widgets exist
    expect(find.text('Flight Booking'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Name'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Date of Birth'), findsOneWidget);
    expect(
      find.widgetWithText(TextFormField, 'Departure Date'),
      findsOneWidget,
    );
    expect(find.widgetWithText(TextFormField, 'Return Date'), findsOneWidget);
    expect(
      find.widgetWithText(DropdownButtonFormField<String>, 'Choose Airport'),
      findsOneWidget,
    );
    expect(find.widgetWithText(ElevatedButton, 'Book Flight'), findsOneWidget);

    // Tap on the Book Flight button without entering data
    await tester.tap(find.widgetWithText(ElevatedButton, 'Book Flight'));
    await tester.pump(); // Rebuild the widget with validation errors

    // Expect validation messages
    expect(find.text('Enter your name'), findsOneWidget);
    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('Please select your date of birth'), findsOneWidget);
    expect(find.text('Select a departure date'), findsOneWidget);
    expect(find.text('Select a return date'), findsOneWidget);
    expect(find.text('Select an airport'), findsOneWidget);
  });
}
