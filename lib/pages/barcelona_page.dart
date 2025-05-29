import 'package:flutter/material.dart';

class BarcelonaPage extends StatelessWidget {
  const BarcelonaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcelona'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Eiffel Tower Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/barcelona.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              'Barcelona',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Description
            const Text(
              'Barcelona, the vibrant capital of Catalonia, is famous for its stunning architecture, including Gaudís Sagrada Família and Park Güell. With its lively streets, delicious tapas, and beautiful beaches, the city offers a perfect blend of culture, history, and modernity. Explore the Gothic Quarter, enjoy the bustling atmosphere of La Rambla, and experience the unique charm that makes Barcelona a must-visit destination.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Features
            const Text(
              'Highlights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const BulletPoint(text: 'Iconic architecture'),
            const BulletPoint(text: 'Panoramic views of Barcelona'),
            const BulletPoint(text: 'Nighttime light shows'),
            const SizedBox(height: 30),

            // ⭐️ Review Section
            const Text(
              'Average Review',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 28),
                Icon(Icons.star, color: Colors.amber, size: 28),
                Icon(Icons.star, color: Colors.amber, size: 28),
                Icon(Icons.star_half, color: Colors.amber, size: 28),
                Icon(Icons.star_border, color: Colors.amber, size: 28),
                SizedBox(width: 10),
                Text(
                  "3.5 / 5",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// 🔸 Helper widget for bullet points
class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
