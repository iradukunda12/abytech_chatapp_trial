import 'package:chatapp/Widget/login/buildemailfield.dart';
import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

final RxBool isPasswordHidden = true.obs;
Widget buildPasswordField() {
  return Obx(() => TextField(
        onChanged: (value) => controller.password.value = value,
        obscureText: isPasswordHidden.value,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordHidden.value ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: () {
              isPasswordHidden.value = !isPasswordHidden.value;
            },
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ));
}
