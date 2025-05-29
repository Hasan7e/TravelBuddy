import 'package:flutter/material.dart';

// class ChatBotPage extends StatelessWidget {
//   const ChatBotPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('AI Chatbot')),
//       body: const Center(
//         child: Text(
//           'This is the AI Chatbot page!',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI Travel Chat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // 💡 Features in the middle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: const [
                Text(
                  "What I can help you with:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                FeatureItem(text: "✈️ Plan your travel itinerary"),
                FeatureItem(text: "🍜 Discover local food spots"),
                FeatureItem(text: "🏨 Suggest top-rated hotels"),
                FeatureItem(text: "📍 Find must-see attractions"),
                SizedBox(height: 20),
                Text(
                  "Example: \"Plan a 3-day trip to Paris\"",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // 📝 Prompt input at bottom
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ask your travel assistant...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // You can add your AI logic here
                    print("Prompt sent");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
