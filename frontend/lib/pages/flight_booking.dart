import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlightBookingPage extends StatefulWidget {
  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  DateTime? departureDate;
  DateTime? returnDate;

  final _formKey = GlobalKey<FormState>();
  String name = '';
  DateTime? dateOfBirth;
  String email = '';
  String selectedAirport = '';

  final List<String> airports = [
    'Dublin Airport (DUB)',
    'Heathrow Airport (LHR)',
    'Barcelona El Prat (BCN)',
    'Charles de Gaulle (CDG)',
    'Changi Airport (SIN)',
    'JFK International (JFK)',
  ];

  Future<void> submitBooking() async {
    final url = Uri.parse('http://localhost:3000/api/bookings');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'dateOfBirth': dateOfBirth?.toIso8601String(),
          'airport': selectedAirport,
          'departureDate': departureDate?.toIso8601String(),
          'returnDate': returnDate?.toIso8601String(),
        }),
      );

      if (response.statusCode == 201) {
        // success
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text("Success"),
                content: Text("Flight has been booked and confirmed."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // close dialog
                      Navigator.pop(context); // go back to home
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
        );
      } else {
        // failed
        final error = json.decode(response.body);
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text("Error"),
                content: Text("Failed to book flight: ${error['message']}"),
              ),
        );
      }
    } catch (e) {
      print('Booking error: $e');
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Error"),
              content: Text("Something went wrong. Please try again."),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flight Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (val) => name = val,
                validator: (val) => val!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                controller: TextEditingController(
                  text:
                      dateOfBirth == null
                          ? ''
                          : dateOfBirth!.toLocal().toString().split(' ')[0],
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000), // default DOB
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() => dateOfBirth = picked);
                  }
                },
                validator:
                    (val) =>
                        dateOfBirth == null
                            ? 'Please select your date of birth'
                            : null,
              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (val) => email = val,
                validator:
                    (val) => !val!.contains('@') ? 'Enter a valid email' : null,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Departure Date'),
                controller: TextEditingController(
                  text:
                      departureDate == null
                          ? ''
                          : departureDate!.toLocal().toString().split(' ')[0],
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => departureDate = picked);
                  }
                },
                validator:
                    (val) =>
                        departureDate == null
                            ? 'Select a departure date'
                            : null,
              ),

              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Return Date'),
                controller: TextEditingController(
                  text:
                      returnDate == null
                          ? ''
                          : returnDate!.toLocal().toString().split(' ')[0],
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: departureDate ?? DateTime.now(),
                    firstDate: departureDate ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => returnDate = picked);
                  }
                },
                validator:
                    (val) => returnDate == null ? 'Select a return date' : null,
              ),

              DropdownButtonFormField<String>(
                value: selectedAirport.isEmpty ? null : selectedAirport,
                items:
                    airports
                        .map(
                          (airport) => DropdownMenuItem(
                            value: airport,
                            child: Text(airport),
                          ),
                        )
                        .toList(),
                onChanged: (val) => setState(() => selectedAirport = val!),
                validator: (val) => val == null ? 'Select an airport' : null,
                decoration: InputDecoration(labelText: 'Choose Airport'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (departureDate == null ||
                        returnDate == null ||
                        dateOfBirth == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select all required dates'),
                        ),
                      );
                      return;
                    }
                    submitBooking();
                  }
                },
                child: Text('Book Flight'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
