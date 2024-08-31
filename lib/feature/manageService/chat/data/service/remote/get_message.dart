import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getMessages(String conversationId) async {
  final response = await http.get(
    Uri.parse(
        'http://10.0.2.2:3000/api/chat/message?conversationId=$conversationId'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return json.decode(response.body)['message']['data'];
  } else {
    throw Exception('Failed to load messages');
  }
}
