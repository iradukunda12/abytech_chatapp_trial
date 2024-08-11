import 'package:get/get.dart';
import 'package:chatapp/controllers/sendmessage_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendMessageController>(() => SendMessageController());
  }
}
