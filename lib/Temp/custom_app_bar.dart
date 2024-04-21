import 'package:flutter/material.dart';
import 'package:go_routing_example/Temp/toggleSwitch.dart';

AppBar customAppBar(String title, bool isLeadingIconNeeded) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    actions: const [
      ToggleSwitch(),
      SizedBox(
        width: 10,
      )
    ],
    leading: isLeadingIconNeeded
        ? IconButton(
            icon: const Icon(Icons.notifications),
            iconSize: 30,
            onPressed: () {})
        : null,
  );
}
