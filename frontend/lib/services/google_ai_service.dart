import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importing .env plugin

class GoogleAIService {
  static Future<String> getResponse(String prompt) async {
    final apiKey = dotenv.env['API_KEY']; // <- Now loaded at runtime
    final apiUrl =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': prompt},
          ],
        },
      ],
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final content =
          decoded['candidates']?[0]['content']?['parts']?[0]['text'];
      return content ?? 'No response.';
    } else {
      return 'Error: ${response.statusCode} - ${response.body}';
    }
  }
}
