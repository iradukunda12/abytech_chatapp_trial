import 'package:chatapp/model/chat_list.dart';
import 'package:chatapp/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget buildChatList(BuildContext context) {
  return ListView.builder(
    itemCount: chatList.length,
    itemBuilder: (context, index) {
      final chat = chatList[index];
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chat['imageUrl']!),
        ),
        title: Text(
          chat['name']!,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          chat['lastMessage']!,
          style: TextStyle(color: Colors.white54),
        ),
        trailing: Text(
          chat['time']!,
          style: TextStyle(color: Colors.white54),
        ),
        onTap: () {
          Get.to(() => ChatScreen(
                userName: chat['senderName']!,
                userImageUrl: chat['userPic']!,
                rideRequestId:
                    chat['rideRequestId'].toString(), 
                initialMessages: [
                  {
                    'text': chat['message']!,
                    'time': chat['sentAt']!,
                    'isMe': 'true',
                  }
                ],
              ));
        },
      );
    },
  );
}
