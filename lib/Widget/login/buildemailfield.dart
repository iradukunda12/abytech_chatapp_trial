import 'package:chatapp/constants.dart';
import 'package:chatapp/controllers/login_controller.dart';
import 'package:flutter/material.dart';


Widget buildEmailField() {
  return TextField(
    onChanged: (value) => controller.email.value = value,
    decoration: InputDecoration(
      labelText: 'Email',
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
        Icons.email_outlined,
        color: Colors.white,
      ),
    ),
    style: const TextStyle(color: Colors.white),
  );
}
