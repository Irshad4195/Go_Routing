import 'package:flutter/material.dart';

void showPicker(BuildContext context, void Function() onTapGallery,
    void Function() onTapCamera) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: onTapGallery),
              ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: onTapCamera),
            ],
          ),
        );
      });
}