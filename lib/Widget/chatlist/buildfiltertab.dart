import 'package:flutter/material.dart';

Widget buildFilterTab(String label, bool isSelected) {
  return GestureDetector(
    onTap: () {
      // Handle tab change
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 216, 109, 9)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}
