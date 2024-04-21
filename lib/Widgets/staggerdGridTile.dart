import 'dart:io';
import 'package:flutter/material.dart';

Container imageContainerInitial( BuildContext context, void Function() onTap){
  return Container(
    color: Colors.grey[350],
    child: IconButton(
      icon: const Icon(Icons.add, size: 40, color: Colors.black),
      onPressed: onTap,
    ),
  );
}

Stack imageContainerAfterSelected( BuildContext context, void Function() onTap, List<File> imageFile, int index, void Function() clearImage){
  return
    Stack(children: [
    InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(imageFile[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 10,
      right: 10,
      child: IconButton(
        icon: const Icon(Icons.cancel_rounded, size: 30, color: Colors.white),
        onPressed: clearImage,
      ),
    ),
  ]);
}