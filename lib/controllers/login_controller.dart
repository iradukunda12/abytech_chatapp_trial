import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/routes/app_routes.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  void login(BuildContext context) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    if (email.value == 'iradukundakvn8@gmail.com' &&
        password.value == 'Iradukunda123?') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful'),
          backgroundColor: Color.fromARGB(255, 216, 109, 9),
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Get.toNamed(AppRoutes.chatList);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
          backgroundColor: Color.fromARGB(255, 216, 109, 9),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}