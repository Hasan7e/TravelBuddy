import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelBookingPage extends StatefulWidget {
  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final checkInController = TextEditingController();
  final checkOutController = TextEditingController();
  String? selectedHotel;

  final List<String> hotels = [
    'Hilton Rome',
    'Barcelona Inn',
    'Eiffel Grand Hotel',
    'Great Wall Suites',
  ];

  Future<void> bookHotel() async {
    final url = Uri.parse('http://localhost:3000/api/hotel-bookings');

    final bookingData = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'dob': dobController.text.trim(),
      'check_in': checkInController.text.trim(),
      'check_out': checkOutController.text.trim(),
      'hotel': selectedHotel,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bookingData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Booking successful!")));
        _formKey.currentState!.reset();
      } else {
        throw Exception('Failed to book');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Hotel")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator:
                    (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(labelText: "Date of Birth"),
              ),
              TextFormField(
                controller: checkInController,
                decoration: InputDecoration(labelText: "Check-in Date"),
              ),
              TextFormField(
                controller: checkOutController,
                decoration: InputDecoration(labelText: "Check-out Date"),
              ),
              DropdownButtonFormField<String>(
                value: selectedHotel,
                hint: Text("Select Hotel"),
                items:
                    hotels
                        .map(
                          (hotel) => DropdownMenuItem(
                            value: hotel,
                            child: Text(hotel),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedHotel = value;
                  });
                },
                validator:
                    (value) => value == null ? 'Please select a hotel' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bookHotel();
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
