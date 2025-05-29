import 'package:flutter/material.dart';

class RomePage extends StatelessWidget {
  const RomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rome'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Eiffel Tower Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/rome.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              'Rome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Description
            const Text(
              'Rome, the capital of Italy, is a timeless city steeped in history and culture. Known for its iconic landmarks such as the Colosseum, the Vatican, and the Pantheon, Rome offers a captivating blend of ancient ruins and vibrant street life. Wander through charming piazzas, savor authentic Italian cuisine, and immerse yourself in the rich art and architecture that define this enchanting city. With its romantic ambiance and rich heritage, Rome is a destination that leaves a lasting impression on every traveler.',
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
            const BulletPoint(text: 'Panoramic views of Rome'),
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
