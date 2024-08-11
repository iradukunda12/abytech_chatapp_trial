import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controllers/sendmessage_controller.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final String rideRequestId;
  final List<Map<String, String>> initialMessages;

  ChatScreen({
    Key? key,
    required this.userName,
    required this.userImageUrl,
    required this.rideRequestId,
    required this.initialMessages,
  }) : super(key: key);

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SendMessageController sendMessageController =
        Get.find<SendMessageController>();

    // Initialize the messages list with initial messages
    sendMessageController.messages.addAll(initialMessages);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImageUrl),
            ),
            const SizedBox(width: 10),
            Text(userName),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 216, 109, 9),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                itemCount: sendMessageController.messages.length,
                itemBuilder: (context, index) {
                  final message = sendMessageController.messages[index];
                  final isMe = message['isMe'] == 'true';

                  return Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        CircleAvatar(
                          backgroundImage: NetworkImage(userImageUrl),
                        ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        decoration: BoxDecoration(
                          color: isMe
                              ? const Color.fromARGB(255, 216, 109, 9)
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['text']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      if (isMe)
                        CircleAvatar(
                          backgroundImage: NetworkImage(userImageUrl),
                        ),
                    ],
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey[700]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    final text = messageController.text.trim();
                    if (text.isNotEmpty) {
                      const String senderId = "20";
                      sendMessageController.sendMessage(
                          text, rideRequestId, senderId);
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
