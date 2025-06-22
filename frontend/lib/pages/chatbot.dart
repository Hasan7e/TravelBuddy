import 'package:flutter/material.dart';
import '../services/google_ai_service.dart'; // adjust the path to your service file

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  bool _showChat = false;
  List<String> messages = [];

  void _sendMessage() async {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      messages.add("You: $input");
      _showChat = true;
      _controller.clear();
    });

    final response = await GoogleAIService.getResponse(input);

    setState(() {
      messages.add("Bot: $response");
    });
  }

  Widget _buildInitialContent() {
    return Column(
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
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildChatView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Align(
          alignment:
              message.startsWith("You:")
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color:
                  message.startsWith("You:")
                      ? Colors.blue[100]
                      : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(message),
          ),
        );
      },
    );
  }

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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _showChat ? _buildChatView() : _buildInitialContent(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
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
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
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
