import 'package:chatapp/Widget/chatlist/buildfiltertabs.dart';
import 'package:chatapp/controllers/chatlist_controller.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatListController chatListController = Get.put(ChatListController());

    chatListController.fetchChatList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chats',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          buildFilterTabs(),
          Expanded(
            child: Obx(() {
              if (chatListController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 216, 109, 9),
                    ),
                  ),
                );
              } else if (chatListController.chatList.isEmpty) {
                return const Center(
                  child: Text(
                    'No conversations available',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: chatListController.chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatListController.chatList[index];
                    return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(chat['userPic']!),
                        ),
                        title: Text(
                          chat['senderName']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'From: ${chat['pickUpAddress']}\nTo: ${chat['dropOffAddress']}',
                          style: const TextStyle(color: Colors.white54),
                        ),
                        trailing: Text(
                          chat['sentAt']!,
                          style: const TextStyle(color: Colors.white54),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.chatScreen, arguments: {
                            'userName': chat['senderName']!,
                            'userImageUrl': chat['userPic']!,
                            'rideRequestId': chat['rideRequestId'].toString(),
                            'initialMessages': [
                              {
                                'text': chat['message'] as String,
                                'time': chat['sentAt'] as String,
                                'isMe': 'true',
                              }
                            ],
                          });
                        });
                  },
                );
              }
            }),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
