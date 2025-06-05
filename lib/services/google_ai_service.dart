import 'dart:convert';
import 'package:http/http.dart' as http;

//import 'package:flutter_dotenv/flutter_dotenv.dart'; //importing .env

class GoogleAIService {
  //static final apiKey = dotenv.env['API_KEY']; // From Google AI Studio
  //String get apiKey => dotenv.env['API_KEY'] ?? '';
  //String get apiUrl =>

  static const String apiKey = '';
  static const String apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

  static Future<String> getResponse(String prompt) async {
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
