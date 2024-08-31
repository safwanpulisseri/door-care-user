import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> startConversation(
    String senderId, String receiverId) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3000/api/chat/conversation'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'senderId': senderId,
      'receiverId': receiverId,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    final conversationId = data['newConversation']['data']['_id'];
    final username = data['newConversation']['data']['user'];
    final userProfile = data['newConversation']['data']['user_profile'];

    log('Conversation ID: $conversationId');
    log('Sender ID: $senderId');
    log('Receiver ID: $receiverId');
    log('Username: $username');
    log('User Profile: $userProfile');

    return {
      'conversationId': conversationId,
      'username': username,
      'userProfile': userProfile,
    };
  } else {
    throw Exception('Failed to create conversation');
  }
}
