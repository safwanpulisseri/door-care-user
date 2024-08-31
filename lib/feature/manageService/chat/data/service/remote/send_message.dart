import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendMessage(String conversationId, String senderId,
    String receiverId, String text) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3000/api/chat/message'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'conversationId': conversationId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to send message');
  }
}
