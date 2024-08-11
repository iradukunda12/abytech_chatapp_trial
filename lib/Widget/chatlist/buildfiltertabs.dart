import 'package:chatapp/Widget/chatlist/buildfiltertab.dart';
import 'package:flutter/material.dart';

Widget buildFilterTabs() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFilterTab('All', true),
        buildFilterTab('Unread', false),
        buildFilterTab('Favourites', false),
        buildFilterTab('Groups', false),
      ],
    ),
  );
}
