import 'package:flutter/material.dart';

class GreatWallPage extends StatelessWidget {
  const GreatWallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Great Wall'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Eiffel Tower Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/great_wall.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              'Great Wall',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Description
            const Text(
              'The Great Wall of China is an awe-inspiring ancient structure stretching thousands of miles across northern China. Built to protect against invasions, it showcases incredible engineering and historical significance. Visitors can explore its winding paths, breathtaking views, and experience a remarkable testament to Chinas rich heritage.',
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
            const BulletPoint(text: 'Panoramic views of Great Wall'),
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
            // ✅ Added Buttons for Booking
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/flight-booking');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: const Color.fromARGB(255, 189, 151, 228),
                  ),
                  child: const Text("Book Flight"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hotel-booking');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Book Hotel"),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space after buttons
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
