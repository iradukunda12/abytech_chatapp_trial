import 'package:chatapp/binding/chat_binding.dart';
import 'package:chatapp/controllers/sendmessage_controller.dart';
import 'package:chatapp/view/chat_list_screen.dart';
import 'package:chatapp/view/chat_screen.dart';
import 'package:chatapp/view/login_screen.dart';
import 'package:get/get.dart';
import 'package:chatapp/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.chatList,
      page: () => ChatListScreen(),
    ),
    GetPage(
      name: AppRoutes.chatScreen,
      page: () => ChatScreen(
        userName: Get.arguments['userName'],
        userImageUrl: Get.arguments['userImageUrl'],
        rideRequestId: Get.arguments['rideRequestId'],
        initialMessages:
            List<Map<String, String>>.from(Get.arguments['initialMessages']),
      ),
      binding: ChatBinding(),
    ),
  ];
}
