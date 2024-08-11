import 'package:chatapp/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SendMessageController extends GetxController {
  var messages = <Map<String, String>>[].obs;

  Future<void> createConversation(String rideRequestId) async {
    const url = 'https://api.abyride.com/api/chat/create';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IisyNTA3ODc2NzgxMjMiLCJpc05ld1VzZXIiOnRydWUsInVzZXJJZCI6bnVsbCwiaWF0IjoxNzIwMDE1MTg2LCJleHAiOjE3Mjc3OTExODZ9.Lpkokyf1geeVQodcXTDF7gC75xb2R2UOSIXSySlmelI',
        },
        body: json.encode({
          'rideRequestId': rideRequestId,
        }),
      );

      if (response.statusCode == 200) {
        print('Conversation created successfully');
      } else {
        print('Failed to create conversation: ${response.body}');
      }
    } catch (e) {
      print('Error creating conversation: $e');
    }
  }

  Future<void> sendMessage(String message, String rideRequestId, String senderId) async {
  const url = 'https://api.abyride.com/api/chat/create';

  try {
    // Convert rideRequestId and senderId to numbers
    final int rideRequestIdNumber = int.parse(rideRequestId);
    final int senderIdNumber = int.parse(senderId);

    final requestBody = json.encode({
      'ride_request_id': rideRequestIdNumber,
      'sender_id': senderIdNumber,
      'message': message,
    });

    print('Request Body: $requestBody');

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IisyNTA3ODc2NzgxMjMiLCJpc05ld1VzZXIiOnRydWUsInVzZXJJZCI6bnVsbCwiaWF0IjoxNzIwMDE1MTg2LCJleHAiOjE3Mjc3OTExODZ9.Lpkokyf1geeVQodcXTDF7gC75xb2R2UOSIXSySlmelI', // Replace with your JWT token if needed
      },
      body: requestBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      print('Message sent successfully: $responseData');

      final Map<String, String> newMessage = {
        'text': responseData['message'] ?? message,
        'time': responseData['timestamp'] ?? DateTime.now().toIso8601String(),
        'isMe': 'true',
      };

      messages.add(newMessage);
      update();
    } else {
      print('Failed to send message: ${response.body}');
    }
  } catch (e) {
    print('Error sending message: $e');
  }
}
}
