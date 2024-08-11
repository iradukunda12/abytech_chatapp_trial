import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget buildLoginButton(BuildContext context) {
  return Obx(
    () => controller.isLoading.value
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () => controller.login(context),
            child: const Text('Login'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 216, 109, 9),
              padding:
                  const EdgeInsets.symmetric(horizontal: 158, vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
  );
}
