import 'package:chatapp/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

final RxBool isPasswordHidden = true.obs;
final LoginController controller = Get.put(LoginController());

 final TextEditingController messageController = TextEditingController();
  final RxList<Map<String, String>> messages = <Map<String, String>>[].obs;
