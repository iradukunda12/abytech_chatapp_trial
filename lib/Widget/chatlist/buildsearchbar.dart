import 'package:flutter/material.dart';

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
      style: const TextStyle(color: Colors.white),
    ),
  );
}
