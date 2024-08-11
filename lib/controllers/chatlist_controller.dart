import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatListController extends GetxController {
  var chatList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  Future<void> fetchChatList() async {
    const url = 'https://api.abyride.com/api/chat/all/20';

    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IisyNTA3ODc2NzgxMjMiLCJpc05ld1VzZXIiOnRydWUsInVzZXJJZCI6bnVsbCwiaWF0IjoxNzIwMDE1MTg2LCJleHAiOjE3Mjc3OTExODZ9.Lpkokyf1geeVQodcXTDF7gC75xb2R2UOSIXSySlmelI',
        },
      );

      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Access the 'data' field in the response
        final data = responseData['data'] as List<dynamic>;

        // Convert each item in the 'data' list into a Map<String, dynamic>
        chatList.value = data
            .map<Map<String, dynamic>>((conversation) => {
                  'rideRequestId': conversation['rideRequestId'],
                  'pickUpAddress': conversation['pickUpAddress'],
                  'dropOffAddress': conversation['dropOffAddress'],
                  'message': conversation['tripOption'],
                  'senderName': conversation['clientType'],
                  'userPic': 'https://via.placeholder.com/150',
                  'sentAt': conversation['createdAt'],
                })
            .toList();

        print('Parsed Data: ${chatList.value}');
      } else {
        print('Failed to fetch chat list: ${response.body}');
      }
    } catch (e) {
      print('Error fetching chat list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
